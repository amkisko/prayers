# Docs working records

Live work. Move issues, changelogs, meetings, and dependency records under docs/. usr/ is the workshop for working tools and operational material.

## Participants

- amkisko

## Decisions

Move the four timestamp trees into docs/ so the familiar documentation entry point holds both maintained explanations and working records. That placement reduces the local convention people need to learn. Placement does not imply polish, currency, or equal authority. Purpose and contents carry that information.

Leave usr/docs undefined. usr/ is the workshop for working tools and operational material. Named trees under it are examples of that role, not a closed list of forms.

Do not add docs/shared in this pass. A further boundary can wait until use exposes friction.

Consumers treat this as a breaking layout change: docs-conventions 3.0.0, dependency-issues 3.0.0, changelog-update 3.0.0, with matching path updates in writing-prose, working-rules, collaboration-workflow, claims-audit, engineering-audit, and dependency-policy.

Later pass, 2026-09-22: merge onto main after 1.21.0. Versions that already shipped with other content moved forward: writing-prose 3.6.0, working-rules 2.6.0, claims-audit 1.2.0, engineering-audit 2.11.0. Path-dependent skills added after the feature branch also point at docs/ timestamp trees: session-review 1.1.0, change-review 1.1.0, agent-artifact 1.1.0, derivation-audit 1.1.0, agent-run-supervision 1.1.0. Product release is 1.22.0.

## Effects

Timestamp trees in this repository now live under docs/issues, docs/changelogs, and docs/dependencies. Package sources no longer name usr/docs. usr/scripts and usr/migrate guidance is unchanged.

Validation commands and observed results:

- make test: exit 0; validate_skill 13 runs, 38 assertions; check_artifacts 9 runs, 37 assertions; 0 failures. First sandbox run failed two check_artifacts cases with git init Operation not permitted in tmpdir; rerun with full permissions passed.
- make validate-skills: exit 0; changelog-update, claims-audit, dependency-audit, engineering-audit, infer-conventions, operational-signal-intake, public-surface-recon, rfc-process each reported valid.
- make apply && make verify: exit 0; Prayfile.lock updated to the bumped path packages; AGENTS.md 16287 bytes; seven provisioned skill files updated. AGENTS.md contains no usr/docs path.

Later pass, 2026-09-22: catalog publish wrote fourteen new artifact sets. AGENTS.md is 19,782 bytes. Product changelog is 1.22.0. Record: docs/changelogs/20260922121638_prayers-1-22-0.md.

Later pass: packages/docs-conventions/README.md now states the motivation. The trees live under docs/ to use that familiar location and to reduce the local convention people need to learn. usr/ is the workshop for working tools and operational material. Named trees such as usr/migrate are instances, not the type.

## Next

Tag v1.22.0 after merge to main. Consumers bump the packages above, then pray update, plan, apply. Move existing timestamp trees into docs/ in each consumer repository.

## Source

User request to relocate the usr/docs convention under docs/ while keeping usr/ for operational material. Prior layout: docs/changelogs/20260710172200_usr-docs-layout.md.
