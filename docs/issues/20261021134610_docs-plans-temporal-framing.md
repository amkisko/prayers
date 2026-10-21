# docs plans temporal framing

## Decisions

`docs/plans`, `docs/issues`, and `docs/changelogs` mark time. Plans hold the uncertain future: design-only notes before work is committed. Issues hold the certain current: live work in play and the open queue. Changelogs hold the factual past: what shipped. Keep those common names; do not rename the trees to futures, currents, or pasts.

Earlier docs-conventions kept pitch and plan inside the live-work issue. That mixed uncertain design with committed current work. A consumer-fork maintainer reported that the fork already used a separate design-notes tree and had renamed it from singular `docs/plan` to plural `docs/plans`. Upstream adopts the plural tree and the time axis so the reported fork can align instead of carrying a local wording fork.

Package `amkisko/docs-conventions` 3.5.0 names six timestamp trees. Reviews, meetings, and dependencies keep their existing roles. The five-heading template still applies to issues, reviews, changelogs, and meetings. Plans stay design notes; when implementation starts, open or update an issue.

`amkisko/collaboration-workflow` 2.5.0 points design-only exploration at `docs/plans`. The plain-prose checker includes that tree.

## Effects

Export and README updated. Collaboration-workflow export bumped. `TIMESTAMP_DOC_TREES` in `usr/scripts/check_prayer_prose.rb` includes `plans`. Product changelog Unreleased names 3.5.0 and 2.5.0.

Validation:

- `RBENV_VERSION=3.4.10 make test`: 61 runs, 180 assertions, 0 failures, 0 errors (earlier sandbox run hit git-init errors on check_artifacts_test; re-run outside sandbox passed).
- `RBENV_VERSION=3.4.10 make PRAY=<installed-pray> validate-skills check-prayer-prose publish plan apply verify`: published docs-conventions 3.5.0 and collaboration-workflow 2.5.0; AGENTS.md and Prayfile.lock updated; verify passed after staging the two new `.praypkg` files; `make check-artifacts`: ok. Machine-specific executable path omitted.
- `pray drift`: exit 0, no drift output.

## Next

1. Consumer fork picks up docs-conventions 3.5.0 through pray and drops the local plans-only wording fork once pinned.
2. Move open design threads out of issues into `docs/plans` when they are not yet committed work.
3. Cut a prayers release when ready to publish 3.5.0 and 2.5.0 to consumers.
