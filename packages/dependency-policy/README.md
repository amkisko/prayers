# amkisko/dependency-policy

Language- and platform-neutral stop-gate for third-party packages, plus an audit skill.

Exports:

- `dependency-policy` — AGENTS fragment: terminology, stop-before-add, and ordinary-work security triggers
- `dependency-audit` skill — selection/alteration rules, target-scoped vulnerability assessments, recon/OSINT, and freshness lag (libyears or equivalent)

Compose and tree this package together. Selection heuristics live in the skill.

Related: `amkisko/dependency-issues` records upstream defects under `docs/dependencies/`; `amkisko/minimal-implementation` covers YAGNI before adding deps.
