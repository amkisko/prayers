# amkisko/agent-discovery

Guidance for products that want AI agents to discover crawl policy, readable content, APIs, auth, MCP, or skills over HTTP. Maturity ladder by site type. Does not chase vendor readiness scores.

Exports:

- `agent-discovery` skill - what to publish, what to skip, and how discovery relates to access control

Tree this skill under `.agents/skills`. Do not compose it into AGENTS.md.

`agent-artifact` reviews existing skill and MCP artifacts. `public-surface-recon` observes discovery on an authorized live target. This skill decides what a product should publish.

Related: `amkisko/agent-artifact`, `amkisko/public-surface-recon`, `amkisko/engineering-audit`, `amkisko/security`.
