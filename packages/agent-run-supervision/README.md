# amkisko/agent-run-supervision

Supervise a live tool-calling agent run: hard ceilings, no-progress detection, human barrier, isolation map.

Exports:

- `agent-run-supervision` skill — tool-call and wall-clock caps, approval and completion states, supervision cost

Tree this skill under `.agents/skills`. Do not compose it into AGENTS.md.

`session-review` stays retrospective over transcripts. This skill is live during a run.

Related: `amkisko/engineering-audit`, `amkisko/agent-artifact`, `amkisko/finite-state-machines`.
