# amkisko/agent-run-supervision

Supervise a live tool-calling agent run: invocation budget with validation reserve, hard ceilings, bounded malformed-result retry, no-progress detection, incomplete terminal state, human barrier, and isolation map.

Exports:

- `agent-run-supervision` skill - agent-invocation, tool-call, and wall-clock caps; approval, complete, and incomplete states; supervision cost

Tree this skill under `.agents/skills`. Do not compose it into AGENTS.md.

`session-review` stays retrospective over transcripts. This skill is live during a run.

Related: `amkisko/engineering-audit`, `amkisko/agent-artifact`, `amkisko/finite-state-machines`.
