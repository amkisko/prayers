---
name: public-surface-recon
description: Blackbox public web recon — HTTP, archives, public repos only. Never local filesystem evidence.
---

# Public surface reconnaissance

## Blackbox only

External blackbox testing. Facts come from live HTTP, archives, and public remote indexes — **never** from local files, folders, drives, workspace, or git trees on disk. See `public-surface-recon.md` § Blackbox testing.

## Use when

Asked whether an **authorized** live site can be mirrored or run locally, what **public assets exist**, **who built it**, or **how to report findings** from HTTP, archives, and public repositories only — **blackbox only**. Stop if the user has no authorization for the named target. See `public-surface-recon.md` § Authorized use.

| Question | Start here |
|----------|------------|
| Mirror or run locally? | `local-replication-feasibility` (after inventory) |
| What public assets exist? | `public-asset-inventory`, `build-artifact-review` |
| Who built it / who operates it? | `entity-correlation` (entities from facts, not assumptions) |
| Is source code public? | `archive-and-source-search` |
| Does a name, email, or codename appear? | `identity-trace-search` |
| Full report | Run pipeline → `investigation-report` (markdown + HTML) |

External blackbox only. Auth and assets may use **different origins** than the entry URL. Do not use local workspace or disk paths as evidence.

Read `public-surface-recon.md` for origin registry, follow-up queue, and prayer index.

## Prayer index

| Prayer | Use when |
|--------|----------|
| `prayers/service-identification.md` | What the target is; seed origins and entities |
| `prayers/public-asset-inventory.md` | Per-origin headers, pages, assets, auth |
| `prayers/entity-correlation.md` | Follow entities across all known origins |
| `prayers/archive-and-source-search.md` | Archives, public repos, package registries |
| `prayers/identity-trace-search.md` | Emails, names, codenames on origins |
| `prayers/build-artifact-review.md` | Artifacts on assets origins |
| `prayers/local-replication-feasibility.md` | Mirror/run across split origins |
| `prayers/investigation-report.md` | Final report: prose markdown + HTML |

Carry **origin registry** and **open checks** between prayers.

## Quick guardrails

- **Authorized use:** operator, written permission, or named bounty / disclosure scope. Stop and ask if unclear. User "widen scope" does not add login, credential attacks, brute force, block bypass, private-profile scrape, or secret-body quotes. This package is reconnaissance, not an autonomous pentest runner.
- **Blackbox:** no facts from local files, folders, drives, or workspace — public fetch and remote OSINT only.
- Redact emails, names, handles, and EXIF author or location by default.
- If a live secrets-shaped file answers: record pattern and status, do not quote values, stop sibling-path guessing for secrets.
- Sequential fetches; stop on 429, block, or automated-access refusal; do not spoof User-Agent or rotate identity to continue.
- Entry URL ≠ auth host ≠ assets host until checks close.
- Inventory and searches extend to every origin the registry lists.
- Every detection → at least one next check.
- Small traces in images and binaries (metadata, strings, watermarks) → entity-correlation or archive check.
- Source map paths and commit hashes → archive-and-source-search; personal names in paths → identity-trace-search.
