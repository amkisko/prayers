# API contract migration claims review

## Participants

Andrei Makarov (@amkisko)

## Decisions

Treat the supplied REST-to-GraphQL account as one migration case, not as evidence that one protocol is generally faster or more efficient. Add a protocol-neutral `api-contract-migration` skill. Put client query-cache behavior and caller-selected query controls in conditional references so agents do not load or apply them to unrelated migrations.

Use official standards and project documentation for technical mechanisms. Accept the supplied benchmark results only as unverified testimony because the raw samples, implementation, fixtures, and runnable harness were not provided.

## Effects

The initial claim pass found six material qualifications. The revised guidance resolves all six in shared prose.

1. Partially supported: `no-store` prevents new storage when correctly applied, but a request directive alone does not guarantee that an already stored response cannot satisfy a request. The skill now requires a verified miss through an isolated profile, clearing, unique identity, or equivalent evidence, plus an observed cache outcome.
2. Supported with a limit: browser Resource Timing buffers can fill and later entries can be dropped. The skill now requires buffer sizing and an independent request-count check when Resource Timing is used.
3. Unsupported as a general claim: caller-selected response fields do not prove reduced storage or external work. The skill now requires source-query, loader, external-call, serialization, and allocation evidence.
4. Partially supported: normalized client caching can support entity reuse, but it is a client implementation behavior rather than a GraphQL protocol guarantee. The guidance is conditional and requires explicit identity, lifecycle, mutation, session, and capacity contracts.
5. Partially supported: restricting introspection can reduce casual discovery for a closed first-party API, but official security guidance says this is insufficient on its own. The skill makes the choice environment-dependent and requires authorization and demand controls.
6. Partially supported: GraphQL execution failures are distinct from malformed input, but exact HTTP status behavior depends on the negotiated media type and the still-draft GraphQL over HTTP contract. The skill requires tested effective behavior and avoids a universal status mapping.

Other proposed percentage improvements, common win and loss shapes, and the results of the described migration remain unverifiable from the supplied prose. They were not converted into shared facts. The skill treats them as hypotheses to test per surface and cardinality.

The final prose and structural pass found zero unresolved findings in the new package and its engineering-audit routing.

## Benchmark

This repository has no fixed model harness or request corpus for a routing or agent-execution A/B benchmark. The new skill therefore defines that benchmark contract without claiming a model-quality improvement.

The available repository benchmark is structural: one selector covers published API contract migration; two conditional references isolate client-cache and flexible-query behavior; four evidence planes prevent cross-plane averages; and each plane requires raw sample identity.

Static selector fixtures covered four intended requests, four exclusions, and four boundaries. Intended cases were REST-to-GraphQL replacement, RPC-to-HTTP replacement, existing API batching-contract replacement, and old-versus-new contract benchmarking. Explicit exclusions were a greenfield API, an internal serializer refactor, compatible field addition, and a cache-only change. Boundary cases assigned existing breaking schema behavior and consumer-visible transport changes to this skill, while assigning GraphQL security review without migration and ordinary version-compatible schema evolution elsewhere. All 12 expectations are expressible from the frontmatter alone. This is selector coverage, not observed model precision or recall.

The full local test path passed 73 tests and 209 assertions in each of three same-host runs. Wall times were 1.48 s, 1.47 s, and 1.51 s; median 1.48 s. Process user-plus-system CPU proxies were 1.14 s, 1.14 s, and 1.16 s; median 1.14 s. The generated always-loaded `AGENTS.md` remained 15,871 bytes because the new skill is loaded on demand. These measurements establish repository validation cost and context size only; they are not API or agent-quality results.

## Next

- Run a routing benchmark with fixed positive, negative, and boundary prompts when a fixed model harness is available.
- Run a migration performance benchmark only against a real pair of old and new contract implementations with identical fixtures and effective work.
- Publish package artifacts only through the ordinary release path.

## Source

- Supplied REST-to-GraphQL migration note
- HTTP caching, RFC 9111: https://www.rfc-editor.org/rfc/rfc9111.html
- Resource Timing Level 2: https://www.w3.org/TR/resource-timing/
- GraphQL specification, September 2025: https://spec.graphql.org/September2025/
- GraphQL security guidance: https://graphql.org/learn/security/
- GraphQL authorization guidance: https://graphql.org/learn/authorization/
- GraphQL caching guidance: https://graphql.org/learn/caching/
- GraphQL over HTTP working draft: https://graphql.github.io/graphql-over-http/draft/
- `packages/api-contract-migration/`
- `packages/engineering-audit/skills/engineering-audit/contracts.md`
- `packages/engineering-audit/skills/engineering-audit/performance.md`
