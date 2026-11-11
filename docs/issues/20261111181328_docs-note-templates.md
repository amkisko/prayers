# Docs note templates under usr/templates/note

Live work. Encode blank timestamp-tree note skeletons in `amkisko/docs-conventions` and provision them to consumers.

## Participants

Andrei Makarov (@amkisko)

## Decisions

Own the six skeletons in `packages/docs-conventions/templates/note/` as a folder export named `note`. Consumers tree `usr/templates` (not `usr/templates/note`) so pray places files at `usr/templates/note/*.md` from the export path's last segment.

Keep heading names and order: Participants, Decisions, Effects, Next, Source for plans, issues, reviews, changelogs, and meetings. Optional near-title lines stay labels, not competing `##` headings: design-only framing on plans; `Scope:` on reviews; `Intent:` on changelogs; `Date:` on meetings.

Dependency skeletons keep Participants first, then Dependency, Symptom, Evidence, Suggested fix, Next, Source. Align `dependency-issues` with that order and with notes already in this repository.

Always name the current human operator under Participants. That person is present for every note. Do not omit Participants. Do not invent a name from git or OS identity marks. This reverses the omit-when-unknown line from docs-conventions 3.4.1 (`docs/issues/20261021102716_docs-conventions-participants-omitted.md`).

Do not invent a separate package. Do not use `spec.templates` (parsed, unused for destinations per pray RFC 0034). Do not use six `file:` bindings when one folder export covers the tree.

## Effects

- `amkisko/docs-conventions` 3.6.0: note folder export; fragment includes plans in the five-heading sentence; README documents sync and optional preamble lines.
- `amkisko/docs-conventions` 3.7.0: Participants always names the current human operator; omit-when-unknown removed.
- `amkisko/dependency-issues` 3.1.0: Participants on dependency notes; pointer to the dependency skeleton. Declared in this repository Prayfile so publish includes it (compose still optional for consumers).
- `amkisko/dependency-issues` 3.2.0: Participants required (no omit-when-unknown).
- This repository Prayfile trees `usr/templates` for docs-conventions. README consumer example bumps docs-conventions to `~> 3.7` and dependency-issues to `~> 3.2`.
- CHANGELOG.md 1.38.0 names the package bumps and README consumer pin moves.

Validation (3.6.0 / 3.1.0 pass):

- `make PRAY=$HOME/.cargo/bin/pray publish plan apply verify`: published docs-conventions 3.6.0 and dependency-issues 3.1.0; wrote six `usr/templates/note/*.md` files; verify exit 0.
- `cmp` of each skeleton under `packages/docs-conventions/templates/note/` versus `usr/templates/note/`: equal.
- `make check-agent-context`: ok (16244/16384 bytes).
- `make check-prayer-prose`: ok.
- `make check-artifacts`: ok after staging the two new `.praypkg` files.
- `make test`: exit 0 (including check_artifacts_test 9 runs / 37 assertions).

Validation (3.7.0 / 3.2.0 pass):

- `make PRAY=$HOME/.cargo/bin/pray publish plan apply verify`: published docs-conventions 3.7.0 and dependency-issues 3.2.0; AGENTS.md updated; verify exit 0.
- `make check-agent-context`: ok (16266/16384 bytes).
- `make check-prayer-prose`: ok.
- `make check-artifacts`: ok after staging the 3.7.0 and 3.2.0 `.praypkg` files.

## Next

1. Merge `trunk/1.38.0` to `main`, then tag `v1.38.0` and publish the GitHub release.
2. Consumers bump `docs-conventions ~> 3.7` (and `dependency-issues ~> 3.2` when composed), add the `usr/templates` tree block, then `pray update && pray plan && pray apply`.

## Source

- `packages/docs-conventions/`
- `packages/dependency-issues/`
- `docs/issues/20261021134610_docs-plans-temporal-framing.md`
- `docs/issues/20261021102716_docs-conventions-participants-omitted.md`
- `docs/changelogs/20261111190045_prayers-1-38-0.md`
- pray RFC 0034 unused `spec.templates` / folder export destination naming

