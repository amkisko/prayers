# Missing package routing

## Participants

Andrei Makarov (@amkisko)

## Decisions

When an operator asks for a job that a distributed amkisko prayer already
owns, the agent must check whether that package is declared in the current
repository before inventing a local procedure.

Consumer Prayfiles deliberately omit tree-only skills (compose budget).
Catalog coverage therefore often exists upstream while `.agents/skills` and
AGENTS.md in this checkout do not mention the package. Agents then answer
from general knowledge (for example a session summary without ranked
tooling recommendations) instead of installing `amkisko/session-review`.

Do not compose the full package catalog into AGENTS.md. Keep a short
always-on pointer and put the lookup steps in on-demand material.

Proposed package changes:

1. `amkisko/collaboration-workflow` (fragment bump): add a stop-gate bullet.
   Before inventing project process for a named job (session retrospective,
   CI retrospective, diff review, engineering audit, convention encoding,
   and peers listed in the distribution README catalog), compare the ask to
   declared packages in this repository's Prayfile and provisioned
   `.agents/skills`. If a matching amkisko package exists in the
   distribution but is not declared here, propose the compose or tree line
   and `pray install` / `pray apply`; do not treat a homemade substitute as
   the package procedure.

2. `amkisko/getting-started` (fragment bump): add a short lookup section.
   How to list what this repo already declares (`pray list`, Prayfile,
   `.agents/skills`). How to see what the distribution offers (README
   Package catalog; source index under the amkisko git source). How to add
   a missing tree-only skill versus an always-on fragment. Remind that
   `getting-started` itself stays out of compose.

3. `amkisko/session-review`, `amkisko/ci-review`, and
   `amkisko/change-review` (skill bumps): extend Routing. When this skill
   owns the operator ask but is not provisioned locally, name
   `amkisko/<package>`, show the recommended Prayfile `tree` line from the
   consumer README example, and offer install before continuing. Keep the
   existing line: do not invent the missing skill's procedure.

Out of scope for this issue: a new package; embedding the full catalog in
always-on AGENTS.md; auto-mutating Prayfile without operator approval.

Cross-repository hygiene (trigger for this note's redactions): when recording
work in this distribution repository, do not name unrelated consumer
repositories, products, customers, or app hosts. Describe the pattern and
the package that should change. Opaque session ids are enough when a
downstream trigger must be cited. Put named consumer traces only in that
consumer's own `docs/`. The same rule applies when editing any shared
upstream while the active chat is about another project.

## Effects

Issue opened from a downstream session-review recommendation (missing
session-review in a consumer Prayfile). Package sources not changed yet.

## Next

- Draft fragment and Routing wording in the three package trees above.
- Bump versions, README consumer pins if needed, CHANGELOG Unreleased.
- `make validate-skills` / publish / install / verify on the prayers tree.
- Confirm with a dry run: consumer Prayfile without session-review, ask
  "session review", expect install proposal before a docs/reviews write.

## Source

- Downstream trigger: session `a81982df` (operator asked session
  audit/review; matching skill existed in the catalog but was not treed in
  that consumer until the same turn).
- Related: packages/collaboration-workflow, packages/getting-started,
  packages/session-review, packages/ci-review, packages/change-review;
  README Package catalog and Compose budget.
