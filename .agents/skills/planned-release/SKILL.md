---
name: planned-release
description: >-
  Agree, collect, prepare, deliver, and measure a planned release under a
  shared milestone. Use when writing or updating a project binding, opening or
  closing a sprint milestone, assigning work into a release collection,
  assembling a candidate, preparing (cutting) or delivering (publishing) a
  release, measuring process signals, setting baseline ceilings, or auditing
  one release id against forge state. Do not use for trees without milestone
  collection.
---

# Planned release

The compose fragment states the concept: team commitment, collection period, period label, and the agreed prepare and delivery calendar events. This skill owns the defaults, vocabulary, invariants, binding, lifecycle procedure, and process-signal measurement.

## Quick reference

```text
confirm cadence and label -> record binding -> open milestone -> collect -> assemble candidate (optional) -> ready checks -> prepare (cut) -> deliver (publish) -> close -> sample signals against baseline
```

Read `references/process-signals.md` in this skill directory when measuring forge state, writing a baseline, or assigning audit disposition for a release id.

## When to use

- writing or revising the project binding;
- opening, collecting into, or closing a sprint milestone;
- assembling, superseding, preparing, or delivering a candidate;
- measuring named process signals or promoting a check past report-only;
- auditing one release id by replaying forge state.

Skip when the tree has no milestone collection. The compose fragment alone is enough only when the agent needs the four concept bullets and already knows the skill defaults.

## Cadence and period label

- Default team cadence is a two-week sprint. The ISO week is the atomic calendar unit.
- Each planned release has one milestone whose title is the release id.
- Release id uses ISO week numbering: `YYYYwNN` (four-digit ISO week-year, lowercase `w`, ISO week number). Example: `2026w38`.
- For a two-week sprint, the milestone title is the last ISO week of that sprint. A sprint spanning `2026w37` and `2026w38` uses milestone `2026w38`.
- Named pack ids (`2026-august-pack`) need an explicit binding exception with owner and review date. Ordinary sprints keep the week agreement.
- Open a milestone when the sprint's release collection starts. Close it when every member is shipped, deferred to another milestone, or removed with a recorded reason. Close a milestone that has zero open members.

## Release collection and milestone

- Release collection is the ongoing assignment of work changes into the current milestone. That collection is the payload.
- The collection period runs from milestone open to prepare (cut), or to close when there is no cut.
- The milestone is the shared container for the payload. Membership is the milestone attachment set the binding names (issues and change requests, or the forge-equivalent). A branch name or tracker status counts only when the binding equates it to that same forge-queryable predicate.
- Collect into the milestone before prepare. Prepare (cut) requires a milestone and a collected payload.
- Moving a member between milestones is a visible membership decision. Silent omission from the candidate while leaving the item on the milestone is payload drift.

## Vocabulary

- release id - the milestone title (`YYYYwNN` under the week agreement);
- milestone - the shared release-collection container for that id;
- payload - membership of that milestone at a named moment;
- stable line - the long-lived default integration branch;
- work change - a short-lived change headed toward the stable line and, when in scope, collected into the milestone;
- candidate - short-lived assembly of the collected payload before prepare (usually `trunk/<release-id>` when using house branch naming);
- candidate request - the reviewable proposal of the candidate into the stable line;
- receipt - evidence that a work change is on the active candidate;
- prepare / cut - accept the candidate (or an agreed revision of the collected payload) as the release source;
- deliver / publish - deliver that source to a destination; may equal prepare only when the binding says so;
- binding - project map from these roles to local objects, checks, and owners;
- sample - one observation of a named process signal for one release id.

Speak prepare and deliver in shared guidance when talking about the calendar event. Keep cut and publish as the forge observation names the binding records.

## Invariants

- one release id and one milestone identify one intended payload;
- membership is explicit and queryable on the milestone; release collection and milestone are required;
- at most one active candidate truth exists per release id;
- replacing a candidate records which request it supersedes and why on the forge;
- prepare and deliver stay distinct observations unless the binding makes them the same event;
- a release closes only after milestone reconciliation has no unexplained members;
- every transition leaves queryable evidence on the shared forge surface;
- recovery uses the ordinary defined path and records forge evidence;
- a local script or bot is allowed only when a second operator can reconstruct milestone membership, active candidate, supersession, prepare, and close disposition from forge state without that operator's machine.

Adapters (host workflows or local scripts) must leave evidence on the shared forge surface that peers can query without the adapter's private machine.

## Naming collision

Literature "trunk" means the stable line. House `trunk/<release-id>` means the candidate for that milestone. Speak in roles in shared guidance; bind prefixes with `branch-naming`.

## Binding

Record in the consumer repository (defaults above stay unless an exception is explicit):

- confirmation of two-week sprint and `YYYYwNN` milestone titles, or a dated exception;
- stable line and work-change base;
- forge object used as milestone and the exact membership predicate;
- candidate policy: batch, incremental, or merge queue (always from the collected milestone payload);
- candidate identity (typically `trunk/<release-id>`) and receipt source;
- readiness checks and the source revision they certify;
- prepare (cut) event and evidence;
- deliver (publish) event, destination, and evidence;
- the agreed calendar moments for prepare and deliver (may be the same instant only when recorded as one event);
- deferral, rebuild, cancellation, recovery, and rollback rules;
- role owners for membership, prepare, deliver, contract maintenance, and baseline updates;
- measurement tool or script, retained sample store, and forge query per named signal;
- project baseline file or locator and the ceiling rule per duration and gated counter;
- deliberate exceptions with reason, owner, and review date.

Coordinated product release across repositories: one parent release id still uses week numbering; each child repository keeps its own milestone and prepare; the parent pins exact child revisions or immutable artifacts.

Keep forge product names, reviewer lists, and workflow clickpaths in the binding. Concept bullets stay in the fragment; defaults and procedures stay here.

## Lifecycle procedure

1. Planned - open the sprint milestone with release id `YYYYwNN`.
2. Collecting - assign work changes into the milestone (release collection).
3. Assembling - optionally build a candidate from collected members; keep at most one active candidate truth per release id.
4. Ready - record the payload snapshot and required checks for a named source revision.
5. Prepared (cut) - record the accepted source revision or artifact set.
6. Delivered (published) - confirm the destination reports the released revision or artifacts.
7. Closed - reconcile the milestone so no members are unexplained; close it, or defer every leftover to another milestone with evidence.

Cancelled and superseded are terminal outcomes with a replacement id or reason. Ready requires checks recorded for the named source revision. Replacing a candidate records which request it supersedes and why on the forge.

## Process signals

Measure forge state for one release id. Keep each named signal as its own series. Compare a project only to its own baseline. Full signal kinds, sample identity, named predicates, durations, counters, drill, audit disposition, and baseline enforcement live in `references/process-signals.md`.

Replay validators and shared enforcement wait until two bindings share a deterministic check. Until then, keep validators report-only when the binding names them.

## Routing

- `branch-naming` for candidate and work-change prefixes.
- `changelog-update` and `writing-prose` for release notes voice.
- `delivery-budgets` for ship-path size and timing gates.
- `publish-checks` for review hygiene before deliver.
- `engineering-audit` when the finding is process integrity on a release path.
- `collaboration-workflow` for where durable process notes live.
- `session-review` when the finding is repeated agent work around releases.

When a named skill is unavailable, preserve the finding and name the deeper review. Do not invent the missing skill's procedure.
