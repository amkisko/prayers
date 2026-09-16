# Authorization assessment guidance

Live work. Skill and fragment text is inference input: resource, trace, and boundary modes skipped because these files never become executed bytes and there is no plant.

## Participants

- amkisko

## Decisions

Expand engineering-audit security review mode so object-level authorization is a named assessment. Keep the mode in security.md. No new skill. No named scanner. No language-specific rule files.

Name the failure classes: object-level authorization (IDOR, BOLA, CWE-639); function-level authorization; property-level authorization and mass assignment; tenant isolation; object rebinding when ownership is taken from the request. A request parameter chooses a row inside an already-authorized set; it does not establish access.

Assessment has two layers. Abstract syntax tree search lists lookups that take a caller-controlled identifier without a nearby ownership predicate. A match is a candidate, not a proven bypass. Two-principal replay of the same object reference for read, write, delete, and export is the proof. Unguessable identifiers reduce enumeration; they do not authorize the row. A post-fetch comparison that still returns the row is not a closed check. Negative permission tests that mock the boundary away remain futile coverage.

Scanner product names stay in consumer overlays. The prayer names the technique class only.

Complementary threats stay in dimensions: function-level gaps; property-level exposure; server-side fetch of a user-supplied URL; injection; session and CSRF; jobs that skip captured policy; forgotten endpoints; trusting third-party payloads; unrestricted automation of a sensitive business flow. API products use OWASP API Security Top 10 the same way web products use ASVS.

Leave the always-on security fragment unchanged. AGENTS.md headroom stays for later always-on text.

Primary references in security.md: CWE-639, the OWASP IDOR prevention cheat sheet, and API1:2023.

## Effects

Source package bumped: engineering-audit 2.8.0. Product changelog 1.16.0. Always-on security fragment and AGENTS.md unchanged at 16311 bytes.

make package for engineering-audit. make publish wrote the 2.8.0 catalog entry and artifact set; unrelated catalog restamps and the public-surface-recon artifact touch were restored from HEAD. make install resolved engineering-audit 2.8.0 (was 2.7.2) and provisioned three skill files. make plan reported everything up to date. New artifact set is staged because check-artifacts requires tracked files. No commit, tag, remote push, or remote publication ran.

Validation commands and observed results:

- make test: exit 0; validate_skill 13 runs, 37 assertions; check_artifacts 9 runs, 37 assertions; 0 failures.
- make validate-skills: exit 0; engineering-audit reported valid.
- make package PACKAGE_DIR=packages/engineering-audit: exit 0.
- make publish: exit 0; local catalog gained engineering-audit 2.8.0.
- make install: exit 0; lockfile version 2.8.0; AGENTS.md unchanged; three provisioned skill files updated.
- make plan && make apply && make verify && make drift && make check-artifacts: exit 0; plan reported everything up to date; verify and drift emitted no findings; check-artifacts reported ok.
- cmp of security.md, contracts.md, and engineering-audit.md between packages and .agents/skills: exit 0.
- Artifact hash sha256:b4555da3344558724c107b438cde640c5db6e99e1d7ff515e016e9845fdf7f36 matched the catalog; 13853 bytes; character_count 35162. Historical catalog versions through 2.7.2 equal HEAD.
- git diff --check && git diff --cached --check: exit 0, no diagnostics.

No executable logic changed, so no new specs. Instruction effect on model output has not been experimentally measured.

## Next

Consumers bump amkisko/engineering-audit ~> 2.8, then pray install. Tag v1.16.0 after merge to main.

## Source

Upstream: packages/engineering-audit security.md; packages/security ownership-set fragment; usr/docs/issues/20260829223300_engineering-audit-product-modes.md; CWE-639; OWASP IDOR Prevention Cheat Sheet; OWASP API Security Top 10 2023 API1.

Downstream: usr/docs/changelogs/20260914161200_engineering-audit-object-level-authorization.md, CHANGELOG.md 1.16.0
