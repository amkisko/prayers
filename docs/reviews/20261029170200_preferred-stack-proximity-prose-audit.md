# Preferred-stack proximity prose audit

Session prose and claims pass while drafting `amkisko/preferred-stack` 1.7.0 language-proximity guidance.

## Participants

Andrei Makarov (@amkisko)

## Decisions

Scope: package sources under `packages/preferred-stack/`, Related line in `packages/minimal-implementation/`, issue `docs/issues/20261029165911_preferred-stack-language-proximity.md`. Coverage: `writing-prose`, `check_prayer_prose`, TypeScript Handbook and Node.js Learn pages for TS/JS runtime inheritance, ECMA-335 for CLI/VES, Wasm runtime survey for host imports/WASI. Catalog of ~200 language rows stays out of always-on prose.

Pass 1 (mechanical): `ruby usr/scripts/check_prayer_prose.rb .` reported ok. `validate_skill.rb` accepted `preferred-stack` frontmatter.

Pass 2 (voice and ownership):

1. Split the native-first definition from the OS-native guest denial so each bullet holds one beat.
2. Replace empty contrast "bands are not ranked performance scores" with positive placement wording.
3. Replace "do not pick a distant guest because syntax looks familiar" with affirmative band rule.
4. Drop "hiring load" from the ask trigger; keep architecture and operability.
5. Replace "compose the language pack" with "follow the matching language pack when the project composes one" so agents do not invent a Prayfile edit as the selection step.
6. Name BEAM in the elixir house shortcut instead of "actor-style fault isolation" marketing cadence.
7. Keep external runtime claims soft and cite public anchors in the reference; house band ranking stays labeled as policy.

Pass 3 (procedure consistency and claim edges):

1. Align quick reference and procedure step 8 with "follow matching language pack".
2. Drop residual "not a benchmark score" contrast in the skill procedure.
3. Soften the SQL trap so embedded engines stay engine-proximate.
4. Affirm TypeScript toolchain versus application host in the reference.

## Effects

- Fragment, skill, and `references/proximity-bands.md` updated through pass 3.
- `minimal-implementation` 1.5.2 Related points at preferred-stack.
- Prayfile skill tree lists preferred-stack.
- `make check-prayer-prose`, `make validate-skills`, and `make PRAY=$HOME/.cargo/bin/pray install plan apply verify` completed successfully. Skill files provisioned under `.agents/skills/preferred-stack/`; `cmp` matches sources.
- Composed AGENTS.md grew with the fragment (~26.6 KiB); house 16 KiB target was already exceeded before this change.
- `pray drift` reported `renderer_drift` on AGENTS.md while `pray render --check` exited clean; treat as the known CLI watch item, not a fragment content mismatch.

## Next

1. Package and publish when cutting the catalog.
2. Optional: sync Cursor `language-and-stack` Ruby default with fragment house shortcuts.
3. Later trim pass on always-on fragments if AGENTS.md budget work resumes.

## Source

Upstream: `writing-prose`, planned-release/durable-cache fragment-skill split, research links in the issue. Downstream: `packages/preferred-stack/`, `packages/minimal-implementation/`, `Prayfile`, `CHANGELOG.md` Unreleased.
