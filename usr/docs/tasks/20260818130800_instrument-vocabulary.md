# Instrument vocabulary for technical names

## Participants

- amkisko

## Decisions

Technical names, APIs, CLI verbs, RFC titles, identifiers, and UI copy use instrument and protocol words: check-in, last-seen, probe, monitor, expected tick.
Body and organism metaphors such as heartbeat, pulse, and organ stay out of contracts and code.
HTTP /health remains the liveness probe until a later RFC.
House source is writing-prose 3.2.0 and rfc-process 1.2.0.

## Effects

- packages/writing-prose/exports/writing-prose.md
- packages/rfc-process/exports/rfc-process.md
- packages/rfc-process/skills/rfc-process/rfc-process.md
- packages/rfc-process/skills/rfc-process/references/template.md
- CHANGELOG.md 1.5.0

## Next

Consumers run pray install after bumping writing-prose to ~> 3.2 and rfc-process to ~> 1.2.
Haikara already applies the rule in RFC 0010 and drops heartbeat from Proposed RFC-0508.

## Source

- Upstream: house writing-prose and rfc-process
- Downstream: haikara RFC 0010 Vocabulary, RFC-0508 generic check-ins
