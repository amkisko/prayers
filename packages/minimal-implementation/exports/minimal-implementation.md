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
- document deliberate shortcuts with an intent comment: name the known ceiling (global lock, O(n²) scan, naive heuristic) and the upgrade path when that ceiling matters.

Not optional even when minimizing scope:
- input validation at trust boundaries;
- error handling that prevents data loss;
- security and accessibility;
- calibration against real hardware and production drift when the platform ideal is not the spec;
- anything explicitly requested in the task or ticket;
- tests for non-trivial behavior per @spec/README.md; trivial one-liners need no new spec.

Related: `keep-the-work` covers the failed place after a refusal; `dependency-policy` covers third-party registry packages; `infer-conventions` encodes how this tree writes as checks.
