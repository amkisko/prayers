# Agent guidance engineering and prose audit

## Decisions

Audit the repository working tree based on `e9a021f`, with emphasis on the 19 published skill selectors and the instructions loaded before agent action. Treat selection, authority, action, failure, completion, and evidence as separate effects. Review the in-progress dependency resource comparison as agent guidance because it directs checkout and forge actions.

Run engineering core, resource and budget, trace and identification, security supply-chain and local-tool boundaries, contracts, learned systems, and lineage. Skip product-surface, privacy, observability, HTTP identity, native interface, cloud deployment, protocols and messaging, data isolation, and physical boundary modes because this repository publishes guidance and local maintenance scripts without a person-facing runtime, personal-data store, long-lived service, custom message boundary, or actuator.

Use structural selection coverage and local command measurements as the available benchmark. Do not call them a model-quality benchmark. A routing and execution benchmark still needs a fixed model, harness, skill set, tool grants, request fixtures, and repeated raw outcomes.

## Effects

The first pass found seven actionable defects. The final pass found zero remaining findings in the reviewed scope.

1. `agent-artifact` did not inspect the selector separately from the loaded body or require an exact effect map. Version 1.3.0 now traces request, selection, references, authority, action, failure, completion, and evidence. It separates routing metrics from execution metrics and keeps review-only requests read-only.
2. `public-surface-recon` kept its use cases and exclusions only in the body. Version 1.4.0 moves them into frontmatter so selection does not depend on instructions that have not loaded.
3. The dependency upgrade comparison could switch the active worktree and write to a change request without explicit authority. Version 4.2.0 now uses isolated base and head checkouts, preserves uncommitted work, separates report output from authorized writes, aligns scope to resolved graph and runtime-pin changes, and requires repeated samples for CPU, RSS, or wall-time direction claims.
4. The skill validator accepted a packaged name that differed from its directory and required local references that were missing or escaped the skill root. It now rejects all three cases. Regression coverage failed before the implementation and passes after it.
5. Package metadata was outside the prose gate. `.prayspec` summaries are now checked, and the non-ASCII `public-surface-recon` summary was replaced with plain ASCII prose.
6. Maintenance commands accepted unsupported Ruby and Pray executables. The Makefile now requires Ruby 3.4.0 and Pray 1.26.0 before work starts and supports explicit `RUBY` and `PRAY` paths. The old tools now fail at the gate with their observed versions rather than later syntax errors.
7. The generated `AGENTS.md` was 27,229 bytes against the repository's 16 KiB target. The self-consumer now keeps repository-wide working, security, documentation, dependency, prose, review, publish, and collaboration fragments always loaded. Task-specific state-machine, branch, release, stack-selection, minimal-implementation, and claim procedures remain available through source or skills without consuming every inference. The rendered file is 15,871 bytes, 513 bytes below the ceiling. A new executable gate fails tests and release checks above 16 KiB.

The static security pass found no credential-shaped assignments, private-key headers, network clients, or telemetry initializers in the executable maintenance trees. Command execution uses argument arrays. The published security-audit validator keeps its existing JSON byte cap and path checks.

All repository-owned findings are fixed. One dependency defect remains outside this tree: Pray 1.26.0 ordinary `drift` reports renderer drift while `plan`, `verify`, and semantic drift are clean. The evidence and fix path are recorded in `docs/dependencies/20261102094751_pray-drift-renderer-mismatch.md`.

## Benchmark

- Selector structure: 18 of 19 skill descriptions had an explicit use selector before the fix; 19 of 19 have one after it. The changed selector also gained explicit exclusions.
- Pre-inference context: 27,229 bytes before composition pruning; 15,871 bytes after it, a reduction of 11,358 bytes (41.7%). The continuous ceiling is 16,384 bytes.
- Full local test path, Ruby 4.0.7, three runs on the same host: wall time 1.53 s, 1.39 s, 1.40 s; median 1.40 s. User plus system CPU proxy: 1.14 s, 1.10 s, 1.10 s; median 1.10 s.
- RSS was unavailable because the sandbox denied the clock-rate query used by `/usr/bin/time`. No memory claim is made.
- A live model routing and execution A/B run was unavailable because the repository has no fixed model harness or request corpus. `agent-artifact` now states the fixture and measurement contract needed for that run.

## Next

- Run the selection and execution benchmark when a consumer provides a fixed model harness and representative positive, negative, and boundary requests.
- Publish the new package versions only after the ordinary release review; this audit did not publish, push, tag, or open a change request.

## Source

- `packages/agent-artifact/`
- `packages/engineering-audit/skills/engineering-audit/learned-systems.md`
- `packages/public-surface-recon/`
- `packages/dependency-policy/skills/dependency-audit/references/upgrade-resource-compare.md`
- `usr/scripts/validate_skill.rb`
- `usr/scripts/check_prayer_prose.rb`
- `usr/scripts/check_tool_version.rb`
- `usr/scripts/check_agent_context.rb`
- `Makefile`
- `docs/dependencies/20261102094751_pray-drift-renderer-mismatch.md`
