---
name: derivation-audit
description: >-
  Audit formal claims, registered checks, and symbolic derivation scope.
  Use when asked to review a computer-algebra derivation, a paper
  proposition, or a solver-backed proof. Do not use for ordinary prose
  claims, a whole-tree engineering audit, or a contest paper workflow.
---

# Derivation audit

Review a formal claim and the checks that claim to support it. This skill does not replace `claims-audit`. It owns identity, implication, registered rows, and solver scope when a consumer asks for that job by name.

The consumer owns the executable and the style exemplar. Stay on concepts. Do not name a computer algebra system.

## Quick reference

```text
keep statement domain quantifiers → classify the claim → inspect registered checks → treat solver output → record unresolved
```

## Claim classes

Keep the statement, the domain, and the quantifiers. Distinguish:

- identity;
- equivalent solution sets;
- one-way implication.

A numeric example does not replace a quantified claim. Solver or test order is not uniqueness. When a condition is rewritten, show both sides and the domain of the rewrite.

## Registered checks

A Boolean check table certifies only its registered rows. A nonempty table is not a proof of the surrounding proposition. Completeness, consistency, and quality are different questions.

A green gate certifies the assertions it ran, not the surrounding product claim. Missing runtime is not a successful static pass.

## Solver output

Timeout, unevaluated output, and a failed solver check stay unresolved until a counterexample or a closed proof exists. Do not treat an unresolved result as a refutation.

A cited standard or theorem used as support needs a recorded statement with its hypotheses, not a name-drop.

## Freeze

Quantities that come from the derivation stay unverifiable until they are frozen from the producing artifact. Do not hand-edit the freeze. A later file does not prove an earlier gate.

## Record

Write durable findings under `docs/issues` per `docs-conventions`. Outcomes follow `claims-audit`: supported, partially supported, unsupported, outdated, contested, unverifiable. Add unresolved when the solver did not close the claim.

## Routing

- `claims-audit` for documentary facts, quotations, and freeze of prose quantities.
- `engineering-audit` when the surrounding product claim is a green test gate.
- `rfc-process` when an RFC states a theorem; reuse these statuses only when that RFC asks.

When a named skill is unavailable, preserve the finding and name the deeper review.
