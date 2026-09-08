## Language

- Write the full report in English unless the user specifies otherwise.
- **Blackbox only:** every fact must cite public HTTP, archive, or remote OSINT — never local files, folders, drives, or workspace.
- Answer user questions in the executive summary first.
- Include unresolved open checks and any origin with role still `unknown`.

## Voice and prose

Plain technical writing. Evidence first. No filler.

- lead with what was found, then what it means; one scene per paragraph;
- short sentences; concrete outcomes; name the origin host when citing a fact;
- no sales language, trend packaging, or methodology pitches;
- no negation-first hooks; state the fact directly;
- do not repeat the same claim in positive and negative form in adjacent lines;
- prefer commas, colons, and full stops over em dashes;
- use headings and bullet lists for scanability;
- use tables only when the content is genuinely tabular (origin map, entity matrix, open checks, URL appendix);
- links and inline code for URLs, paths, and headers are fine;
- conclusions: short imperative lines where a list helps; otherwise tight prose.

Confidence belongs in the sentence: "high", "medium", or "low", with one reason.

## Use when

The user needs **how to report findings** as a structured deliverable, or wants a single document covering assets, attribution, mirror feasibility, and open checks. Compile after other prayers or from supplied notes.

Deliver **two artifacts** when the investigation is complete:

1. **Markdown report** — prose-first, filename `investigation-report.md`
2. **HTML report** — same content, formatted for reading and print; filename `investigation-report.html`

Use the HTML scaffold at `templates/investigation-report.html`. Replace placeholders; remove unused sections and example rows.

## Purpose

Compile results for the user-given target, with **origin map** showing split auth and assets hosts. The reader should understand answers without reading prior prayer outputs.

## Inputs

- User URL and questions
- All prior outputs including origin registry
- Final open checks queue

## Procedure

1. **Executive summary** — one short paragraph per user question; confidence in the sentence.
2. **Service identification** — prose: what the target is, operator, homonym risks closed or open.
3. **Methodology** — state blackbox mode in the first sentence; list origins fetched; name tools (curl, CDX, code-host search) in plain text.
4. **Origin map** — short prose on how hosts relate; table for origins; monospace flow line for redirects (entry → auth → app).
5. **Observed surface** — prose per origin when hosts differ; bullets for notable paths and headers; table only if many paths share one origin.
6. **Entities** — prose on who operates, integrates, or hosts; table for tier and evidence origin.
7. **Authentication** — prose then bullets: UI host, credential host, third parties.
8. **Assets and traces** — prose on CDN split; table for assets origins; bullets for image/binary traces.
9. **Public source** — prose on whether runnable source exists; table for repo candidates with relation labels.
10. **Identity traces** — prose; omit section if no identifiers searched.
11. **Artifacts and disclosure** — prose on maps, exposed paths, severity.
12. **Local replication** — prose verdict: mirror scope, clone feasibility, blockers named by origin.
13. **Open checks** — one sentence on what remains unknown; table for queue.
14. **Conclusions** — tight summary; bullets for actionable outcomes.
15. **Appendix** — URLs grouped by origin; list links, no prose needed.

### HTML generation

1. Copy structure from `templates/investigation-report.html`.
2. Set `<title>`, header meta, and `ENTRY_HOST` / `ENTRY_URL` / `ISO_DATE` / `USER_SCOPE`.
3. Map each markdown section to the matching `<section id="...">`.
4. Wrap prose in `<p>`; use `<ul>` for bullets; keep tables for tabular sections only.
5. Use `class="mono"` on hostnames in tables; `tier-1` / `tier-2` / `tier-3` on tier cells; confidence classes when summarizing.
6. Remove placeholder rows, empty sections, and HTML comments before delivery.
7. Validate: standalone file, no external CSS/JS, readable when opened in a browser and when printed.

## Output

### Markdown (`investigation-report.md`)

```markdown
# Investigation Report: <entry host>

**Date:** <iso>
**Scope:** <user input>
**Mode:** blackbox

## Executive summary

<One paragraph per user question. Confidence in the sentence.>

## What this service is

<Prose. Operator, product, homonyms.>

## Methodology

Blackbox recon only. No local files, folders, drives, or workspace were used as evidence.

<Prose on what was fetched and searched.>

**Origins fetched**
- <origin> (<role>)

## Origin map

<Prose on relationships.>

| Origin | Role | Relationship to entry | Key findings |
|--------|------|----------------------|--------------|

**Cross-origin flow**
```text
entry → ...
```

## Observed surface

### <origin> (<role>)

<Prose. Bullets for paths, headers, auth surface.>

## Entities and attribution

<Prose.>

| Entity | Relationship | Tier | Origin of evidence |
|--------|--------------|------|-------------------|

## Authentication

<Prose.>

- **UI host:** ...
- **Credential host:** ...
- **Third parties:** ...

## Asset delivery and traces

<Prose.>

| Assets origin | Types served | Operator entity |
|---------------|--------------|-----------------|

**Image and binary traces**
- <url>: <trace> → <led to>

## Public source availability

<Prose verdict on clone vs none.>

| Candidate | Relation | Evidence |
|-----------|----------|----------|

## Identity and codename traces

<Prose. Omit if not run.>

## Build artifacts and disclosure

<Prose. Severity in sentence.>

## Local replication

<Prose. Mirror vs runnable clone. Blockers by origin.>

## Open checks

<One sentence on remaining unknowns.>

| Detection | Origin | Next fact to verify | Suggested check |
|-----------|--------|---------------------|-----------------|

## Conclusions

<Short prose.>

- <imperative outcome>
- <imperative outcome>

## Appendix: URLs by origin

### <origin>
- <url>
```

### HTML (`investigation-report.html`)

Filled copy of `templates/investigation-report.html` with the same sections and facts as the markdown report. Prose in `<p>` tags; tabular sections in `<table>`; links as `<a href="...">`.

## Guardrails

- Do not include facts sourced from local filesystem, workspace, or disk git repos. If such material exists but was not used, do not mention it.
- Do not describe auth as "on the target" when only the entry page links elsewhere; use origin map.
- Asset inventory without CDN origin is incomplete if HTML references external hosts.
- Unresolved `unknown` origins must appear in open checks.
- Markdown and HTML must carry the same facts; HTML is not a shortened summary.
- Do not decorate prose with bold or italic except host labels in authentication bullets and inline code for paths.
- Redact emails, names, handles, and EXIF author or location unless the user asked for literals.
- Do not include secret-file bodies; record pattern presence and status only.
- State that the investigation ran under authorized blackbox scope.
