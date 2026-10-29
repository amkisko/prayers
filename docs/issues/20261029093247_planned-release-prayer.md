# Planned release as a shared prayer

## Participants

Andrei Makarov (@amkisko)

## Decisions

- Encode the planned-release contract as `amkisko/planned-release` 1.0.0, a compose fragment.
- Essential agreements in the fragment (not optional knobs): two-week sprint cadence, ISO week release ids `YYYYwNN`, release collection into a milestone, and shared-workbench process indicators aligned with the team's human workshop philosophy without copying a manifesto as machine procedure.
- Without release collection and a milestone, the package is out of scope. Host clickpaths stay in bindings; the milestone role does not.
- Allow local scripts and bots only when their success path leaves forge-visible membership, candidate, supersession, cut, and close evidence for a second operator.
- Do not add a cut skill in 1.0.0. Replay validators and skills wait until two bindings share a deterministic check.
- Design input lived in a product repository review and plans; this issue owns distribution work in amkisko/prayers.

## Effects

- Package files under `packages/planned-release/` rewritten so cadence, week numbering, milestone collection, and workbench principles are first-class.
- Prayfile compose entry added so this distribution exercises the fragment.
- `amkisko/branch-naming` Related line points at planned-release for lifecycle beyond prefixes.
- `docs/release-runbook.md` names planned-release roles for this repository's own cuts.
- CHANGELOG Unreleased notes the package.

## Next

- Reviewer reads the fragment and binding rules before merge.
- Run `make check-prayer-prose`, `make package PACKAGE_DIR=packages/planned-release`, then `make publish` / release cut when ready to ship the catalog.
- Consumers compose `amkisko/planned-release ~> 1.0` and write a short binding; first consumer binding expected from the originating product tree.
- After two bindings exist, add a report-only replay validator if the same checks recur.

## Source

- Originating product docs (session review, alternatives plan, multi-project scale plan, hardening issue) remain in that repository; do not copy private project detail here.
- `packages/branch-naming`, `packages/delivery-budgets`, `docs/release-runbook.md`
