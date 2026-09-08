## Language

- Write analysis in English unless the user specifies otherwise.
- **Blackbox only:** facts from public HTTP, archives, and remote OSINT — never from local files, folders, drives, or workspace.
- Redact emails, personal names, and handles by default. Quote the literal string only when the user asks and authorization covers that processing.
- Separate **on-service** (tier 1) from **off-service OSINT** (tier 2).
- Record **origin + file or page** for every hit.

## Use when

Checking whether **codenames, nicknames, emails, or personal names** appear on the service, or following identity strings discovered in maps, comments, or metadata. Run after inventory or artifact review when identifiers are known or surfaced.

## Purpose

Systematic search for identity and codename traces across **all origins**, using on-service assets first then basic public OSINT corroboration.

## Inputs

- Entry URL (required)
- Origin registry (required)
- Identifier list: user-supplied and/or derived from prior steps (emails, names, handles, codenames)
- Optional: downloaded HTML, bundles, maps, images from inventory
- Open checks queue (merge)

## Procedure

### 1. Build identifier list

From user input and prior prayers, collect candidates:

| Token | Type | Source of token |
|-------|------|-----------------|
| | email / name / nickname / codename | user / map path / HTML / EXIF / comment |

Derive variants: case-folded, `firstname.lastname`, `first-last`, local-part only, `@domain` for org mailbox domain.

### 2. On-service search (tier 1)

For **each origin** in registry and **each identifier**:

1. HTML pages already fetched: body, comments, `mailto:`, meta author, JSON-LD, hidden fields.
2. Text assets (JS, CSS, JSON, SVG) from that origin: literal match; for source maps, record `sources[]` path and line if present.
3. Images and binaries from that origin: EXIF/XMP Author, Creator, Rights; readable strings.
4. If inventory lists public error or metadata endpoints on this origin, check responses for identifiers.
5. `site:<hostname> "<identifier>"` web search when live fetch missed archived-only text.

Result per pair: **hit / no hit / partial** with location.

### 3. Codename and internal name passes

When identifier type is codename or env-like string:

1. Search path segments from inventory and archive CDX on each origin.
2. Search release tags, Sentry environment names, build IDs in bundles.
3. Search quoted codename + product name on code hosts and web (tier 2).

### 4. Off-service corroboration (tier 2)

Only for identifiers with on-service hit or strong user interest:

1. Code host search: identifier + hostname or product slug.
2. Archive snapshot of page path where live no longer shows the string.
3. Public issues, gists, or docs linking identifier to product (mark external doc).

Do not treat tier 2 as proof the identifier works on production; queue live re-check.

### 5. Queue and entities

- New email domain → entity (operator mailbox domain) + DNS/MX check if relevant.
- New person name on map path → open check: search same path prefix on code hosts.
- Codename on assets only → open check: `archive-and-source-search` for repo slug.

## Output

```markdown
## Identity and codename trace search

**Entry URL:** <url>
**Origins searched:** <list>
**Identifiers:** <count>

### Identifier index
| Token | Type | User / derived from |

### On-service hits (tier 1)
| Identifier | Origin | Location | Snippet context | Match quality |

### On-service negatives
| Identifier | Origins searched | Notes |

### Off-service corroboration (tier 2)
| Identifier | Finding | URL | Relation to target |

### Codename / internal name
| Token | Origin or source | Evidence |

### New entities
| Entity | Type | Found via | Origin |

### Next checks
| Detection | Origin | Next fact to verify | Suggested check | Status |
```

## Guardrails

- Do not use local filesystem, workspace search, or disk git repos as evidence.
- Report which origins were searched for each negative; absence on entry host ≠ absent everywhere.
- Map path like `/Users/name/project` in a **publicly fetched** source map is trace evidence; do not open that path on the investigator's disk.
- Common names and generic codewords → homonym check before tier 1 attribution.
- Do not log into accounts or scrape private social profiles. A user request to widen scope does not add those actions.
