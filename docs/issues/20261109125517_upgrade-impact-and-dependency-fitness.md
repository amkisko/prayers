# Upgrade impact and dependency fitness

## Participants

Andrei Makarov (@amkisko)

## Decisions

Add upgrade impact and fitness reassessment to `amkisko/dependency-policy`
4.3.0. On upgrades, map changelog or release notes from locked base through
target onto this tree's usage, classify `patch-safe` / `adapt-needed` /
`blocked`, and split must-adapt, may-adopt, and do-not-adopt work. When
measured load or a named requirement shows a dependency no longer fits,
reassess replace, remove, vendor or thin fork, or narrow first-party before
custom code.

Escalate from `amkisko/pressure-benchmarking` 1.1.0 when the cooker stalls
inside a third-party package with no high-confidence first-party candidate.
Point `amkisko/minimal-implementation` 1.6.0 at the same reassessment before
custom replacement.

Collect into distribution release 1.36.0 on candidate `trunk/1.36.0`.

## Effects

Added `packages/dependency-policy/skills/dependency-audit/references/upgrade-impact.md`.
Wired impact into skill routing, selection and alteration, full-audit
alteration checks, and the compose fragment. Added pressure-loop dependency
fitness escalate and Related pointers. Extended minimal-implementation rules
for existing-dependency miss. Published local catalog packages 4.3.0, 1.1.0,
and 1.6.0; restored `minimal-implementation` as a Prayfile path publish entry.

## Next

- Tag `v1.36.0` and publish the GitHub release after catalog artifacts land on
  the release commit

## Source

- session analysis of changelog usage map, fitness under pressure, and custom
  versus dependency
- `packages/dependency-policy/`
- `packages/pressure-benchmarking/`
- `packages/minimal-implementation/`
- `docs/changelogs/20261109125517_prayers-1-36-0.md`
