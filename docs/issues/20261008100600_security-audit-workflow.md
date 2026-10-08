# Security audit workflow

## Participants

- amkisko

## Decisions

Add a tree-only security-audit skill for full repository audits. Keep focused security guidance in engineering-audit. The full workflow separates reconnaissance, coverage-led hunting, independent validation, and reporting.

Store each run outside maintained documentation. Require run metadata, a coverage ledger, findings, agent-owned evidence, and a final report. A complete run must have no unaccounted candidates. An incomplete run must state why it stopped.

Use confirmed, needs_validation, and rejected as finding verdicts. Reserve blocked, covered, candidate, deferred, and out_of_scope for coverage state. Assign severity only to confirmed findings and never above demonstrated impact.

Validate referenced source paths and line numbers against the audited tree. Validate evidence files as regular, non-linked files under the producing agent's artifact directory. Use the Ruby standard library and add no dependency.

Expand engineering-audit security companions for HTTP and identity, clients, native interfaces, supply chain and release, cloud deployment, protocols and messaging, availability abuse, data isolation, and local application boundaries. Dependency advisories and package reachability remain owned by dependency-audit. Learned-system boundaries remain owned by learned-systems mode.

Bound security-audit agent invocations and reserve capacity for independent validation. Agent-run-supervision owns the reusable live-run ceiling and incomplete terminal state.

## Effects

Added security-audit 0.1.1 with a full-audit workflow, run metadata, coverage and finding schemas, a standard-library Ruby validator, and sixteen regression cases. The validator checks source existence and line bounds, safe evidence ownership, independent validator identity, severity and verdict rules, cross-document fingerprints, agent budget, and truthful complete or incomplete state.

Expanded engineering-audit 2.14.2 with the finding contract, safe target execution, and six new security companions. Expanded HTTP, client, and native companions. Agent-run-supervision 1.2.1 now owns total invocation budgets, reserved validation capacity, one bounded malformed-result retry, and incomplete terminal state.

Prayfile trees the new skill. Prayfile.lock and `.agents/skills` are provisioned. The local catalog contains security-audit 0.1.0 and 0.1.1; 0.1.1 preserves the final complete-state rules without replacing the earlier artifact. The built and catalog 0.1.1 archives have the same SHA-256 digest.

Validation passed: `make test` ran all repository suites, including security-audit with 16 runs and 21 assertions; `make validate-skills` reported all skills valid; `make check-artifacts`, `pray plan`, `pray verify`, and `pray drift` exited zero. Package builds for security-audit, engineering-audit, and agent-run-supervision exited zero. No person-facing screen or document rendering changed, so visual assessment does not apply.

Published security-audit 0.1.2 in the package source after an engineering-audit of the working-tree diff: reject unknown JSON fields to match schema `additionalProperties: false`, cache source line counts in `PathVerifier`, and extend the run-contract suite to twenty cases. Observed: `make test` exit 0 (security-audit 20 runs, 29 assertions); `PRAY=$HOME/.cargo/bin/pray make install` and `make apply` provisioned 0.1.2 under `.agents/skills/security-audit` including `object_shape.rb`. Catalog `make publish` for the 0.1.2 `.praypkg` is still pending explicit approval.

## Next

Consumers tree `amkisko/security-audit ~> 0.1` beside `amkisko/engineering-audit ~> 2.14`, then run `pray install`. Keep the run contract at 0.x until real audits have exercised schema evolution and cross-platform path behavior.

## Source

Upstream research: https://github.com/cloudflare/security-audit-skill

Downstream: packages/security-audit, packages/engineering-audit, packages/agent-run-supervision, docs/changelogs/20261008100600_security-audit-workflow.md, README.md, CHANGELOG.md.
