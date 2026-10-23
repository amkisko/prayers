# delivery-budgets 1.0.0

## Participants

- Andrei Makarov

## Decisions

Ship-path size and build timing had audit language in engineering-audit but no shared MUST for continuous CI budgets across products. Encode that as `amkisko/delivery-budgets` 1.0.0, a compose fragment. Keep budget YAML and gate scripts in each consumer repository. Ingest dashboards stay optional. Skip only when the tree never becomes shipped bytes.

Distinguish from `engineering-audit` resource and budget mode: that mode is an audit pass over utilization. This fragment requires ongoing CI fail-closed budgets on the artifacts the product actually ships.

Cut CHANGELOG.md 1.31.0 for this package. README consumer example composes `delivery-budgets` for products that ship byte-bearing artifacts. This repository publishes the package and does not compose it into AGENTS.md (prose catalog; no product ship path).

Person-facing surface: CHANGELOG.md and README catalog row. Hierarchy is version heading then imperative bullets. Copy names the package, version, and when to compose. No interactive, empty, loading, or error states.

## Effects

- New package `amkisko/delivery-budgets` 1.0.0: named artifact size budgets, sibling timing reports, required when/where sample identity.
- Claims pass before cut: dropped consumer schema identifiers (`max_bytes`, `max_growth_ratio`, timestamp field names); gate the recipient-facing size series; name local image size versus registry or manifest compressed size separately; keep absolute ceiling when baseline is missing.
- Catalog: `prayers/v1/packages/amkisko/delivery-budgets.json` and `prayers/v1/artifacts/amkisko/delivery-budgets/1.0.0/`.
- Prayfile path package and Prayfile.lock entry for 1.0.0. AGENTS.md unchanged.

## Validation

- `make validate-skills`: 17 skills valid; exit 0.
- `make check-prayer-prose`: ok.
- `make PRAY=<cargo-pray> publish`: published `amkisko/delivery-budgets` 1.0.0; 40 unchanged; `catalog-topics` rewritten 1 file. Restored unrelated newline and field-order noise on four existing catalog JSON files.
- `make PRAY=<cargo-pray> plan apply verify`: lockfile gained delivery-budgets 1.0.0; AGENTS.md unchanged; verify exit 0.
- `make check-artifacts` after staging the new `.praypkg` and catalog: ok.
- `make PRAY=<cargo-pray> drift`: exit 0; no findings.
- `make test`: 61 runs, 181 assertions; 0 failures, 0 errors.
- `git diff --check` and `git diff --cached --check`: exit 0.
- `pray` version: 1.22.0 (cargo binary).

## Next

- Commit on `trunk/1.31.0-delivery-budgets`, open PR, merge to `main`.
- Tag `v1.31.0` and create the GitHub release from the CHANGELOG 1.31.0 section.
- Consumers compose `amkisko/delivery-budgets ~> 1.0` and keep concrete budgets in-repo.
- Optional later: short skill for wiring budget YAML and report kinds; keep the fragment under the compose size budget.

## Source

docs/issues/20261023211000_delivery-budgets-prayer.md
packages/delivery-budgets/
Downstream: CHANGELOG.md 1.31.0
