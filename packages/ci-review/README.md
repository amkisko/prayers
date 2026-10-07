# amkisko/ci-review

Retrospective over this repository's CI runs: counts, failure families, wall-clock and queue times, re-runs, cache usage, and required check lanes. Rank at most five fixes. Report findings; change pipelines only when requested.

Exports:

- `ci-review` skill — scope coverage, confirm recurrence from run evidence, rank recommendations, record without changing pipelines

Tree this skill under `.agents/skills`. Do not compose it into AGENTS.md.

Requires read access to the repository's CI run data. Prefer the host's CLI or API when available (for example `gh` on GitHub). Provider account details and auth stay in the consumer.

Related: `amkisko/session-review`, `amkisko/change-review`, `amkisko/engineering-audit`, `amkisko/docs-conventions`, and `amkisko/collaboration-workflow`.
