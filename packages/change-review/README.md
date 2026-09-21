# amkisko/change-review

Review a git diff: account for every changed file, path-matched criteria, falsify each finding against the diff before reporting.

Exports:

- `change-review` skill — coverage, line-range cites, falsify-before-report

Tree this skill under `.agents/skills`. Do not compose it into AGENTS.md.

`engineering-audit` still owns whole-tree and pipeline review. This skill owns the changed-file pass.

Related: `amkisko/engineering-audit`, `amkisko/working-rules`, `amkisko/publish-checks`.
