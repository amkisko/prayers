# Pray drift reports a renderer mismatch after a clean plan

## Participants

Andrei Makarov (@amkisko)

## Dependency

Pray 1.26.0, generated lockfile entry `generated_by = "pray 1.26.0"`.

## Symptom

After `pray install` and `pray apply`, `pray plan` reports `AGENTS.md unchanged` and `pray verify` exits successfully. `pray drift --semantic` also exits successfully. The ordinary `pray drift` command exits 6 and reports `renderer_drift: AGENTS.md differs from fresh render`.

## Evidence

- `pray install`: exit 0; lock and target updated for the current local packages.
- `pray apply`: exit 0; everything up to date.
- `pray plan`: exit 0; `Prayfile.lock unchanged`, `AGENTS.md unchanged`.
- `pray verify`: exit 0.
- `pray drift --semantic`: exit 0.
- `pray drift`: exit 6 with one renderer-drift record for `AGENTS.md`.
- Source and provisioned copies of the changed skills compare byte-for-byte equal.

The local Pray source shows that `plan` checks current rendered outputs through `ensure_rendered_outputs_current`, while ordinary drift separately compares on-disk targets with `fresh_targets` in `drift_project`. The two paths disagree for this fixture.

## Suggested fix

Add this repository shape as a Pray regression fixture, then make the plan/render check and ordinary drift use the same normalized fresh target for a managed file with local content. Until a fixed Pray release is available, use `plan`, `verify`, source-to-provisioned comparisons, and `drift --semantic` together; keep the ordinary drift failure visible.

## Next

- Reproduce in the Pray test suite and report upstream.
- Upgrade the pinned minimum after the upstream regression test and fix ship.

## Source

- `docs/issues/20261029165911_preferred-stack-language-proximity.md`
- `Prayfile`
- `Prayfile.lock`
- Pray `crates/pray-cli/src/commands_verify.rs`
- Pray `crates/pray-core/src/verify/mod.rs`
