# Engineering-audit input and mutation

## Participants

- amkisko

## Decisions

Name ingress and mutation assessment in engineering-audit security review mode. Double-check means trusted-layer allowlist after one canonical decode, then a distinct check at the write. Scanner product names stay out of the prayer. Always-on security fragment unchanged.

## Effects

engineering-audit 2.9.0 adds named input and mutation classes, ingress and write inventories, AST-search candidate listing, and extra-field persist proof. contracts.md counts extra-field persist. Core pipeline notes untrusted cache keys and extra-column writes.

make package, make publish, restore of public-surface-recon restamp, make install, make plan, make apply, make verify, make drift, and make check-artifacts all exited 0. Artifact sha256:1181ddd9aa398ef8fd62fd0ce970196b0f5f64c568a0aec56868333ae700b6e7. AGENTS.md stayed 16317 bytes. make test: 13 plus 9 runs, 0 failures.

## Next

Consumers bump amkisko/engineering-audit ~> 2.9, then pray install. Tag v1.18.0 after merge to main.

## Source

Upstream: docs/issues/20260914171500_input-and-mutation-assessment.md
Downstream: CHANGELOG.md 1.18.0, packages/engineering-audit 2.9.0
