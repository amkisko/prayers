---
name: session-review
description: >-
  Review agent sessions for repeated work, corrections, and reusable
  patterns. Use when asked to review recent agent sessions, find
  repeated work or corrections, improve tools and process, or run a
  session retrospective. Do not use for one-off code review, product
  engineering audit, encoding repository conventions, live service
  intake, or to edit skills and rules without approval.
---

# Session review

A retrospective over agent sessions: find repeated work, corrections, and reusable patterns, then recommend the smallest improvement to tools and working process. This skill does not train a model. Report findings; implement recommendations when requested.

## Quick reference

```text
scope and coverage → original transcripts → candidate patterns → confirm recurrence → smallest response → rank recommendations → record without changing skills or rules
```

By default, report findings and recommendations. Edit skills, rules, integrations, or canonical preferences when the person's request authorizes those changes or they approve a concrete proposal.

## Scope and coverage

Stay on this project. Use the time since the last review of this kind; if none exists, use the last 30 days. Inspect other projects only when the person asks.

State which sessions you could actually read and any gaps. Use the transcripts the current environment can open. Harness-specific paths belong in the consumer project, not here. If transcripts are missing, ask for a sanitized sample. Do not mark the review complete when evidence collection failed.

Start with a compact session summary when one already exists. Still inspect representative original transcripts before treating a pattern as supported.

## What to look for

- Repeated discovery, navigation, commands, or mechanical processing.
- Repeated user workflows and information handoffs.
- User corrections, repeated agent errors, and missing steps.
- Successful reusable patterns and opportunities to simplify.
- Principles that recur across several skills or workflows.

## Evidence

Inspect original transcripts. Distinguish observed fact from hypothesis. One incident is not a confirmed pattern. Do not invent recurrence.

Cite concise locators (session identifier, turn, command) rather than copying long private transcripts. Keep secrets, credentials, and unrelated personal information out of the report and out of `docs/`.

## Smallest response

For each useful finding, pick one:

- Script or CLI: repeated deterministic work.
- Tool or adapter: repeated structured access or external operations.
- Shared prayer package: reusable guidance across projects. Use a skill for judgment-heavy work or a fragment for an always-on rule.
- Project convention or documentation: project-specific navigation and rules.
- No action: isolated, or unlikely to justify the effort.

Prefer deterministic code over repeated model reasoning. Prefer a short script for repeatable steps.

## Recommendations

Rank by value. Show only the strongest few. Separate project-specific improvements from reusable ones. For shared guidance, name the prayer package that owns the proposed change, or say why a new package is needed.

For each recommendation include evidence, expected benefit, implementation target, one concrete next action, and how we would verify that it helps.

Before implementing an approved automation, name the replay input (the sessions or commands that showed the pattern) and a small verification gate (a script, a test, or a later review that no longer finds that pattern).

## Record

Write the durable result under `docs/issues` per `docs-conventions`, one note per review episode. Update that note while the review is active, and link the previous review used to set the time window. Record scope, coverage, recommendations, and outcome. Follow the live-work heading template. The chat report may be compact; the file stays plain prose. Recording the review does not change skills or rules.

Keep proposals in the project's review note. When work on a shared prayer begins in its source repository, record that work in the source repository's `docs/issues`. Record an upstream dependency defect under `docs/dependencies` only when evidence supports it, per `dependency-issues`.

For a reviewed distributed prayer, offer `pray confess <package> --accepted` or `pray confess <package> --rejected` to send a package verdict to its distribution point. Use `--note` for a concise finding and `--url` when the destination must be supplied. Check the destination and remove private transcript details before an authorized submission. Keep the full evidence and proposed improvement in the review note.

## Routing

- `infer-conventions` when the finding is how this tree writes.
- `claims-audit` when the report states material external facts.
- `engineering-audit` when the finding is product code or pipeline behavior.
- `operational-signal-intake` when the finding is live service evidence.
- `minimal-implementation` and `dependency-policy` before adding code or a package.
- `collaboration-workflow` for what belongs in the live-work queue.

When a named skill is unavailable, preserve the finding and name the deeper review. Do not invent the missing skill's procedure.
