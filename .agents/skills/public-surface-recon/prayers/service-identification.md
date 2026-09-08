## Language

- Write analysis and conclusions in English unless the user specifies another language.
- **Blackbox only:** facts from public HTTP, archives, and remote OSINT — never from local files, folders, drives, or workspace.
- Quote product names, domain names, and UI strings in their original form.
- Label homonym risks as inference until operator docs or distinct domains confirm.

## Use when

Starting an investigation; the user gave a URL but purpose or operator is unclear. Feeds entity list and origin registry before asset or attribution work.

## Purpose

Establish what the user-given target is. Seed **origin registry**, entity list, and **open checks**. Do not assume app, auth, and assets share one host.

## Inputs

- Target URL or hostname (required) — becomes first `entry` origin
- Optional: user hypothesis
- Optional: existing origin registry and open checks (carry forward)

## Procedure

1. Fetch the live entry URL. Record status, redirects (each redirect target → new origin + check).
2. Extract named strings and **all linked absolute URLs** from the page (operator, product, legal, login links).
3. For each distinct host, add origin registry row with role `unknown` unless evidence supports `marketing`, `auth`, `app`, `assets`, or `api`.
4. Flag early splits:
   - login link or form points to another host → candidate `auth` origin + fetch check;
   - static resource hosts differ from entry → candidate `assets` origin + sample fetch check.
5. Search hostname plus product tokens on the public web. Note name collisions.
6. Classify service category from copy and links only.
7. List homonyms with discard reason or open check.
8. Build entity list with detection source per row.
9. Close verifiable checks; append open checks for every unresolved detection and origin.

## Output

```markdown
## Service identification

**Entry URL:** <url>
**Identified service:** <name or unknown> — <purpose or unknown>
**Operator:** <org or unknown>
**Category:** <from evidence only>

### Evidence
- <fact> — <source>

### Origin registry
| Origin | Role | How detected | Status |

### Linked domains (detail)
| Domain | Role guess | How detected | Open check |

### Entities for correlation
| Entity | Type | Detected from | Origin |

### Homonyms
| Token | Conflicts with | Disposition |

### Remaining ambiguity
- <inference> — check: <falsifiable statement>

### Next checks
| Detection | Origin | Next fact to verify | Suggested check | Status |
```

## Guardrails

- Do not use local filesystem, workspace search, or disk git repos as evidence.
- User gave one URL; auth and assets may still be elsewhere — do not collapse hosts.
- `www` vs `app` vs bare domain are separate origins until role checks close.
- Login chrome on entry host does not prove auth is processed on same host; read form action and redirects.
