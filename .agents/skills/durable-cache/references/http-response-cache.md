# Shared HTTP response cache

Use this reference when a browser, proxy, gateway, or CDN may answer without reaching the application.

## Eligibility

Answer four questions before setting cache headers or provider rules:

1. Is the operation a side-effect-free read?
2. Does the cache key capture everything that changes the response?
3. May the complete response, including response fields, be shared between these callers?
4. What staleness is acceptable, and how do changes invalidate or supersede the response?

A cache hit can skip application authentication, authorization, rate limiting, billing, auditing, and request logging. Run controls required for every request before the cache can answer, or bypass shared caching.

## Identity and sharing

Start with the request method and target URI. Add every response-changing dimension, such as:

- meaningful query parameters and request body for an application-aware cache;
- representation, content encoding, full-page versus fragment mode, and API version;
- language, currency, feature policy, and other normalized variants;
- the actual visibility scope derived from trusted identity, not a caller-supplied tenant label;
- operation identifier, selected operation, and complete variables for GraphQL or RPC.

Forwarding a value to the origin does not prove that the cache includes it in the key. Normalize only when the application and every cache layer assign the same meaning to the normalized form.

Begin with public responses. Bypass session-dependent, permission-dependent, or personalized responses unless authentication precedes every hit, the trusted visibility scope is in the key, permission changes are handled, and downstream storage remains appropriately private.

## Storage, freshness, and validation

Separate these decisions:

- whether storage is allowed;
- how long a stored response is fresh;
- whether and how a stale response may be served;
- how a stale response is validated;
- whether errors are stored;
- how an entry is invalidated or superseded.

`no-store` prohibits storage. `private` excludes ordinary shared caching. `no-cache` permits storage but requires validation before reuse. `max-age` and `s-maxage` set freshness for their applicable caches. Validators such as `ETag` can avoid transferring an unchanged body, but they do not create a positive freshness lifetime or guarantee cheap origin validation.

The end-to-end staleness budget includes source age, each cache layer's freshness, permitted stale serving, and invalidation delay. TTL expiry affects a later request; it does not guarantee proactive refresh or retention until expiry.

## Operation and protocol cases

- JSON, HTML, XML, and binary GET responses use ordinary HTTP caching when their identity and sharing policy are complete.
- A GraphQL query may use GET under the current GraphQL over HTTP working draft. A mutation must not use GET. Persisted operations shorten and stabilize request identity but do not cache results; variables and context still belong in the result key.
- A POST read needs an explicitly approved, application-aware cache that validates the operation, constructs a body-aware key, and stores only permitted successful results. Ordinary intermediary behavior must not be assumed to replay POST responses to later POST requests.
- HTTP QUERY defines a safe, idempotent request with content and requires the content and relevant metadata in the cache key. Verify support across every client, proxy, cache, and server before adopting it.
- JSON-RPC result caching excludes the request correlation identifier from the result key and rebuilds the response with the current identifier. Notifications and mutating methods never become cache hits.
- Native gRPC and gRPC-Web use POST-oriented protocol behavior. Do not assume an ordinary HTTP response cache understands messages, final status, metadata, or framing. Prefer service-level result caching or an explicitly designed GET-facing gateway.
- Connect permits GET for eligible side-effect-free unary RPCs. The schema annotation, client choice, response policy, and intermediary behavior must all agree.
- Subscriptions, server-sent events, WebSockets, and bidirectional streams are not ordinary reusable responses. Cache a separately designed snapshot or underlying data when useful.

Protocol and provider support changes. Confirm current official documentation before relying on a draft method, framework option, cache directive extension, purge scope, or provider default.

## Invalidation and races

Commit the primary write before publishing invalidation. When missed invalidation would exceed the freshness contract, record the invalidation intent with the durable write and process it idempotently.

Invalidate collections and aggregates as well as records already present in a cached response. A new record can change a list that never contained it. Keep a fallback TTL for delayed or failed invalidation.

A request that read old state before the commit can finish after a purge and refill stale data. Use a version or generation gate when the consistency contract cannot tolerate that race.

## Validation

Test effective behavior, not header presence:

- repeat an identical request and prove the origin does not execute again;
- change every key dimension and receive the correct distinct response;
- request anonymously and as two principals and prove isolation or bypass;
- update data and verify details, collections, and aggregates refresh;
- exercise validation, permitted stale serving, errors, and origin failure;
- send mutations and prove execution is never suppressed by a cached read;
- test more than one effective cache location when invalidation scope matters;
- inspect standard or provider status fields, response age, and origin logs together.

## Standards and protocol sources

- HTTP semantics: https://www.rfc-editor.org/rfc/rfc9110.html
- HTTP caching: https://www.rfc-editor.org/rfc/rfc9111.html
- Cache status: https://www.rfc-editor.org/rfc/rfc9211.html
- Targeted cache control: https://www.rfc-editor.org/rfc/rfc9213.html
- HTTP QUERY: https://www.rfc-editor.org/rfc/rfc10008.html
- GraphQL over HTTP working draft: https://http-spec.graphql.org/draft/
- Connect protocol: https://connectrpc.com/docs/protocol/
