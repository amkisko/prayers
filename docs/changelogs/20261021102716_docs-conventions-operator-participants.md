# docs-conventions operator Participants

## Participants

- Andrei Makarov

## Decisions

The Participants section remains limited to humans. New notes name the current operator when the current session provides their display name or that person confirms it. Solo sessions still get one Participants line.

If the current operator cannot be identified without inference, the note omits Participants. Git configuration, commit history, filesystem paths, OS accounts, and login names do not establish who operated the current session.

Other humans who decided or reported in the episode are listed when known. Every past code touch is out of scope.

Problem / Fix and similar ticket outlines do not replace the five headings. A consumer workflow that always supplies a confirmed operator identity may enforce Participants through `infer-conventions`; this package documents that option and does not ship the check.

Package `amkisko/docs-conventions` 3.4.0 added the Participants requirement and an identity inference chain. A prose-audit pass removed that chain and bumped the corrected package to 3.4.1 before prayers 1.28.0.

## Effects

Updated `packages/docs-conventions` export, README, and prayspec. Recorded the work under `docs/issues/20261021102716_docs-conventions-participants-omitted.md`. `CHANGELOG.md` 1.28.0 names 3.4.1.

Validation:

- `RBENV_VERSION=3.4.10 make test`: 61 runs, 180 assertions, 0 failures, 0 errors.
- `RBENV_VERSION=3.4.10 make PRAY=pray release`: stopped before publish because that rbenv version did not provide `pray`.
- `RBENV_VERSION=3.4.6 pray --version`: stopped before the CLI loaded because the user gem path contained a `date` extension built for Ruby 3.4.10.
- `RBENV_VERSION=3.4.10 make PRAY=<installed-pray> release`: published docs-conventions 3.4.1, rewrote catalog topics, updated Prayfile.lock and AGENTS.md, and passed verify. The final artifact check reported the expected untracked 3.4.1 archive. The machine-specific executable path is omitted from this repository note.
- `git add prayers/v1/artifacts/amkisko/docs-conventions/3.4.1/amkisko-docs-conventions-3.4.1.praypkg` followed by `RBENV_VERSION=3.4.10 make check-artifacts`: exit 0, `check-artifacts: ok`.
- `pray drift` with the installed Cargo executable: exit 0, no drift output. The machine-specific executable path is omitted.

## Next

Review and commit the release preparation, then tag prayers 1.28.0. Consumers run `pray update`, `pray plan`, and `pray apply` after the release. Open live-work notes may be backfilled when the operator is known. A later session review may check whether omissions recur after consumers install 3.4.1.

## Source

docs/issues/20261021102716_docs-conventions-participants-omitted.md
Prior: docs/changelogs/20260726221452_docs-conventions-human-participants.md
