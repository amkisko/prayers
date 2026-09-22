# Prayfile publish remote

## Participants

- amkisko

## Decisions

Name the local catalog dest in Prayfile. make publish and make serve use that remote instead of a duplicated --root path.

## Effects

Prayfile declares publish "prayers", path: "prayers". make publish runs pray publish with no dest flags. make serve uses --to prayers. README publish section names the remote. CHANGELOG.md Unreleased names the declaration.

pray publish --dry-run listed 29 path-owned packages to dest prayers and wrote nothing.

Validation commands and observed results:

- pray version: pray 1.19.0
- pray install: exit 0; generated_by pray 1.19.0; manifest_hash sha256:adc98c6423190595b898d8fa4418d044c5a3015bddf67d437f5dba2027829bd9
- pray plan: exit 0; lockfile and destinations unchanged
- pray apply: exit 0
- pray verify && pray drift: exit 0
- pray publish --dry-run: exit 0; 29 packages
- make test: exit 0; validate_skill 13 runs, 39 assertions; check_artifacts 9 runs, 37 assertions; 0 failures
- make check-artifacts: exit 0; check-artifacts reported ok
- git diff --check: exit 0, no diagnostics

Did not run a live catalog publish.

## Next

getting-started and elixir-conventions remain catalog-only until listed as path packages. rust-conventions is now a path package. Catalog heading is CHANGELOG.md 1.21.0.

## Source

usr/docs/issues/20260918160400_prayfile-publish-remote.md
Upstream: pray 1.19.0 RFC 0118
Downstream: CHANGELOG.md 1.21.0, usr/docs/changelogs/20260921102600_prayers-1-21-0.md
