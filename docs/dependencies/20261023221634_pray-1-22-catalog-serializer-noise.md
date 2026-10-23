# Pray 1.22 catalog serializer noise

## Dependency

`pray` 1.22.0 (cargo binary invoked as `PRAY` by the repository `Makefile`). Distinct from the Ruby `pray-cli` gem shims under rbenv.

## Symptom

`make publish` that only adds one new package version still rewrites a few unrelated existing catalog JSON files. The rewrites are not content changes: trailing newlines are stripped, and on some version objects `artifact_hash` / `tree_hash` move relative to `yanked` in the key order. Diff noise forces a manual restore before review. Artifact hashes, tree hashes, signatures, and `derived_metadata` on records that already have it stay intact.

This is not the pray 1.21 catalog metadata-loss defect. That release rewrote every catalog and dropped `derived_metadata`. With 1.22.0, a publish of `amkisko/delivery-budgets` 1.0.0 left 40 packages reported unchanged, wrote `derived_metadata` on the new record, and did not strip metadata from historical versions that still carried it.

## Evidence

Observed on 2026-10-23 while publishing `amkisko/delivery-budgets` 1.0.0 on branch `trunk/1.31.0-delivery-budgets`:

- Command: `make PRAY=<cargo-pray-1.22.0> publish` then `catalog-topics` (rewrote 1 file: the new package).
- Publish summary: 1 published, 40 unchanged. Matches the Prayfile selection (41 unique local packages including the new one) against an index that also lists catalogs not selected for publish.
- Mechanism (upstream `publish_to_root`): the unchanged branch still called `write_registry_package_metadata` after load. Rust `serde_json::to_string_pretty` omits a final newline and emits struct field order (`artifact_hash` / `tree_hash` before `yanked`). Ruby `version_to_hash` historically emitted `yanked` before those hashes. Downstream `usr/scripts/catalog_topics.rb` writes with a trailing newline when it rewrites a catalog.
- Unrelated working-tree diffs after publish:
  - `prayers/v1/packages/amkisko/collaboration-workflow.json`: final newline removed only (key order already matched Rust).
  - `prayers/v1/packages/amkisko/docs-conventions.json`: final newline removed only.
  - `prayers/v1/packages/amkisko/durable-cache.json`: `artifact_hash` and `tree_hash` reordered before `yanked` on version 2.0.0; final newline removed.
  - `prayers/v1/packages/amkisko/engineering-audit.json`: same key-order and newline change on version 2.14.3.
- Only catalogs whose on-disk bytes already differed from a Rust round trip showed a git diff. Most unchanged packages were already newline-free and in Rust key order, so a rewrite left no visible diff.
- Intended diffs kept: `prayers/v1/index.json` (new package name), new `delivery-budgets.json`, new `.praypkg`.
- After `git checkout --` of the four unrelated catalogs, `make check-artifacts`, `make verify`, and `make drift` passed.
- New `delivery-budgets` 1.0.0 catalog record includes `derived_metadata` (summary, topics, counts).
- Leftover from 1.21 (unchanged by this publish): `durable-cache` 2.0.0 and `engineering-audit` 2.14.3 still lack `derived_metadata`. Those tip rows still carried Ruby key order from the 1.21 write; other rows in the same files already matched Rust order, so only those tips showed a key-order diff when Rust re-serialized the file.

## Suggested fix

Upstream: on the unchanged publish path, do not rewrite the package catalog file. Prefer not touching a file that has no semantic change. If a later release must re-serialize, match the on-disk key order and newline convention used by existing catalog peers.

Workaround in this repository: after every `make publish`, inspect `git diff -- prayers/v1/packages`, restore unrelated catalog JSON from the reviewed Git version, keep only the intended new or bumped package record plus `index.json` and artifacts. Do not invent missing `derived_metadata` by hand for the 1.21 leftovers; either leave them or republish those versions under a later pray that emits the field.

## Next

- Consume an upstream pray build newer than 1.22.0 that skips catalog writes for unchanged versions (fix drafted in the pray Unreleased changelog). Track against https://github.com/kiskolabs/pray.
- Keep the post-publish catalog-diff restore step in the release path until that lands in the cargo binary used as `PRAY`.
- Separate decision (still open from the 1.21 note): backfill or resign `derived_metadata` on `durable-cache` 2.0.0 and `engineering-audit` 2.14.3, or retire the requirement for historical records.

## Source

Upstream project: https://github.com/kiskolabs/pray

Related earlier defect: docs/dependencies/20261022094645_pray-1-21-catalog-derived-metadata-loss.md

Downstream publisher: `Makefile` (`publish` target)

Downstream topic normalizer: `usr/scripts/catalog_topics.rb` (adds a trailing newline when it rewrites)

Downstream materialization this session: docs/changelogs/20261023211000_delivery-budgets.md; restored paths `prayers/v1/packages/amkisko/{collaboration-workflow,docs-conventions,durable-cache,engineering-audit}.json`
