## Language

- Write analysis in English unless the user specifies otherwise.
- **Blackbox only:** facts from public HTTP, archives, and remote OSINT — never from local files, folders, drives, or workspace.
- Separate **in live assets**, **in public OSINT**, **name collision**.
- State relationship only when a check closes with evidence.
- Cite **which origin** each asset hit came from.

## Use when

The user asks **who built it**, who operates it, which auth broker or CDN is involved, or whether a named company appears in deployed assets vs off-site docs only. Run whenever the entity list grows.

## Purpose

Correlate entities across **all origins** in the registry. Auth providers and CDN operators are entities; their hosts may not match the entry URL.

## Inputs

- Entry URL (required)
- Origin registry (required)
- Entity list: name or domain + detection source + origin when known
- Optional: assets downloaded from any origin
- Optional: user question about a specific entity
- Open checks queue (merge)

## Procedure

For each entity:

### A. Presence across known origins

Search every origin row where the entity could appear (`entry`, `app`, `auth`, `assets`, `api`, and entity's own domain if registered):

1. Derive search strings: name, domain, abbreviations, product slugs, mailbox domains, codenames from identifier list.
2. Search reachable HTML on each app/auth origin without credentials.
3. Search text assets fetched from **each assets origin** and same-origin bundles on app/auth hosts.
4. Search **image and binary** assets from inventory: metadata fields, watermarks, font copyright strings, readable substrings in wasm/pdf/media.
5. Search build artifacts per assets origin if collected.
6. Search headers when entity implies infrastructure (CDN, hosting, broker).
7. Record hit / no hit / partial with **origin + location**. Tier-1 can be on auth or CDN host, not only entry.

### B. Public OSINT on entity

When entity has distinct name or domain:

1. Official site: role claims naming entry hostname or product.
2. Press, case studies, integration docs.
3. Code hosts: org/repos for hostname, product, entity name (see `archive-and-source-search` § Phase 2).
4. Registries if scope includes ownership.

For **person** or **codename** entities, prefer `identity-trace-search` for on-service hits before tier-2 doc claims.

Each claim → open check: find corroboration on **which origin** (app vs auth vs assets).

### C. Correlate

| Tier | Meaning |
|------|---------|
| 1 | String, logo, hostname, or **metadata trace** in assets on **any** registered origin |
| 2 | Entity public doc names target; not yet found on origins |
| 3 | Inference only |

Auth provider entity: tier-1 often on `auth` origin. CDN entity: tier-1 often on `assets` origin. Queue fetch on that origin if not yet done.

New hosts from B → origin registry + entity list + checks.

### D. User-specific question

Answer with tier table per origin searched.

## Output

```markdown
## Entity correlation

**Entry URL:** <url>
**Origins searched:** <list>
**Entities processed:** <n>

### Per entity

#### <name>
| Check | Origin | Result | Tier | Source |
| In deployed assets | <which host> | yes/no/partial | 1 / — | |
| Entity doc mentions target | — | yes/no | 2 / — | <url> |
| Inference only | — | yes/no | 3 / — | |

**Relationship:** <operator | developer | integrator | auth | assets-cdn | infra | homonym | unknown>
**Conclusion:** <short>

### New entities
| Entity | Type | Found via | Origin |

### Origin registry updates
| Origin | Role | Reason added |

### Collisions discarded
- <entity> — <reason>

### Next checks
| Detection | Origin | Next fact to verify | Suggested check | Status |
```

## Guardrails

- Confirm authorization; stop if missing. See `public-surface-recon.md` § Authorized use.
- Do not use local filesystem, workspace search, or disk git repos as evidence. Tier-1 hits must come from assets fetched from public origins.
- "Not found on entry host" ≠ not found; report which origins were searched.
- Auth broker logos on auth origin are tier-1 for auth entity even if absent on entry page.
- Library copyrights in a CDN bundle are not CDN operator proof for the product.
- EXIF `Software` or font vendor string on a **standalone** favicon or og:image is stronger attribution signal than the same string inside a generic UI kit bundle.
