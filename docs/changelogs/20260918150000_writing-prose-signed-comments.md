# Writing-prose signed comments

## Participants

Andrei Makarov.

## Decisions

writing-prose 3.5.0 adds signed-comment rules for speech posted under the account holder on a public tracker. Cite only public checkable locators. Do not expose non-public source material. Do not post source material without consent.

## Effects

packages/writing-prose version 3.5.0. Export bullets cover audience, cite bar, greeting and agency, one primary link, and ticket-state scope. Consumer README example constraint moves to ~> 3.5.

make package wrote a root scratch archive, later removed by make clean. make publish wrote prayers/v1/packages/amkisko/writing-prose.json 3.5.0 and prayers/v1/artifacts/amkisko/writing-prose/3.5.0/amkisko-writing-prose-3.5.0.praypkg. public-surface-recon catalog and artifact files were restored from HEAD. pray 1.18.0 did not emit a torrent file beside the new artifact. Historical writing-prose version objects through 3.4.0 equal HEAD.

Fragment 1,919 bytes. AGENTS.md 17,671 bytes after make apply, 1,287 over the 16 KiB house line.

Validation commands and observed results:

- make test: exit 0; validate_skill 13 runs, 39 assertions; check_artifacts 9 runs, 37 assertions; 0 failures
- make apply: exit 0; writing-prose 3.5.0 from path; AGENTS.md updated
- make plan: exit 0; 29 packages, everything up to date
- make publish: exit 0; writing-prose 3.5.0 in the local catalog
- make verify && make drift && make check-artifacts: exit 0; check-artifacts reported ok after git add of the new artifact
- git diff --check && git diff --cached --check: exit 0, no diagnostics
- Artifact hash sha256:e60d477ab292acd8e98cc0244a44b9f086b14ee75cec400eed83552f8fd3f4e6 matched the catalog; 1,631 bytes

Did not rerun make publish after restoring catalogs.

## Next

Consumers bump amkisko/writing-prose ~> 3.5, then pray install. Tag v1.20.0 after merge to main. Later: shorten composed always-on fragments so AGENTS.md returns under 16 KiB.

## Source

usr/docs/issues/20260918150000_signed-comment-prose.md
