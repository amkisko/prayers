## Durable cache

- if process state and local cache files are both cleared, name what must be rebuilt and from which durable source;
- one commit point; every read revalidates against it or names the generation it serves;
- side effects read committed state from a cursor; they are not steps of the write;
- a reconciler computes desired state from configuration plus the committed log and performs one bounded unit of missing work;
- a hot path must not list or enumerate when a probe would do;
- a cache generation is not the durable commit; a lease is not ownership of the object.

Related: `working-rules` covers the wipe test and dependent search; `background-jobs` covers enqueue after commit; `engineering-audit` asks the same questions on cache and worker stages; `finite-state-machines` names generation versus commit.
