## Participants

- Andrei Makarov

## Decisions

Participants in usr/docs trace notes list humans only. Agents, tools, and binaries stay out of that heading. Software mentions belong under Decisions, Effects, or Source only when needed for execution or later analysis.

Package amkisko/docs-conventions bumped to 2.1.0 and published to the local prayers/v1 distribution root.

## Effects

Updated packages/docs-conventions export and prayspec. Regenerated AGENTS.md managed span. Added prayers/v1/artifacts/amkisko/docs-conventions/2.1.0 artifact and package metadata. make release also refreshed distribution published_at stamps and synced SECURITY.md from community-security package source.

## Next

Consumers run pray update, plan, apply after merge. Optional: clean existing notes that put agents or binaries under Participants.

Later pass: 2.1.1 also bans absolute local paths and private material in docs/ and usr/docs (see usr/docs/changelogs/20260726221627_docs-conventions-no-path-or-private-leaks.md).

## Source

Request to tighten Participants guidance after misuse in consumer audit notes.
