# Swift conventions and ordinary host execution

## Participants

- Andrei Kisko

## Decisions

Add a host-independent Swift fragment. Preserve declared runtime requirements in all language packs and require a named unmet requirement before adding execution layers. Keep consumer interaction sequences and framework recipes in project overlays.

## Effects

- Add `swift-conventions` 1.0.0 for apps, libraries, command-line tools, servers, and scripts. The fragment is 1935 bytes, within its 2048-byte acceptance limit.
- Add the same execution-layer rule to `ruby-conventions` 1.5.0, `rust-conventions` 1.2.0, `elixir-conventions` 1.1.0, and `kotlin-conventions` 1.1.0. Preserve existing guidance and declared runtimes.
- Add the Swift cross-reference to `preferred-stack` 1.7.1. Register both the new Swift package and the previously unlisted source for the existing Elixir package in the publisher manifest. Update the consumer example, catalog listing, and lockfile.
- Record the contrary cases, claim outcomes, sources, and qualifications in the [work record](../issues/20261112103122_swift-conventions.md#claim-ledger).

Validation commands and observed results:

- `make test validate-skills`: 73 tests, 210 assertions, zero failures, errors, or skips; all 21 skills valid. Prose and agent-context checks also pass.
- `pray publish --dry-run`: list the planned local catalog writes.
- `make publish`: publish six new versions to the local distribution; report 38 packages unchanged. Its `make catalog-topics` step rewrites six catalog files. No remote service is involved.
- `make plan`: show six package version changes or additions and a lockfile update; managed destinations unchanged.
- `make install`: refresh the lockfile successfully.
- `make verify drift check-agent-context`: exit 0; agent context 16266/16384 bytes.
- In each of five temporary consumer roots, use `source "local", "<checkout>/prayers"` and compose exactly one package at its new version. Run `pray --no-input install`, `pray --no-input verify --strict`, and `pray --no-input drift`: all 15 commands exit 0. Temporary roots are removed after the run.
- `make check-artifacts`: initially fail because the six new archives are untracked; add those six archive paths with `git add`; rerun and observe `check-artifacts: ok`. The first index write is blocked by the filesystem sandbox; the authorized retry succeeds.
- Run a Ruby check using `JSON.parse`, `File.size`, and `git show HEAD:<catalog>`: all previously published version entries are preserved, and all six new versions and archive files exist. The Swift archive is 2768 bytes.
- `git diff --check`: exit 0.

This change adds guidance and package metadata, with no executable application logic. Validation exercises package resolution and composition; no source-text assertion tests are added.

## Next

- Deliver the local catalog change through the repository's release workflow.
- After delivery, consumers may compose `pray "amkisko/swift-conventions", "~> 1.0"` and retain their application-specific contracts in the project overlay.

## Source

- [Work record and factual review](../issues/20261112103122_swift-conventions.md).
- [Swift package and primary sources](../../packages/swift-conventions/README.md).
- [Publisher manifest](../../Prayfile).
