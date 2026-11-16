# Checkable prayer instructions

## Participants

Andrei Makarov (@amkisko)

## Decisions

Require checkable instructions across prayer sources: name the actor, action, target, applicable conditions, limits, failure behavior, and completion evidence. Distinguish requirements, prohibitions, permissions, and recommendations. Replace experiential labels for system behavior with the operation, outcome, prerequisite, resource cost, or interaction they mean. Retain applicable technical terms, attributed human reports, necessary qualifications, and uncertainty. Do not invent missing thresholds or mechanisms.

Keep the shared rules in `writing-prose` and concrete checks in the owning skills. Compact existing prose to fit the composed instruction budget. No keyword gate or prose-content tests: a word match cannot establish that an instruction defines executable behavior. This change does not claim measured improvement in agent execution.

Prepare `writing-prose` 3.8.0, `engineering-audit` 2.18.0, and `operational-signal-intake` 1.0.2 with matching local catalog artifacts and consumer examples. Retain historical artifact versions. Do not change dependencies or run the proposed evaluation study.

## Effects

The destructive-action review names confirmation target and consequence, cancellation without a state change, and undo within its stated window. The signal evidence model names failed restoration, measured recovery time, and required manual steps. The documentation layout issue names missing or competing destinations as its revisit condition. The evaluation plan names out-of-scope requests sharing selector vocabulary and requests matching multiple selectors.

Baseline validation:

- `make test`: exit 0; 73 runs, 210 assertions, no failures, errors, or skips; prose check passed; composed instructions 16266/16384 bytes.

Local delivery and validation:

- `make publish`: exit 0; three local package versions generated, 41 unchanged; catalog topics rewritten for three files. No remote publication.
- `make install`: first attempt failed when the sandbox denied provisioning under `.agents/`; rerun with approved filesystem access exited 0 and refreshed generated instructions and lock state.
- `make test`: first post-publication run failed because the three new package artifacts were not tracked. Added only those artifacts to the Git index as required by the repository publishing instructions; rerun exited 0, 73 runs, 210 assertions, no failures, errors, or skips.
- `make validate-skills verify check-agent-context`: exit 0; 21 skills valid, managed files verified, composed instructions 16338/16384 bytes.
- `make check-artifacts check-prayer-prose drift`: exit 0; artifacts present and tracked, prose check passed, no drift output.
- `git diff --check` and `git diff --cached --check`: exit 0, no output.
- Prepare candidate `trunk/1.40.0`: CHANGELOG 1.40.0 cut; `make release` exit 0 (0 published, 44 unchanged; AGENTS.md 16338/16384); `make test` 73 runs, 210 assertions; `make drift` exit 0. See `docs/changelogs/20261116175157_prayers-1-40-0.md`.

## Next

- Merge `trunk/1.40.0` to `main`, then tag `v1.40.0` and publish the GitHub release.
- Measure agent execution effects only after choosing and authorizing a concrete evaluation protocol; structural checks do not establish those effects.

## Source

- User request: analyze and implement concrete, explicit prayer wording without filler or unrelated definitions; operator name confirmed in this session.
- `packages/writing-prose/exports/writing-prose.md`.
- `packages/engineering-audit/skills/engineering-audit/product-surface.md`.
- `packages/operational-signal-intake/skills/operational-signal-intake/references/evidence-model.md`.
- [Documentation destination decision](20260916173100_docs-working-records.md).
- [Evaluation study plan](../plans/20261116171015_prayers-evaluation-study.md).
