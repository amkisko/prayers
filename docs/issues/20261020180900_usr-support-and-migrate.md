# usr/reports, usr/support, and usr/migrate

Live work. Name shared workshop trees for read-only investigation, support mutations, and manual migrations. Path split exists so a human reviewer sees risk before opening the file.

## Participants

- amkisko

## Decisions

`usr/reports/` holds read-only analysis and investigation console scripts. No mutations.

`usr/support/` holds product and customer support console scripts that mutate or write. A person pastes or runs the script after review. Programmable agents may author the script and the note; they do not run it against a live process.

`usr/migrate/` holds schema and data migration scripts for manual running before new code is on the process. Later framework schema migrate stays schema-only and idempotent.

Do not invent `usr/console` as a shared tree. Other workshop trees (`usr/scripts`, `usr/bin`, and similar) stay unnamed examples of the `usr/` role.

Later pass: keep `usr/reports` and `usr/support` separate rather than collapsing into one support tree. Reviewer clarity outweighs one-home-per-case convenience.

docs-conventions 3.2.0. ruby-conventions 1.3.1 Related line.

## Effects

Package sources updated under packages/docs-conventions and packages/ruby-conventions. CHANGELOG.md Unreleased names the bump. README package table summary updated.

Validation (earlier pass, support+migrate only):

- make PRAY=$HOME/.cargo/bin/pray apply: docs-conventions 3.2.0, ruby-conventions 1.3.1; Prayfile.lock and AGENTS.md updated.
- make PRAY=$HOME/.cargo/bin/pray verify: exit 0.
- ruby usr/scripts/check_prayer_prose.rb packages/docs-conventions packages/ruby-conventions: check-prayer-prose: ok.

Later pass validation (reports + support + migrate):

- make PRAY=$HOME/.cargo/bin/pray apply && verify: exit 0; AGENTS.md 22936 bytes; three usr/ bullets present.
- ruby usr/scripts/check_prayer_prose.rb packages/docs-conventions packages/ruby-conventions: check-prayer-prose: ok.

## Next

1. Merge trunk/2026-10-20-usr-workshop-trees; tag v1.26.0; GitHub release from CHANGELOG 1.26.0.
2. Consumers bump docs-conventions ~> 3.2, then pray update, plan, apply.
3. Consumer repos: keep read-only scripts under `usr/reports`; move mutating support console scripts from `usr/reports` or `usr/console` into `usr/support` when ready.

## Source

Session analysis of workshop trees and consumer practice: some repos used `usr/reports` for mixed inspect and mutate scripts; others used `usr/console` for paste-first support scripts. Prior workshop role: docs/issues/20260916173100_docs-working-records.md.
