# Catalog published_at integers

## Participants

- amkisko

## Decisions

Refresh every catalog under prayers/v1/packages so published_at is an integer unix time. Keep existing numeric values. Do not rebuild same-version artifacts.

make publish from pray 1.14.0 converts timestamps for packages in Prayfile and can rewrite a same-version artifact when source drifted. Restore that artifact. Convert the three catalog packages that Prayfile does not compose (elixir-conventions, rust-conventions, getting-started) and public-surface-recon by replacing the quoted timestamp only.

## Effects

29 catalog files now store published_at as JSON numbers. engineering-audit.json was already integer from 2.8.0. Totals: 30 catalog files, 102 integer timestamps, 0 strings. Artifact hashes, signatures, and praypkg bytes are unchanged.

public-surface-recon 1.0.0 source is ahead of its published artifact. make publish rebuilt that archive (22318 to 23654 bytes) and restamped published_at to 1789392669. Restored the published 1.0.0 artifact, torrent, hash, signature, and original timestamp 1788863010 as an integer.

Validation commands and observed results:

- python inventory after conversion: 30 catalog files, 0 string published_at, 102 integer published_at
- make test: exit 0; validate_skill 13 runs, 37 assertions; check_artifacts 9 runs, 37 assertions; 0 failures
- make check-artifacts: exit 0; check-artifacts reported ok
- make verify && make drift: exit 0; both emitted no findings
- git diff --check: exit 0, no diagnostics

## Next

Consumers that parsed published_at as a string should accept a JSON number. Bump public-surface-recon when the authorization-guideline source change should ship as a new version. Tag v1.16.1 after merge to main.

## Source

Upstream: pray 1.14.0 publish output; prayers/v1/packages/amkisko
Downstream: CHANGELOG.md 1.16.1
