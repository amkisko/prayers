---
name: change-review
description: >-
  Review a git diff with file coverage, path-matched criteria, and
  falsify-before-report. Use when asked to review a pull request, a
  commit, or a working-tree diff. Do not use for a whole-tree
  engineering audit, session retrospective, or live service intake.
---

# Change review

Review the changed files in a diff. This skill does not replace `engineering-audit`. It owns coverage of the change, not the whole tree.

## Quick reference

```text
list changed files → mark skips → path-matched criteria → read the file → cite existing lines → falsify against the diff → report
```

## Coverage

Account for every changed file. Mark skipped files with a reason. Report coverage. Do not stop after the first high finding.

Read the file. Cite line ranges that exist in the current tree. A finding that cannot be placed is inference or artifact-missing.

Use path-matched criteria. Do not dump every language checklist into one prompt.

## Falsify

Falsify each finding against the diff alone before reporting. Drop a finding the diff contradicts. Confirm concurrent invocation before a race. Confirm attacker control before a security finding.

Do not restate what formatters, linters, and compilers already catch. Missing tests remain a defect.

## Kinds

Use observed, inference, or artifact-missing as the evidence kind. When security mode is also in scope, add the disposition defined by `engineering-audit` security mode.

## Record

Write durable findings under `docs/issues` when the review is more than a chat pass. Follow `docs-conventions`. The chat report may be compact; the file stays plain prose.

## Routing

- `engineering-audit` for whole-tree, pipeline, or product-mode review.
- `claims-audit` when the diff states material external facts.
- `publish-checks` before a pull request.
- `session-review` for transcripts, not diffs.

When a named skill is unavailable, preserve the finding and name the deeper review.
