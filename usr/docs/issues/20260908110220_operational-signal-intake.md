# Operational signal intake

## Decisions

- Add a skill-only package for provider-neutral intake of live service evidence. Do not add an always-on fragment to the shared compose budget.
- Separate the observed condition, its established or possible consequences, and causal hypotheses. A signal may support a security or reliability investigation; it does not by itself prove a vulnerability, attack, root cause, or user harm.
- Treat availability degradation as an observable consequence. Require separate evidence before attributing it to a denial-of-service attack.
- Include telemetry confidentiality, integrity, availability, and detection gaps in the intake because the signal path may expose data, accept misleading input, consume resources, or create false quiet.
- Keep provider locations and commands in consumer project context. The shared skill names source roles and concepts only.
- Route full security, dependency, performance, resource, observability, privacy, contract, and product-surface work to the existing audit skills.

## Effects

- Added `amkisko/operational-signal-intake` 1.0.0 with an evidence model and security, reliability, and user-consequence reference.
- Updated engineering-audit observability guidance and bumped that package to 2.7.2.
- Added the new skill to the publisher Prayfile and consumer example.
- `make validate-skills` accepted all six packaged skills, including operational-signal-intake.
- `rbenv exec ruby usr/scripts/validate_skill_test.rb` passed 13 runs and 36 assertions. `rbenv exec ruby usr/scripts/check_artifacts_test.rb` passed 9 runs and 37 assertions.
- `make package PACKAGE_DIR=packages/operational-signal-intake` built an archive containing only the declared manifest, README, skill, and two references; the scratch archive was moved outside the repository after inspection.
- `make install` resolved 26 local packages, updated engineering-audit to 2.7.2, installed operational-signal-intake 1.0.0, and provisioned its skill files. `make plan` then reported everything up to date. `make verify` and `make drift` exited successfully. `rbenv exec ruby usr/scripts/check_artifacts.rb ./prayers` reported `check-artifacts: ok`.
- Catalog publish for prayers 1.14.0 wrote artifacts for operational-signal-intake 1.0.0 and engineering-audit 2.7.2. See usr/docs/changelogs/20260908114024_prayers-1-14-0.md.

## Next

- Tag v1.14.0 after merge to main.
- Consumers can tree `amkisko/operational-signal-intake` ~> 1.0 and map its source roles to their available services in project-specific context.

## Source

- NIST SP 800-61 Rev. 3: https://doi.org/10.6028/NIST.SP.800-61r3
- NIST Cybersecurity Framework 2.0: https://doi.org/10.6028/NIST.CSWP.29
- NIST denial-of-service glossary: https://csrc.nist.gov/glossary/term/denial_of_service
- MITRE CWE-400: https://cwe.mitre.org/data/definitions/400.html
- Google SRE monitoring guidance: https://sre.google/sre-book/monitoring-distributed-systems/
- OpenTelemetry signals and security guidance: https://opentelemetry.io/docs/concepts/signals/ and https://opentelemetry.io/docs/security/
