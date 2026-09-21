# Prayer additions backlog

Implement the 2026-09-21 research backlog: updates to existing packages and six new packages. Tree-only skills stay out of AGENTS.md. durable-cache and kotlin-conventions are opt-in fragments.

## Participants

- amkisko

## Decisions

Fold generic residue into existing prayers. Add change-review, agent-artifact, derivation-audit, agent-run-supervision, durable-cache, and kotlin-conventions as named packages. Do not vendor the twelve upstream trees. Do not compose the new skills into AGENTS.md.

## Effects

Source versions: claims-audit 1.1.0, engineering-audit 2.10.0, security 1.4.0, working-rules 2.5.0, background-jobs 1.1.0, keep-the-work 1.3.0, finite-state-machines 1.3.0, docs-conventions 2.5.0, rejected-changes 1.1.0, publish-checks 1.1.0, minimal-implementation 1.5.0, public-surface-recon 1.1.0, rust-conventions 1.1.0. New packages at 1.0.0: change-review, agent-artifact, derivation-audit, agent-run-supervision, durable-cache, kotlin-conventions.

A follow-up prose audit separated evidence kinds from security dispositions, replaced figurative system terms with observable states, clarified secret handling and companion selection, and removed incomplete or coined constructions from the published guidance.

Validation commands and observed results:

- ruby usr/scripts/validate_skill.rb: exit 0
- make test: exit 0; validate_skill 13 runs, 43 assertions; check_artifacts 9 runs, 37 assertions
- make install plan apply with pray 1.20.0: exit 0; 36 packages; AGENTS.md 19,750 bytes
- make publish: exit 0
- make verify drift check-artifacts with pray 1.20.0: exit 0; check-artifacts ok
- git diff --check: exit 0

## Next

Consumers bump the composed pins in the README example, then pray install. Tree the new skills when those jobs are in scope. Tag after merge to main. Later: shorten composed always-on fragments so AGENTS.md returns under 16 KiB.

## Source

usr/docs/issues/20260921075200_todays-prayer-additions-backlog.md
usr/docs/issues/20260921074000_spc-research-prayer-additions.md
usr/docs/issues/20260921075000_codex-mathmatica-skills-prayer-additions.md
