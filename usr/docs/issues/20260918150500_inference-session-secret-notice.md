# Inference session secret notice

When a live secret, credential, or confidential trace is already in the session, prevention rules cannot fire. The inference provider has already seen it. The agent must notice that as a security event, tell the person, and stop sending the value to another third party.

## Participants

Andrei Makarov.

## Decisions

Add the session notice to amkisko/security 1.3.0. Keep rotate on the existing exposure bullet. Do not quote values. Do not add a detector skill.

Point amkisko/writing-prose 3.5.1 Related text at that notice. Signed public comments stay writing-prose. Session ingress stays security.

community-security keeps the human keep-out-of-prompts line. Do not duplicate the agent notice into SECURITY.md in this pass.

No product screen changed. Visual-surface assessment skipped.

## Effects

Source packages security 1.3.0 and writing-prose 3.5.1. Consumer README example pin for security moves to ~> 1.3. writing-prose remains ~> 3.5. Local catalog gained both versions. Artifact hashes sha256:d055cbe9b5067b3afbf2c0dbb35dd3fc623c6ef85085b06f5a6bf66ad69b498a (security 1.3.0) and sha256:5168ced198d16106d8097020d4c427e2800fd8d2c0df791c8d4889a904640eae (writing-prose 3.5.1). Unrelated public-surface-recon restamp from make publish was restored from HEAD. pray 1.18.0 did not emit torrent files beside the new artifacts.

security fragment is 2,045 bytes, 3 under the 2 KiB skill line. writing-prose fragment is 1,989 bytes. AGENTS.md is 17,995 bytes, 1,611 over the 16 KiB house line.

Validation commands and observed results:

- make package PACKAGE_DIR=packages/security: exit 0
- make package PACKAGE_DIR=packages/writing-prose: exit 0
- make publish: exit 0; security.json gained 1.3.0; writing-prose.json gained 3.5.1
- make install: exit 0; security 1.3.0 and writing-prose 3.5.1 from path; Prayfile.lock and AGENTS.md updated
- make apply: exit 0; everything up to date
- make test: exit 0; validate_skill 13 runs, 39 assertions; check_artifacts 9 runs, 37 assertions; 0 failures
- make plan: exit 0; 29 packages, everything up to date
- make verify && make drift && make check-artifacts: exit 0; check-artifacts reported ok after git add of the new artifacts
- git diff --check && git diff --cached --check: exit 0, no diagnostics
- wc -c packages/security/exports/security.md: 2,045 bytes
- wc -c packages/writing-prose/exports/writing-prose.md: 1,989 bytes
- wc -c AGENTS.md: 17,995 bytes
- Artifact hashes matched the catalog

No executable logic changed, so no new specs.

## Next

Consumers bump amkisko/security ~> 1.3, then pray install. writing-prose ~> 3.5 already admits 3.5.1. Tag v1.20.0 after merge to main. Later: shorten composed always-on fragments so AGENTS.md returns under 16 KiB.

## Source

usr/docs/issues/20260918150000_signed-comment-prose.md
packages/community-security/exports/SECURITY.md
packages/public-surface-recon/skills/public-surface-recon/public-surface-recon.md
