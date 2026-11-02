# amkisko/engineering-audit

Language- and framework-agnostic pipeline engineering audit. Boundary and control when the system talks to external services, devices, operators, or physical actuators. Place-after-refusal when the product has a place the person can return to. Resource, budget, and trace-and-identification for every executable tree. Optional modes for product surface, privacy, performance, observability, security review, contracts, learned systems, and lineage; skip any mode that does not apply. Security companions cover HTTP and identity, client, native, supply-chain and release, cloud deployment, protocols and messaging, availability abuse, data isolation, and local application boundaries.

Learned-systems mode separates selectors available before inference from instructions loaded after selection, then traces authorization, bounded action, failure, and observable completion.

Stay on concepts. Tool and framework names belong in the consumer repository, not in this skill.

Related: `amkisko/delivery-budgets` owns continuous ship-path size and timing gates; `amkisko/dependency-policy` upgrade resource compare produces before/after deltas; `amkisko/minimal-implementation` calibrates on real hardware; `amkisko/keep-the-work` covers the place after a refusal.

Use `amkisko/api-contract-migration` for a per-surface migration between published API request and response contracts. It keeps equivalence, serving work, request behavior, and interface behavior as separate evidence planes.
