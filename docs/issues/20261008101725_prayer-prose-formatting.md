# Prayer prose formatting

Shared prayer and skill texts used markdown bold and tables where writing-prose requires plain prose. Agents then copied that styling into docs and investigation deliverables.

## Participants

Andrei Makarov.

## Decisions

Strip non-mandatory bold and markdown tables from package sources. Keep headings, backticks for technical names, YAML frontmatter, code fences, and bullet lists. Investigation-report voice follows writing-prose: no markdown tables, bold, or italic; multi-field rows use labeled bullets. HTML report prefers lists over tables for the same facts.

Bump versions: public-surface-recon 1.3.0, docs-conventions 3.1.1, dependency-issues 3.0.1, dependency-policy 4.1.1, engineering-audit 2.14.1, changelog-update 3.0.1, agent-discovery 1.0.1, agent-artifact 1.2.1. Consumer README pin for public-surface-recon moves to ~> 1.3.

State in `.agents/project.md` that package prayer sources are not exempt: fragments, skill bodies, prompt templates, and `prayers/` files follow writing-prose and docs-conventions plain-prose formatting; deliverable templates must not teach bold or table scaffolding.

writing-prose 3.7.0 and project.md also forbid special Unicode punctuation for structure (arrows, em dashes, ellipsis characters, not-equal signs, curly quotes, section signs). Prefer keyboard ASCII (`->`, `-`, `...`, `!=`, straight quotes) or plain words. Pipelines are numbered or bulleted lists, not glyph diagrams. Replace those characters across package markdown; rewrite public-surface-recon typical pipeline as a numbered list (`public-surface-recon` 1.3.2). Consumer README pin for writing-prose moves to ~> 3.7. Observed: make publish/install/apply, validate-skills, check-artifacts, and make test passed after the keyboard-ASCII pass; packages markdown re-scan showed 0 leftover non-ASCII punctuation.

No product screen changed. Visual-surface assessment skipped.

## Effects

Package sources under packages/ updated. CHANGELOG Unreleased, README consumer pin for public-surface-recon ~> 1.3, this note, and docs/changelogs/20261008101725_prayer-prose-formatting.md added. Catalog artifacts published for the bumped versions. AGENTS.md and .agents/skills refreshed via pray install/apply. Re-scan of packages markdown (README excepted, code fences and YAML frontmatter stripped): 0 leftover body bold or table rows. AGENTS.md no longer embeds bold Participants/Decisions section names. `.agents/project.md` states that prayer package sources follow writing-prose and docs-conventions plain-prose formatting; make apply refreshed the Shared instructions block in AGENTS.md (AGENTS.md 21,676 bytes after that pass).

Validation commands and observed results:

- make validate-skills: exit 0; public-surface-recon and other skills valid
- make publish PRAY from cargo: exit 0; catalog and .praypkg for bumped versions
- make install / apply / verify with same PRAY: exit 0; packages at bumped versions from path
- make check-artifacts after git add of new .praypkg files: ok
- make test: exit 0; validate_skill 13/46, check_artifacts 9/37, catalog_topics 8/33, security_audit_run 14/19
- make drift: exit 0
- git diff --check and git diff --cached --check: exit 0

`check_prayer_prose` later fixed so failure line numbers match the original file after closed YAML frontmatter and closed code fences. Added regression coverage for frontmatter and post-fence bold lines. Observed: `ruby usr/scripts/check_prayer_prose_test.rb` 8 runs, 25 assertions, exit 0; `make check-prayer-prose` exit 0.

## Next

Consumers bump pins and pray install. Commit and open pull request when asked.

## Source

Upstream: packages/writing-prose, audit of packages markdown for bold and tables. Downstream: packages listed in Decisions, CHANGELOG.md Unreleased, README.md consumer example.
