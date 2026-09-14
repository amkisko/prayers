# Security review mode

Run this mode when trust, authentication, authorization, or an attacker path is in scope. Skip for a calculation-only library with no IO and no secrets, and state that reason. Keep the same finding fields. Extra fields when they help: attack path; blast radius; regression guard.

Credential handling for agents lives in the `security` fragment. Advisory scanning and lag metrics live in `dependency-audit`. This mode reviews the product.

## Two maps

1. Request pipeline: ingress → routing → authentication → authorization → validation → app logic → cache → store → queue → worker → external API → response.
2. Attacker path: entry → trust boundary → privilege gain → data access → persistence → lateral movement → exfiltration → cover-up.

Never collapse authentication and authorization into one vague check.

## Dimensions

Scan for: missing or weak authentication; object-, function-, property-, or tenant-level authorization gaps; injection and unsafe parsing; data exposure; secrets in tree, logs, or artifacts; session, CSRF, and browser-boundary flaws; infrastructure exposure; jobs that skip policy; missing audit of sensitive actions; abuse paths (rate limit, enumeration, flooding, unrestricted automation of a sensitive business flow); weak or homemade cryptography; server-side fetch of a user-supplied URL; forgotten or shadow endpoints; trusting third-party payloads as first-party.

Manual checklist frame: a published application-security verification standard (OWASP ASVS is the usual web frame; OWASP API Security Top 10 when the product is an API). Start at the lowest level; raise selected controls for auth, sessions, access, upload, and APIs.

## Auth changes

Before suggesting an auth change, name the trust boundary, the policy owner, and whether the path runs as user, operator, service, or worker. Show whether the bug is missing authentication, missing authorization, wrong object scope, wrong tenant scope, or unsafe privilege inheritance.

Ask whether a request parameter establishes access, or only chooses a row inside an already-authorized set. Ask whether a worker reads request-local context that was not captured at enqueue. HTTP-cached form pages that leave a stale mutating token are a session-boundary flaw.

## Object-level authorization

Object-level authorization fails when a caller-controlled identifier selects a record and policy is not applied to that record. Published names: insecure direct object reference (IDOR), broken object-level authorization (BOLA), CWE-639.

Keep these classes distinct:

- missing authentication: no proven identity;
- missing function authorization: the caller should not reach the operation (broken function-level authorization);
- missing object authorization: the caller may use the operation, not this record;
- missing property authorization: extra fields in a read or write, including mass assignment;
- missing tenant isolation;
- object rebinding: ownership taken from the request body or a hidden field.

A request parameter chooses a row inside an already-authorized set. It does not establish access. Unguessable identifiers reduce enumeration; they do not authorize the row. A post-fetch comparison that still returns the row is not a closed check. Lookups go through an ownership set. Fail closed when access cannot be proven. Apply the same check on read, write, delete, export, and on workers that later act on an enqueued identifier.

## Assessment

1. Inventory operations that take a caller-controlled object reference (path, query, body, header, GraphQL identifier, filename, signed URL, cache key, job payload).
2. Abstract syntax tree search can list lookups that take such a reference without a nearby ownership predicate. A match is a candidate. Cross-file policy, store-level row rules, and post-fetch rejects can hide or fake a check.
3. Prove with two principals: replay the same object reference as the other principal for read, write, delete, and export. Expect refusal, not the other principal's object. An authorization matrix of operation against role or tenant is the countable indicator.
4. Negative permission tests that mock away the boundary are futile coverage.

Live or third-party replay requires explicit authorization that names the target and allowed action.

## Tests

Separate missing security coverage, futile coverage (happy path only, boundary mocked away), and dangerous helpers that bypass real policy.

## Threat-model steps

When asked to threat-model: assets, actors, trust boundaries, entry points, privilege transitions, sensitive flows, abuse cases; then rank by impact and ease. End in concrete fixes.

## Secrets review

Search committed files, config, examples, CI, logs, images, scripts, and docs. Classify: credential, token, key, webhook secret, internal URL, customer data, harmless placeholder. For real exposure: rotate, revoke, and audit access since exposure. History purge only when needed.

## Dependency security

Reachability and known advisories: `dependency-audit`. Do not claim a CVE applies unless version and reachability are clear.

## Ranking

Order by exploitability, blast radius, privilege gained, data sensitivity, certainty, then fix cost. Smallest real fix first.

## Skip

No trust boundary, secrets, or attacker path: skip and say so.

## Primary references

- CWE-639, authorization bypass through a user-controlled key: https://cwe.mitre.org/data/definitions/639.html
- OWASP Insecure Direct Object Reference Prevention Cheat Sheet: https://cheatsheetseries.owasp.org/cheatsheets/Insecure_Direct_Object_Reference_Prevention_Cheat_Sheet.html
- OWASP API Security Top 10 2023, broken object-level authorization: https://owasp.org/API-Security/editions/2023/en/0xa1-broken-object-level-authorization/
