# Planned release as a shared prayer

## Participants

Andrei Makarov (@amkisko)

## Decisions

- Encode the planned-release contract as `amkisko/planned-release` 1.0.0, a compose fragment.
- Essential agreements in the fragment: two-week sprint cadence, ISO week as atomic unit (`YYYYwNN`), release collection into a milestone, forge-visible evidence, and process signals with kinds (predicate, counter, duration, drill), sample identity, audit disposition (pass, fail, process debt, dated exception), and project baseline ceilings.
- Compose only when release collection and a milestone exist. Host clickpaths stay in bindings; the milestone role stays in the fragment.
- Allow local scripts and bots only when their success path leaves forge-visible membership, candidate, supersession, cut, and close evidence for a second operator.
- Cut skill and replay validators wait until two bindings share a deterministic check; none ship in 1.0.0.
- Design input lived in a product repository review and plans; this issue owns distribution work in amkisko/prayers.
- Prose and engineering pass in this issue: drop workshop philosophy, empty contrasts, and unmeasurable health language; keep only forge-answerable signals and an auditable baseline path.

## Effects

- Package files under `packages/planned-release/` rewritten so cadence, week numbering, milestone collection, signal kinds, sample identity, audit disposition, and baseline enforcement are first-class.
- Prayfile compose entry added so this distribution exercises the fragment.
- `amkisko/branch-naming` Related line points at planned-release for lifecycle beyond prefixes.
- `docs/release-runbook.md` names planned-release roles for this repository's own cuts.
- CHANGELOG Unreleased notes the package.
- `docs/reviews/20261029120557_planned-release-process-signals.md` records the session corrections that drove the signal contract.

## Next

- Reviewer reads the fragment and binding rules before merge.
- Run `make check-prayer-prose`, `make package PACKAGE_DIR=packages/planned-release`, then `make publish` / release cut when ready to ship the catalog.
- Consumers compose `amkisko/planned-release ~> 1.0` and write a short binding that names measurement script, sample store, and baseline ceilings; first consumer binding expected from the originating product tree.
- After two bindings exist, add a report-only replay validator if the same checks recur.

## Source

- Originating product docs (session review, alternatives plan, multi-project scale plan, hardening issue) remain in that repository; private project detail stays there.
- `packages/branch-naming`, `packages/delivery-budgets`, `docs/release-runbook.md`, `docs/reviews/20261029120557_planned-release-process-signals.md`
