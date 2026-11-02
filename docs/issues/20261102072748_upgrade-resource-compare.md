# Upgrade resource comparison for dependency changes

## Participants

Andrei Makarov (@amkisko)

## Decisions

Require before/after resource samples when an automated or human dependency change alters a resolved lockfile graph or runtime pin. Encode the procedure in `amkisko/dependency-policy` as a dependency-audit reference, not a new package and not a continuous CI ceiling.

The reviewing agent uses isolated base and head checkouts, runs named probes, and returns the comparison without changing the active worktree. It writes to the change request or durable notes only when the current request authorizes those writes. Keep measurement tooling small and consumer-local so both revisions use the same fixture. Do not replace review judgment with a cross-ecosystem benchmark harness.

Minimum series on every upgrade that changes a resolved graph or runtime pin: install or graph storage, resident memory after a named boot or thin path, CPU time (or a stated proxy) for that same path, and shipped bundle or image size when the product ships bytes. Name the probe, fixture, and machine class. CPU, RSS, and wall-time direction claims require at least three comparable samples per revision. Cheaper, smaller, faster, or greener stays inference until comparable samples support it.

Distinguish siblings: `delivery-budgets` gates absolute ship-path size and build timing in CI; engineering-audit resource and budget mode audits utilization claims; this procedure produces the upgrade delta evidence those reviews can cite.

## Effects

Package edits are collected in the `trunk/1.33.0` release candidate: `amkisko/dependency-policy` 4.2.0 with `upgrade-resource-compare`, fragment and alteration wiring; `amkisko/delivery-budgets` 1.0.1; and the final `amkisko/engineering-audit` 2.16.0, which includes the earlier 2.15.0 resource work. Sibling associations use advisory `spec.related` (pray 1.26+) so `pray explain` lists them without installing or resolving targets.

## Next

- Review and merge the `trunk/1.33.0` candidate, then deliver tag `v1.33.0` and its GitHub release.
- Consumers compose `amkisko/dependency-policy ~> 4.2`.
- Optional later: short consumer binding note naming local measure commands; keep that out of the shared prayer.

## Source

- `packages/dependency-policy/`
- `packages/delivery-budgets/exports/delivery-budgets.md`
- `packages/engineering-audit/skills/engineering-audit/resource-and-budget.md`
