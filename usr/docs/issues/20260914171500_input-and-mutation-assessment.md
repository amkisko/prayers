# Input and mutation assessment

Live work. Skill and fragment text is inference input: resource, trace, and boundary modes skipped because these files never become executed bytes and there is no plant.

## Participants

- amkisko

## Decisions

Expand engineering-audit security review mode so ingress and mutation are a named assessment. Keep the mode in security.md. No new skill. No named scanner. No language-specific rule files.

Double-check means two different controls: allowlist at a trusted layer after one canonical decode, then a distinct check at the write. A request body does not choose which fields persist. Assumed-immutable values come from server state.

Name the classes: missing validation (CWE-20); wrong decode order (CWE-180); sink encoding skipped (CWE-116); assumed-immutable mutation (CWE-471); extra-field write including autobinding (CWE-915); shared-memory mutation including prototype-chain writes (CWE-1321); unsafe parse (CWE-502); storage path from caller.

Assessment inventories every ingress and every write to request state, memory, cache, or storage. Abstract syntax tree search lists parsers, binders, merges, and writes without a nearby schema or allowlist. A match is a candidate. Extra-field persist, type and range rejects, path-escape rejects, and hidden-field tampers are the proof. Tests that only exercise the client form, or that mock away the binder, are futile coverage.

Leave the always-on security fragment unchanged. AGENTS.md has 67 bytes of compose headroom.

Primary references added in security.md: CWE-20, CWE-915, and the OWASP Input Validation Cheat Sheet. Object-level authorization references stay.

contracts.md counts extra-field persist. engineering-audit.md pipeline notes untrusted cache keys, caller-controlled shared state, and extra-column writes. Publisher-script path checks stay out of this pass.

## Effects

Source package bumped: engineering-audit 2.9.0. Product changelog 1.18.0. Always-on security fragment and AGENTS.md unchanged at 16317 bytes.

make package for engineering-audit. make publish wrote the 2.9.0 catalog entry and artifact set; public-surface-recon restamp restored from HEAD. make install resolved engineering-audit 2.9.0 (was 2.8.0) and provisioned three skill files. make plan reported everything up to date. New artifact set is staged because check-artifacts requires tracked files. No commit, tag, remote push, or remote publication ran.

Validation commands and observed results:

- make test: exit 0; validate_skill 13 runs, 38 assertions; check_artifacts 9 runs, 37 assertions; 0 failures.
- make validate-skills: exit 0; engineering-audit reported valid.
- make package PACKAGE_DIR=packages/engineering-audit: exit 0.
- make publish: exit 0; local catalog gained engineering-audit 2.9.0.
- make install: exit 0; lockfile version 2.9.0; AGENTS.md unchanged; three provisioned skill files updated.
- make plan && make apply && make verify && make drift && make check-artifacts: exit 0; plan reported everything up to date; verify and drift emitted no findings; check-artifacts reported ok.
- cmp of security.md, contracts.md, and engineering-audit.md between packages and .agents/skills: exit 0.
- Artifact hash sha256:1181ddd9aa398ef8fd62fd0ce970196b0f5f64c568a0aec56868333ae700b6e7 matched the catalog; 14880 bytes; character_count 38128. Historical catalog versions through 2.8.0 equal HEAD.
- git diff --check && git diff --cached --check: exit 0, no diagnostics.

No executable logic changed, so no new specs. Instruction effect on model output has not been experimentally measured.

## Next

Consumers bump amkisko/engineering-audit ~> 2.9, then pray install. Tag v1.18.0 after merge to main.

## Source

Upstream: packages/engineering-audit security.md, contracts.md, engineering-audit.md; usr/docs/issues/20260914160500_authorization-assessment-guidance.md; CWE-20; CWE-915; OWASP Input Validation Cheat Sheet; OWASP ASVS 5.0 V1 and V2.

Downstream: usr/docs/changelogs/20260914172200_engineering-audit-input-and-mutation.md, CHANGELOG.md 1.18.0
