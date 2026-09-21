## Background jobs

- the job body is one call into domain code;
- jobs are idempotent and safe to retry;
- capture request-local context at enqueue; do not read it at perform;
- enqueue only after the required rows are committed;
- do not call out from the write path;
- retry transient failures; record destination failure and complete; retry when our code raises;
- long fan-out uses a cursor so a crash resumes;
- a reconciler computes desired state from configuration plus the committed log and performs one bounded unit of missing work.

Related: `engineering-audit` covers workers and contracts; `io-simulation` injects destination faults; `security` covers ownership on worker paths.
