# Security inference session notice

## Participants

Andrei Makarov.

## Decisions

security 1.3.0 adds a session notice when a live secret, credential, or confidential trace appears in inference. Tell the person. Do not quote the value. Do not send it to another third party. writing-prose 3.5.1 points Related text at that notice.

## Effects

packages/security version 1.3.0. packages/writing-prose version 3.5.1. Consumer README example security constraint moves to ~> 1.3.

make package wrote root scratch archives, later removed by make clean. make publish wrote prayers/v1/packages/amkisko/security.json 1.3.0, prayers/v1/artifacts/amkisko/security/1.3.0/amkisko-security-1.3.0.praypkg, writing-prose.json 3.5.1, and prayers/v1/artifacts/amkisko/writing-prose/3.5.1/amkisko-writing-prose-3.5.1.praypkg. public-surface-recon catalog and artifact files were restored from HEAD. pray 1.18.0 did not emit torrent files beside the new artifacts. Historical security version objects through 1.2.0 and writing-prose through 3.5.0 equal HEAD for those version rows.

security fragment 2,045 bytes. writing-prose fragment 1,989 bytes. AGENTS.md 17,995 bytes after make apply, 1,611 over the 16 KiB house line.

Validation commands and observed results:

- make test: exit 0; validate_skill 13 runs, 39 assertions; check_artifacts 9 runs, 37 assertions; 0 failures
- make apply: exit 0; security 1.3.0 and writing-prose 3.5.1 from path; AGENTS.md updated
- make plan: exit 0; 29 packages, everything up to date
- make publish: exit 0; both versions in the local catalog
- make verify && make drift && make check-artifacts: exit 0; check-artifacts reported ok after git add of the new artifacts
- git diff --check && git diff --cached --check: exit 0, no diagnostics
- Artifact hashes sha256:d055cbe9b5067b3afbf2c0dbb35dd3fc623c6ef85085b06f5a6bf66ad69b498a and sha256:5168ced198d16106d8097020d4c427e2800fd8d2c0df791c8d4889a904640eae matched the catalog

Did not rerun make publish after restoring catalogs.

## Next

Consumers bump amkisko/security ~> 1.3, then pray install. writing-prose ~> 3.5 already admits 3.5.1. Tag v1.20.0 after merge to main. Later: shorten composed always-on fragments so AGENTS.md returns under 16 KiB.

## Source

usr/docs/issues/20260918150500_inference-session-secret-notice.md
