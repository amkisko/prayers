# Signed comment prose

Public issue and pull request comments are speech under the account holder's name. Existing always-on fragments covered usr/docs, changelogs, live-work records, product surfaces, and secrets in issues. They did not cover that signed public register.

## Participants

Andrei Makarov.

## Decisions

Add signed-comment rules to amkisko/writing-prose 3.5.0. Do not add a package. Do not add a named section. Keep the existing bullet height.

A public comment cites only what a stranger can open and check. Confidential traces, unique working locators, and unverifiable session evidence stay in chat. Source material that is not already public stays off the ticket. Source material is not posted without the person's consent. Secrets in issues stay amkisko/security.

Speak as the account holder to the named person. Greeting, short body, close, and the name from the tracker identity. First person when that person did the work. One primary public commit, pull request, or release link. Comment when asked to comment. Do not close, assign, or reopen unless asked.

No product screen changed. Visual-surface assessment skipped.

## Effects

Source package writing-prose 3.5.0. Consumer README example pin moves to ~> 3.5. Local catalog gained version 3.5.0. Artifact hash sha256:e60d477ab292acd8e98cc0244a44b9f086b14ee75cec400eed83552f8fd3f4e6. Unrelated public-surface-recon restamp from make publish was restored from HEAD. pray 1.18.0 did not emit a torrent file beside the new artifact.

Fragment is 1,919 bytes, under the 2 KiB skill line. AGENTS.md is 17,671 bytes, 1,287 over the 16 KiB house line. It was already over before this pass.

Validation commands and observed results:

- make package PACKAGE_DIR=packages/writing-prose: exit 0
- make publish: exit 0; writing-prose.json gained 3.5.0
- make install: exit 0; writing-prose 3.5.0 from path; Prayfile.lock and AGENTS.md updated
- make apply: exit 0; everything up to date
- make test: exit 0; validate_skill 13 runs, 39 assertions; check_artifacts 9 runs, 37 assertions; 0 failures
- make plan: exit 0; 29 packages, everything up to date
- make verify && make drift && make check-artifacts: exit 0; check-artifacts reported ok after git add of the new artifact
- git diff --check && git diff --cached --check: exit 0, no diagnostics
- wc -c packages/writing-prose/exports/writing-prose.md: 1,919 bytes
- wc -c AGENTS.md: 17,671 bytes
- Artifact 1,631 bytes; hash matched the catalog

No executable logic changed, so no new specs.

## Next

Consumers bump amkisko/writing-prose ~> 3.5, then pray install. Tag v1.20.0 after merge to main. Later: shorten composed always-on fragments so AGENTS.md returns under 16 KiB.
