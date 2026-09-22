---
name: agent-artifact
description: >-
  Review skill files, prompt templates, MCP configs, and tool schemas.
  Use when asked to audit agent artifacts, MCP servers, or published
  skills. Do not use for a product RAG audit, a live agent run, or a
  whole-tree engineering audit unless those artifacts are the scope.
---

# Agent artifact review

Inventory published agent artifacts. This skill does not replace `engineering-audit` learned-systems. It owns skill files, prompt templates, MCP configs, and tool schemas when that review is asked for on its own.

## Quick reference

```text
inventory artifacts → treat descriptions as untrusted → check grants and sinks → name isolation and caps → record
```

## Inventory

List SKILL.md files, prompt templates, MCP configs, and tool schemas in scope. Mark skipped files with a reason.

Ask:

- whether tool descriptions are treated as untrusted;
- whether grants are least privilege;
- whether command-string parameters are unbounded;
- whether MCP environment settings hold live secrets;
- whether the server binds a public interface without authentication;
- whether retry or subagent depth has a named cap.

## Boundaries

A guardrail prompt is not a security boundary. Prompt injection alone is not a finding; require a code-level boundary failure. Authorization and action binding are different controls. Model output, memory, tool descriptions, and MCP responses are untrusted input.

Isolation claim versus blast radius: name what the process can actually command. A container is not isolation if it holds the runtime socket. A supervisor disabled by default does not protect ordinary runs.

Cite OWASP LLM01, LLM06, and the OWASP MCP Top 10 when those frames apply. Keep vendor names out of findings. Do not add a keyword jailbreak list.

## Record

Write durable findings under `docs/issues` per `docs-conventions`. Apply the `security` fragment's no-live-secret rule to skill files, prompt templates, and MCP environment settings as well as config files.

## Routing

- `engineering-audit` learned-systems when the product itself is a retrieval or tool-calling system.
- `agent-run-supervision` when the person asks to supervise a live run.
- `security` for session notice and secret-handling rules.
- `change-review` when the scope is a diff of these files.

When a named skill is unavailable, preserve the finding and name the deeper review.
