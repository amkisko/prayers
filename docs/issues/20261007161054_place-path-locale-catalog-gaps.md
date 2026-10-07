# Place, path, locale, and catalog gaps

Fold product-place gaps into existing packages. No new always-on prayer. Keep claims-audit unchanged. Keep product-local form libraries and GraphQL naming out of shared guidance.

## Participants

Andrei Makarov.

## Decisions

Encode five package bumps on main:

- keep-the-work 1.4.0: alternate-id GET is a moved show; mutations and live frames stay; typed values the widget rewrote redisplay; confirm that cannot run is not consent; failed catalog picker keeps the typed query.
- preferred-stack 1.6.0: product locale for person-facing dates; combobox plus paged live list for growing association catalogs; empty assignment default; write commands look like commands.
- ruby-conventions 1.3.0: path generate and lookup order; no global find; path(record) versus string id; date text when product locale differs; TimeZoneConverter prepend; association pickers reuse paged list API.
- working-rules 2.7.0: after an identifier shape change, search path helpers that pass a string id.
- engineering-audit 2.12.0: product-surface asks locale dates, paged pickers, empty assignment, and confirm; contracts treat uuid primary key as the only id field.

Do not add a new compose fragment. Do not put Finnish locale strings or Formtastic field types into shared packages.

## Effects

Source exports and prayspec versions updated. README consumer example pins raised to the new floors. CHANGELOG Unreleased lists the five publishes. make publish wrote catalog artifacts for the five packages. make install plan apply verify check-artifacts validate-skills test passed with PRAY from cargo. AGENTS.md remains over the 16 KiB house target.

## Next

Consumers bump pins and pray install. Commit when asked.

## Source

Upstream: packages/keep-the-work, packages/preferred-stack, packages/ruby-conventions, packages/working-rules, packages/engineering-audit. Downstream: docs/changelogs/20261007161054_place-path-locale-catalog-gaps.md, CHANGELOG.md Unreleased, README.md.
