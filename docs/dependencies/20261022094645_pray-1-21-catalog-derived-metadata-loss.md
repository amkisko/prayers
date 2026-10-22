# Pray 1.21 catalog metadata loss

## Dependency

`pray-cli` 1.21.0, invoked as `pray` by the repository `Makefile`.

## Symptom

`make publish` rewrote all 41 existing `prayers/v1/packages/amkisko/*.json` catalogs and removed `derived_metadata` from historical version records. New `amkisko/durable-cache` 2.0.0 and `amkisko/engineering-audit` 2.14.3 records also had no derived metadata, so `make catalog-topics` had no summary or topics to normalize for those versions.

## Evidence

- The working-tree diff after `make publish` changed every package catalog although only `amkisko/durable-cache` had a new version.
- Historical `durable-cache` 1.0.0 and 1.0.1 records lost their summary, topics, categories, effects, embeddings, and counts.
- Publishing only `engineering-audit` 2.14.3 into an isolated empty catalog produced a new record without `derived_metadata`.
- The installed 1.21.0 library contains no `derived_metadata` handling. The repository's `usr/scripts/catalog_topics.rb` only normalizes metadata already present and does not recreate missing fields.
- Restoring unrelated catalogs and the two historical `durable-cache` records from their pre-publish content left `make check-artifacts`, `make verify`, and `make drift` passing.

## Suggested fix

Report the regression upstream. A publisher that updates one package should preserve unrecognized fields on existing catalog records. If derived metadata remains part of the catalog contract, it should also create that metadata for a new record before the repository topic normalizer runs.

Until fixed, inspect the catalog diff after each publish, restore historical metadata from the reviewed Git version, and keep only the intended new package record. Do not synthesize missing metadata by hand.

## Next

- Open an upstream issue with a minimal repository containing one historical catalog record with `derived_metadata` and one new package version.
- Decide whether new versions must carry derived metadata or whether this repository should retire `make catalog-topics` and its documented contract.

## Source

Upstream project: https://github.com/kiskolabs/pray

Downstream publisher: `Makefile`

Downstream normalizer: `usr/scripts/catalog_topics.rb`

Affected catalogs: `prayers/v1/packages/amkisko/durable-cache.json` and `prayers/v1/packages/amkisko/engineering-audit.json`
