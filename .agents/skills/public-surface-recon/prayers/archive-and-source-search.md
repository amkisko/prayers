## Language

- Write analysis in English unless the user specifies otherwise.
- **Blackbox only:** facts from public HTTP, archives, and remote OSINT — never from local files, folders, drives, or workspace.
- Cite archive timestamps and URLs per **hostname**.
- Mark repo matches: related, unrelated, uncertain.

## Use when

Supporting **who built it**, **whether source is public**, and **report** intents with historical paths, public repositories, and off-site role claims. Uses HTTP archive APIs and public code hosts only.

## Purpose

Historical and off-site evidence for **each origin** in the registry, with a structured pass for **public source code availability**. See `public-surface-recon.md` § Basic OSINT techniques.

## Inputs

- Entry URL (required)
- Origin registry (required)
- Entity list
- Optional: path strings, package names, commit hashes from inventory or artifact review
- Optional: identifier list from identity-trace-search
- Open checks queue (merge)

## Procedure

### Phase 1 — Archive per origin

1. Run web archive CDX for **each origin** in registry (browser User-Agent if blocked).
2. Per host: first snapshot, retired paths, auth migrations. Archived path → live check on **that** host.
3. CDX filter for extensions suggesting source or config: `.map`, `package.json`, `Gemfile`, `go.mod`, `requirements.txt`, `.git/config`, `.env`, `docker-compose`.
4. When live image metadata is stripped, compare archived favicon, logo, or og:image for retained EXIF or different branding.

### Phase 2 — Public source availability (code hosts and registries)

Use search strings from hostname, product name, entities, and artifact path roots.

**Code hosts (GitHub, GitLab, Bitbucket, Codeberg, etc.)**

| Search | Example pattern |
|--------|-----------------|
| Hostname in code | `"app.example.com"` in repos (platform search or web `site:github.com`) |
| Org from entity correlation | `org:acme` repos mentioning product or hostname |
| Path or package slug | Folder names from source maps, `package.json` `name` if seen in artifacts |
| Commit hash | Short hash from bundle or error page → platform search |
| Release tag | `v*.*.*` from asset → releases on candidate repos |

**Package and artifact registries**

| Registry | Query |
|----------|--------|
| npm / jsr | Product slug, scope, hostname |
| PyPI | Package name from API paths or docs |
| RubyGems | Gem name from `/assets` or error pages |
| Docker / GHCR | Image name matching product or org |

**Web search (quoted)**

- `"<hostname>"` + `github` / `gitlab` / `source`
- `"<product>"` + `repository` / `open source`
- `"<codename>"` + hostname (when identity search supplies codename)

For each candidate repo record: URL, stars/forks optional, **relation** (same product | fork | integration sample | unrelated | uncertain), **evidence** (file URL or README line mentioning hostname).

### Phase 3 — Entity and off-site claims

1. Per entity domain: site search for entry hostname, product name, auth/assets origins.
2. Terms, privacy, careers, press on marketing or app origins when linked.
3. Developer docs or status pages linking to public API specs or sample repos.
4. Homonyms flagged; new hosts → origin registry.

### Phase 4 — Handoff

1. Archive paths suggesting exposed trees on **assets** origin → `build-artifact-review` for that host.
2. Repo with high confidence same product → `local-replication-feasibility` (clone vs mirror).
3. Identifiers found in repo README or commits → `identity-trace-search` on-service re-check.
4. Map path roots without repo match → open check with derived code-host query.

## Output

```markdown
## Archive and public source search

**Entry URL:** <url>

### Archive by origin
| Origin | Role | First seen | Notable paths | Live check needed |

### Public source availability
| Candidate | Platform | Relation | Evidence | Hostnames / paths mentioned |

### Package / container registry
| Name | Registry | Relation | Evidence |

### Archive / web (per entity)
| Entity | Finding | URL | Relation |

### Code host search log
| Query | Platform | Top results | Relation notes |

### Off-site claims
| Entity | Claim | URL | Tier | Origins implicated |

### Homonyms
| Token | Why unrelated or pending |

### New entities / origins
| Name | Type | Source |

### Gaps
- <not searched and why>

### Next checks
| Detection | Origin | Next fact to verify | Suggested check | Status |
```

## Guardrails

- Do not use local filesystem, workspace search, or disk git repos as evidence. Code-host hits must link to a **public remote URL** (e.g. `github.com/...`), not a path on the investigator's machine.
- CDX for `cdn.example.com` is separate from `app.example.com`.
- Archived asset path on CDN does not prove current app origin exposure.
- Repo named like product but different hostname needs explicit link evidence.
- Public repo with only docs or SDK ≠ full application source; state what is missing for local run.
- Prefer platform search and quoted web search over guessing private repo URLs.
