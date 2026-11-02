# Client query cache

Use this reference only when a client cache, normalized entity store, or reusable query result is part of the migration claim. These behaviors belong to the selected client implementation, not to the API protocol by itself.

## Contract

Name:

- cache identity, including type, stable identifier, arguments, authorization scope, representation, and version dimensions;
- which reads may reuse entities or query results;
- cold, warm, stale, refreshing, failed, and evicted states;
- mutation update, targeted invalidation, refetch, optimistic state, and rollback behavior;
- session change and logout clearing;
- persistence across navigation, reload, process restart, or application update;
- byte, entry, and retention bounds.

Do not claim a warm revisit improvement unless the same client instance or documented persisted cache can answer it. A normalized store does not establish that a particular query is complete, authorized, or fresh.

## Validate observable behavior

- Navigate cold, then revisit or remount warm without changing the cache boundary.
- Change one identity dimension at a time and prove isolation or deliberate reuse.
- Complete a write and verify every visible detail, collection, aggregate, and derived count that the contract promises to update.
- Distinguish a successful primary write from a failed refresh. Keep the committed success visible and report synchronization failure separately unless the product contract made the refresh part of the write transaction.
- Refresh in the background without replacing usable stale content with a full loading state unless the product explicitly requires a blocking refresh.
- Log out or change principal and prove that private state cannot cross the session boundary.
- Exhaust cache capacity and confirm bounded eviction and correct misses.
- Reconnect, reload, and restart only when the claimed persistence boundary includes them.

Measure request count, transferred bytes, visible transitions, stale duration, invalidation lag, and source work for cold and warm cases. Hit ratio alone does not prove correctness or user benefit.

When HTTP responses can be reused by a browser, proxy, gateway, or CDN, route that layer to `durable-cache`; it has a different identity and invalidation contract from an in-memory client query cache.
