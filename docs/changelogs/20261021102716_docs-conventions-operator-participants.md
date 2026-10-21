# docs-conventions operator Participants

## Participants

- Andrei Makarov

## Decisions

Participants stays humans only. When the current operator is known, the section is not empty: new notes under issues, reviews, changelogs, and meetings always name that person, including solo sessions. Other humans who decided or reported in the episode are listed when known; every past code touch is out of scope.

Operator display name resolves first match wins: `git config user.name`, else latest local commit author, else tracker or workspace profile matching `git config user.email`, else OS or home nickname marked unresolved. Prefer a person display name over a login nickname.

Problem / Fix and similar ticket outlines do not replace the five headings. A fail-closed Participants check stays consumer-local via `infer-conventions`; this package documents that option and does not ship the check.

Package `amkisko/docs-conventions` bumped to 3.4.0.

## Effects

Updated `packages/docs-conventions` export, README, and prayspec. Recorded the defect under `docs/dependencies/20261021102716_docs-conventions-participants-omitted.md`. CHANGELOG Unreleased names 3.4.0.

Validation:

- RBENV_VERSION=3.4.10 make test: exit 0 (skill, artifact, catalog topic, prayer prose, security-audit run specs; check-prayer-prose ok).
- make PRAY=$HOME/.cargo/bin/pray release: publish wrote docs-conventions 3.4.0; plan/apply updated Prayfile.lock and AGENTS.md to 3.4.0; verify exit 0; check-artifacts ok after git add of the new .praypkg.
- make drift: exit 0.

## Next

Consumers run pray update / plan / apply after this branch merges. Optional: backfill open live-work notes; optional session-review scan for repeated omission after consumers pick up 3.4.0.

## Source

docs/dependencies/20261021102716_docs-conventions-participants-omitted.md
Prior: docs/changelogs/20260726221452_docs-conventions-human-participants.md
