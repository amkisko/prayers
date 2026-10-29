# Process signals

Measure forge state for one release id. Keep each named signal as its own series. Compare a project only to its own baseline.

## Signal kinds

- predicate - true or false for this release id at a named moment;
- counter - non-negative integer from membership or candidate history;
- duration - elapsed time between two forge-recorded events;
- drill - pass or fail when a second-operator reconstruction is exercised.

Every sample records: release id; repository or binding name; signal name; signal kind; observed value; observation time; forge query or evidence locator the binding names.

## Audit disposition

For a named release id or check:

- pass - predicate true; or duration or gated counter at or under the project baseline ceiling; or drill pass;
- fail - predicate false; or duration or gated counter above the ceiling when no dated exception covers that deviation;
- process debt - close or recovery used a path outside the binding's ordinary forge evidence;
- dated exception - recorded exception with owner and review date covers the deviation through that date.

## Named predicates

Absolute; fail when false:

- sprint week identity - release id equals the last ISO week of the intended two-week sprint;
- close clean - unexplained members at close equals zero;
- milestone honesty - count of open milestones with zero open members equals zero;
- exception hygiene - count of dated exceptions past their review date equals zero.

## Named durations

Gate against the project baseline ceiling:

- collection period - milestone open to prepare (cut), or open to close when there is no cut;
- prepare-to-deliver - elapsed time when prepare (cut) and deliver (publish) are separate events.

## Named counters

- payload size at cut - observation for trend (informational series);
- deferred or removed with reason at close - observation for trend (informational series);
- payload drift at readiness - milestone-only member count and candidate-only member count; gate each against the project baseline ceiling;
- candidate supersession count per release id - gate against the project baseline ceiling;
- failed prepare (cut) attempts with recorded reason - gate against the project baseline ceiling.

## Named drill

Second-operator reconstruction of membership, active candidate, supersession, prepare (cut), and close disposition from forge state alone; record pass or fail when exercised.

## Baseline and enforcement

1. Binding names the forge queries and the tool or script that emits samples.
2. Collect report-only samples across at least two completed sprint releases on that binding.
3. Write the project baseline from those samples: absolute predicates as above; durations and gated counters get a ceiling the binding records (median of the seed samples is the default starting ceiling unless the binding states another rule).
4. Report-only validators emit audit disposition against that baseline.
5. Promote a check to shared enforcement after the same check is deterministic on at least two bindings.
6. Intentional process change updates the baseline in the same change that updates the binding.

After implementation, an auditor can replay forge state for a release id, recompute each named signal, compare to the binding baseline, and record one audit disposition per check. Replay fixtures: a normal prepare, a rebuilt candidate, and deferred members.
