# Infer conventions

Live work. Skill text is inference input: resource, trace, and boundary modes skipped because these files never become executed bytes and there is no plant.

## Participants

- amkisko

## Decisions

Add a skill-only package that finds how a tree actually writes. Do not compose it into AGENTS.md.

The skill documents reality. It does not propose a better pattern. Majority style is the convention. Skip form an active formatter, linter, or codemod already owns. Encode a deliberate hold by changing that tool so the other form fails. Encode decisions, not framework defaults. Encode architecture presence and deliberate absence so a new layer fails the suite.

A convention needs at least three consistent examples and no meaningful rival. Mixed styles are a reported split, not an encoded winner, unless a stable path or context boundary explains both and the check is scoped to those paths. Default is confirm with the person. Encode without asking only when the invocation said to. Conflicts still go to the person.

Later pass: the shipped artifact is an executable check, not agent markdown. Prefer, in order: configure an already-installed formatter or linter; add a test in the existing suite; add a CI path filter or pack boundary the tree already uses. A new check tool is a dependency-policy stop. Do not write .agents/conventions/ files. If no executable can fail closed, say so and stop.

Later pass: always-on pointers. working-rules: sibling files and executable checks beat shared defaults; mixed styles stay a split until a path boundary explains both. minimal-implementation: match the tree's structural height; a consistent absence of a layer is a convention. docs-conventions: conventions that matter fail a command. collaboration-workflow: when encoding how this tree writes, use infer-conventions. Existing fragment text was shortened so AGENTS.md stays under 16 KiB. Tree infer-conventions from the root README; do not compose the skill.

Language-specific checklists stay out of v1. Genuine-fork families stay conceptual. Consumer overlays keep framework names.

## Effects

Source package added: infer-conventions 1.0.0. Fragment bumps: working-rules 2.4.0, minimal-implementation 1.4.0, docs-conventions 2.4.0, collaboration-workflow 2.3.0. Product changelog 1.17.0. AGENTS.md 16317 bytes, 67 under 16 KiB.

First catalog write used convention markdown as the output. Later pass replaced that with executable checks and rebuilt the 1.0.0 artifact. Later pass added always-on pointers and published the four fragment versions. Unrelated public-surface-recon restamps were restored from HEAD after each make publish. No commit, tag, remote push, or remote publication ran.

Validation commands and observed results after the fragment pass:

- make apply: exit 0; AGENTS.md updated to 16317 bytes.
- make test: exit 0; validate_skill 13 runs, 38 assertions; check_artifacts 9 runs, 37 assertions; 0 failures.
- make verify && make drift && make check-artifacts: exit 0; check-artifacts reported ok after git add of the new artifact sets.
- Artifact hashes: infer-conventions 1.0.0 sha256:b65c8d3d1e4d6495f0e65693a65fc5e0f2310d9b5ab34890f044a4ca4e8263e5; working-rules 2.4.0 sha256:c796b2c722e7ad2b7b7e1d213eb8475c961c46171073dd95350fd9f83614fc00; docs-conventions 2.4.0 sha256:35e0aed0abd5ba32c4106557fea41383ef12c9f5962b5192d01d7527ee3bfba8; minimal-implementation 1.4.0 sha256:b8f51dfca51e3f81bf78ec3780335e9e45b39f16c0d207cbcabb15124e3c1e49; collaboration-workflow 2.3.0 sha256:21c89e9a76bd06ec4ab19677b064289711776c223fa33b704c69e688ea477bd1.

## Next

Consumers tree amkisko/infer-conventions ~> 1.0, then pray install. Encode approved forks as checks in the consumer tree. Tag v1.17.0 after merge to main.

## Source

Upstream: packages/infer-conventions. Downstream: CHANGELOG.md 1.17.0, prayers/v1 catalog infer-conventions 1.0.0.
