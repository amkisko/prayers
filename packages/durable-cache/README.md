# amkisko/durable-cache

Correctness of cached and rebuildable derived state across process, shared-store, materialized, computation, and HTTP layers.

Exports:

- `durable-cache` fragment - truth, reusable identity, freshness, rebuild, invalidation, and resource budgets
- `durable-cache` skill - select a cache contract, design its lifecycle, and validate failure, consistency, and HTTP response reuse

Compose and tree this package together when a product has a cache or rebuildable derived serving state. Skip both exports when the tree has no such state.

Related: `amkisko/working-rules`, `amkisko/background-jobs`, `amkisko/engineering-audit`, `amkisko/finite-state-machines`.
