# amkisko/session-review

Review agent sessions for repeated work, corrections, and reusable patterns. Recommend the smallest durable response: a script, a tool or adapter, a shared prayer package, a project convention, or no action.

Exports:

- `session-review` skill — scope coverage, confirm recurrence from original transcripts, rank recommendations, record without changing skills or rules

Tree this skill under `.agents/skills`. Do not compose it into AGENTS.md.

Harness-specific transcript paths stay in the consumer. This package does not train a model or apply skill or rule edits without approval.

For feedback about a distributed prayer, the skill can offer Pray's `confess` acceptance or rejection signal with a concise note when the person authorizes it. Detailed findings stay in the review note.

Related: `amkisko/collaboration-workflow`, `amkisko/docs-conventions`, `amkisko/claims-audit`, `amkisko/infer-conventions`, and `amkisko/minimal-implementation`.
