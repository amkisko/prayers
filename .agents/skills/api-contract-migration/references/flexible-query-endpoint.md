# Flexible query endpoint

Use this reference when callers can choose fields, nested relationships, aliases, fragments, batches, or multiple operations. GraphQL is one instance of this shape.

## Preserve domain controls

Authenticate before executing the query boundary. Enforce operation, object, and field authorization in reusable domain logic or another trusted layer shared with existing entry points. Recheck writes at the trusted mutation boundary. Hiding a schema or returning a not-found shape does not replace authorization.

Apply the browser's existing credential and request-integrity controls when cookies or ambient credentials are accepted. CSRF exposure follows HTTP method, credential, origin, and browser behavior; it is not created or solved by the query language alone.

## Bound caller-selected work

Set product-specific ceilings for the work the implementation actually permits. Relevant controls can include:

- request body and parsed-document bytes;
- lexical tokens, aliases, directives, fragments, variables, and operations;
- nesting depth and breadth;
- list page size and nested result multiplication;
- batch size and concurrent execution;
- static or runtime complexity budget;
- validation, execution, source-call, response-byte, and wall-time budgets.

Trusted or persisted operation documents can reduce the accepted input surface for controlled first-party clients. They do not replace authentication, authorization, variable validation, result limits, or rate limits. Public and third-party APIs may need arbitrary documents; make that product decision explicit.

Choose introspection policy from the client population and environment. Restricting introspection outside development can reduce casual schema discovery for a closed first-party API, but it is not a security boundary and must not be the only demand-control measure.

## Prove backend effects

Requested response fields define the result shape. They do not prove that the implementation avoided unused columns, joins, association loads, external calls, or authorization work.

For each performance claim, inspect source-query count and time, selected columns when meaningful, loader keys and batch count, external calls, serialization, and allocations. Apply lookahead or selection-aware batching only where measurement shows avoidable work. Reuse already loaded identifiers and values rather than issuing a second lookup for the same object.

## Errors and observability

Distinguish malformed transport, parse failure, validation failure, authorization refusal, expected domain failure, and internal execution failure. Do not relabel an internal execution fault as malformed caller input. Protocol status and response rules may depend on the negotiated media type and protocol version; test the effective client-server contract rather than assuming one universal status mapping.

Log stable operation identity, duration, result size, bounded complexity, and error class. Filter or omit raw documents, variables, tokens, and personal data. Mask internal error detail in production responses while retaining a correlation path for operators.

## Primary references

- GraphQL specification, field selection and execution errors: https://spec.graphql.org/September2025/
- GraphQL security guidance: https://graphql.org/learn/security/
- GraphQL authorization guidance: https://graphql.org/learn/authorization/
- GraphQL caching guidance: https://graphql.org/learn/caching/
- GraphQL over HTTP working draft: https://graphql.github.io/graphql-over-http/draft/
