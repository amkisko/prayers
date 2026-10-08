# Reconnaissance and hunting

## Reconnaissance

Inventory executable languages, package and build manifests, generated code, entry points, exposed services, identity and policy owners, stores, queues, external calls, deployment definitions, release automation, local application boundaries, and test facilities. Record exclusions rather than silently skipping them.

Map lower-trust principals to assets and actions. Follow data and authority from entry through canonicalization, authorization, mutation, persistence, asynchronous work, external effects, and response. The last trusted decision before the effect is the preferred fix location.

## Coverage classes

Create a ledger unit for each applicable class and bounded subsystem:

- authentication, session, object, function, property, and tenant authorization;
- input canonicalization, injection, unsafe parsing, upload, path, and server-side fetch;
- HTTP framing, cache partitioning, browser boundaries, and identity protocols;
- secrets, cryptography, sensitive data copies, deletion, restore, export, and logs;
- queue, worker, webhook, protocol, replay, ordering, and message authenticity;
- client, desktop, mobile, embedded browser, local storage, deep link, and IPC boundaries;
- native, unsafe, foreign-function, loader, plugin, kernel, and driver boundaries;
- cloud identity, public exposure, network policy, metadata services, and deployment drift;
- build, CI, generated artifact, provenance, signing, release, and dependency introduction;
- resource exhaustion, amplification, costly parsing, unbounded automation, and business-flow abuse;
- generative model, retrieval, tool permission, action binding, prompt injection, and agent isolation.

Route package advisories and dependency reachability to `dependency-audit`. The security audit records that coverage unit and links its result; it does not duplicate the package assessment.

## Hunting discipline

Search broadly, then trace narrowly. A text or syntax match is a candidate, not a finding. For each candidate, identify the least-trusted reachable principal, prove the trust boundary, trace to a sensitive sink, and seek an existing control in another layer before escalating.

Use safe fixtures and local tests for bounded proof. Prefer a minimum observable result over a dramatic exploit. Do not generate fix patches during hunting; patch generation competes with coverage and can mutate the evidence base.

Workers may share read-only reconnaissance, but each coverage unit has one owner. Evidence filenames must be deterministic enough to review and must not contain secrets or private customer data.
