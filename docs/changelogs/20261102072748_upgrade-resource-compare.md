# Upgrade resource compare in dependency-policy

## Decisions

Require before/after resource samples when a change alters a resolved lockfile graph or runtime pin. Keep the procedure inside `amkisko/dependency-policy` 4.2.0 as `upgrade-resource-compare` rather than a new package. The reviewing agent uses isolated checkouts, preserves the active worktree, and needs authorization before repository or forge writes. Consumer measurement commands stay small. Absolute ship-path ceilings remain in `delivery-budgets` 1.0.1. Utilization audit stays in `engineering-audit` 2.15.0 resource and budget mode. Sibling packages declare each other with advisory `spec.related` (pray 1.26+).

## Effects

Updated package sources under `packages/dependency-policy/`, Related prose and `spec.related` under `packages/delivery-budgets/` and `packages/engineering-audit/`. Live-work note: `docs/issues/20261102072748_upgrade-resource-compare.md`.

## Next

- Open PR for `feature/upgrade-resource-compare`, merge, cut catalog release when ready.

## Source

- `docs/issues/20261102072748_upgrade-resource-compare.md`
- `packages/dependency-policy/skills/dependency-audit/references/upgrade-resource-compare.md`
