# Run contract

Use a fresh run directory outside maintained documentation:

```text
run-metadata.json
coverage-ledger.json
findings.json
REPORT.md
agents/<agent-id>/artifacts/<evidence>
```

The JSON schemas under `schemas/` define the portable shape. `scripts/validate_run.rb` rejects unknown fields to match `additionalProperties: false`, and also enforces relationships the schemas cannot prove: source files and lines exist, evidence is a regular non-linked file, evidence stays under its owner's directory, candidate fingerprints and findings agree, and severity does not exceed demonstrated impact.

## Metadata

Record schema version, unique run id, immutable source reference when available, complete or incomplete status, ISO 8601 start and finish times, report path, and agent invocation budget. The budget states maximum invocations, used invocations, and capacity reserved for independent validation.

An incomplete run requires `incomplete_reason`. A complete run has no planned or blocked coverage and no finding that still needs validation. Do not convert a missing runtime, malformed worker result, exhausted budget, or unavailable checker into a successful static pass.

## Coverage ledger

One unit is one attack class over a bounded subsystem. Sort units by id. States have distinct meanings:

- `planned`: assigned scope has not started;
- `covered`: named checks ran and found no candidate;
- `candidate`: one or more fingerprints need a finding verdict;
- `blocked`: work started but a named fact or facility is missing;
- `deferred`: intentionally postponed with a reason;
- `out_of_scope`: excluded with a reason.

Only covered, candidate, and blocked units have an owner, reviewed paths, and checks. Candidate units list finding fingerprints. Blocked, deferred, and out-of-scope units state what remains unresolved.

## Finding contract

A candidate starts with the lower-trust principal, starting capability, controlled input or action, intended control, crossed boundary, affected principal or resource, source trace from entry to sink, required conditions, evidence owner, and independent validator. The validator id differs from the owner id.

Verdicts:

- `confirmed`: bounded evidence demonstrates a minimum result; assign likelihood, impact, severity, confidence, and the smallest fix at the last trusted decision;
- `needs_validation`: the path is plausible but a named blocker prevents confirmation; assign likelihood, potential impact, confidence, blockers, and a precise validation plan; never assign severity;
- `rejected`: contrary evidence disproves the candidate; state why; never assign severity.

Severity is not impact. Impact is the demonstrated consequence. Likelihood is how readily the required conditions occur. Severity ranks confirmed work and may not exceed impact. Confidence is evidence quality.

Use a stable lowercase SHA-256 fingerprint derived from attack class, boundary, canonical source location, and affected resource class. Do not include prose wording or current severity.
