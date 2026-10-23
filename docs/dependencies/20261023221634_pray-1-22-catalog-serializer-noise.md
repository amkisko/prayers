# Pray 1.22 catalog serializer noise

## Dependency

`pray` 1.22.0 (cargo binary invoked as `PRAY` by the repository `Makefile`). Distinct from the Ruby `pray-cli` gem shims under rbenv.

## Symptom

`make publish` that only adds one new package version still rewrites a few unrelated existing catalog JSON files. The rewrites are not content changes: trailing newlines are stripped, and on some version objects `artifact_hash` / `tree_hash` move relative to `yanked` in the key order. Diff noise forces a manual restore before review. Artifact hashes, tree hashes, signatures, and `derived_metadata` on records that already have it stay intact.

This is not the pray 1.21 catalog metadata-loss defect. That release rewrote every catalog and dropped `derived_metadata`. With 1.22.0, a publish of `amkisko/delivery-budgets` 1.0.0 left 40 packages reported unchanged, wrote `derived_metadata` on the new record, and did not strip metadata from historical versions that still carried it.

## Evidence

Observed on 2026-10-23 while publishing `amkisko/delivery-budgets` 1.0.0 on branch `trunk/1.31.0-delivery-budgets`:

- Command: `make PRAY=<cargo-pray-1.22.0> publish` then `catalog-topics` (rewrote 1 file: the new package).
- Publish summary: 1 published, 40 unchanged.
- Unrelated working-tree diffs after publish:
  - `prayers/v1/packages/amkisko/collaboration-workflow.json`: final newline removed only.
  - `prayers/v1/packages/amkisko/docs-conventions.json`: final newline removed only.
  - `prayers/v1/packages/amkisko/durable-cache.json`: `artifact_hash` and `tree_hash` reordered before `yanked` on version 2.0.0; final newline removed.
  - `prayers/v1/packages/amkisko/engineering-audit.json`: same key-order and newline change on version 2.14.3.
- Intended diffs kept: `prayers/v1/index.json` (new package name), new `delivery-budgets.json`, new `.praypkg`.
- After `git checkout --` of the four unrelated catalogs, `make check-artifacts`, `make verify`, and `make drift` passed.
- New `delivery-budgets` 1.0.0 catalog record includes `derived_metadata` (summary, topics, counts).
- Leftover from 1.21 (unchanged by this publish): `durable-cache` 2.0.0 and `engineering-audit` 2.14.3 still lack `derived_metadata`. Those two version objects are exactly the ones that received key-order rewrites, which matches serializer touch of records that 1.21 wrote without that field.

## Suggested fix

Upstream: when rewriting a package catalog JSON file, preserve byte-stable formatting for version records that are not the published version (trailing newline, key order). Prefer not opening a file that has no semantic change. If re-serializing is required, match the on-disk key order and newline convention used by existing catalog peers in this repository.

Workaround in this repository: after every `make publish`, inspect `git diff -- prayers/v1/packages`, restore unrelated catalog JSON from the reviewed Git version, keep only the intended new or bumped package record plus `index.json` and artifacts. Do not invent missing `derived_metadata` by hand for the 1.21 leftovers; either leave them or republish those versions under a later pray that emits the field.

## Next

- Open or extend an upstream pray issue: publisher should not dirty unrelated catalogs; include the trailing-newline and key-order cases from this note.
- Keep the post-publish catalog-diff restore step in the release path until that lands.
- Separate decision (still open from the 1.21 note): backfill or resign `derived_metadata` on `durable-cache` 2.0.0 and `engineering-audit` 2.14.3, or retire the requirement for historical records.

## Source

Upstream project: https://github.com/kiskolabs/pray

Related earlier defect: docs/dependencies/20261022094645_pray-1-21-catalog-derived-metadata-loss.md

Downstream publisher: `Makefile` (`publish` target)

Downstream materialization this session: docs/changelogs/20261023211000_delivery-budgets.md; restored paths `prayers/v1/packages/amkisko/{collaboration-workflow,docs-conventions,durable-cache,engineering-audit}.json`
