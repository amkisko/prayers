---
name: agent-run-supervision
description: >-
  Supervise a live tool-calling agent run with ceilings, no-progress
  detection, and a human barrier. Use when asked to watch, cap, or
  stop a worker that calls tools. Do not use for session retrospectives,
  skill-file review, or a pentest runner.
---

# Agent-run supervision

Supervise a live tool-calling run. This skill does not replace `session-review` or `agent-artifact`. It owns ceilings and barriers while the worker is running.

## Quick reference

```text
name isolation → set tool-call and wall-clock caps → detect identical calls → request approval or stop → measure supervision cost
```

## Ceilings

Set hard tool-call and wall-clock ceilings. Detect identical calls and lack of progress. Stop gracefully when a cap is hit. Bound generated plans. Refine after each completed step.

## Barriers

Distinguish the human-approval state (`ask`) from the terminal state (`done`). State whether supervision is enabled by default. Record each supervisor's measurements and cost. Claims that extra supervisors improve quality by a multiplier stay inference until a benchmark demonstrates the effect.

## Isolation

Name what the worker can touch when prompt injection succeeds: host runtime socket, extra capabilities, host network, downloaded binaries. A container is not isolation if it holds the runtime socket. Untrusted target content can steer tools.

Context compaction can drop constraints, authorization, or a do-not-touch rule. Ask whether compacted history is still the contract.

## Record

Write durable findings under `usr/docs/issues` per `docs-conventions`. Tool-call and token counts belong in `engineering-audit` resource-and-budget.

## Routing

- `agent-artifact` for published skill files and MCP configs.
- `engineering-audit` learned-systems for in-product agents.
- `session-review` after the run, over transcripts.
- `public-surface-recon` for authorized blackbox HTTP; do not chain this skill to exploit tools.

When a named skill is unavailable, preserve the finding and name the deeper review.
