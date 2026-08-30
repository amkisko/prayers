# CHANGELOG

## 1.10.0 (2026-08-30)

- Add `amkisko/background-jobs` 1.0.0: shallow, idempotent workers; capture request context at enqueue; record destination failure.
- Publish `amkisko/working-rules` 2.2.0: fix the cause of a race; prefer positive names; compute at write when a read cannot paginate.
- Publish `amkisko/security` 1.2.0: ownership-set lookups; fail closed; untrusted user-supplied URLs; rate-limit authentication.
- Publish `amkisko/minimal-implementation` 1.2.0: three real uses before an abstraction; drop unused public methods.
- Publish `amkisko/finite-state-machines` 1.2.0: when who and when matter, model the event as a record.
- Publish `amkisko/keep-the-work` 1.2.0: a live refresh or reconnect must not wipe work still on the place.
- Publish `amkisko/preferred-stack` 1.4.0: label icon-only controls; hide decorative duplicates from the accessibility tree.
- Publish `amkisko/engineering-audit` 2.7.0: ownership versus parameter access; worker request-local context; destination failure versus our code; refresh that wipes in-progress work.
- Publish `amkisko/docs-conventions` 2.3.0: `usr/migrate` holds live console-first scripts for a change that must run before new code is on the process.
- Publish `amkisko/ruby-conventions` 1.1.0: page data backfills and log progress; point pre-process fills at `usr/migrate`.

## 1.9.0 (2026-08-29)

- Publish `amkisko/community-code-of-conduct` 1.2.0: name the acts (admit uncertainty, own generated code, correct politely, report harassment).
- Publish `amkisko/community-security` 1.2.0: email security details privately; keep secrets and personal data out of public-model prompts.
- Publish `amkisko/keep-the-work` 1.1.1: show the error on the requested place.
- Publish `amkisko/minimal-implementation` 1.1.1: smallest correct change.
- Publish `amkisko/publish-checks` 1.0.1: split the publish beats into separate checks.
- Publish `amkisko/finite-state-machines` 1.1.1: tries and automata for searchable vocabularies.
- Publish `amkisko/working-rules` 2.1.1: readability, structure, and clarity are product qualities.

## 1.8.0 (2026-08-29)

- Publish `amkisko/engineering-audit` 2.6.0: optional product-surface, privacy, performance, observability, security, contract, and learned-systems modes; skip when they do not apply; stay on concepts, not named frameworks.
- Publish `amkisko/dependency-policy` 3.2.0: freshness pass records libyears or equivalent lag (total, average, major-version distance) with coverage and spike results.

## 1.7.0 (2026-08-29)

- Add `amkisko/keep-the-work` 1.1.0: after a refusal, stay on the place they used and keep the work they already did.
- Publish `amkisko/preferred-stack` 1.3.0 and `amkisko/minimal-implementation` 1.1.0: point humane UX and refusal recovery at keep-the-work.
- Publish `amkisko/engineering-audit` 2.5.0: after a refusal, ask whether the person can still operate on the place they used; for every executable tree, measure memory, CPU, storage, network, and energy against a named ceiling, and ask which emissions identify a person or device.
- Publish `amkisko/security` 1.1.0: treat device fingerprints, tracking identifiers, and silent analytics marks as personal data.
- Publish `amkisko/docs-conventions` 2.2.0: keep agent traces in `usr/docs/issues`, `usr/docs/changelogs`, `usr/docs/meetings`, and `usr/docs/dependencies`. Pitch, plan, and the open queue stay in the live-work issue.
- Publish `amkisko/writing-prose` 3.3.0, `amkisko/dependency-issues` 2.1.0, and `amkisko/dependency-policy` 3.1.0: follow that layout.

## 1.6.0 (2026-08-18)

- Add `make check-artifacts`: every catalog `.praypkg` path must exist and be git-tracked.
- Publish `amkisko/engineering-audit` 2.1.0: when the system talks to external services, devices, operators, or actuators, also inspect who commands whom, interface faults, and digital versus physical state.
- Publish `amkisko/io-simulation` 1.1.0: the plant control UI covers injectable faults: unavailable, slow, valid but false, stale, protocol meaning change, partition, clock disagreement, reset, freeze, drift, duplicated command, command after timeout, reconnect replay, two authorities, and obsolete operator display.
- Publish `amkisko/finite-state-machines` 1.1.0: name both the digital machine and the physical machine when those states can split.

## 1.5.0 (2026-08-18)

- Add `amkisko/io-simulation` 1.0.0: ship a simulated plant and a control UI when the product depends on live IO from an external service.
- Publish `amkisko/writing-prose` 3.2.0: technical names use instrument and protocol words; body and organism metaphors stay out of contracts and code.
- Publish `amkisko/rfc-process` 1.2.0: RFC titles, registrar names, and identifiers follow that vocabulary.

## 1.4.0 (2026-08-18)

- Publish `amkisko/rfc-process` 1.1.0: product RFCs specify a design; version numbers belong in changelogs.

## 1.3.0 (2026-08-18)

- Add `amkisko/rfc-process` 1.0.0: RFC numbering, template, types, and statuses as a fragment plus skill.
- Publish `amkisko/writing-prose` 3.1.0: treat consecutive short sentences that only restated the same beat as a punchline stack.
- Publish `amkisko/community-contributing` 1.1.0 and `amkisko/community-governance` 1.1.0: keep the rules in plain language.

## 1.2.0 (2026-08-15)

- Remove `getting-started` and unused language packs from this repo always-on compose.
- Publish `amkisko/dependency-policy` 3.0.0: keep the stop-before-add gate in the fragment; move selection heuristics into the skill.
- Publish `amkisko/working-rules` 2.1.0 and `amkisko/collaboration-workflow` 2.1.0: point at `docs-conventions` instead of restating paths.
- Split `amkisko/changelog-update` 2.1.0: short skill pointer, procedure in `changelog-update.md`.
- Publish `amkisko/writing-prose` 3.0.0: treat ease, diversity, coherence, mechanics, and claims as separate constructs; keep agency on the person; point material claims at `claims-audit`.
- Add `amkisko/claims-audit` 1.0.0: claim hygiene fragment plus verification skill with an optional evidence bundle.
- Document compose, tree, and pray `file:` destinations in consumer examples.
- Publish `amkisko/getting-started` 1.1.0 with destination DSL guidance.

## 1.1.3 (2026-07-27)

- Bump `community-security` and `community-code-of-conduct` to 1.1.0: replace contact and security emails with `((pray:support_email))` and `((pray:security_email))` placeholders (requires pray CLI with symbol templating).

## 1.1.2 (2026-07-26)

- Add `amkisko/security` 1.0.0: Credentials and Secrets guidance for AGENTS.md (secret stores, reference-only config, no live credentials in argv, history, commits, issues, or logs).
- Publish `amkisko/working-rules` 2.0.2: move Credentials and Secrets out of working-rules into `amkisko/security` (2.0.1 briefly carried that section).

## 1.1.1 (2026-07-26)

- Publish `amkisko/docs-conventions` 2.1.1: ban local absolute paths and private material (secrets, credentials, tokens, API keys, personal private data) from `docs/` and `usr/docs/`; prefer repository-relative paths.
- Publish `amkisko/docs-conventions` 2.1.0: Participants list humans only; mention software only under Decisions, Effects, or Source when needed for execution or later analysis.

## 1.1.0 (2026-07-26)

- Add community file packages: `community-security`, `community-code-of-conduct`, `community-governance`, and `community-contributing` (exact-file exports for SECURITY.md, CODE_OF_CONDUCT.md, GOVERNANCE.md, and CONTRIBUTING.md).

## 1.0.0 (2026-07-05)

- Publish 17 shared agent guidance packages under the `amkisko` namespace.
- Add pray distribution metadata, publisher Makefile, and consumer getting-started docs.
- Normalize package naming to `amkisko/*` and remove local-machine defaults from rollout scripts.
