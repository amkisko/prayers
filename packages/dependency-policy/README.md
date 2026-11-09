# amkisko/dependency-policy

Language- and platform-neutral stop-gate for third-party packages, plus an audit skill.

Exports:

- `dependency-policy` - AGENTS fragment: terminology, stop-before-add, and ordinary-work security triggers
- `dependency-audit` skill - selection/alteration rules, target-scoped vulnerability assessments, recon/OSINT, freshness lag (libyears or equivalent), upgrade impact (changelog mapped to usage), isolated base/head upgrade resource compare (CPU, memory, storage, bundle or image size), and fitness reassessment when a dependency no longer meets named requirements

Compose and tree this package together. Selection heuristics, upgrade impact, and the upgrade resource procedure live in the skill.

Related: `amkisko/dependency-issues` records upstream defects under `docs/dependencies/`; `amkisko/minimal-implementation` covers YAGNI before adding deps and before custom replacement; `amkisko/delivery-budgets` owns continuous ship-path size gates; `amkisko/pressure-benchmarking` owns load ladders and ceiling ratchet episodes.
