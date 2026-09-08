## Language

- Write analysis in English unless the user specifies otherwise.
- **Blackbox only:** facts from public HTTP, archives, and remote OSINT — never from local files, folders, drives, or workspace.
- Use **feasible**, **partial**, **not feasible**.
- Split mirroring across origins when auth and assets differ.

## Use when

The user asks whether the site can be **mirrored or run locally**. Run after inventory and entity correlation so blockers (auth broker, CDN-only assets, no public source) are known.

## Purpose

Assess fetch, store, and local run feasibility when **entry, auth, and assets may be separate origins**.

## Inputs

- Entry URL (required)
- User goal: mirror | runnable clone | offline browse
- Origin registry and prior outputs
- Open checks queue

## Procedure

1. Per origin in registry, list publicly fetchable items without auth (from inventory).
2. List items requiring session; note which origin sets cookies and which consumes them.
3. If auth origin is third-party broker: local login flow likely **not feasible** without broker credentials; queue as blocker.
4. Mirror scope: static mirror may require fetching from **multiple origins** (HTML from app, bundles from CDN); estimate per host.
5. Code host and package registry search from `archive-and-source-search` outputs; hostname and strings from facts across origins.
6. If related public repo found: note clone vs mirror; missing backend still blocks full local run.
7. Per correlated entity (auth, CDN, API): dependency blocker with origin named.
8. Unclosed origin role or unreachable assets origin → lower confidence.

## Output

```markdown
## Local replication feasibility

**Entry URL:** <url>
**User goal:** <mirror | clone | browse>
**Origins involved:** <count and roles>

### Fetchable by origin
| Origin | Role | Public items | Feasible? |

### Cross-origin dependencies
| From | To | Dependency | Blocks local run? |

### Not obtainable publicly
| Item | Origin | Why |

### Verdict
**Runnable locally:** partial shell | not feasible | feasible with credentials
**Mirror completeness:** full static | partial (list missing origins) | unknown
**Confidence:** high | medium | low

### Blockers
1. ...

### Practical options
| Goal | Approach |

### Next checks
| Detection | Origin | Next fact to verify | Suggested check | Status |
```

## Guardrails

- Do not use local filesystem, workspace search, or disk git repos as evidence. "Public repo exists" requires a remote URL from `archive-and-source-search`, not a clone on disk.
- Mirroring entry HTML without CDN assets gives broken shell; list assets origins required.
- Auth on external broker blocks full clone even if app source were public.
- Verdict **low** while auth or assets origins lack inventory passes.
- This prayer assesses feasibility. Do not perform a bulk site mirror as part of the investigation.
