# amkisko/docs-conventions

`docs/` is the documentation entry point. It holds maintained guides and procedures with stable descriptive filenames, and working records in six timestamp trees. The trees live here to use that familiar location and to reduce the local convention people need to learn. These records keep their character: provisional findings, historical evidence, and working notes. Placement does not imply that a file is polished, current, or equally authoritative. Purpose and contents carry that information.

Three trees mark time. `docs/plans` holds the uncertain future: design-only notes before anyone commits to build. `docs/issues` holds the certain current: live work in play. `docs/changelogs` holds the factual past: what shipped. The names stay common and searchable; do not rename them to futures, currents, or pasts.

`usr/` is the repository workshop. It holds working tools and operational material. Named trees under it follow their own purpose; `usr/scripts/`, `usr/reports/`, `usr/support/`, `usr/migrate/`, and provisioned `usr/templates/note/` are among them. Filename under the timestamp trees: `YYYYMMDDHHMMSS_<kebab-case-title>.md`. Filename under `usr/reports/`, `usr/support/`, and `usr/migrate/`: the same timestamp kebab with the console language as the suffix. Filename under `usr/scripts/`: a stable descriptive name (not a timestamp tree). No README index in those trees. Keep absolute local paths and private data out of `docs/` and `usr/`. Project conventions that matter are executable checks; see `amkisko/infer-conventions`. A consumer workflow may check new or touched files for a missing or blank `## Participants` section. This package does not ship that check. Do not store those conventions as working records.

The open queue of committed live work stays inside the live-work issue. Design exploration that is not yet committed work goes under `docs/plans`.

## Purpose

plans: uncertain future. Design-only notes before work is committed. One file per design thread. When implementation starts, open or update an issue; what shipped goes to changelogs.

issues: certain current. Live work still in play. Contract, findings, open next. One file per episode. The open queue stays here.

reviews: one review episode. Session or CI scope, coverage, recommendations, and outcome. Open implementation work after the review goes to issues. What shipped goes to changelogs.

changelogs: factual past. Engineering record of what shipped. Feeds `CHANGELOG.md`.

meetings: one sitting. Who was there and what they agreed that day. Open work after the sitting goes to issues. What shipped goes to changelogs.

dependencies: an upstream package misbehaved during real work. Use the headings below. Record graph audits with the dependency-audit skill.

usr: the workshop. Working tools and operational material.

usr/scripts: maintainer scripts invoked from a checkout, Makefile, CI, or a runner on a named path (`bin/rails runner usr/scripts/...`, `./usr/scripts/...`). Checks, local assessment, and similar operator tools live here. Not paste-into-live-console support or migrate work. Other workshop trees such as `usr/bin` (CLI entrypoints) stay instances of the `usr/` role when named locally.

usr/reports: read-only analysis and investigation console scripts. No mutations. Split from `usr/support` so a human reviewer can see risk from the path before opening the file.

usr/support: product and customer support console scripts that mutate or write. A person pastes or runs the script in a live console after review. Programmable agents may author the script and the note; they do not run it against a live process. Do not invent `usr/console` for this role.

usr/migrate: schema and data migration scripts for manual running. Paste or run in a live console when the new code is not on the process yet. Later the framework schema migrate is schema-only and idempotent.

usr/templates/note: blank note skeletons provisioned from this package. Copy a file into the matching `docs/` timestamp tree, replace `{{title}}`, fill sections that apply, and omit empty sections. Do not hand-edit the provisioned skeletons; bump the package and re-apply.

## Consumer sync

Compose the fragment for always-on guidance. Tree the `note` folder export so skeletons stay under `usr/templates/note/`:

```prayfile
compose "AGENTS.md" do
  pray "amkisko/docs-conventions", "~> 3.7"
end

tree "usr/templates" do
  pray "amkisko/docs-conventions", "~> 3.7"
end
```

`pray install && pray plan && pray apply` writes `usr/templates/note/{plan,issue,review,changelog,meeting,dependency}.md`. The folder export destination name is the last path segment (`note`), so the tree root must be `usr/templates`, not `usr/templates/note`.

## Template: plans, issues, reviews, changelogs, meetings

Blank skeletons live under `templates/note/` in this package (and under `usr/templates/note/` after apply). Optional lines near the title:

- plans: `Design-only. Not committed work.`
- reviews: `Scope:`
- changelogs: `Intent:`
- meetings: `Date:`

Shared heading order:

```markdown
# {{title}}

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

Participants list humans only. Always name the current human operator; that person is present for every note. Solo sessions still get one Participants line. Do not omit Participants.

Take the operator name from the session display name or that person's confirmation. Do not invent a name from git configuration, commit history, filesystem paths, OS accounts, or login names.

List other humans who decided or reported in the episode when known. Do not list every person who touched related code. Problem / Fix and similar ticket outlines do not replace the five headings; map that content into Decisions and Effects.

Omit other empty sections (not Participants). Git history is the edit log. Add an explicit note only when a later pass changes meaning.

Prefer `Intent:` near the title on changelog notes. A standalone `## Intent` heading is legacy-compatible when Decisions and Effects are absent, but new notes keep the five findable headings.

## Template: dependencies

```markdown
# {{title}}

## Participants

- name

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

Always keep Participants with the current human operator. Omit other empty sections. Record only defects found during requested work, and only when the defect is evident from behavior or published upstream facts.
