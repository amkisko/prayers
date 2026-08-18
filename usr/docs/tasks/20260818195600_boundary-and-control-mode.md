# Boundary and control mode in shared audit prayers

## Participants

- amkisko

## Decisions

Patch the three existing packages. Do not add a separate control-analysis package. Do not compose the new text into AGENTS.md; it stays in the engineering-audit skill and in the two fragments that already sit in compose.

## Effects

Source files bumped. make publish wrote v1 artifacts. make apply updated AGENTS.md and .agents/skills/engineering-audit. make verify and make drift exited 0. AGENTS.md is 15478 bytes.

Later pass: restored timestamp-only catalog JSON, named io-simulation faults in CHANGELOG.md, added make check-artifacts. Rewrote engineering-audit boundary mode in house names and rebuilt 2.1.0. Cut CHANGELOG.md 1.6.0.

## Next

Consumers bump engineering-audit to ~> 2.1, io-simulation to ~> 1.1, and finite-state-machines to ~> 1.1, then pray install.

## Source

- Upstream: usr/docs/changelogs/20260818195600_boundary-and-control-mode.md
- Downstream: packages/engineering-audit 2.1.0, packages/io-simulation 1.1.0, packages/finite-state-machines 1.1.0
