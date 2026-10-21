# docs-conventions Participants omitted for current operator

## Participants

- Andrei Makarov

## Dependency

`amkisko/docs-conventions` in `amkisko/prayers`. Package source tip at this writing before the fix: `3.3.0` (`packages/docs-conventions`, export `docs-conventions`). Published artifacts under `prayers/v1/artifacts/amkisko/docs-conventions/` through `3.3.0`. A consumer lock observed on `3.1.1`. The wording gap below was present in the export text on both the locked consumer install and the `3.3.0` source tip.

Related earlier tightening: `docs/changelogs/20260726221452_docs-conventions-human-participants.md` (Participants humans only; agents, tools, and binaries out). That pass correctly banned non-humans. It did not require naming the current operator, and it did not define how to resolve a display name.

Cross-package note: the same fragment says conventions that matter fail a command, and points at `amkisko/infer-conventions`. No shippable check in `docs-conventions` currently fails a new timestamp-tree note for a missing or empty Participants heading.

## Symptom

Coding agents that follow the installed fragment write live-work notes under `docs/issues`, `docs/reviews`, `docs/changelogs`, and `docs/meetings` without a `## Participants` heading, or with that heading omitted because the agent treats the section as empty.

The human who ran the session (the current operator) is absent from the durable record. Later readers cannot see who owned the note. Solo sessions are the common miss: the agent correctly refuses to list itself, then drops the section entirely.

A second pattern: the agent substitutes a ticket-style Problem / Fix outline for the five required headings. Participants disappears with the template switch even when Decisions and Effects content is present under other names.

## Evidence

Fragment text (export `docs-conventions.md`, tip `3.3.0`), relevant clauses:

1. Timestamp trees issues, reviews, changelogs, and meetings must make five things findable: Participants, Decisions, Effects, Next, Source.
2. Use `##` headings or equivalent; omit empty sections.
3. Participants: humans only; omit agents, tools, and binaries.
4. Software, tools, agents, or binaries belong under Decisions, Effects, or Source when needed, never under Participants.

Observed agent failure modes against that text:

- Conjunction of "omit empty sections" and "omit agents" yields: no non-human to list, one unnamed human, section treated as empty, heading omitted.
- No instruction to resolve an operator display name before writing. Session context often exposes a filesystem nickname or home segment, not a person name suitable for Participants.
- No instruction that a single known human still fills Participants. Solo work looks optional.
- Competing outlines (Problem / Fix, intake summaries) are not named as non-substitutes for the five headings, so agents optimize for technical content and drop metadata.
- "Conventions that matter fail a command" is stated, but this heading is not backed by a fail-closed check in the package, so omission survives review and merge.

Consumer sample (identity redacted): among recent `docs/issues` files in one consumer repository that installs this package, roughly two in five lacked `## Participants`. Files that included the heading usually listed a person display name. Files that used Problem / Fix without the five headings were a recurring miss class.

Operator identity that agents skip is available on ordinary developer machines without project-specific services:

1. `git config user.name` (preferred display name for Participants).
2. Else latest local commit author: `git log -1 --format='%an'`.
3. Else a tracker or workspace user whose email matches `git config user.email`.
4. Else OS or home nickname, marked as unresolved display name, only when 1-3 are absent.

On the machine used for this report, (1) resolved to a stable person name and matched recent commit authors. Agents that never run that lookup still omit Participants.

## Suggested fix

Upstream in `amkisko/prayers`, package `amkisko/docs-conventions` (bump past tip `3.3.0`):

1. Keep humans-only Participants. Do not list agents, tools, and binaries.
2. Add an explicit non-empty rule: Participants is not empty when the current operator is known. Always name that person on new notes in issues, reviews, changelogs, and meetings. Solo sessions still get one Participants line.
3. Add an operator resolution chain (first match wins): `git config user.name`; else latest local commit author name; else tracker or workspace profile matching `git config user.email`; else OS or home nickname with an explicit unresolved-display-name note. Prefer the person display name over a login nickname when both exist.
4. State that Problem / Fix and similar ticket outlines do not replace the five headings. Map content into Decisions and Effects; keep Participants, Next, and Source as their own headings.
5. Optionally ship or document an `infer-conventions` (or consumer) check that fails new or touched files under those four trees when `## Participants` is missing or the section body is blank. Aligns with the existing "conventions that matter fail a command" line.

Do not require listing every person who ever touched related code. Require the operator of this note, plus other humans who decided or reported in that episode when known.

Consumer workaround until the package bumps: local AGENTS or skill reminder to resolve `git config user.name` before any timestamp-tree write, and to refuse Problem / Fix-only skeletons for those four trees.

## Next

1. Done: patch export and README; bump to `3.4.0`; publish `prayers/v1` artifact; compose AGENTS via release.
2. Done: Participants check stays consumer-local via `infer-conventions`; documented in package README.
3. Consumers run pray update / plan / apply after this branch merges; optionally backfill Participants on open live-work notes where the operator is known.
4. Optional: scan agent session reviews for repeated Participants omission after the bump to confirm the wording fix landed.

## Source

- `amkisko/prayers` package `amkisko/docs-conventions` export `docs-conventions`
- Prior human-only pass: `amkisko/prayers` `docs/changelogs/20260726221452_docs-conventions-human-participants.md`
- Related: `amkisko/infer-conventions` (executable convention checks referenced by the fragment)
- This report: consumer observation during ordinary agent-authored docs writes; operator resolution verified via local git identity lookup
