# Planned release fragment and skill split

Session review and engineering pass while splitting `amkisko/planned-release` so AGENTS.md keeps concept agreements and the skill owns procedure.

## Participants

Andrei Makarov (@amkisko)

## Decisions

Scope: this project's live chat that asked whether planned release should be a skill rather than a large AGENTS.md block, plus package files under `packages/planned-release/`, `Prayfile` skill tree entry, and issue `docs/issues/20261029093247_planned-release-prayer.md`. Coverage: prior review `docs/reviews/20261029120557_planned-release-process-signals.md`; durable-cache fragment-plus-skill pattern; writing-prose and check-prayer-prose; engineering-audit on guidance ownership (tree never becomes executed bytes, so resource and budget and trace and identification skipped); session-review smallest response (shared prayer package with fragment for always-on rules and skill for judgment-heavy work).

Confirmed corrections in this workstream:

1. Keep cadence, vocabulary, and invariants in the compose fragment so ordinary sprint work sees week numbering without opening a skill.
2. Move binding checklist, lifecycle procedure, and process-signal measurement into `skills/planned-release` with `references/process-signals.md`.
3. Provision the skill from `tree ".agents/skills"` in Prayfile; compose alone does not install skill folders.
4. Restore membership predicate wording and the recovery forge-evidence invariant after an over-aggressive fragment trim.
5. Replay validators stay deferred until two bindings share a deterministic check.

## Effects

- `amkisko/planned-release` 1.1.0: fragment about 4.5 KiB (was about 10 KiB); skill and process-signals reference added.
- Later pass, 1.2.0: fragment cut to four concept bullets (commitment, collection period, period label, prepare/deliver calendar event); skill gained cadence defaults, vocabulary (including prepare/deliver aliases for cut/publish), invariants, naming collision, and fuller binding/lifecycle text. Fragment about 1.3 KiB.
- Composed `AGENTS.md` shrunk again after the concept-only trim.
- `branch-naming` Related line names the skill for binding and signals.
- `docs/release-runbook.md` and the live issue updated for the split.
- `make check-prayer-prose` and `make validate-skills` pass for the new skill.
- `pray verify` and `pray render --check` pass after install. `pray drift` still reports `renderer_drift` on AGENTS.md while `render --check` is clean; treat as CLI inconsistency to watch, not as fragment content mismatch (fragment body matches the managed span; provisioned skill files match sources).

## Next

1. Reviewer reads fragment versus skill ownership before merge.
2. `make package` for planned-release needs a host with zstd; then `make publish` when cutting the catalog.
3. First consumer binding from the originating product tree.
4. Optional later: diagnose `pray drift` versus `pray render --check` disagreement on this tree.

## Source

Upstream: writing-prose, session-review, engineering-audit, durable-cache package shape. Downstream: `packages/planned-release/`, `Prayfile`, `docs/issues/20261029093247_planned-release-prayer.md`, `docs/reviews/20261029120557_planned-release-process-signals.md`.
