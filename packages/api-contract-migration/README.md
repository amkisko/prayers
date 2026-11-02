# amkisko/api-contract-migration

Skill for migrating a published API surface from one request and response contract to another without confusing contract equivalence, serving work, network behavior, and user-interface behavior.

The skill is protocol-neutral. Conditional references cover client query caches and caller-selected query documents. A REST-to-GraphQL migration is one applicable case, not the default architecture.

Related: `amkisko/engineering-audit` owns broader review and finding priority; `amkisko/claims-audit` verifies external claims; `amkisko/durable-cache` owns reusable-response and durable-cache contracts; `amkisko/dependency-policy` reviews added runtime and generation dependencies.
