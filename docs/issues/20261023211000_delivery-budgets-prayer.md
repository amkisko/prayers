# Delivery budgets as a shared prayer

## Participants

- Andrei Makarov

## Decisions

Encode continuous ship-path size and build-timing budgets as `amkisko/delivery-budgets`, a compose fragment. Treat the local CI gate as mandatory for products that ship bytes. Keep ingest dashboards optional. Do not put project budgets, registry hosts, or workflow paths in the prayer.

Size and timing stay sibling signals with a shared when/where environment object. Without started_at, finished_at, repository, and run identity, samples are not comparable across runners.

Distinguish from `engineering-audit` resource and budget mode: that mode is an audit pass over utilization. This fragment requires ongoing CI fail-closed budgets on the artifacts the product actually ships.

## Effects

Research from a Rails plus Flutter plus Docker product that already gates store uploads and container images, then split Ruby/Rails path sizes inside images, then added build timing and when/where fields for ingest. Duplicate CI workflows for docker-only versus flutter-only gate unit tests were merged into one artifact-size workflow.

Package published into the local catalog as `amkisko/delivery-budgets` 1.0.0. README consumer example includes the compose pin. CHANGELOG.md 1.31.0 cut. Validation evidence in docs/changelogs/20261023211000_delivery-budgets.md.

## Next

- Commit on `trunk/1.31.0-delivery-budgets`, open PR, merge to `main`, tag `v1.31.0`.
- Consumers compose `amkisko/delivery-budgets ~> 1.0` and keep concrete budgets in-repo.
- Optional later: short skill for wiring budget YAML and report kinds; keep the fragment under the compose size budget.

## Source

Consumer research and first implementation lived in a product tree that ships mobile store uploads and Docker images. External reporting and analysis system ingest contract for `artifact_size_report` and `build_timing_report` is a separate upstream dependency note in that tree. engineering-audit resource-and-budget.md. ci-review README.
