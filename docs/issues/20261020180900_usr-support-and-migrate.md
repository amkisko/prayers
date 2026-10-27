# usr workshop trees

Live work. Name shared workshop trees for maintainer scripts, read-only investigation, support mutations, and manual migrations. Path split for reports versus support exists so a human reviewer sees risk before opening the file.

## Participants

Andrei Makarov (@amkisko)

## Decisions

`usr/scripts/` holds maintainer scripts invoked from a checkout, Makefile, CI, or a runner on a named path. Not paste-into-live-console support or migrate work. Stable descriptive filenames.

`usr/reports/` holds read-only analysis and investigation console scripts. No mutations.

`usr/support/` holds product and customer support console scripts that mutate or write. A person pastes or runs the script after review. Programmable agents may author the script and the note; they do not run it against a live process.

`usr/migrate/` holds schema and data migration scripts for manual running before new code is on the process. Later framework schema migrate stays schema-only and idempotent.

Do not invent `usr/console` as a shared tree. `usr/bin` and similar stay unnamed examples of the `usr/` role unless a later pass names them.

Later pass: keep `usr/reports` and `usr/support` separate rather than collapsing into one support tree. Reviewer clarity outweighs one-home-per-case convenience.

Later pass: name `usr/scripts` in the shared convention. Evidence: this repository wires publisher checks under `usr/scripts` into Make; other repos keep coverage helpers, local assessment, and similar maintainer tools there, run via shell or `rails runner` on the path.

docs-conventions 3.3.0. ruby-conventions 1.3.2 Related line. Product release 1.27.0.

## Effects

Package sources updated under packages/docs-conventions and packages/ruby-conventions. CHANGELOG.md 1.27.0 names the bump.

Validation for 1.26.0 (reports, support, migrate): tagged v1.26.0; GitHub release https://github.com/amkisko/prayers/releases/tag/v1.26.0.

Validation for 1.27.0:

- RBENV_VERSION=3.4.10 make test: exit 0.
- make PRAY=$HOME/.cargo/bin/pray release: docs-conventions 3.3.0, ruby-conventions 1.3.2; check-artifacts ok after staging new .praypkg files; make drift exit 0.
- AGENTS.md names `usr/scripts` with the maintainer-script bullet.

## Next

1. Tag v1.27.0 and GitHub release when ready.
2. Consumers bump docs-conventions ~> 3.3, then pray update, plan, apply.
3. Consumer repos: keep read-only scripts under `usr/reports`; move mutating support console scripts from `usr/reports` or `usr/console` into `usr/support` when ready; keep maintainer tools under `usr/scripts`.

## Source

Session analysis of workshop trees and consumer practice: some repos used `usr/reports` for mixed inspect and mutate scripts; others used `usr/console` for paste-first support scripts; maintainer tools commonly live under `usr/scripts`. Prior workshop role: docs/issues/20260916173100_docs-working-records.md.
