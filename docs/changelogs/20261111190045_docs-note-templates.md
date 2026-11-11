# Docs note templates and required Participants

## Participants

Andrei Makarov (@amkisko)

## Decisions

Ship blank timestamp-tree note skeletons from `amkisko/docs-conventions` via a `note` folder export provisioned at `usr/templates/note/`. Keep the five findable headings on plans, issues, reviews, changelogs, and meetings. Optional near-title lines stay labels: design-only framing, `Scope:`, `Intent:`, `Date:`.

Always name the current human operator under Participants. Reverse the 3.4.1 omit-when-unknown rule. Align `dependency-issues` so dependency notes require Participants first.

## Effects

Product release 1.38.0 cuts `docs-conventions` 3.6.0 and 3.7.0 plus `dependency-issues` 3.1.0 and 3.2.0. This repository trees `usr/templates` for the skeletons.

## Next

None for the cut. Consumer pin bumps follow deliver.

## Source

- `docs/issues/20261111181328_docs-note-templates.md`
- `docs/changelogs/20261111190045_prayers-1-38-0.md`
- `CHANGELOG.md` 1.38.0
