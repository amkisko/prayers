## Language

- Write analysis in English unless the user specifies otherwise.
- Blackbox only: facts from public HTTP, archives, and remote OSINT - never from local files, folders, drives, or workspace.
- Quote paths, status codes, headers, and body shapes literally.
- Label each endpoint RFC, draft, or vendor proposal. Do not treat a vendor readiness score as a finding.

## Use when

The user asks what agent-facing discovery a live origin publishes, whether agents can find APIs, MCP, skills, or crawl policy, or the inventory should include machine-readable agent surfaces. Run after `public-asset-inventory` seeds origins, or when the question is only discovery.

## Purpose

Observe public agent-discovery surfaces per origin. Record presence, absence, and maturity. Prefer site-type gating so content sites are not judged for missing MCP or commerce endpoints.

## Inputs

- Entry URL (required)
- Origin registry (from inventory or create with `entry`)
- Optional site type from the user: `content`, `api` / `application`, `commerce`, or `all` (default `all` with gating notes)
- Open checks queue (merge)

## Procedure

### Phase 1 - Site type

1. If the user named a site type, use it. Otherwise infer lightly from inventory (docs/blog -> content; API hosts or OpenAPI links -> api; checkout/cart -> commerce) and mark inference.
2. Always probe discoverability and bot-policy paths below. Probe protocol and commerce paths only when site type is `api`, `application`, `commerce`, or `all`. When type is `content`, still note protocol hits if Linked or referenced, but do not treat absence as a defect.

### Phase 2 - Discoverability and crawl policy

3. On each `entry`, `app`, `marketing`, and `api` origin (skip pure `assets` unless inventory linked discovery there):
   - Fetch `/robots.txt`. Record status. Parse `Sitemap:` lines, `User-agent` / `Allow` / `Disallow` for AI-named agents when present, and any `Content-Signal:` lines. Mark Content-Signal as vendor proposal / preference, not enforcement.
   - For each sitemap URL in robots or conventional `/sitemap.xml` (and common index variants when linked): record status and whether the body looks like a sitemap or index. Do not recursively crawl every URL.
   - On `/` (or the path that established the origin): record `Link` response headers (RFC 8288), especially `api-catalog` and other discovery relations.
4. Optional content probe when site type is `content` or `all`: one `GET` of the homepage with `Accept: text/markdown`. Record whether the response is markdown, HTML, or negotiated otherwise. Do not score token savings.

### Phase 3 - Protocol and auth discovery (bounded)

5. For each relevant origin, fetch these paths when site type warrants it. One GET each. Record status and content-type. Do not authenticate. Do not invoke MCP tools.
   - `/.well-known/api-catalog` - RFC 9727
   - `/.well-known/oauth-authorization-server` - RFC 8414
   - `/.well-known/openid-configuration` - OIDC
   - `/.well-known/oauth-protected-resource` - RFC 9728
   - `/.well-known/agent-skills/index.json` - draft / proposal
   - `/.well-known/mcp.json` - draft / transitional
   - `/.well-known/mcp/server-card.json` - draft / transitional
   - `/.well-known/mcp/catalog.json` - draft / transitional
   - `/.well-known/mcp-server-card` - draft / transitional
   - `/.well-known/agent-card.json` - draft (A2A)
   - `/.well-known/ai-catalog.json` - draft / proposal
   - `/.well-known/http-message-signatures-directory` - draft (Web Bot Auth)
6. If a discovery document names an absolute MCP or API URL on another host, add that host to the origin registry and queue a role check. Do not call `initialize` or `tools/list` unless the user explicitly expands scope to capability inspection; default is document presence only.
7. Optional: `/llms.txt` and `/llms-full.txt` when site type is `content` or `all`. Record presence; do not require them when markdown negotiation already succeeded.
8. Commerce discovery (`x402`, UCP, ACP, MPP) only when site type is `commerce` or the user asks. Presence is a fact; absence is not a defect for other types.

### Phase 4 - DNS (optional)

9. If DNS lookups are already in scope for the investigation, note whether AI-discovery style records appear (for example DNS-AID / `_agents` drafts). Mark draft. Do not invent required DNS shapes.

### Phase 5 - Queue

10. Secrets-shaped values inside discovery JSON: record pattern and field name, do not quote values, stop sibling guessing.
11. Every hit or surprising miss that matters for the user's question -> open check.
12. Do not call third-party agent-readiness scanner APIs as part of this prayer. External scores are optional corroboration only when the user asks.

## Output

```markdown
## Agent discovery surface

Entry URL: <url>
Site type: <content | api | application | commerce | all> (stated | inferred)

### Per-origin probes
For each probe: origin, path or check, status, content-type, maturity label, notes.

### robots.txt (summary)
For each origin: sitemap URLs, AI agent rules seen, Content-Signal seen, notes.

### Link headers
For each Link: origin, Link value, relation, notes.

### Markdown negotiation
For each origin: Accept, content-type returned, notes.

### Cross-origin discovery targets
For each named URL: from origin, named URL, host added?, next check.

### Next checks
For each check: detection, origin, next fact to verify, suggested check, status.
```

## Guardrails

- Confirm authorization before fetching; stop if missing. See `public-surface-recon.md` Authorized use.
- Sequential fetches. Stop an origin on 429, a block, or an automated-access refusal. Do not spoof User-Agent or rotate identity to continue.
- Do not use local filesystem evidence.
- Preferences in robots.txt and Content-Signal are not access control.
- Missing MCP or commerce endpoints on a content site is not a finding.
- Unstable MCP card paths: record which variants respond; do not require one vendor path.
- Do not invoke discovered tools. Do not supply credentials.
- Do not chase a vendor readiness score.
