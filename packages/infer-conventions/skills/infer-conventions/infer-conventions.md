# Infer conventions (procedure)

Encode how this tree writes. Do not improve it. Do not record an aspiration in prose. A convention that matters fails a command: formatter, linter, architecture test, pack boundary, or CI path filter.

## Ground rules

Read these before any sweep.

Consistency first. The majority style is the convention. Encode what the code does, including a style you would not choose.

Skip what an active tool already enforces. Inspect formatter, linter, codemod, architecture-test, and CI configuration first. A transformation is tooling-owned only when its package and the relevant rule or set are installed and enabled. When the tree already sits at an active tool's target form, add nothing. When the tree deliberately holds a form that tool would rewrite, change the tool so the hold fails the other way: disable or override that rule on the matching paths, or add a rule that requires the held form.

Encode decisions, not defaults. A consistent pattern earns a check only when the tree took one valid option among others, or the pattern would surprise a competent agent. Framework defaults steer nothing. A real fork is not enough on its own. Weigh the side the tree took, and encode only the side an agent would not reach for by itself. Watch for a false fork: two tools that double different things are not a choice against each other. The test for every candidate: without this check, would the next change plausibly take the other side? Only yes earns a check.

Architecture choices are the highest-signal convention. Encode presence and deliberate absence. The structural pattern the tree commits to is the one no default tool decides: dedicated operation objects and how they are invoked, query objects, data objects, an events spine versus direct calls, domain or module folders. Also encode a consistent non-pattern, such as handlers querying the persistence library directly with no extra layer, so a new layer fails the suite.

Never duplicate an existing check. Read tool config, architecture tests, pack boundaries, and CI path filters before the sweep. A dimension already enforced there is done.

Evidence or silence. A convention needs at least three consistent examples and no meaningful rival (rival under about one fifth of occurrences). Every Step 1 verdict applies this bar.

The shipped artifact is the check, not a description of the convention. Prove it fails on a planted violation and passes on the current majority.

## Process

Each step ends on a checkable completion criterion. Do not advance until it holds.

Fan out when you can. If the environment can spawn subagents, do Step 0 yourself, then hand dimension groups and the architecture map to their own subagents. Each returns structured verdicts: dimension, verdict, evidence, proposed glob, proposed check. You aggregate, dedupe, then run Steps 3 to 5. Without subagents, run the steps in sequence with the same bar.

### Step 0: Orient

Read the package manifest (installed packages tell you which dimensions apply), formatter and linter and codemod config, architecture tests, pack or CI path filters, composed overlay files, and the application source tree. List every directory under the application root (and any modules, `src/`, packages, or domain root). Every folder beyond the framework's default skeleton is a structural pattern the tree committed to.

Done when: you have the applicable dimensions, the dimensions already enforced, and a list of every non-default application directory mapped to the pattern it represents.

### Step 1: Genuine-fork sweep

A dimension is a genuine fork only when the language or framework offers two or more valid approaches, the choice changes what the next change writes, and no active project tool already fails the other side. Skip pure formatting. Skip any form an installed and enabled tool already rewrites. Skip framework defaults a competent agent writes unprompted.

Inspect at least these families when they apply to the tree. Stay on concepts. Use the names this tree already uses.

- Validation and input: where rules live; typed accessors versus raw parameters.
- Handlers and routing: single-purpose versus multi-method; fat handlers versus delegated operations; closures versus classes; where middleware is assigned; implicit binding versus manual lookup.
- Authorization: where policy lives; where it is invoked.
- Persistence: which attributes a request-derived update may set; query home (handlers versus repositories versus query objects); scopes versus dedicated builders; key type; model events.
- Architecture: operation objects and invocation method; data objects; injection versus service location; events versus direct calls; default skeleton versus domain or module folders.
- Views or API: template stack versus API plus a separate client; how templates compose.
- Schema: foreign keys; reversible versus one-way migrations; where enumerations live.
- Tests: runner; database reset; how records are created; how this tree's own types are doubled; assertion style for comparable endpoints.
- Responses: serializer objects versus raw payloads; pagination contract by endpoint family, never as a project-wide majority.

Give each applicable dimension exactly one verdict:

- Pattern. Clears the bar, rival under about one fifth of occurrences, and reflects a real choice. A check candidate. Cite two or three example files.
- Conflict. Both styles present in meaningful numbers. Report the split with counts and example files. Never encode a preferred winner while the code remains mixed. Encode only if the person identifies a stable path or context boundary that explains both styles, and then scope the check to those paths; otherwise defer until the code is reconciled.
- Default. Consistent, but a framework or common-practice default the next change already writes unprompted. Skip it.
- No signal. Under the bar: feature unused, or too few examples. Skip silently (one summary line at most).
- Tooling-owned. Skip per the ground rules.

Done when: every applicable dimension carries exactly one of those verdicts.

### Step 2: Open-ended pass

Close out the architecture map from Step 0. For every non-default application directory, confirm how the pattern is used and apply the same evidence and decisions-not-defaults tests. Generator-standard or sparsely used directories are signals to inspect, not automatic conventions. Make genuine structural patterns candidates and scope each check to its own directory glob. Encode a consistent deliberate absence when it sets the tree's height.

Then find what else makes this codebase itself: base or abstract types most code extends, traits used everywhere, tenancy or authorization scoping woven through queries, naming schemes, custom helpers. Same evidence bar, cite files. Propose a check for every genuine structural pattern, and cap the other house findings at about five so the pass stays high-signal.

Done when: every non-default application directory from Step 0 has a verdict, and the pass has produced its cited house findings or concluded there are none.

### Step 3: Confirm

Present every candidate in one batch. Per item: dimension, verdict, evidence (counts and files), the glob, and the proposed check (file, command, what fails). Conflicts are questions about an existing context boundary or deferred cleanup, not a choice of future style.

Default mode is confirm: encode only what the person approves. Encode all pattern candidates without asking only when the invocation said to. Conflicts still go to the person.

Done when: every candidate is approved, rejected, or (conflicts) decided.

### Step 4: Encode

For each approved convention, add the lightest executable that fails when violated. Prefer, in order:

1. Configure an already-installed formatter or linter: path-scoped include or exclude, enable or disable a rule, or turn on a rule the tool already ships.
2. Add a test in the tree's existing suite that searches or asserts the structure.
3. Add a CI path filter or pack boundary the tree already uses.
4. A new check tool is a dependency-policy stop. Use it only when 1 to 3 cannot fail closed.

Follow `working-rules`: prove the check fails on a planted violation, then passes on the current majority. Follow `minimal-implementation`: do not add a second check for the same job.

Do not write `.agents/conventions/` files. Do not paste the convention into AGENTS.md. If encoding must wait, a live-work note may hold the ticket; that note is not the convention.

Choose the most specific paths that cover the cited evidence. If a convention spans two domains, fail both. Mentioning another path in a comment does not make the check run there.

Encode this:

> A test or linter rule fails when a new type appears under a forbidden extra layer, or when a handler reaches persistence through that layer.

Not this:

> Handlers query the persistence library directly; no repository types exist (14 handler queries, 0 repository classes). Match that height in existing handlers.

Done when: every approved item has a check that was run, and any failure is reported with the command and output.

### Step 5: Summarize

List checks added (file and command), conflicts the person deferred, notable no-signals, and remind the person to commit the check so CI owns the convention.

## Path mapping

Attach each check to the most specific path that covers its evidence. Never a lazy application-wide include when a subtree fits. Match the path filter to where the code actually lives. Use the Step 0 map to pick the real path.

Examples of families, not required directory names:

- Models or entities: the directory this tree uses.
- Handlers, routing, validation, responses: the HTTP or interface directory, or each module's equivalent.
- Operation objects, services, data objects: the folders the tree actually uses.
- Tests: the test tree.
- Schema: the migration or schema directory.
- Truly application-wide (rare): the application root.

## Edge cases

- Tiny or fresh tree: most dimensions land on no-signal. Say so honestly and add no check.
- Huge tree: each dimension is a bounded search plus a handful of file reads. Sample representative files.
- Re-runs: reading tool config and architecture tests in Step 0 makes re-runs incremental. Only new or unenforced dimensions surface.
- Non-standard layout: the open-ended pass catches the layout itself as the first convention. Adapt path filters to the observed paths.
- No executable can fail closed: say so and stop. Do not substitute agent markdown.
