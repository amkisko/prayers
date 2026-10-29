# Planned release as a shared prayer

## Participants

Andrei Makarov (@amkisko)

## Decisions

- Encode the planned-release contract as `amkisko/planned-release`, composed as a fragment plus a skill (1.2.0).
- Fragment keeps only the concept: team commitment, collection period, period label (`YYYYwNN`), and agreed prepare (cut) and deliver (publish) calendar events.
- Skill owns defaults, vocabulary, invariants, binding checklist, lifecycle steps, and process signals in `references/process-signals.md`.
- Compose only when release collection and a milestone exist. Host clickpaths stay in bindings; the milestone role stays in the skill defaults.
- Allow local scripts and bots only when their success path leaves forge-visible membership, candidate, supersession, prepare, and close evidence for a second operator.
- Replay validators wait until two bindings share a deterministic check; none ship in 1.2.0.
- Design input lived in a product repository review and plans; this issue owns distribution work in amkisko/prayers.
- Prose and engineering pass: drop workshop philosophy, empty contrasts, and unmeasurable health language; keep only forge-answerable signals and an auditable baseline path. Keep the always-on fragment to the four concept bullets.

## Effects

- Package files under `packages/planned-release/` split: short compose fragment; skill plus process-signals reference.
- Prayfile compose entry exercises the fragment; skill provisions under `.agents/skills`.
- `amkisko/branch-naming` Related line points at planned-release concept and skill.
- `docs/release-runbook.md` names prepare/deliver roles for this repository's own cuts.
- CHANGELOG Unreleased notes 1.0.0 through 1.2.0.
- `docs/reviews/20261029120557_planned-release-process-signals.md` records the session corrections that drove the signal contract.
- `docs/reviews/20261029132640_planned-release-fragment-skill-split.md` records the fragment-versus-skill split and the later concept-only fragment trim.

## Next

- Reviewer reads the fragment and skill before merge.
- Run `make check-prayer-prose`, `make validate-skills`, `make package PACKAGE_DIR=packages/planned-release`, then `make publish` / release cut when ready to ship the catalog.
- Consumers compose `amkisko/planned-release ~> 1.2` and write a short binding that names measurement script, sample store, and baseline ceilings; first consumer binding expected from the originating product tree.
- After two bindings exist, add a report-only replay validator if the same checks recur.

## Source

- Originating product docs (session review, alternatives plan, multi-project scale plan, hardening issue) remain in that repository; private project detail stays there.
- `packages/branch-naming`, `packages/delivery-budgets`, `packages/durable-cache` (fragment-plus-skill pattern), `docs/release-runbook.md`, `docs/reviews/20261029120557_planned-release-process-signals.md`, `docs/reviews/20261029132640_planned-release-fragment-skill-split.md`
