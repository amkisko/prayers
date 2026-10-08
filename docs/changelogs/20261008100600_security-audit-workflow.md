# Security audit workflow

## Decisions

Ship security-audit 0.1.1 as a tree-only skill beside engineering-audit. Keep focused subsystem security review in engineering-audit and package advisory reachability in dependency-audit.

Use explicit reconnaissance, coverage, hunting, independent validation, and reporting phases. Store raw run artifacts outside docs. A complete run has no planned or blocked coverage and no finding that still needs validation.

Use Ruby standard-library validation for actual source paths and lines, agent-owned evidence files, cross-document fingerprints, independent validator identity, verdict fields, severity bounded by impact, and invocation budgets. Add no runtime dependency.

## Effects

security-audit 0.1.1 is packaged, published to the local prayers/v1 catalog, locked, and provisioned under `.agents/skills/security-audit`. The final package archive and catalog archive have matching SHA-256 digests.

engineering-audit 2.14.2 carries the security finding contract, safe execution rules, expanded existing companions, and new supply-chain and release, cloud deployment, protocols and messaging, availability abuse, data isolation, and local application companions.

agent-run-supervision 1.2.1 carries the total agent-invocation budget, reserved validation capacity, bounded malformed-result retry, and incomplete terminal state.

`make test` passed all suites; the new run validator reported 16 runs, 21 assertions, zero failures, and zero errors. `make validate-skills`, `make check-artifacts`, `pray plan`, `pray verify`, and `pray drift` exited zero. No person-facing visual surface changed.

## Next

Consumers tree `amkisko/security-audit ~> 0.1` beside `amkisko/engineering-audit ~> 2.14`, then run `pray install`. Keep the schema at 0.x until real audits exercise migration and cross-platform behavior.

## Source

Upstream research: https://github.com/cloudflare/security-audit-skill

Live work: docs/issues/20261008100600_security-audit-workflow.md

Downstream: packages/security-audit, packages/engineering-audit, packages/agent-run-supervision, README.md, CHANGELOG.md.
