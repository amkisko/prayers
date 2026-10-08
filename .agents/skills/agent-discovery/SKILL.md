---
name: agent-discovery
description: >-
  Decide what a product site should publish for agent HTTP discovery.
  Use when adding robots policy, markdown negotiation, api-catalog,
  OAuth discovery, MCP cards, or public skill indexes. Do not use for
  blackbox recon of a third-party site or for live tool-call supervision.
---

# Agent HTTP discovery

Help a product publish only the agent-facing discovery surfaces it needs. Prefer RFCs. Mark drafts. Do not optimize for a vendor readiness score.

## Quick reference

```text
name site type -> climb the ladder that matches -> skip unrelated rungs -> keep secrets out of discovery docs -> record
```

## Site type

Pick one primary type before recommending endpoints:

- content - crawl policy, optional markdown or llms.txt
- api / application - catalog and auth discovery; MCP only if the product exposes tools
- commerce - above plus payment or checkout protocols only when the product sells that way

Absence of MCP or commerce discovery on a content site is correct, not a gap.

## Maturity ladder

Climb only the rungs that match the site type and an actual consumer.

1. Crawl baseline. Valid `robots.txt` with sitemap directives when the site has indexable URLs. Optional explicit AI user-agent rules when the operator has a preference.
2. Usage preference. Content-Signal style directives may declare training, search, and inference preferences to cooperative clients. They are preferences, not authentication or a technical block. See `security`.
3. Readable content. For documentation or article surfaces, support `Accept: text/markdown` and/or a curated `llms.txt` reading list when agents should consume text cheaper than HTML. Do not require both.
4. HTTP discovery links. Use `Link` response headers (RFC 8288) to point at catalogs or other discovery documents when agents should not parse HTML first.
5. API catalog. When public APIs exist, publish `/.well-known/api-catalog` per RFC 9727 (`application/linkset+json`).
6. OAuth discovery. When agents must obtain delegated access, publish authorization-server metadata (RFC 8414 / OIDC) and protected-resource metadata (RFC 9728). Discovery is not a grant.
7. MCP and skills. Publish MCP discovery documents and optional `/.well-known/agent-skills/index.json` only when the product exposes tools or installable skills. Card and catalog paths remain draft and may move; pin the contract the product implements and accept transitional locations during migration. Public skill bodies and digests must not embed live secrets.
8. Bot request identity. Web Bot Auth style key directories matter when this origin sends automated requests others must verify, not merely because a scanner lists the check.
9. DNS agent discovery. DNS-AID and similar drafts are optional and early. Do not require them for an HTTP API that already has well-known discovery.
10. Commerce protocols. x402, UCP, ACP, MPP and similar only when the product sells to agents that way.

## Non-goals

- Implementing every check from a public agent-readiness scanner
- Treating scanner fix prompts as specifications without review
- Composing this skill into always-on `AGENTS.md`
- Replacing `agent-artifact` review or `public-surface-recon` observation

## Safety

- Discovery documents are public. No tokens, passwords, private hostnames, or session-specific values.
- robots and Content-Signal text do not replace ownership checks, rate limits, or fail-closed auth.
- Tool descriptions and public skill markdown stay untrusted input at the caller.

## Routing

- `agent-artifact` to review skill files, MCP configs, and published discovery documents already in tree or on disk.
- `public-surface-recon` `agent-discovery-surface` to observe an authorized live site.
- `engineering-audit` learned-systems when the product itself is a retrieval or tool-calling system.
- `security` for secret handling and the preference-versus-enforcement rule.

## Record

Write durable product decisions under `docs/issues` per `docs-conventions` when the ladder choice changes what the site publishes.
