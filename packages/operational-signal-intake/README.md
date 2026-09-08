# amkisko/operational-signal-intake

Provider-neutral intake for live service evidence. The skill separates observed conditions, consequences, and hypotheses; correlates only the evidence needed to distinguish them; and routes confirmed work to the existing audit skills.

Exports:

- `operational-signal-intake` skill — read-only intake for alerts, error groups, monitors, traces, profiles, metrics, logs, probes, deployment changes, and user reports

Provider locations and commands stay in each consumer repository. This package does not install telemetry, redesign monitoring, perform a full vulnerability audit, or authorize production changes.

Related: `amkisko/engineering-audit`, `amkisko/dependency-policy`, `amkisko/claims-audit`, `amkisko/docs-conventions`, and `amkisko/keep-the-work`.
