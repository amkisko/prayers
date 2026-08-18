# Boundary and control mode in shared audit prayers

## Participants

- amkisko

## Decisions

Engineering-audit stays one skill. Boundary and control questions live there as an optional mode, not as a new package. Skip extra forms and numeric safety ratings unless asked. Skip the mode for a library with no IO.

Io-simulation lists the injectable plant faults that correspond to those interface deviations. Finite-state-machines names digital reported state and physical process state when they can diverge.

House names stay generic: unlock, occupancy listing, partner identity, sample at the station.

## Effects

- packages/engineering-audit 2.1.0
- packages/io-simulation 1.1.0
- packages/finite-state-machines 1.1.0
- CHANGELOG.md 1.6.0
- README.md catalog summaries
- prayers/v1 artifacts for those three versions
- AGENTS.md and .agents/skills/engineering-audit after make apply

Validation: make publish, make apply, make verify, make drift. All exited 0. AGENTS.md is 15478 bytes. io-simulation fragment is 1185 bytes. finite-state-machines fragment is 888 bytes. engineering-audit skill body is 6502 bytes.

Later pass: restored published_at on 19 unchanged catalog files after make publish restamped them. CHANGELOG.md Unreleased now names the full io-simulation fault list. make check-artifacts requires each catalog artifact path to exist and be git-tracked. Rewrote engineering-audit boundary mode in house names and rebuilt 2.1.0. Cut CHANGELOG.md 1.6.0.

## Next

Consumers bump engineering-audit to ~> 2.1, io-simulation to ~> 1.1, and finite-state-machines to ~> 1.1, then pray install.

## Source

- Upstream: packages/engineering-audit, packages/io-simulation, packages/finite-state-machines
- Downstream: CHANGELOG.md 1.6.0, README.md catalog
