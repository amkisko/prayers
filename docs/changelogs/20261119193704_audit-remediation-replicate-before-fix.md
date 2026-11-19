# Audit remediation replicate before fix

Intent: Separate audit report emission from remediation. Prefer replicated findings. Keep high-potential theories visible. Require a failing executable check before fixing an audit finding when a fix is requested.

## Participants

Andrei Makarov (@amkisko)

## Decisions

Encode a remediation-only replicate-then-fix gate for engineering-audit, security-audit, and working-rules. Audit runs stay report-only and hunt iteratively. Findings may enter the report without a product regression test. Regression guards are remediation hints when known, otherwise deferred. Replicated findings lead; high or critical potential-impact theories still output as inference or `needs_validation`; low-interest theories may be summarized or omitted. Performance remediaatio uses the named measurement and fixture as the replication check.

## Effects

- `amkisko/working-rules` 2.8.0: tests-first covers audit remediation after a fix request (kept short for the AGENTS.md byte budget; report-vs-remediation detail lives in the audit skills).
- `amkisko/engineering-audit` 2.19.0: finding pass, remediation after audit, replicated-over-theory ranking; security and performance modes aligned.
- `amkisko/security-audit` 0.1.3: iterative hunt, report ranking, deferred regression guard, remediation pointer when separately requested.

## Next

Consumers bump pins when ready, then `pray install`. Release cut when this work merges.

## Source

packages/working-rules, packages/engineering-audit, packages/security-audit.
