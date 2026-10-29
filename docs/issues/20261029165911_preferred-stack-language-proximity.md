# Preferred-stack language proximity

## Participants

Andrei Makarov (@amkisko)

## Decisions

- Keep language choice in `amkisko/preferred-stack`. Do not open a separate package.
- Define `native-first` as nearest semantic authority plus proximity of ordinary execution form. House language shortcuts stay when proximity and team practice agree.
- Compose fragment keeps always-on stop-gates and existing UX rules. Selection procedure and proximity bands live in a skill with one reference file.
- Existing tree language still wins (`minimal-implementation`). Greenfield and independent packages without an owning language use authority then proximity.
- Transpile and check layers inherit the target host for proximity (TypeScript inherits the JavaScript host). Native-named compiler tooling does not change application runtime proximity.
- Catalog rows stay out of AGENTS.md. Bands use labeled bullets. No markdown tables in governed prayer prose.
- Research anchors for checkable runtime claims: TypeScript Handbook runtime behavior and erased types; ECMA-335 CLI Virtual Execution System; WebAssembly host execution and WASI-style host imports. House band rankings are policy heuristics, not measured rankings.

## Effects

- `preferred-stack` 1.7.0 sources: fragment stop-gates, skill, `references/proximity-bands.md` with checkable anchors.
- `minimal-implementation` 1.5.2 Related points at preferred-stack.
- Prayfile skill tree entry added; CHANGELOG Unreleased updated.
- Prose audit recorded in `docs/reviews/20261029170200_preferred-stack-proximity-prose-audit.md` (passes 1-3).

## Next

1. Reviewer reads fragment versus skill versus proximity-bands before merge.
2. Package and publish when cutting the catalog (`make package` needs zstd on the host).
3. Optional later: align Cursor `language-and-stack` default with the fragment house shortcuts.
4. `pray drift` may still report `renderer_drift` on AGENTS.md while `pray render --check` is clean (same watch item as planned-release).

## Source

Upstream: live chat language-proximity tables; `packages/preferred-stack`; `packages/minimal-implementation`; `packages/planned-release` and `packages/durable-cache` fragment-plus-skill pattern; `writing-prose`; TypeScript Handbook (https://www.typescriptlang.org/docs/handbook/typescript-from-scratch); ECMA-335 (https://ecma-international.org/publications-and-standards/standards/ecma-335/); WebAssembly / WASI host model surveys and docs. Downstream: this issue; package sources when edited.
