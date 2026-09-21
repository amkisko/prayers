# amkisko/agent-artifact

Review skill files, prompt templates, MCP configs, and tool schemas. Use when that review is asked for on its own.

Exports:

- `agent-artifact` skill — inventory, untrusted descriptions, least privilege, secret-handling checks

Tree this skill under `.agents/skills`. Do not compose it into AGENTS.md.

`engineering-audit` learned-systems still owns product RAG and in-product agents. This skill owns published agent artifacts.

Related: `amkisko/engineering-audit`, `amkisko/security`, `amkisko/agent-run-supervision`.
