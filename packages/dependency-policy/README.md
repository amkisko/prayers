# amkisko/dependency-policy

Language- and platform-neutral stop-gate for third-party packages, plus an audit skill.

Exports:

- `dependency-policy` — AGENTS fragment: terminology, stop-before-add, when to run the skill
- `dependency-audit` skill — selection/alteration rules, advisory scans, and recon/OSINT

Compose and tree this package together. Selection heuristics live in the skill.

Related: `amkisko/dependency-issues` records upstream defects under `usr/docs/dependencies/`; `amkisko/minimal-implementation` covers YAGNI before adding deps.
