<!-- pray:0 ignore-comments -->

# Agent context

Do not edit managed blocks in `AGENTS.md` or provisioned files under `.agents/`.
To change shared guidance, update `Prayfile` and run `pray install`.

## Shared instructions

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
- fix the cause of a race, not a retry around it; prefer positive names; compute at write when a read cannot paginate; do not change production design only so tests can reach it.
<!-- pray:9068e4a2 -->

<!-- pray:781b7711 -->
## Credentials and Secrets

- Prefer a secret store or OS credential helper over embedding live secrets in config files, scripts, or documentation. Named managers (for example 1Password, Bitwarden, KeePassXC) are fine; the requirement is isolation, not a specific vendor.
- Config and project files may hold references (vault paths, item ids, redacted fingerprints). They must not hold live tokens, API keys, passwords, or client secrets.
- Do not pass secrets on command lines or in other process-visible arguments. Prefer secret-store lookup, short-lived credentials, or stdin/file descriptors that do not persist in shell history.
- Do not commit secrets, paste them into issues or pull requests, or write them to logs. Rotate anything that may have been exposed.

## Tracking and identification

- A redacted fingerprint above is a hash of a secret for config references. A device fingerprint is fields that combine to identify a person or device across sessions or observers.
- Identifiers, IP addresses, device marks, and combined attributes are personal data. They can unmask a person, a location, or a session secret. Emit them only when the feature they asked for this session needs them and they were shown that this product would.
- Silent analytics ids, leftover marks after logout, and canvas or hardware probes are security events. They can locate a person, stitch sessions, or leak a credential-shaped token.

## Ownership and destinations

- Lookups go through an ownership set; request parameters pick which row; fail closed when access cannot be proven.
- Treat user-supplied URLs as untrusted; rate-limit authentication and abuse-prone endpoints.

Related: `engineering-audit` security mode asks whether a parameter establishes access and whether a worker skipped policy.
<!-- pray:781b7711 -->

<!-- pray:bfe6ff38 -->
- `docs/` holds maintained explanations and working records; use stable descriptive filenames for guides; placement does not imply polish or currency;
- keep inference input (AGENTS.md, `.agents/`) separate from `docs/`; conventions that matter fail a command;
- `usr/` is the workshop for working tools and operational material;
- `usr/migrate/` holds console-first scripts that must run before new code is on the process; later schema migrate is schema-only and idempotent;
- four `docs/` timestamp trees, no README index, filename `YYYYMMDDHHMMSS_<kebab-case-title>.md`: `issues` (live work: contract, findings, open next; pitch, plan, and queue stay here), `changelogs` (what shipped), `meetings` (one sitting: who was there and what they agreed), `dependencies` (upstream defects from real work);
- issues, changelogs, and meetings make five things findable (use `##` headings or equivalent; omit empty sections): **Participants** (humans only; omit agents, tools, and binaries), **Decisions** (what was agreed), **Effects** (done, failed, recovered, rolled back), **Next** (todo, planned, open questions), **Source** (links upstream: meeting, issue, PR, commit, and downstream materializations); git history is the edit log; add an explicit note only when a later pass changes meaning (scope cut, rollback, decision reversed);
- mention software, tools, agents, or binaries in a note only when that detail is needed for execution or later analysis; put it under Decisions, Effects, or Source, not under Participants;
- never put local absolute paths or private material in `docs/` or under `usr/`: no home-directory or machine-specific filesystem paths, secrets, credentials, tokens, API keys, or personal private data; prefer repository-relative paths;
<!-- pray:bfe6ff38 -->

<!-- pray:edcc5f67 -->
## Dependency issues

When work surfaces a clearly visible bug or defect in a dependency (wrong behavior, broken API contract, regression between versions, or a fix already merged upstream but not released), say so in the task output and suggest a concrete fix path: upgrade, pin, patch, vendor, workaround, or upstream report.

Store evidence under `docs/dependencies/#{YYYYMMDDHHMMSS}_<kebab-case-title>.md`; no README index in that tree. Each file should make these findable (use `##` headings or equivalent; omit empty sections): **Dependency** (name, version constraint, lockfile entry if any), **Symptom** (what breaks and where), **Evidence** (repro steps, logs, stack traces, links to issues or commits), **Suggested fix** (upgrade, pin, patch, workaround, or upstream report), **Next** (todo, planned, open questions), **Source** (links upstream: issue, PR, release note, commit, and downstream materializations in this repo). Git history is the edit log.

Do not open drive-by dependency hunts; record only issues encountered while doing the requested work and only when the defect is evident from behavior or published upstream facts, not speculation.

For proactive selection, alteration, and audit rules, use `dependency-policy` and the dependency-audit skill.
<!-- pray:edcc5f67 -->

<!-- pray:3ac5d6ce -->
## Dependency policy

Rules for adding, changing, or removing third-party packages. Apply across languages. Names vary by ecosystem; concepts do not.

Terminology:

- package manifest — declares intent (`gemspec`, `package.json`, `Cargo.toml`, `mix.exs`, etc.)
- lockfile — pins the resolved graph CI and developers install
- registry — published versions consumers resolve (`RubyGems`, `npm`, `crates.io`, `Hex`, etc.)
- hot path — code on the security, auth, crypto, IO, or request/response boundary users rely on

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
- document deliberate shortcuts with an intent comment: name the known ceiling (global lock, O(n²) scan, naive heuristic) and the upgrade path when that ceiling matters.

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
- when digital reported state and physical process state can diverge, name both machines and the observation that couples them; occupancy listing is not the lock; a reported identity is not the person or sample at the station.

Related: `engineering-audit` boundary mode asks when those states disagree without an alarm; `io-simulation` injects the faults that cause the split.
<!-- pray:120c3507 -->

<!-- pray:26f3566a -->
## Branch naming

Use kebab-case after the prefix.

Prefixes:

- `feature/<title>` — new capability
- `patch/<title>` — bugfix or chore
- `trunk/<title>` — release candidate or integration work before `main`
- `plan/<title>` — exploration or ideation

Examples:

- `feature/user-access-control`
- `patch/fix-translation`
- `trunk/2026w15`
- `trunk/2026-august-pack`
- `plan/auth-redesign-notes`
- `plan/2026-q2-roadmap`
<!-- pray:26f3566a -->

<!-- pray:f528eeca -->
## Preferred stack and tools

- native-first approach for all platforms and languages
- ruby for web application and API development, and for its rich ecosystem of libraries and frameworks
- elixir for concurrent and distributed systems, and for its actor model and fault tolerance
- rust for system programming and performance-critical code
- javascript, html, css for native browser experience
- humane and accessible design principles for UI/UX, and for clear communication of intent and feedback; label icon-only controls; hide decorative duplicates from the accessibility tree

Related: `keep-the-work` covers staying on the failed place and keeping answers after a refusal.
<!-- pray:f528eeca -->

<!-- pray:ca94e22d -->
## Writing and changelog prose checks

Review for marketing language, invented objections, empty contrasts, stray em dashes, and paragraph flow; keep notes and metadata honest and plain.
- docs timestamp trees: plain prose readable without a rendered preview. No markdown tables, bold, italic, or other styling. Prioritize factual accuracy over presentation.
- Ease, lexical diversity, coherence, mechanics, and claim integrity are separate constructs. Automated matches, readability grades, similarity, and model preference are review prompts; preserve meaning, necessary negation, scope, and uncertainty when editing.
- Keep agency on the person who acts. Tools and process nouns do mechanical work.
- Technical names, APIs, CLI verbs, RFC titles, identifiers, and UI copy use instrument and protocol words: check-in, last-seen, probe, monitor, expected tick. Body and organism metaphors such as heartbeat, pulse, and organ stay out of contracts and code. HTTP `/health` remains the liveness probe until a later RFC.
- One sentence holds one beat. Consecutive short sentences that only restated the same beat are a punchline stack.
- For material external claims, quotations, dates, or research summaries, use the claims-audit skill.
<!-- pray:ca94e22d -->

<!-- pray:d893ab3d -->
## Claims and testimony

Treat checkable facts, quotations, dates, quantities, and causal statements as claims. Treat author memory and clearly framed interpretation as testimony.

- Inventing scenes, sources, numbers, or quotations is out of scope.
- A link or citation in the text is not verification. The cited passage must support the claim's scope, date, population, and causal strength.
- If a material external claim cannot be checked in this run, mark it unverifiable rather than rounding it to certainty.
- Run the claims-audit skill when asked to verify, fact-check, or research checkable claims, or when prose under edit states material external facts, quotations, dates, or research summaries.

Related: `writing-prose` covers voice and quality constructs; `engineering-audit` covers code and pipeline behavior.
<!-- pray:d893ab3d -->

<!-- pray:08c294fb -->
## Likely rejected changes

- features whose complexity outweighs user value
- giant refactors
- non-trivial changes without tests
- style-only rewrites without behavior change
- AI-generated-looking code the author does not understand
<!-- pray:08c294fb -->

<!-- pray:2543c1cc -->
## Checks before publish (engineering)

- verify the change is wanted; discuss first for unconfirmed larger features
- describe what problem is solved and why it matters
- include tests
- add screenshots or screen recordings for UI changes
- keep one pull request to one concern
- understand any AI-assisted code you submit
<!-- pray:2543c1cc -->

<!-- pray:48e8a6b3 -->
## Collaboration workflow

- record durable project value in the live-work queue, including improvements to shared guidance or a skill;
- keep only decision-bearing material; omit generic notes, copied chat, and filler;
- use the lightest trace that preserves context; design-only work needs no branch unless implementation starts;
- follow docs-conventions for `docs/` and `usr/`; when encoding how this tree writes, use infer-conventions.
<!-- pray:48e8a6b3 -->
