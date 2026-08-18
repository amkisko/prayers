# CHANGELOG

## Unreleased

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
