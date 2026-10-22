---
name: durable-cache
description: >-
  Design, change, or diagnose caches and rebuildable derived state. Use for
  process, shared-store, persistent, materialized, computation, build, and
  shared HTTP response caches; invalidation, consistency, rebuilds, or cache
  stampedes. Do not use for ordinary database persistence with no reusable
  derived state.
---

# Durable cache

Establish what is authoritative, what is derived, and what may disappear before choosing a cache pattern or implementation.

## Quick reference

```text
inventory state -> classify retention -> bind identity -> choose consistency -> connect writes -> bound failure -> validate
```

Read `references/cache-kinds.md` when choosing whether a store is a soft cache, persistent cache, materialized view, computation cache, or durable serving store. Read `references/http-response-cache.md` when a browser, proxy, gateway, or CDN may reuse an HTTP response.

## Establish the contract

1. Name the authoritative state, every derived copy, and every layer that may answer a read.
2. State whether each entry may be lost, evicted, recomputed, or rebuilt. If the only accepted copy cannot be lost, treat that store as durable state rather than relying on cache semantics.
3. Name the rebuild source, cursor or generation, permitted data loss, recovery-time target, and source-load ceiling.
4. Name the required read contract: bounded staleness, monotonic reads, read-after-write, read-your-writes, or a version fence. Do not use a TTL as an unnamed consistency guarantee.
5. Name the expensive unit the cache avoids and estimate repeated use per effective key and location within the freshness window.

## Design the lifecycle

- Identity: include every input that changes the result or who may receive it. Version keys when schema, encoding, permissions, or behavior changes. Do not expose secrets or personal data in observable keys.
- Fill: a miss remains correct. Collapse or bound concurrent misses, reject results older than the current version or generation, and do not run business side effects from speculative fills.
- Write: commit the primary change before readers observe it. Record update or invalidation intent with that commit when losing the intent would violate the promised freshness. Consumers process committed changes idempotently and preserve required ordering.
- Delete: propagate tombstones or equivalent deletion state long enough for lagging consumers and full rebuilds. A restored backup must not recreate data deleted after that backup without replaying the deletion.
- Refresh: distinguish expiry, validation, refresh-ahead, explicit invalidation, and full rebuild. Expiry does not promise retention or proactive refresh.
- Capacity: bound admission, entry size, total bytes, retention, fan-out, retries, and rebuild concurrency. Decide which entries may be evicted and how the source survives a cold cache.
- Isolation: bind tenant, permission, representation, and other visibility differences to the key or bypass sharing. A cache hit must not skip a control required for every request.
- Observability: measure hits, misses, stale or rejected fills, invalidation and rebuild lag, evictions, hot keys, source amplification, stored bytes, and recovery progress. Hit ratio alone does not establish correctness or value.

## Validate

Exercise the contract at the boundary that actually serves reads:

- delete process and local cache state, then rebuild from the named durable source;
- race a slow fill with a newer write or invalidation;
- issue concurrent misses for one hot key and observe bounded source work;
- change every key dimension and confirm a distinct result or deliberate bypass;
- read immediately after a write under the promised consistency mode;
- replay duplicate, delayed, reordered, and deletion events;
- exhaust capacity and confirm eviction or rejection does not lose authoritative data;
- interrupt rebuild and resume from the committed cursor;
- measure cold and warm latency, source calls, bytes, and recovery time against named budgets.

Record provider-specific retention, persistence, replication, and purge behavior from current effective configuration. Product names and defaults are evidence for one deployment, not a portable cache contract.
