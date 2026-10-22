## Cache and derived state

- name the authoritative state, every derived copy, and every layer that may serve a read;
- a cache entry may disappear; if losing it breaks correctness, the store is durable state and needs a commit, recovery, and consistency contract;
- persistence across restart does not make a cache authoritative or guarantee retention;
- if process state and local cache files are both cleared, name the rebuild source, cursor or generation, recovery time, and source-load ceiling;
- one durable commit point; every read revalidates against it or names the version, generation, or bounded stale window it serves;
- every reusable result key includes all inputs that change the value or who may receive it; the same key means the same permissible result;
- commit the primary change and its update or invalidation intent together when losing that intent would break the freshness contract;
- consumers apply committed changes in order and idempotently; reject a fill older than the current generation and bound concurrent misses;
- retain deletions long enough for lagging consumers and rebuilds; version keys when schema or behavior changes;
- side effects read committed state from a cursor; they are not cache fills or steps of the write;
- a reconciler computes desired state from configuration plus the committed log and performs one bounded unit of missing work;
- budget admission, retention, eviction, hot-key load, miss amplification, rebuild traffic, and stored bytes.

Related: the `durable-cache` skill selects the cache contract and owns HTTP response-cache details; `background-jobs` covers enqueue after commit; `engineering-audit` covers cache and worker stages; `finite-state-machines` distinguishes generation from commit.
