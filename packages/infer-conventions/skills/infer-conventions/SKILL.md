---
name: infer-conventions
description: >-
  Learn how a repository actually writes, then encode genuine forks as
  executable checks. Use when the user wants to detect, infer, or
  standardize project conventions, resolve mixed patterns, or stop agents
  from inventing a second style. Documents reality by making the majority
  fail a command when violated. Do not use for one-off code review, to
  enforce formatting a project tool already owns, or to write agent
  convention markdown.
---

# Infer conventions

Read `infer-conventions.md` in this skill directory for ground rules, steps,
verdicts, how to choose a check, and edge cases.

You are encoding how this tree writes. You are not improving it. A convention
that matters fails a command.

## Quick reference

```text
orient → genuine-fork sweep → architecture and house pass → confirm → add the check that fails on violation → summarize
```

Default is confirm: encode only what the person approves. Encode without asking only when the invocation said to. Mixed styles still go to the person.

Do not write convention files under `.agents/conventions/` or restated bullets in AGENTS.md.

## Related

`working-rules` covers tests for a new check. `minimal-implementation` keeps the check small. `dependency-policy` applies before adding a new tool. `engineering-audit` reviews defects; this skill does not judge.
