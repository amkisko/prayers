# amkisko/security-audit

Full repository security audit with explicit coverage, bounded agent work, independent finding validation, and machine-checked run artifacts.

Tree this skill under `.agents/skills` beside `amkisko/engineering-audit`. Do not compose it into AGENTS.md. Use `engineering-audit` security mode for a focused product or subsystem review, `change-review` for a diff, `dependency-audit` for package advisories and reachability, and `agent-run-supervision` to supervise a live worker.

The package is 0.x because the run schema is new. Consumers should pin `~> 0.1` until the artifact contract has survived real audits.
