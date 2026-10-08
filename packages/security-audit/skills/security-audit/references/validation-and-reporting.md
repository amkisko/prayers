# Validation and reporting

## Independent validation

The checker did not discover the candidate. Give the checker the source reference, candidate contract, trace, evidence locators, and relevant contrary controls. Do not give it the finder's conclusion as an instruction.

Try to falsify in this order:

1. the lower-trust principal cannot reach the entry;
2. canonicalization changes the claimed input;
3. authentication, authorization, tenant, or state policy blocks the path;
4. propagation does not reach the sink;
5. the sink is not sensitive in the claimed context;
6. required conditions are impossible or materially narrower;
7. the observed result came from the fixture, mock, or environment rather than the product.

The validator may reduce scope, impact, likelihood, severity, or confidence. It may reject the candidate. It does not raise severity beyond demonstrated impact.

## Report

Lead with run status and scope. Then report confirmed findings in descending severity, impact, confidence, and fix cost. Keep findings needing validation separate from confirmed work. Summarize rejected candidates only when retaining them avoids repeated work.

Every confirmed finding includes the finding contract, evidence kind, observed minimum result, affected versions or configurations when known, smallest fix, and a regression guard. State unreviewed and blocked areas explicitly.

Do not claim absence of vulnerabilities. Say which attack classes and paths were covered at the recorded source reference. A complete run means its ledger is internally accounted for, not that the product is secure.

Run the artifact validator after writing the report. Record the exact command and result. Review the final prose for claims that outrun evidence, accidental secrets, private locators, exploit detail that exceeds the audience's need, and fixes that move the control away from the last trusted decision.
