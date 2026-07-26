# CHANGELOG

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
