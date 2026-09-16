# Docs working records

Live work. Move issues, changelogs, meetings, and dependency records under docs/. usr/ is the workshop for working tools and operational material.

## Participants

- amkisko

## Decisions

Move the four timestamp trees into docs/ so the familiar documentation entry point holds both maintained explanations and working records. That placement reduces the local convention people need to learn. Placement does not imply polish, currency, or equal authority. Purpose and contents carry that information.

Leave usr/docs undefined. usr/ is the workshop for working tools and operational material. Named trees under it are examples of that role, not a closed list of forms.

Do not add docs/shared in this pass. A further boundary can wait until use exposes friction.

Consumers treat this as a breaking layout change: docs-conventions 3.0.0, dependency-issues 3.0.0, changelog-update 3.0.0, with matching path updates in writing-prose, working-rules, collaboration-workflow, claims-audit, engineering-audit, and dependency-policy.

## Effects

Timestamp trees in this repository now live under docs/issues, docs/changelogs, and docs/dependencies. Package sources no longer name usr/docs. usr/scripts and usr/migrate guidance is unchanged.

Validation commands and observed results:

- make test: exit 0; validate_skill 13 runs, 38 assertions; check_artifacts 9 runs, 37 assertions; 0 failures. First sandbox run failed two check_artifacts cases with git init Operation not permitted in tmpdir; rerun with full permissions passed.
- make validate-skills: exit 0; changelog-update, claims-audit, dependency-audit, engineering-audit, infer-conventions, operational-signal-intake, public-surface-recon, rfc-process each reported valid.
- make apply && make verify: exit 0; Prayfile.lock updated to the bumped path packages; AGENTS.md 16287 bytes; seven provisioned skill files updated. AGENTS.md contains no usr/docs path.

Catalog publish did not run. prayers/v1 artifacts still hold the previous package versions.

Later pass: packages/docs-conventions/README.md now states the motivation. The trees live under docs/ to use that familiar location and to reduce the local convention people need to learn. usr/ is the workshop for working tools and operational material. Named trees such as usr/migrate are instances, not the type.

## Next

Run make publish or make release so the catalog carries the new versions. Consumers bump the packages above, then pray update, plan, apply. Move existing timestamp trees into docs/. Tag v1.19.0 after merge to main.

## Source

User request to relocate the usr/docs convention under docs/ while keeping usr/ for operational material. Prior layout: docs/changelogs/20260710172200_usr-docs-layout.md.
