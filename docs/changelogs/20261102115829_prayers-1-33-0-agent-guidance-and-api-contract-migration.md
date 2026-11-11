# prayers 1.33.0 agent guidance and API contract migration

## Participants

Andrei Makarov (@amkisko)

## Decisions

Prepare distribution release 1.33.0 from the complete former Unreleased set. The payload is `api-contract-migration` 1.0.0, `engineering-audit` 2.16.0, `dependency-policy` 4.2.0, `delivery-budgets` 1.0.1, `agent-artifact` 1.3.0, and `public-surface-recon` 1.4.0, plus repository validation and pre-inference context gates.

Use `trunk/1.33.0` as the release candidate. Prepare means a reviewed merge of this candidate to `main`. Deliver is the `v1.33.0` tag and GitHub release.

## Effects

CHANGELOG.md now has a 1.33.0 heading dated 2026-11-02 and names only the final package versions. Intermediate unreleased `engineering-audit` 2.15.0 work is included in 2.16.0 rather than appearing as a separate published version.

The local `prayers/v1` catalog contains the six named versions and their staged archives. Their combined archive size is 74,348 bytes. Every archive SHA-256 digest matches its catalog `artifact_hash`.

Validation:

- `make validate-skills`: 20 skills valid.
- `make check-prayer-prose`: zero findings.
- `make test`: 73 tests, 209 assertions, zero failures and errors.
- `make release`: published six local catalog versions; plan, apply, verify, and the 16 KiB context gate passed; the final artifact check stopped only because the six new archives were not yet tracked.
- Staged the six archives, six package catalog changes, and catalog index change; `make check-artifacts` then passed. The publish step was not repeated.
- Package archive hashes match their catalog hashes. `git diff --cached --check` passed.
- `pray drift --semantic` passed. Ordinary `pray drift` still reports the known Pray 1.26.0 renderer mismatch recorded in `docs/dependencies/20261102094751_pray-drift-renderer-mismatch.md`; plan, apply, verify, and source-to-provisioned comparisons are the documented release checks for this upstream defect.

Delivered: tagged `v1.33.0` on `48a26d0` and published https://github.com/amkisko/prayers/releases/tag/v1.33.0 (backfill; tag pushed to gitlab.com, github.com, and codeberg.org).

## Source

- `CHANGELOG.md`
- `docs/changelogs/20261102072748_upgrade-resource-compare.md`
- `docs/changelogs/20261102094751_agent-guidance-audit-fixes.md`
- `docs/changelogs/20261102111635_api-contract-migration.md`
- `docs/reviews/20261102094751_agent-guidance-engineering-prose-audit.md`
- `docs/reviews/20261102111635_api-contract-migration-claims-review.md`
- `docs/release-runbook.md`
