# Pressure benchmarking prayer

## Decisions

Adapt a consumer-local pressure benchmarking skill into shared package
`amkisko/pressure-benchmarking` 1.0.0. Keep measurement harnesses and ceiling
files in consumer repositories. Encode calibrate-before-baseline, primary
series, propose-basis per series, RSS probe class, samples-per-load >= 3 for
gate/propose/write, pressure cooker N >= 10, and explicit stop criteria.
Avoid naming vendor products or persons in the skill rationale; keep the
practice ideas.

Ownership stays split: `delivery-budgets` for continuous ship-path absolute
gates; dependency-audit upgrade resource compare for one-change base/head
deltas; engineering-audit resource and budget for utilization claims and
candidate lists; this skill for calibrate, load ladder, ceiling ratchet, and
cooker episodes.

Collect the package into distribution release 1.35.0 on candidate
`trunk/1.35.0`.

## Effects

Added `packages/pressure-benchmarking` with skill, `pressure-loop.md`, and
`known-practices.md`. Wired the skill under `.agents/skills` in Prayfile.
Pointed Related from delivery-budgets 1.0.2, dependency-policy 4.2.1, and
engineering-audit 2.16.1 at the new package. Cut CHANGELOG 1.35.0 and README
consumer tree example.

## Next

- Open or update the candidate request for `trunk/1.35.0` into `main`, merge
  when checks pass, then deliver tag `v1.35.0` and the GitHub release
- Consumers can pin `amkisko/pressure-benchmarking ~> 1.0` and strengthen
  local self-tests for stage-distinct p95 parsing

## Source

- `packages/pressure-benchmarking/`
- session review on calibrate, primary series, propose-basis, RSS limits,
  n >= 3 write/gate, and stop criteria
- `packages/dependency-policy/skills/dependency-audit/references/upgrade-resource-compare.md`
- `packages/delivery-budgets/exports/delivery-budgets.md`
- `packages/engineering-audit/skills/engineering-audit/resource-and-budget.md`
- `docs/changelogs/20261106174238_prayers-1-35-0.md`
