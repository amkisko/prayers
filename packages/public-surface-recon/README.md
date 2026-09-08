# amkisko/public-surface-recon

**Blackbox** public recon: HTTP, archives, and public remote repos only. Never use local files, folders, drives, or workspace as evidence.

Run only on a target the user is authorized to investigate (they operate it, they have written permission, or it is in a named bounty or disclosure scope). Stop if authorization is missing. Redact personal data by default. Do not spoof a User-Agent to bypass a block or quote live secret-file bodies.

Use when asked whether an authorized live site can be mirrored or run locally, what public assets exist, who built it, or how to report findings from public sources only.

Stack-agnostic. Multi-origin auth and assets. Detect facts → queue next checks → OSINT → prose report (markdown + HTML).

Template: `skills/public-surface-recon/templates/investigation-report.html`

Prayers: `skills/public-surface-recon/prayers/`
