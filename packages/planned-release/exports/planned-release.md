## Planned release

A planned release is a named collection of work that the team intends to ship together. Without a release collection and a milestone, this contract does not apply. Do not compose this fragment for trees that never collect a payload under a shared release id.

Projects share the agreements below. Each repository records a short binding that maps roles to forge objects and owners. A host workflow or local script is an adapter. Adapters must leave evidence on the shared forge surface; they are not a private substitute for the milestone.

### Philosophical core (shared workbench)

These are process agreements that keep the release on a shared bench peers can enter, continue, and repair. They support human workshop indicators (visibility, contribution, concurrency, communication, stewardship, collective handoff, careful use of machines). They are not machine instructions copied from a human manifesto.

- Understanding: peers can talk about the current release in human language because the milestone, membership, candidate, and blockers are visible on the shared surface.
- Contribution: anyone may add or move membership before cut; unfinished work, notes, failures, and partial candidates remain useful material when they stay queryable.
- Visibility: problems, decisions, experiments, rebuilds, deferrals, and repairs stay visible on the forge. Machines may compress work; they must not hide effort, uncertainty, judgement, or recovery.
- Concurrency: people may prepare work for the same milestone at the same time. Overlap and conflicts are expected; integrity comes from shared membership and one active candidate truth, not from serial ownership of the whole release.
- Communication: every release artifact should suggest a next move (what is missing, who may cut, what superseded what, what was deferred).
- Workshop: the form of the release must survive touch by others. Prefer shared milestone and candidate request state over one operator's terminal history.
- Learning: each cut, incident, and repair increases available information; keep close reconciliation honest so the next sprint can learn.
- Stewardship: ownership is care, not possession. Anyone who can change membership or the candidate should be able to participate in cut and recovery under the binding's role rules.
- Collective juggling: nobody holds the whole release alone. Handoff and recovery stay possible because traces remain on the bench.
- Critical adoption: use scripts and bots to widen comparison and reduce repetition; treat their output as material on the bench. Slow down where understanding begins.
- Humane determinism: tools may be deterministic; people are not reduced to tools. Variation and judgement stay in membership moves, deferrals, and rebuild reasons.
- Sustainable attention: prefer contact with the real milestone and candidate over infinite planning docs that replace them.

### Cadence and week numbering (essential agreement)

- Default team cadence is a two-week sprint.
- Each planned release has one milestone whose title is the release id.
- Release id uses ISO week numbering: `YYYYwNN` (four-digit ISO week-year, lowercase `w`, ISO week number). Example: `2026w38`.
- For a two-week sprint, the milestone title is the last ISO week of that sprint. A sprint spanning `2026w37` and `2026w38` uses milestone `2026w38`.
- Named pack ids (`2026-august-pack`) are allowed only as an explicit exception in the binding, with owner and review date. They do not replace the week agreement for ordinary sprints.
- Open a milestone when the sprint's release collection starts. Close it when every member is shipped, deferred to another milestone, or removed with a recorded reason. A milestone with zero open members left open is dishonest shared state.

### Release collection and milestone (essential agreement)

- Release collection is the ongoing assignment of work changes into the current milestone. That collection is the payload.
- The milestone is the shared container for the payload. Membership is the set of issues and change requests attached to that milestone (or the forge-equivalent the binding names as milestone).
- A branch name is not membership. Tracker status alone is not membership unless the binding equates it to the same milestone predicate peers can query on the forge.
- Collect into the milestone before cut. Cutting without a milestone and without a collected payload is out of contract.
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
- binding - project map from these roles to local objects, checks, and owners.

### Invariants

- one release id and one milestone identify one intended payload;
- membership is explicit and queryable on the milestone; without release collection and milestone, stop;
- at most one active candidate truth exists per release id;
- replacing a candidate records which request it supersedes and why on the forge;
- cut and publish stay distinct observations unless the binding makes them the same event;
- a release closes only after milestone reconciliation has no unexplained members;
- every transition leaves queryable evidence on the shared forge surface; private chat does not replace missing forge evidence;
- recovery uses the ordinary defined path when possible; a hidden manual repair is process debt;
- a local script or bot belongs on the shared bench only when a second operator can reconstruct milestone membership, active candidate, supersession, cut, and close disposition from forge state without that operator's machine.

### Lifecycle

1. Planned - sprint milestone exists with release id `YYYYwNN`;
2. Collecting - work changes are assigned into the milestone (release collection);
3. Assembling - optional candidate is built from collected members;
4. Ready - payload snapshot and required checks are known for a named source revision;
5. Cut - accepted source revision or artifact set is recorded;
6. Published - destination reports the released revision or artifacts;
7. Closed - milestone reconciliation has no unexplained members; milestone is closed or every leftover is deferred to another milestone with evidence.

Cancelled and superseded are terminal outcomes with a replacement id or reason. A later artifact does not prove an earlier readiness check.

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
- role owners for membership, cut, publish, and contract maintenance;
- retained evidence and measurement source;
- deliberate exceptions with reason, owner, and review date.

Coordinated product release across repositories: one parent release id still uses week numbering; each child repository keeps its own milestone and cut; the parent pins exact child revisions or immutable artifacts. Do not pretend one branch is the commit point for several repositories.

### Naming collision

Literature "trunk" often means the stable line. House `trunk/<release-id>` means the candidate for that milestone. Speak in roles in shared guidance; bind prefixes with `branch-naming`.

### Health signals

Keep series separate; compare a project to its own baseline.

- process integrity: members on milestone but not on candidate (and the reverse) at readiness; unexplained members at close; open milestones with zero open members; candidate rebuild count with reason; failed cut attempts; manual steps and operator active time; cut-to-publish elapsed time when separate;
- delivery outcomes when the product ships: change lead time, deployment frequency, failed deployment recovery time, change fail rate, deployment rework rate;
- adoption: time to open and close a sprint milestone honestly; local exceptions and expired exceptions; validator usefulness; whether a second operator can continue from forge state alone.

Verify before shared enforcement: replay representative past releases including a normal cut, a rebuilt candidate, and deferred members; first validators report only; promote a check only after it is deterministic in at least two bindings.

Related: `branch-naming` owns branch prefixes; `finite-state-machines` owns lifecycle modeling; `changelog-update` and `writing-prose` own release notes voice; `delivery-budgets` owns ship-path size and timing gates; `publish-checks` owns review hygiene before publish; `collaboration-workflow` owns where durable process notes live.
