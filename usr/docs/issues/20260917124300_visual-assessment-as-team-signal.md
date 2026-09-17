# Visual assessment as a team signal

Anyone who changes a person-facing surface must name that need and record a visual assessment. That record is a team signal. Linked pictures, previews, tickets, and chat are source locators and can drift.

## Participants

Andrei Makarov.

## Decisions

Extend preferred-stack 1.5.0 with skip-or-state visual-assessment communication. Keep vendor names out. Keep product-contract and architecture work distinct from visual-surface assessment.

Do not add fetch procedures for design files or preview catalogues. Optional later: widen engineering-audit product-surface so it applies when implementing a person-facing surface, not only when asked for an audit.

## Effects

preferred-stack export names the surface, records what was assessed, and treats pictures and previews as locators. Package version 1.5.0. Catalog publish not run.

## Next

make package and make publish when cutting the catalog version. Consumers bump amkisko/preferred-stack ~> 1.5, then pray install.
