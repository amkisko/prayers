# amkisko/pressure-benchmarking

Skill for iterative pressure benchmarking: calibrate the meter, raise load, lower resource ceilings, then run at least ten optimize/prove cycles until the product stays under the new ceilings.

Tree this skill under `.agents/skills`. Do not compose it into `AGENTS.md`.

Measurement commands, ceiling files, and harness parsers stay in the consumer repository. This package owns the procedure and report contract.

Related: `amkisko/delivery-budgets` (continuous ship-path absolute size and timing gates), `amkisko/dependency-policy` upgrade resource compare (one-change base/head deltas) and upgrade impact fitness reassessment (when load shows a dependency miss), `amkisko/engineering-audit` resource and budget mode (utilization audit and prioritized candidates for the loop).
