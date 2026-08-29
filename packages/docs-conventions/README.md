# amkisko/docs-conventions

Human docs live under `docs/`. Durable agent and engineering trace lives under `usr/docs/` in four timestamp trees. Filename: `YYYYMMDDHHMMSS_<kebab-case-title>.md`. No README index in those trees. Keep absolute local paths and private data out of both trees.

Pitch, plan, and the open queue stay inside the live-work issue.

## Purpose

issues: live work still in play. Contract, findings, open next. One file per episode.

changelogs: engineering record of what shipped. Feeds `CHANGELOG.md`.

meetings: one sitting. Who was there and what they agreed that day. Open work after the sitting goes to issues. What shipped goes to changelogs.

dependencies: an upstream package misbehaved during real work. Use the headings below. Record graph audits with the dependency-audit skill.

## Template: issues, changelogs, meetings

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
