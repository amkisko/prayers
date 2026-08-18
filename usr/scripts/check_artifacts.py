#!/usr/bin/env python3
"""Fail when catalog version.artifact paths are missing or untracked."""

from __future__ import annotations

import json
import os
import subprocess
import sys
from pathlib import Path


def git_environment() -> dict[str, str]:
    return {
        key: value
        for key, value in os.environ.items()
        if key not in {"GIT_DIR", "GIT_WORK_TREE", "GIT_COMMON_DIR"}
    }


def catalog_artifact_paths(distribution_root: Path) -> list[Path]:
    packages = distribution_root / "v1" / "packages"
    paths: list[Path] = []
    for catalog in sorted(packages.rglob("*.json")):
        payload = json.loads(catalog.read_text())
        for version in payload.get("versions", []):
            relative = version.get("artifact")
            if relative:
                paths.append(distribution_root / relative)
    return paths


def tracked_paths(repo_root: Path) -> set[str] | None:
    probe = subprocess.run(
        ["git", "-C", str(repo_root), "rev-parse", "--is-inside-work-tree"],
        capture_output=True,
        env=git_environment(),
        check=False,
    )
    if probe.returncode != 0 or probe.stdout.decode().strip() != "true":
        return None
    listed = subprocess.run(
        ["git", "-C", str(repo_root), "ls-files", "-z"],
        capture_output=True,
        env=git_environment(),
        check=True,
    )
    return set(listed.stdout.decode().split("\0")) - {""}


def main() -> int:
    repo_root = Path(__file__).resolve().parents[2]
    distribution_root = repo_root / "prayers"
    if len(sys.argv) > 1:
        given = Path(sys.argv[1])
        distribution_root = given if given.is_absolute() else (Path.cwd() / given).resolve()
        repo_root = distribution_root.parent

    missing: list[str] = []
    untracked: list[str] = []
    tracked = tracked_paths(repo_root)

    for artifact in catalog_artifact_paths(distribution_root):
        try:
            display = str(artifact.relative_to(repo_root))
        except ValueError:
            display = str(artifact)
        if not artifact.is_file():
            missing.append(display)
            continue
        if tracked is not None and display not in tracked:
            untracked.append(display)

    if missing or untracked:
        for path in missing:
            print(f"missing: {path}", file=sys.stderr)
        for path in untracked:
            print(f"untracked: {path}", file=sys.stderr)
        print(
            "git add the listed .praypkg files, then rerun make check-artifacts; do not rerun make publish",
            file=sys.stderr,
        )
        return 1

    print("check-artifacts: ok")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
