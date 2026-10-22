# Cache kinds and contracts

Classify each store by the promise callers rely on, not by its product name or storage medium.

## Soft cache

An entry may be missing or evicted at any time. A miss reads or computes the authoritative value. Loss changes latency and load, not correctness.

Require:

- a correct miss path;
- bounded stampede and source amplification;
- explicit freshness and negative-result policy;
- no side effect that depends on a successful fill.

## Persistent best-effort cache

Entries normally survive a process restart, but persistence alone does not guarantee admission, retention, backup, or recovery after corruption. Treat every lookup as optional unless the store publishes and the product accepts a stronger contract.

Require the soft-cache rules plus:

- startup behavior for missing, partial, corrupt, or incompatible files;
- a schema and key version;
- disk, compaction, and recovery-time budgets;
- proof that a restored entry is not newer or older than the read contract permits.

## Materialized or projected state

A query, committed log, or configuration can recreate the state. The materialization may be durable and operationally required even though it is not authoritative.

Require:

- one named rebuild source and committed cursor;
- deterministic or explicitly conflict-resolving application of changes;
- idempotent replay and deletion state;
- lag, rebuild progress, and source-load budgets;
- a migration plan when projection logic or schema changes.

## Content-addressed computation cache

The key represents declared inputs to a reproducible computation. A matching key may reuse the stored result across processes or people only when all output-changing inputs and visibility constraints are bound.

Require:

- complete input, toolchain, environment, and output-format identity;
- deterministic output or an explicit rule for acceptable variation;
- integrity validation before reuse;
- isolation for private source, logs, and generated artifacts;
- retention and garbage collection that do not become the build record.

## Durable serving store

If an acknowledged write exists only here, loss or eviction changes correctness, or the service cannot operate after entries disappear, the store is part of durable state. Do not rely on cache terminology to weaken its contract.

Require:

- an explicit commit point and acknowledged-write semantics;
- replication and failover consistency;
- backup, restore, and disaster-recovery tests;
- access control, audit, retention, and deletion guarantees;
- named recovery point and recovery time objectives.

It may still cache derived values internally. Those values have a separate identity and invalidation contract.

## Reconciled external state

A controller compares committed desired state with observed current state and performs a bounded idempotent correction. Observed state is not proof of the durable commit, and a lease is not ownership of the target.

Require:

- desired state from a durable source;
- an observation that can be missing, delayed, stale, or wrong;
- one bounded correction per pass;
- ownership binding so one controller does not alter another controller's targets;
- progress, failure, and divergence signals.

## Source standards and evidence

- HTTP cache semantics: https://www.rfc-editor.org/rfc/rfc9111.html
- Materialized views: https://www.postgresql.org/docs/current/rules-materializedviews.html
- Fault-tolerant state stores: https://kafka.apache.org/43/streams/developer-guide/processor-api/
- Reproducible remote caching: https://bazel.build/remote/caching
- Cache fill races and leases: https://www.usenix.org/system/files/conference/nsdi13/nsdi13-final170_update.pdf
