# amkisko/docs-conventions

`docs/` is the documentation entry point. It holds maintained guides and procedures with stable descriptive filenames, and working records in five timestamp trees. The trees live here to use that familiar location and to reduce the local convention people need to learn. These records keep their character: provisional findings, historical evidence, and working notes. Placement does not imply that a file is polished, current, or equally authoritative. Purpose and contents carry that information.

`usr/` is the repository workshop. It holds working tools and operational material. Named trees under it follow their own purpose; `usr/reports/`, `usr/support/`, and `usr/migrate/` are three of them. Filename under the timestamp trees: `YYYYMMDDHHMMSS_<kebab-case-title>.md`. Filename under those three workshop trees: the same timestamp kebab with the console language as the suffix. No README index in those trees. Keep absolute local paths and private data out of `docs/` and `usr/`. Project conventions that matter are executable checks; see `amkisko/infer-conventions`. Do not store those conventions as working records.

Pitch, plan, and the open queue stay inside the live-work issue.

## Purpose

issues: live work still in play. Contract, findings, open next. One file per episode.

reviews: one review episode. Session or CI scope, coverage, recommendations, and outcome. Open implementation work after the review goes to issues. What shipped goes to changelogs.

changelogs: engineering record of what shipped. Feeds `CHANGELOG.md`.

meetings: one sitting. Who was there and what they agreed that day. Open work after the sitting goes to issues. What shipped goes to changelogs.

dependencies: an upstream package misbehaved during real work. Use the headings below. Record graph audits with the dependency-audit skill.

usr: the workshop. Working tools and operational material.

usr/reports: read-only analysis and investigation console scripts. No mutations. Split from `usr/support` so a human reviewer can see risk from the path before opening the file.

usr/support: product and customer support console scripts that mutate or write. A person pastes or runs the script in a live console after review. Programmable agents may author the script and the note; they do not run it against a live process. Do not invent `usr/console` for this role.

usr/migrate: schema and data migration scripts for manual running. Paste or run in a live console when the new code is not on the process yet. Later the framework schema migrate is schema-only and idempotent.

## Template: issues, reviews, changelogs, meetings

```markdown
# Title

## Participants

- name

## Decisions

What was agreed.

## Effects

Done, failed, recovered, rolled back.

## Next

Todo, planned, open questions.

## Source

Upstream and downstream links.
```

Participants list humans only. Omit empty sections. Git history is the edit log. Add an explicit note only when a later pass changes meaning.

## Template: dependencies

```markdown
# Title

## Dependency

Name, version constraint, lockfile entry if any.

## Symptom

What breaks and where.

## Evidence

Repro steps, logs, stack traces, links.

## Suggested fix

Upgrade, pin, patch, workaround, or upstream report.

## Next

Todo, planned, open questions.

## Source

Upstream issue, PR, release note, commit, and downstream materializations.
```

Omit empty sections. Record only defects found during requested work, and only when the defect is evident from behavior or published upstream facts.
