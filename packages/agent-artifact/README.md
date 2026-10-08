# amkisko/agent-artifact

Review skill files, prompt templates, MCP configs, and tool schemas. Use when that review is asked for on its own. Covers local skill trees and HTTP-published discovery documents.

Exports:

- `agent-artifact` skill - inventory, untrusted descriptions, least privilege, secret-handling checks

Tree this skill under `.agents/skills`. Do not compose it into AGENTS.md.

`engineering-audit` learned-systems still owns product RAG and in-product agents. This skill owns published agent artifacts. `agent-discovery` owns when a product should publish agent HTTP discovery.

Related: `amkisko/engineering-audit`, `amkisko/security`, `amkisko/agent-run-supervision`, `amkisko/agent-discovery`.
