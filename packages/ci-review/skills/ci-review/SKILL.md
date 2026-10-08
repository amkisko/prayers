---
name: ci-review
description: >-
  Retrospective over this repository's CI: run counts, failures grouped by
  root cause, wall-clock and queue times, re-runs, cache usage, and required
  check lanes, ending in at most five ranked fixes. Findings are proposals;
  change nothing without approval. Use when asked how CI is doing, why CI is
  slow, what keeps failing in the pipeline, or to review CI runs, including
  when a prior review's next line names CI items that are due. Do not use for
  debugging one failing run or pull request (read that run's log), for a
  security review of a workflow or pipeline file change (use change-review
  with engineering-audit security mode), or for agent session retrospectives
  (use session-review).
---

# CI review

A retrospective over continuous integration runs for this repository. Report findings and recommendations. Implement pipeline or config changes only when requested.

## Quick reference

```text
scope and coverage -> collect run evidence -> group failures -> separate queue from wall-clock -> rank at most five fixes -> record without changing pipelines
```

By default, report findings and recommendations. Edit pipelines, runners, caches, or required checks when the person's request authorizes those changes or they approve a concrete proposal.

## Scope and coverage

Stay on this project. Use the time since the last review of this kind; if none exists, use the last 30 days. Inspect other projects only when the person asks.

State which pipelines and runs you could actually read and any gaps. Prefer the host's CI API or CLI when available (for example `gh` for GitHub Actions). Account identifiers and auth belong in the consumer, not here. If evidence collection failed, do not mark the review complete.

## What to collect

- Run counts by pipeline and conclusion.
- Failures grouped by repeating root cause, not by one-off log lines.
- Wall-clock duration and queue wait as separate series.
- Re-runs and attempt counts that hide flaky or capacity problems.
- Cache hit or miss signals and cache entry bloat when the API allows it.
- Required check lanes: which checks gate merge and how often they fail or stall.

## Evidence

Distinguish observed fact from hypothesis. One failed run is not a confirmed pattern. Do not invent recurrence.

Cite concise locators (pipeline file, run id, job name, step name) rather than pasting long logs into `docs/`. Prefer structured list and view commands over dumping every log into the model context. Keep secrets, credentials, and unrelated personal information out of the report and out of `docs/`.

Separate queue wait from job execution before calling the pipeline slow. Sustained queue growth is a runner-capacity finding; flat duration with rising end-to-end time is the same.

## Recommendations

Rank by developer feedback cost and recurrence. Show at most five. Prefer deleting redundant triggers and duplicated jobs before micro-optimizing a step.

For each recommendation include evidence, expected benefit, implementation target, one concrete next action, and how we would verify that it helps.

Before implementing an approved automation or pipeline edit, name the replay input (the runs or queries that showed the pattern) and a small verification gate (a later review that no longer finds that pattern, or a before-and-after duration or failure count).

## Record

Write the durable result under `docs/reviews` per `docs-conventions`, one note per review episode. Update that note while the review is active, and link the previous review used to set the time window. Record scope, coverage, recommendations, and outcome. Follow the reviews heading template. The chat report may be compact; the file stays plain prose. Recording the review does not change pipelines.

Keep proposals in the project's review note. When work on a shared prayer begins in its source repository, record that work in the source repository's `docs/issues`. Record an upstream dependency defect under `docs/dependencies` only when evidence supports it, per `dependency-issues`.

## Routing

- Read that run's log when the question is one failing run or pull request check.
- `change-review` with `engineering-audit` security mode for a pipeline file change that needs a security pass.
- `session-review` for agent session transcripts, not CI runs.
- `operational-signal-intake` for live service evidence outside CI.
- `engineering-audit` when the finding is product code or in-repo pipeline behavior beyond CI fleet health.
- `claims-audit` when the report states material external facts.
- `minimal-implementation` and `dependency-policy` before adding code or a package.
- `collaboration-workflow` for what belongs in the live-work queue.

When a named skill is unavailable, preserve the finding and name the deeper review. Do not invent the missing skill's procedure.
