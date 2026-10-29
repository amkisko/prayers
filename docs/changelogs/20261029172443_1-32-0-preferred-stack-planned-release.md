# prayers 1.32.0 preferred-stack and planned-release

## Participants

Andrei Makarov (@amkisko)

## Decisions

Cut distribution release 1.32.0 from the Unreleased set: preferred-stack 1.7.0 (native-first proximity plus skill), minimal-implementation 1.5.2 Related, planned-release 1.0.0 through 1.2.0 (fragment plus skill), branch-naming 1.0.2 Related.

## Effects

Catalog publish under `prayers/v1` for the named package versions. Consumer README example bumps preferred-stack to `~> 1.7` and adds planned-release compose/tree pins. Merged via https://github.com/amkisko/prayers/pull/8. Tagged `v1.32.0`. GitHub release: https://github.com/amkisko/prayers/releases/tag/v1.32.0

## Next

Consumers bump preferred-stack `~> 1.7` and add planned-release when they collect releases under a shared milestone.

## Source

Upstream: `docs/issues/20261029165911_preferred-stack-language-proximity.md`, `docs/issues/20261029093247_planned-release-prayer.md`, `docs/reviews/20261029170200_preferred-stack-proximity-prose-audit.md`. Downstream: CHANGELOG.md 1.32.0, catalog artifacts, PR 8, tag `v1.32.0`.
