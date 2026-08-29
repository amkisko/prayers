# Keep the work and engineering audit

## Participants

- amkisko

## Decisions

Ship keep-the-work as its own fragment (renamed from unpublished humane-ui). Point preferred-stack and minimal-implementation at it. Keep it out of this publisher always-on compose.

engineering-audit 2.2.0 through 2.4.0 add place-after-refusal catches, then resource and budget mode with the exceptional when-clause, then the fifth catch for a deep link that replaces in-progress work. preferred-stack 1.3.0 Related is one clause.

engineering-audit 2.5.0 inverts resource mode to every executable tree, always names energy or a proxy, adds shared-hardware contention, and adds trace and identification with RFC 6973 section 7.1. Skip only when the tree never becomes executed bytes. Do not paste GDPR, ATT, SCI formula, Kubernetes, or resctrl as house law.

security 1.1.0 adds always-on tracking and identification cautions to the credentials fragment: device fingerprints versus redacted secret hashes; identifiers as personal data; silent analytics and leftover marks as security events.

docs-conventions 2.2.0 keeps usr/docs/issues, usr/docs/changelogs, usr/docs/meetings, and usr/docs/dependencies. Purpose and templates are in the package README. Pitch, plan, and the open queue stay in the live-work issue. writing-prose 3.3.0, dependency-issues 2.1.0, and dependency-policy 3.1.0 follow that layout. Product changelog stays 1.7.0 because this pass was never committed as 1.8.0 through 1.12.0.

## Effects

Source packages: keep-the-work 1.0.0 and 1.1.0, preferred-stack 1.1.0 through 1.3.0, minimal-implementation 1.1.0, engineering-audit 2.2.0 through 2.5.0, security 1.1.0, docs-conventions 2.2.0, writing-prose 3.3.0, dependency-issues 2.1.0, dependency-policy 3.1.0. CHANGELOG.md 1.7.0. README catalog example bumped for those constraints. Removed packages/humane-ui and its catalog artifacts.

make package PACKAGE_DIR=packages/engineering-audit produced amkisko-engineering-audit-2.5.0.praypkg. After second-round patches, same version rebuilt in place at 7084 bytes (2026-08-29 11:47). Related-sentence patch for security.md naming rebuilt the same 2.5.0 artifact at 7084 bytes (2026-08-29 11:58).

make package PACKAGE_DIR=packages/security produced amkisko-security-1.1.0.praypkg at 1360 bytes. Fragment is 1424 bytes (over the 1 KB prefer line, under the 2 KB hard line). make publish, then unrelated catalog published_at stamps restored from a pre-publish snapshot, keeping security.json and engineering-audit.json. make apply used amkisko/security 1.1.0 from path; AGENTS.md 16312 bytes (72 bytes under 16 KiB). make verify exit 0. make drift exit 0. make check-artifacts after git add of the 1.1.0 praypkg.

This episode now has one issues file and this changelog. Deleted usr/docs/ideas, usr/docs/plan, and usr/docs/tasks for this basename, and the August 18 tasks files whose Next items already shipped. Restored usr/docs/meetings and usr/docs/dependencies as named trees; templates are in packages/docs-conventions/README.md.

make package for docs-conventions, writing-prose, dependency-issues, and dependency-policy rebuilt 2.2.0 (2152 bytes), 3.3.0 (1277 bytes), 2.1.0 (1356 bytes), and 3.1.0 (7020 bytes) in place. docs-conventions fragment is 1636 bytes (over the 1 KB prefer line, under the 2 KB hard line). make apply used those from path; AGENTS.md 16305 bytes (79 bytes under 16 KiB). make verify exit 0. make drift exit 0. make publish, then unrelated catalog published_at stamps restored from a pre-publish snapshot, keeping the four rebuilt catalog files. make check-artifacts after git add of the unpublished praypkg files.

Later pass: prose and consistency audit. Rebuilt docs-conventions 2.2.0 (2078 bytes), writing-prose 3.3.0 (1269 bytes), and dependency-issues 2.1.0 (1335 bytes) in place. docs-conventions fragment is 1667 bytes. make apply: AGENTS.md 16328 bytes (56 under 16 KiB). make verify exit 0. make drift exit 0. make publish, then 24 unrelated catalog files restored from a pre-publish snapshot, keeping the three rebuilt catalogs. make check-artifacts ok after git add of those three praypkg files.

## Next

Consumers bump docs-conventions ~> 2.2, writing-prose ~> 3.3, dependency-issues ~> 2.1, dependency-policy ~> 3.1, keep-the-work ~> 1.1, preferred-stack ~> 1.3, engineering-audit ~> 2.5, security ~> 1.1. README skip remains a recorded low for the next unpublished rebuild.

## Source

Upstream: usr/docs/issues/20260828143210_keep-the-work-and-engineering-audit.md
Downstream: CHANGELOG.md 1.7.0, README.md catalog, packages/keep-the-work, packages/engineering-audit 2.5.0, packages/security 1.1.0, packages/docs-conventions 2.2.0, packages/writing-prose 3.3.0, packages/dependency-issues 2.1.0, packages/dependency-policy 3.1.0
