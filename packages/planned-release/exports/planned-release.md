## Planned release

A planned release is a named collection of work the team intends to ship together. Compose this fragment only when that work is collected under a shared release id and milestone.

Projects share the agreements below. Each repository records a short binding that maps roles to forge objects and owners. A host workflow or local script is an adapter. Adapters must leave evidence on the shared forge surface that peers can query without the adapter's private machine.

### Cadence and week numbering

- Default team cadence is a two-week sprint. The ISO week is the atomic calendar unit.
- Each planned release has one milestone whose title is the release id.
- Release id uses ISO week numbering: `YYYYwNN` (four-digit ISO week-year, lowercase `w`, ISO week number). Example: `2026w38`.
- For a two-week sprint, the milestone title is the last ISO week of that sprint. A sprint spanning `2026w37` and `2026w38` uses milestone `2026w38`.
- Named pack ids (`2026-august-pack`) need an explicit binding exception with owner and review date. Ordinary sprints keep the week agreement.
- Open a milestone when the sprint's release collection starts. Close it when every member is shipped, deferred to another milestone, or removed with a recorded reason. Close a milestone that has zero open members.

### Release collection and milestone

- Release collection is the ongoing assignment of work changes into the current milestone. That collection is the payload.
- The collection period runs from milestone open to cut, or to close when there is no cut.
- The milestone is the shared container for the payload. Membership is the milestone attachment set the binding names (issues and change requests, or the forge-equivalent). A branch name or tracker status counts only when the binding equates it to that same forge-queryable predicate.
- Collect into the milestone before cut. Cut requires a milestone and a collected payload.
- Moving a member between milestones is a visible membership decision. Silent omission from the candidate while leaving the item on the milestone is payload drift.

### Vocabulary

- release id - the milestone title (`YYYYwNN` under the week agreement);
- milestone - the shared release-collection container for that id;
- payload - membership of that milestone at a named moment;
- stable line - the long-lived default integration branch;
- work change - a short-lived change headed toward the stable line and, when in scope, collected into the milestone;
- candidate - short-lived assembly of the collected payload before cut (usually `trunk/<release-id>` when using house branch naming);
- candidate request - the reviewable proposal of the candidate into the stable line;
- receipt - evidence that a work change is on the active candidate;
- cut - accept the candidate (or an agreed revision of the collected payload) as the release source;
- publish - deliver that source to a destination; may equal cut only when the binding says so;
- binding - project map from these roles to local objects, checks, and owners;
- sample - one observation of a named process signal for one release id.

### Invariants

- one release id and one milestone identify one intended payload;
- membership is explicit and queryable on the milestone; release collection and milestone are required;
- at most one active candidate truth exists per release id;
- replacing a candidate records which request it supersedes and why on the forge;
- cut and publish stay distinct observations unless the binding makes them the same event;
- a release closes only after milestone reconciliation has no unexplained members;
- every transition leaves queryable evidence on the shared forge surface;
- recovery uses the ordinary defined path and records forge evidence;
- a local script or bot is allowed only when a second operator can reconstruct milestone membership, active candidate, supersession, cut, and close disposition from forge state without that operator's machine.

### Lifecycle

1. Planned - sprint milestone exists with release id `YYYYwNN`;
2. Collecting - work changes are assigned into the milestone (release collection);
3. Assembling - optional candidate is built from collected members;
4. Ready - payload snapshot and required checks are known for a named source revision;
5. Cut - accepted source revision or artifact set is recorded;
6. Published - destination reports the released revision or artifacts;
7. Closed - milestone reconciliation has no unexplained members; milestone is closed or every leftover is deferred to another milestone with evidence.

Cancelled and superseded are terminal lifecycle outcomes with a replacement id or reason. Ready requires checks recorded for the named source revision.

### Binding requirements

Record in the consumer repository (defaults above stay unless an exception is explicit):

- confirmation of two-week sprint and `YYYYwNN` milestone titles, or a dated exception;
- stable line and work-change base;
- forge object used as milestone and the exact membership predicate;
- candidate policy: batch, incremental, or merge queue (always from the collected milestone payload);
- candidate identity (typically `trunk/<release-id>`) and receipt source;
- readiness checks and the source revision they certify;
- cut event and evidence;
- publish event, destination, and evidence;
- deferral, rebuild, cancellation, recovery, and rollback rules;
- role owners for membership, cut, publish, contract maintenance, and baseline updates;
- measurement tool or script, retained sample store, and forge query per named signal below;
- project baseline file or locator and the ceiling rule per duration and gated counter;
- deliberate exceptions with reason, owner, and review date.

Coordinated product release across repositories: one parent release id still uses week numbering; each child repository keeps its own milestone and cut; the parent pins exact child revisions or immutable artifacts.

### Naming collision

Literature "trunk" means the stable line. House `trunk/<release-id>` means the candidate for that milestone. Speak in roles in shared guidance; bind prefixes with `branch-naming`.

### Process signals

Measure forge state for one release id. Keep each named signal as its own series. Compare a project only to its own baseline.

Signal kinds:

- predicate - true or false for this release id at a named moment;
- counter - non-negative integer from membership or candidate history;
- duration - elapsed time between two forge-recorded events;
- drill - pass or fail when a second-operator reconstruction is exercised.

Every sample records: release id; repository or binding name; signal name; signal kind; observed value; observation time; forge query or evidence locator the binding names.

Audit disposition for a named release id or check:

- pass - predicate true; or duration or gated counter at or under the project baseline ceiling; or drill pass;
- fail - predicate false; or duration or gated counter above the ceiling when no dated exception covers that deviation;
- process debt - close or recovery used a path outside the binding's ordinary forge evidence;
- dated exception - recorded exception with owner and review date covers the deviation through that date.

Named predicates (absolute; fail when false):

- sprint week identity - release id equals the last ISO week of the intended two-week sprint;
- close clean - unexplained members at close equals zero;
- milestone honesty - count of open milestones with zero open members equals zero;
- exception hygiene - count of dated exceptions past their review date equals zero.

Named durations (gate against the project baseline ceiling):

- collection period - milestone open to cut, or open to close when there is no cut;
- cut-to-publish - elapsed time when cut and publish are separate events.

Named counters:

- payload size at cut - observation for trend (informational series);
- deferred or removed with reason at close - observation for trend (informational series);
- payload drift at readiness - milestone-only member count and candidate-only member count; gate each against the project baseline ceiling;
- candidate supersession count per release id - gate against the project baseline ceiling;
- failed cut attempts with recorded reason - gate against the project baseline ceiling.

Named drill:

- second-operator reconstruction of membership, active candidate, supersession, cut, and close disposition from forge state alone; record pass or fail when exercised.

Baseline and enforcement:

1. Binding names the forge queries and the tool or script that emits samples.
2. Collect report-only samples across at least two completed sprint releases on that binding.
3. Write the project baseline from those samples: absolute predicates as above; durations and gated counters get a ceiling the binding records (median of the seed samples is the default starting ceiling unless the binding states another rule).
4. Report-only validators emit audit disposition against that baseline.
5. Promote a check to shared enforcement after the same check is deterministic on at least two bindings.
6. Intentional process change updates the baseline in the same change that updates the binding.

After implementation, an auditor can replay forge state for a release id, recompute each named signal, compare to the binding baseline, and record one audit disposition per check. Replay fixtures: a normal cut, a rebuilt candidate, and deferred members.

Related: `branch-naming` owns branch prefixes; `finite-state-machines` owns lifecycle modeling; `changelog-update` and `writing-prose` own release notes voice; `delivery-budgets` owns ship-path size and timing gates; `publish-checks` owns review hygiene before publish; `collaboration-workflow` owns where durable process notes live; `engineering-audit` reviews process integrity when auditing a release path.
