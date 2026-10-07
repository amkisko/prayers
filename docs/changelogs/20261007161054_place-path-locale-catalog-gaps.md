# Place, path, locale, and catalog package bumps

## Decisions

Publish keep-the-work 1.4.0, preferred-stack 1.6.0, ruby-conventions 1.3.0, working-rules 2.7.0, and engineering-audit 2.12.0. Fold place, path, locale, and catalog guidance into those packages. No new always-on prayer. claims-audit unchanged.

## Effects

Source versions and exports updated. README example pins raised. CHANGELOG Unreleased carries the five product-facing bullets. Catalog artifacts for 1.4.0, 1.6.0, 1.3.0, 2.7.0, and 2.12.0 are staged. make check-artifacts validate-skills test verify passed.

## Next

Consumers bump amkisko/keep-the-work ~> 1.4, preferred-stack ~> 1.6, ruby-conventions ~> 1.3, working-rules ~> 2.7, engineering-audit ~> 2.12, then pray install.

## Source

docs/issues/20261007161054_place-path-locale-catalog-gaps.md
