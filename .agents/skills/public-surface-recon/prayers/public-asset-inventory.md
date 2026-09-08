## Language

- Write analysis in English unless the user specifies otherwise.
- **Blackbox only:** facts from public HTTP, archives, and remote OSINT — never from local files, folders, drives, or workspace.
- Quote headers, paths, and strings literally.
- Separate **fetched** from **referenced in HTML only**.
- Always record **which origin** each observation belongs to.

## Use when

The user asks what **public assets exist**, what the surface looks like, or what can be fetched without login. Required before mirror feasibility or attribution checks.

## Purpose

Inventory public surface **per origin** in the registry. Auth hosts and asset hosts are inventoried separately from the entry URL when detections show they differ.

## Inputs

- Entry URL (required)
- Origin registry from prior steps (create with `entry` if empty)
- Optional: path or locale variants the user gives
- Open checks queue (merge)

## Procedure

### Phase 1 — Entry and discovered origins

1. For each origin in registry with role `entry`, `app`, `auth`, `assets`, `api`, or `unknown` (prioritize `unknown` for role closure):
   - Fetch `/` or the path that linked to this origin.
   - Record status, redirects (new origins), response headers (`set-cookie`, `server`, `via`, security policy).
2. From each fetched HTML: resource URLs, inline config, forms, hidden fields, meta tags — tag each with **source origin**; note `mailto:`, author meta, HTML comments, visible emails or personal names.
3. Any new host in `href`, `src`, `action`, `redirect`, preload, or CSP → add to origin registry + open check for role.

### Phase 2 — Auth surface (may be off entry host)

4. On **each origin** where auth UI appears or is linked:
   - forms: full `action` URL (scheme + host + path);
   - links to login, logout, register;
   - embedded iframes or third-party logo hosts;
   - identity-related path segments.
5. If auth UI is on host A but form posts to host B, register both; queue check on relationship (broker vs operator subdomain).
6. Note cookies set per origin: names, `Domain`, `Path`, `SameSite` when visible.

### Phase 3 — Assets (may be off entry host)

7. Group referenced resources by **asset origin** (script, style, font, image, media, wasm, pdf, data).
8. For each assets origin: fetch at least one representative file per **type** if public (script, stylesheet, favicon, og/social image, font, wasm or other binary when linked).
9. On fetched **images and binaries**: note file name, content-type, size; extract metadata and readable strings when tools allow (EXIF/XMP, SVG text, font name tables, embedded URLs in binaries). Any org, hostname, email, or product string → entity list + open check.
10. Do not merge CDN or storage host into app origin in the report.

### Phase 4 — Hints and queue

11. From paths and file names on any origin, note functional hints; mark inference.
12. From image/binary traces (metadata, watermarks, strings), note attribution hints; mark fact vs inference by source field.
13. From emails, names, nicknames, or codename-like path segments, add to **identifier list** for `identity-trace-search`.
14. Every detection → open check (probe path on correct origin, fetch asset, metadata pass, DNS, entity-correlation, archive CDX for that host).
15. Unclear third-party hosts → entity list.

## Output

```markdown
## Public asset inventory

**Entry URL:** <url>

### Origin registry (updated)
| Origin | Role | Evidence | Pages fetched |

### Per-origin summary

#### <origin> (<role>)
| Path | Status | Notes |

**Headers (observed)**
| Header | Value | Implication |

**Auth on this origin**
| Method | URL (full) | Posts to host | Notes |

**Resources served from this origin**
| Type | Pattern or example | Count guess |

**Image and binary traces**
| URL | Type | Trace (metadata, string, watermark) | Fact / inference |

**Cookies set**
| Name | Domain | Origin that set it |

### Cross-origin relationships (inference until verified)
| From origin | To origin | Relationship guess | Check |

### Client metadata
| Key | Value | Source origin | Source file or tag |

### Functional hints (inference)
- <hint> — basis — origin

### New identifiers for trace search
| Token | Type | Detected from | Origin |

### New entities for correlation
| Entity | Type | Detected from | Origin |

### Next checks
| Detection | Origin | Next fact to verify | Suggested check | Status |
```

## Guardrails

- Confirm authorization before fetching; stop if missing. See `public-surface-recon.md` § Authorized use.
- Sequential fetches. Stop an origin on 429, a block, or an automated-access refusal. Do not spoof User-Agent or rotate identity to continue.
- Do not use local filesystem, workspace search, or disk git repos as evidence. Assets must be fetched from public URLs in-session.
- Referenced asset on `cdn.other.example` ≠ hosted on entry host; inventory both.
- Auth broker may host only UI while app stays on entry origin, or the reverse; use full URLs.
- Cookie scoped to parent domain may bridge app and auth; verify with Set-Cookie on each origin.
- Role `unknown` must not stay unknown without an open check or closed role.
- Skipping favicons, social images, and fonts loses common attribution traces; inventory them explicitly.
