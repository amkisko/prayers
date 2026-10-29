# Planned release process signals

Session corrections and engineering gaps while drafting `amkisko/planned-release` 1.0.0. Findings drove fragment edits in the same workstream; skills and rules unchanged.

## Participants

Andrei Makarov (@amkisko)

## Decisions

Scope: this project's live planned-release draft chat and the resulting package files under `packages/planned-release/`, plus the issue `docs/issues/20261029093247_planned-release-prayer.md`. Coverage: successive user corrections in one continuous workstream (prose trim, measurability, empty-contrast sweep, then audit/benchmark clarity). Previous review window: `docs/reviews/20261008102520_session-review.md` (release choreography and prose-formatting patterns).

Confirmed corrections in this workstream:

1. Manifesto and workshop philosophy lines removed; process text kept to forge-visible agreements.
2. Empty contrasts rewritten to positive rules (`X, not Y` labels, private-chat substitute lines, membership-by-negation).
3. Health/DORA language dropped; remaining signals must answer from forge state.
4. Engineering gap: signals were named without sample identity, audit disposition, or baseline recipe; auditors could not recompute pass/fail after implementation.

## Effects

Fragment `Process signals` now states signal kinds, required sample fields, audit disposition values, named predicates/durations/counters/drill, and a six-step baseline-to-enforcement path. Binding requirements name measurement tool, sample store, baseline locator, and ceiling rules. Issue and README aligned. Membership definition de-duplicated.

## Next

1. Consumer binding from the originating product tree names queries, sample store, and ceilings.
2. After two bindings share a deterministic check, add report-only replay validator (still deferred from 1.0.0 package contents).
3. Optional `pray confess amkisko/planned-release` after the first consumer cut.

## Source

Upstream: writing-prose, session-review, engineering-audit (observability and evidence-first disposition). Downstream: `packages/planned-release/`, `docs/issues/20261029093247_planned-release-prayer.md`.
