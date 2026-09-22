## Participants

- Andrei Makarov

## Decisions

docs/ and usr/docs must not contain local absolute filesystem paths or private material: secrets, credentials, tokens, API keys, or personal private data. Prefer repository-relative paths.

Extends docs-conventions 2.1.0 (humans-only Participants) as 2.1.1 on the same publish branch.

## Effects

Published amkisko/docs-conventions 2.1.1 to prayers/v1. Regenerated AGENTS.md managed span.

## Next

Merge PR. Consumers run pray update, plan, apply. Sweep existing notes for absolute home-directory paths or pasted secrets if any appear.

## Source

Follow-on request after Participants tightening; prior note usr/docs/changelogs/20260726221452_docs-conventions-human-participants.md.
