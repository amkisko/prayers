---
name: api-contract-migration
description: >-
  Plan, implement, benchmark, or review a migration from one published API
  request and response contract to another, including REST-to-GraphQL or RPC
  changes. Use when existing consumers and observable behavior must survive a
  transport, query, batching, or response-shape change. Do not use for a
  greenfield API, an internal refactor with no contract change, or routine
  version-compatible schema evolution.
---

# API contract migration

Treat the change as a per-surface contract migration. Do not presume that either contract is faster, smaller, safer, or simpler.

For review-only requests, inspect and report without changing code or external state. For an authorized implementation, make the smallest reversible slice, validate it, and leave unrelated surfaces unchanged.

## Quick reference

```text
name surfaces -> freeze observable equivalence -> implement one slice -> measure separate planes -> migrate consumers -> retire old path
```

Read `references/client-query-cache.md` only when a client query cache or normalized entity store is part of the proposed behavior. Read `references/flexible-query-endpoint.md` only when callers can submit field selections, nested queries, aliases, fragments, batches, or multiple operations.

## Establish the migration contract

1. Inventory each operation and consumer. Name request identity, authentication, authorization, validation, pagination, ordering, null and omission semantics, errors, side effects, idempotency, and retry behavior.
2. Write an equivalence matrix per surface. Separate behavior that must remain equivalent from an intentional contract change. An equivalent outcome need not have the same wire shape.
3. State non-claims. Examples: no expected request-count reduction for an already single-request surface; no backend-work reduction without source evidence; no warm-cache gain when the client has no reusable identity.
4. Name compatibility and rollback windows. Keep the old path only until named consumers have moved and rollback evidence is adequate; remove it when the window closes.
5. Identify added runtime, generation, schema, or build dependencies. Route their selection and upgrade effects through dependency review when that skill is available.

Equivalence comes before speed. Create or update contract tests before changing the implementation when executable behavior changes. Exercise both paths against the same fixtures until the accepted intentional differences are the only differences.

## Migrate one surface

- Prefer one representative read surface before broad conversion. Include a write only when write behavior is part of the decision.
- Reuse the same domain authorization and validation rules. A new endpoint must not become a second policy implementation.
- Keep response assembly proportional to requested and returned work. Caller-selected fields do not prove that storage reads, joins, external calls, or serialization were avoided.
- Make batching or loading conditional on actual selected associations and observed repeated source access. Bound keys, fan-out, concurrency, and memory.
- Preserve stable identifiers needed for reconciliation. Do not invent duplicate identifiers when the domain already has one.
- Keep successful primary writes distinct from later refresh, projection, or delivery failures. Report each committed effect honestly.

## Measure separate planes

Never average these planes into one result:

1. Contract plane: equivalence pass and fail by named operation and scenario.
2. Serving plane: application latency, process CPU when available, allocations or peak memory when available, source-query count and time, external calls, serialization time, and response bytes.
3. Request plane: end-to-end wall time, request count, transferred bytes, status, retries, and cache outcome as observed by the real client boundary.
4. Interface plane: cold navigation, warm revisit or remount, visible loading transitions, mutation coherence, background refresh, and retained work. Run only when a person-facing client exists.

For every sample, record surface, fixture and cardinality, build revision, asset revision, authentication state, cache state, concurrency, measurement point, tool version, and raw value. Warm both paths, alternate their order, repeat enough times to expose variance, and report distributions or raw samples rather than only the best run.

Match effective work. If the old client performs independent requests concurrently, do not compare their summed durations with one new request's wall time. Record critical-path wall time and total serving work separately. A one-request baseline removes request-count headroom, but it does not decide payload, server work, cache coherence, or contract-maintenance effects.

HTTP cache directives alone do not establish a cold run. Use an isolated client profile, cleared cache, a deliberately unique request identity, or another verified miss, and confirm the observed cache outcome. If browser Resource Timing supplies request evidence, size its buffer for the run and verify that entry counts agree with another request signal; a full buffer may drop later entries.

## Decide from evidence

Accept or reject the migration per surface. Name the observed benefit, regression, or unchanged plane. Treat results from one shape and cardinality as evidence for that case, not as a general protocol ranking.

Prefer the smallest conclusion that the evidence supports:

- migrate the surface;
- retain the old contract;
- migrate for a non-performance contract benefit while recording the measured cost;
- revise the implementation and rerun the same comparison;
- leave the decision unresolved because the paths were not comparable.

After accepted consumers move, remove the old route, resolver, serializer, schema shape, generated artifact, dependency, and compatibility test that no longer has an owner. Preserve tests for the surviving observable contract.

## Report

Return:

- scope and named surfaces;
- equivalence matrix and intentional differences;
- per-plane measurements with raw sample location;
- security, cache, dependency, and rollback limits;
- surface-by-surface decision;
- remaining old-path owners and deletion condition;
- unsupported, partially supported, or unresolved claims.

When a runnable model or agent harness is absent, call this a structural and engineering benchmark, not an agent-quality benchmark. A routing benchmark needs fixed positive, negative, and boundary requests, a fixed model and skill set, repeated runs, and raw selection and execution outcomes.

## Primary references

- HTTP caching and `no-store`: https://www.rfc-editor.org/rfc/rfc9111.html
- Browser Resource Timing buffers: https://www.w3.org/TR/resource-timing/
