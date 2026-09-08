## Language

- Write analysis in English unless the user specifies otherwise.
- **Blackbox only:** facts from public HTTP, archives, and remote OSINT — never from local files, folders, drives, or workspace.
- Rate severity from evidence.
- Report pattern presence, not secret values.
- Tag each artifact with **assets origin** host.

## Use when

Extending **what public assets exist** with build or debug artifacts (maps, manifests, exposed paths) and **traces in images and binaries** (metadata, strings, watermarks), often on assets origins separate from the entry URL.

## Purpose

Review build or debug artifacts on **each assets origin** in the registry. Maps and manifests often live on CDN or static hosts, not the entry URL.

## Inputs

- Entry URL (required)
- Origin registry with `assets` (and `app` if bundles served there) rows
- Resource URLs from inventory, grouped by origin
- Open checks queue (merge)

## Procedure

1. For each `assets` or `app` origin, list candidate artifacts from inventory: maps, manifests, config-like paths, archive hints.
2. Probe on **that origin's** base URL (not entry host unless same).
3. Record status and size per URL.
4. For readable artifacts: sample paths, sensitive patterns, org/product strings — note **host**; extract **map path roots**, commit hashes, release tags for code-host search.
5. For **images** (favicon, og:image, UI raster, svg): read metadata and visible branding; record author, software, copyright, embedded text, odd hostnames, emails.
6. For **binaries** (fonts, wasm, pdf, media): extract readable strings; note URLs, emails, copyright lines, personal names, error-reporting or analytics host patterns.
7. Compare artifact paths to public URLs on the same origin.
8. Findings → severity + checks (entity-correlation for CDN operator, live probe on sibling paths).
9. New strings → entity list or identifier list. New host in artifact content → origin registry. Path roots and hashes → `archive-and-source-search`. Personal names or emails → `identity-trace-search`.

## Output

```markdown
## Build artifact review

**Entry URL:** <url>

### By assets origin

#### <origin>
| Artifact URL | Status | Size | Type guess |

**Path exposure (sample)**
- <path>

**Sensitive patterns**
| Pattern | Present | Notes |

**Strings for entity correlation**
| String | Context | Source (map / image / font / wasm / other) |

**Image and binary traces**
| URL | Trace type | Value | Notes |

### Risk (per origin or combined)
**Severity:** low | medium | high
**Why:**

### Next checks
| Detection | Origin | Next fact to verify | Suggested check | Status |
```

## Guardrails

- Do not use local filesystem, workspace search, or disk git repos as evidence. Artifacts must be fetched from public URLs on target origins.
- Probing `entry/app.js.map` when bundle is on `cdn.host` misses the artifact; use inventory URL.
- Same operator may use multiple asset origins; inventory each.
- Pattern hit on CDN artifact is disclosure for that host's operator relationship, not automatically entry host breach.
- Empty live metadata does not close the trace; queue archive snapshot of same image path.
