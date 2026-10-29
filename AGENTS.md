<!-- pray:0 ignore-comments -->

# Agent context

Do not edit managed blocks in `AGENTS.md` or provisioned files under `.agents/`.
To change shared guidance, update `Prayfile` and run `pray install`.

<!-- pray:ae5d334a -->
## Shared instructions

- package sources in this repository are shared prayers: fragments under `exports/`, skill bodies, prompt templates, and files under `prayers/` follow the same prose and formatting rules as `writing-prose` and `docs-conventions`; agents and humans authoring them must not treat prayer text as exempt from plain-prose discipline;
- plain prose readable without a rendered preview: no markdown tables, bold, italic, or other styling; use headings, bullet lists, backticks for technical names, YAML frontmatter, and code fences when the contract needs them; prefer labeled bullets over tables for multi-field rows;
- prefer characters typed from a normal keyboard; no special Unicode punctuation or symbols for structure (arrows, em dashes, ellipsis characters, not-equal signs, curly quotes, section signs); use ASCII (`->`, `-`, `...`, `!=`, straight quotes) or plain words; pipelines and flow diagrams are numbered or bulleted lists, or ASCII-only `text` fences;
- investigation and skill deliverable templates must teach the same plain-prose shape; do not ship emphasis, table scaffolding, or inaccessible glyphs that consumers will copy into `docs/` notes or reports;
<!-- pray:ae5d334a -->

<!-- pray:9068e4a2 -->
- when fixing or refactoring code, add or update tests first to expose the current bug/regression path (or missing contract), then implement the fix, then run focused and broader checks, and do not ship behavior changes without proving before/after via specs;
- test only executable logic and user-facing behavior; tests should affect coverage metrics;
- avoid tests that only assert implementation details; avoid file/page content/ordering/regex assertions; avoid duplicating tests;
- user interface texts should never mention implementation technical details;
- prefer files around <=150 LOC when cohesion allows; split only when it improves ownership, readability, and reviewability;
- do not use abbreviations or short names unless they are very common;
- avoid explanatory comments, but allow intent comments for non-obvious constraints, invariants, concurrency edges, or external contract requirements;
- readability, structure, and clarity are product qualities;
- pull request description answers what problem is solved, why it matters, how the solution works, and relevant context; non-trivial changes include reproduction steps or a changelog entry with intent;
- pull request checklist: changelog entry with intent or reproduction steps when relevant, test coverage, and quality checks done;
- follow docs-conventions for docs timestamp-tree filenames and layout;
- report completed actions only with observed evidence; validation output must list exact commands run and observed results;
- ignore style-only dust unless it harms correctness, operability, maintainability, or auditability under realistic load;
- sibling files and executable checks beat shared defaults; mixed styles stay a split until a path boundary explains both;
- fix the cause of a race, not a retry around it; prefer positive names; compute at write when a read cannot paginate; do not change production design only so tests can reach it;
- if process state and local cache files are both cleared, name what must be rebuilt and from which durable source;
- side effects read committed state from a cursor; they are not steps of the write;
- on a store or network hot path, name the expensive unit and keep a before-and-after budget;
- after changing a published number, identifier, or contract field, search dependents and mark them stale or update them; when a published identifier shape changes, search path helpers that pass a string id, not only those that pass a record.
<!-- pray:9068e4a2 -->

<!-- pray:781b7711 -->
## Credentials and Secrets

- Prefer a secret store or OS credential helper over embedding live secrets in config files, scripts, or documentation. Named managers (for example 1Password, Bitwarden, KeePassXC) are fine; the requirement is isolation, not a specific vendor.
- Config and project files may hold references (vault paths, item ids, redacted fingerprints). They must not hold live tokens, API keys, passwords, or client secrets. The same prohibition applies to skill files, prompt templates, and MCP environment settings.
- Do not pass secrets on command lines or in other process-visible arguments. Prefer secret-store lookup, short-lived credentials, or stdin/file descriptors that do not persist in shell history.
- Do not commit secrets, paste them into issues or pull requests, or write them to logs. Rotate anything that may have been exposed.
- if a live secret, credential, or confidential trace appears in this session, treat it as a security event: tell the person, do not quote the value, and do not send it to another third party; the inference provider already saw what reached this session

## Tracking and identification

- A redacted fingerprint above is a hash of a secret for config references. A device fingerprint is fields that combine to identify a person or device across sessions or observers.
- Identifiers, IP addresses, device marks, and combined attributes are personal data. They can unmask a person, a location, or a session secret. Emit them only when the feature they asked for this session needs them and they were shown that this product would.
- Silent analytics ids, leftover marks after logout, and canvas or hardware probes are security events. They can locate a person, stitch sessions, or leak a credential-shaped token.

## Ownership and destinations

- Lookups go through an ownership set; request parameters pick which row; fail closed when access cannot be proven.
- Treat user-supplied URLs as untrusted; rate-limit authentication and abuse-prone endpoints.
- An invalid or expired credential gets a protocol-level failure status. A hop's own credential is never the caller's. Modes that relax access controls must remain disabled when their configuration is missing or invalid.
- Crawl preferences in `robots.txt` and Content-Signal style directives declare intent to cooperative clients. They are not authentication, ownership proof, or a technical block. They do not replace rate limits or fail-closed access checks.

Related: `engineering-audit` security mode asks whether a parameter establishes access and whether a worker skipped policy.
<!-- pray:781b7711 -->

<!-- pray:bfe6ff38 -->
- `docs/` holds maintained explanations and working records; use stable descriptive filenames for guides; placement does not imply polish or currency;
- keep inference input (AGENTS.md, `.agents/`) separate from `docs/`; conventions that matter fail a command;
- `usr/` is the workshop for working tools and operational material;
- `usr/scripts/` holds maintainer scripts invoked from a checkout, Makefile, CI, or a runner on a named path; not paste-into-live-console support or migrate work;
- `usr/reports/` holds read-only analysis and investigation console scripts; no mutations;
- `usr/support/` holds product and customer support console scripts that mutate or write; a person pastes or runs them after review; programmable agents do not run them against a live process;
- `usr/migrate/` holds schema and data migration scripts for manual running before new code is on the process; later schema migrate is schema-only and idempotent;
- six `docs/` timestamp trees, no README index, filename `YYYYMMDDHHMMSS_<kebab-case-title>.md`: `plans` (uncertain future: design-only notes before work is committed), `issues` (certain current: live work in play; contract, findings, open next; the open queue stays here), `reviews` (one review episode: session or CI scope, coverage, recommendations, outcome), `changelogs` (factual past: what shipped), `meetings` (one sitting: who was there and what they agreed), `dependencies` (upstream defects from real work);
- issues, reviews, changelogs, and meetings make five things findable with `##` headings or equivalent: Participants (humans), Decisions (what was agreed), Effects (done, failed, recovered, rolled back), Next (todo, planned, open questions), Source (links upstream and downstream);
- name the current operator under Participants when the current session provides their display name or that person confirms it; solo sessions still get one Participants line;
- if the current operator cannot be identified without inference, omit Participants rather than guess from git configuration, commit history, filesystem paths, OS accounts, or login names;
- list other humans who decided or reported in that episode when known; do not list agents, tools, binaries, or every person who touched related code;
- omit other empty sections; git history is the edit log; add an explicit note only when a later pass changes meaning (scope cut, rollback, decision reversed);
- Problem / Fix and similar ticket outlines do not replace the five headings; map that content into Decisions and Effects; keep Participants, Next, and Source as their own headings;
- mention software, tools, agents, or binaries in a note only when that detail is needed for execution or later analysis; put it under Decisions, Effects, or Source, not under Participants;
- never put local absolute paths or private material in `docs/` or under `usr/`: no home-directory or machine-specific filesystem paths, secrets, credentials, tokens, API keys, or personal private data; prefer repository-relative paths;
- one home per fact; link, do not duplicate; goal and acceptance live apart from operating rules; when a decision changes shape, supersede it in place; name what the product does not do next to what it does;
<!-- pray:bfe6ff38 -->

<!-- pray:edcc5f67 -->
## Dependency issues

When work surfaces a clearly visible bug or defect in a dependency (wrong behavior, broken API contract, regression between versions, or a fix already merged upstream but not released), say so in the task output and suggest a concrete fix path: upgrade, pin, patch, vendor, workaround, or upstream report.

Store evidence under `docs/dependencies/#{YYYYMMDDHHMMSS}_<kebab-case-title>.md`; no README index in that tree. Each file should make these findable (use `##` headings or equivalent; omit empty sections): Dependency (name, version constraint, lockfile entry if any), Symptom (what breaks and where), Evidence (repro steps, logs, stack traces, links to issues or commits), Suggested fix (upgrade, pin, patch, workaround, or upstream report), Next (todo, planned, open questions), Source (links upstream: issue, PR, release note, commit, and downstream materializations in this repo). Git history is the edit log.

Do not open drive-by dependency hunts; record only issues encountered while doing the requested work and only when the defect is evident from behavior or published upstream facts, not speculation.

For proactive selection, alteration, and audit rules, use `dependency-policy` and the dependency-audit skill.
<!-- pray:edcc5f67 -->

<!-- pray:3ac5d6ce -->
## Dependency policy

Rules for adding, changing, or removing third-party packages. Apply across languages. Names vary by ecosystem; concepts do not.

Terminology:

- package manifest - declares intent (`gemspec`, `package.json`, `Cargo.toml`, `mix.exs`, etc.)
- lockfile - pins the resolved graph CI and developers install
- registry - published versions consumers resolve (`RubyGems`, `npm`, `crates.io`, `Hex`, etc.)
- hot path - code on the security, auth, crypto, IO, or request/response boundary users rely on

Stop until one of these applies before adding a dependency:

- stdlib or the framework for this tree already covers it;
- an installed transitive dependency already covers it without a second library for the same job;
- the feature needs a new package and tests will prove behavior.

Run dependency-audit for direct dependency changes, graph audits, releases with hot-path package changes, and plausible dependency vulnerability or exploitation signals found during ordinary work. Keep the evidence and assessment in the live-work or dependency record.

Related: `dependency-issues` records upstream defects found during real work; `minimal-implementation` covers YAGNI before adding deps; `engineering-audit` covers code and pipeline review.
<!-- pray:3ac5d6ce -->

<!-- pray:bf7304a6 -->
## Minimal implementation

Efficient means the smallest correct change.

Before writing code, stop at each step until one applies:
- does the feature need to exist at all (YAGNI)?
- does the language stdlib or framework for this tree already cover it?
- does an existing implementation or dependency already solve it?
- can the change be one line; if so, make it one line?
- only then write the minimum code that works.

Before generating the main implementation of an unproven method, require a small runnable check that records a feasibility number or a failure verdict.

Before adding a new library directory or first-party package, stop until one applies:
- one product owns the contract and is the only caller: keep source in that tree;
- a second in-repo caller, or no product runtime: unpublished in-repo package (own manifest, own tests, path-linked, 0.x, registry publish blocked);
- a second repository or registry consumer: extract, publish, then follow dependency-policy.

Rules:
- match the language of the directory you are changing (see Preferred stack and tools above);
- match the tree's structural height; a consistent absence of a layer is a convention; do not introduce a second pattern for the same job;
- no abstractions unless three real variations need them; drop unused public methods;
- no new dependency when stdlib, the framework for this tree, or an installed dependency suffices;
- no boilerplate the task did not ask for;
- deletion over addition; boring over clever; fewest files that stay readable;
- when a request sounds overbuilt, ask whether a simpler existing path already covers it;
- when two stdlib approaches are the same size, pick the edge-case-correct one; less code is not an excuse for a flimsier algorithm;
- document deliberate shortcuts with an intent comment: name the known ceiling (global lock, O(n^2) scan, naive heuristic) and the upgrade path when that ceiling matters.

Not optional even when minimizing scope:
- input validation at trust boundaries;
- error handling that prevents data loss;
- security and accessibility;
- calibration against real hardware and production drift when the platform ideal is not the spec;
- anything explicitly requested in the task or ticket;
- tests for non-trivial behavior per @spec/README.md; trivial one-liners need no new spec.

Related: `keep-the-work` covers the failed place after a refusal; `dependency-policy` covers third-party registry packages; `infer-conventions` encodes how this tree writes as checks.
<!-- pray:bf7304a6 -->

<!-- pray:120c3507 -->
## Finite state machines

- model lifecycles with explicit finite state machines when status, allowed transitions, and side effects matter; prefer named states and guarded transitions over scattered conditionals and implicit enums alone; when who and when matter, model the event as a record, not a boolean flag;
- finite state machines can compactly represent ordered sets or maps of strings supporting fast prefix, suffix, and fuzzy search; consider tries and automata when matching catalogs, codes, routes, or searchable vocabularies at scale;
- when digital reported state and physical process state can diverge, name both machines and the observation that couples them; occupancy listing is not the lock; a reported identity is not the person or sample at the station;
- a later artifact does not prove an earlier gate; a cache generation is not the durable commit; a lease is not ownership of the object; bound generated plans and refine after each completed step.

Related: `engineering-audit` boundary mode asks when those states disagree without an alarm; `io-simulation` injects the faults that cause the split.
<!-- pray:120c3507 -->

<!-- pray:26f3566a -->
## Branch naming

Use kebab-case after the prefix.

Prefixes:

- `feature/<title>` - new capability
- `patch/<title>` - bugfix or chore
- `trunk/<title>` - release candidate or integration work before `main`
- `plan/<title>` - exploration or ideation

Examples:

- `feature/user-access-control`
- `patch/fix-translation`
- `trunk/2026w15`
- `trunk/2026-august-pack`
- `plan/auth-redesign-notes`
- `plan/2026-q2-roadmap`

Related: `planned-release` owns release id, payload membership, candidate lifecycle, cut versus publish, and project bindings. The `trunk/<title>` prefix names a candidate branch; it is not the literature "trunk" (stable line).
<!-- pray:26f3566a -->

<!-- pray:f528eeca -->
## Preferred stack and tools

- native-first approach for all platforms and languages
- ruby for web application and API development, and for its rich ecosystem of libraries and frameworks
- elixir for concurrent and distributed systems, and for its actor model and fault tolerance
- rust for system programming and performance-critical code
- javascript, html, css for native browser experience
- humane and accessible visual-surface principles for UI/UX, and for clear communication of intent and feedback; label icon-only controls; hide decorative duplicates from the accessibility tree
- when the change presents a screen, document, or other person-facing surface, name that surface in the work product (reply, pull request, live-work note) and record a visual assessment: hierarchy, copy, interactive states, empty/loading/error, a narrow surface, and whether a person can finish the task; record what was assessed and what remains for a human; skip and say so when there is no such surface
- pictures, previews, tickets, and chat threads are source locators for that signal; the assessment is the running product plus the written need
- product-contract and architecture work stay distinct from this visual-surface assessment
- person-facing dates and times follow the product locale form; native HTML date and datetime-local follow the browser locale and are not that form; machine APIs, data attributes, filenames, and CSV machine columns stay ISO unless the product already published another contract
- a catalog picker for growing association lists is a combobox that queries the product's live list API as the person types; each request takes a bounded page; further rows load on type or on scroll; a datalist or a select of every row is not that control
- catalog assignment starts empty when a default first row would apply a change
- a command that writes a record must look like a command

Related: `keep-the-work` covers staying on the failed place after a refusal.
<!-- pray:f528eeca -->

<!-- pray:ca94e22d -->
## Writing and changelog prose checks

Review for marketing language, invented objections, empty contrasts, stray em dashes, and paragraph flow; keep notes and metadata honest and plain.
- docs timestamp trees, shared prayer sources (fragments, skill bodies, prompt templates, files under `prayers/`), and agent deliverable templates: plain prose readable without a rendered preview. No markdown tables, bold, italic, or other styling. Prioritize factual accuracy over presentation.
- Prefer characters typed from a normal keyboard layout. Do not use special Unicode punctuation or symbols for structure or emphasis: no Unicode arrows, em or en dashes, ellipsis characters, not-equal signs, curly quotes, section signs, or similar. Use ASCII stand-ins (`->`, `-`, `...`, `!=`, straight `"` / `'`) or plain words (`then`, `section`). Do not draw pipelines or diagrams with inaccessible glyphs; use a numbered or bulleted list, or a `text` fence with ASCII only.
- Ease, lexical diversity, coherence, mechanics, and claim integrity are separate constructs. Automated matches, readability grades, similarity, and model preference are review prompts; preserve meaning, necessary negation, scope, and uncertainty when editing.
- Keep agency on the person who acts. Tools and process nouns do mechanical work.
- Technical names, APIs, CLI verbs, RFC titles, identifiers, and UI copy use instrument and protocol words: check-in, last-seen, probe, monitor, expected tick. Body and organism metaphors such as heartbeat, pulse, and organ stay out of contracts and code. HTTP `/health` remains the liveness probe until a later RFC.
- One sentence holds one beat. Consecutive short sentences that only restated the same beat are a punchline stack.
- For material external claims, quotations, dates, or research summaries, use the claims-audit skill.
- signed comments on a public tracker speak as the account holder to the named person; chat stays in chat
- cite only what a public reader can open and check; confidential traces, unique working locators, and unverifiable session evidence stay in chat; do not expose source material that is not already public, and do not post source material without the person's consent
- greeting names the person, then a short body, a close, and the name from the tracker identity; first person when that person did the work
- one primary commit, pull request, or release link; comment when asked; do not close, assign, or reopen unless asked

Related: `security` forbids secrets in issues and owns the session notice when confidential material hits inference.
<!-- pray:ca94e22d -->

<!-- pray:d893ab3d -->
## Claims and testimony

Treat checkable facts, quotations, dates, quantities, and causal statements as claims. Treat author memory and clearly framed interpretation as testimony.

- Inventing scenes, sources, numbers, or quotations is out of scope.
- A link or citation in the text is not verification. The cited passage must support the claim's scope, date, population, and causal strength.
- If a material external claim cannot be checked in this run, mark it unverifiable rather than rounding it to certainty.
- Keep statement, domain, and quantifiers on a formal claim. Freeze quantities from the producing artifact. A later file does not prove an earlier check.
- Run the claims-audit skill when asked to verify, fact-check, or research checkable claims, or when prose under edit states material external facts, quotations, dates, or research summaries.

Related: `writing-prose` covers voice and quality constructs; `engineering-audit` covers code and pipeline behavior; `derivation-audit` covers symbolic derivation when a consumer asks for that job.
<!-- pray:d893ab3d -->

<!-- pray:08c294fb -->
## Likely rejected changes

- features whose complexity outweighs user value
- giant refactors
- non-trivial changes without tests
- style-only rewrites without behavior change
- AI-generated-looking code the author does not understand
- compatibility aliases, shims, and legacy input shapes that remain accepted even though the change should remove them
<!-- pray:08c294fb -->

<!-- pray:2543c1cc -->
## Checks before publish (engineering)

- verify the change is wanted; discuss first for unconfirmed larger features
- describe what problem is solved and why it matters
- include tests
- add screenshots or screen recordings for UI changes
- keep one pull request to one concern
- understand any AI-assisted code you submit
- review generated changes before requesting revisions; write review replies from the author's own understanding
<!-- pray:2543c1cc -->

<!-- pray:48e8a6b3 -->
## Collaboration workflow

- record durable project value in the live-work queue, including improvements to shared guidance or a skill;
- keep only decision-bearing material; omit generic notes, copied chat, and filler;
- use the lightest trace that preserves context; design-only work needs no branch unless implementation starts; put that exploration under `docs/plans`;
- follow docs-conventions for `docs/` and `usr/`; when encoding how this tree writes, use infer-conventions.
<!-- pray:48e8a6b3 -->

<!-- pray:5523d080 -->
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
<!-- pray:5523d080 -->
