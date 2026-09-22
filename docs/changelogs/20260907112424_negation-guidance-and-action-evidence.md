## Decisions

The user approved the research recommendations. Clarify prose review so necessary negative answers, prohibitions, scope, and uncertainty survive editing. Require observed evidence when reporting completed actions.

Updated writing-prose 3.4.0 and working-rules 2.3.0. Aligned engineering-audit 2.7.1 and changelog-update 2.1.1 with the necessary-negation rule. Distribution notes are under CHANGELOG.md 1.13.0.

Package sources own these changes. Prayfile already references their local paths, so its declarations remain sufficient. Regenerated AGENTS.md, provisioned skills, and Prayfile.lock with make install.

## Effects

The writing-prose fragment remains 1,241 bytes. The completed-action rule saves 11 bytes. AGENTS.md is 16,311 bytes, leaving 73 bytes below the 16 KiB house ceiling.

The four package versions were built and published to the local prayers catalog. Restored 21 unrelated catalog files after checking that their changes were limited to timestamps and JSON serialization. New artifact sets are staged because check-artifacts requires tracked files. No commit, tag, remote push, or remote publication ran.

make install emitted a warning about local edits outside managed spans. Inspection of the generated AGENTS.md diff showed only the two intended managed fragments changed; the unmanaged introduction was preserved. The subsequent plan reports everything up to date.

Validation commands and observed results:

- make verify && make drift && make check-artifacts: baseline exit 0; check-artifacts reported ok.
- make package PACKAGE_DIR=packages/writing-prose: exit 0.
- make package PACKAGE_DIR=packages/working-rules: exit 0.
- make package PACKAGE_DIR=packages/engineering-audit: exit 0.
- make package PACKAGE_DIR=packages/changelog-update: exit 0.
- make publish: exit 0; updated the local catalog and artifact sets.
- make install: exit 0; resolved four new versions, updated the lockfile, AGENTS.md, and two provisioned skill files.
- make plan && make verify && make drift && make check-artifacts: exit 0; plan reported everything up to date, verify and drift emitted no findings, check-artifacts reported ok.
- cmp packages/changelog-update/skills/changelog-update/changelog-update.md .agents/skills/changelog-update/changelog-update.md: exit 0.
- cmp packages/engineering-audit/skills/engineering-audit/engineering-audit.md .agents/skills/engineering-audit/engineering-audit.md: exit 0.
- wc -c AGENTS.md: 16,311 bytes, exit 0.
- wc -c packages/writing-prose/exports/writing-prose.md: 1,241 bytes, exit 0.
- git diff --check && git diff --cached --check: exit 0, no diagnostics.

The system skill-creator commands below both exited 1 before validation because Python could not import yaml. The placeholder identifies the installed skill location without recording a machine-specific path.

- python3 <skill-creator>/scripts/quick_validate.py packages/engineering-audit/skills/engineering-audit
- python3 <skill-creator>/scripts/quick_validate.py packages/changelog-update/skills/changelog-update

Fallback: an inline ruby -ryaml invocation parsed both SKILL.md frontmatter mappings with YAML.safe_load and checked their names and nonempty descriptions. Both passed, exit 0. This checks metadata; it does not replace every quick-validator check. The unchanged entrypoints and references were inspected, and native package builds completed.

An inline python3 invocation compared each changed catalog's historical version objects to git show HEAD:<catalog> and computed hashlib.sha256 over each new artifact. All four historical lists were unchanged and all four artifact hashes matched their catalog entries, exit 0.

No executable logic changed, so no test suite or text-matching tests were added or run. The instruction changes were reviewed for retaining necessary negatives and uncertainty. Their effect on model output has not been experimentally measured.

## Next

Local package skill frontmatter checks now run through make validate-skills. The upstream system validator still needs PyYAML or a stdlib parser; this repository no longer depends on it for those checks. See usr/docs/changelogs/20260907143500_skill-frontmatter-validator.md.

## Source

Research and user approval context: usr/docs/issues/20260907111611_negation-guidance-claims-review.md.

Existing validator issue and suggested fix: usr/docs/dependencies/20260905124000_skill-validator-pyyaml.md.

Package source paths: packages/writing-prose, packages/working-rules, packages/engineering-audit, packages/changelog-update. Generated distribution: prayers/v1/packages/amkisko and prayers/v1/artifacts/amkisko. User-facing notes: CHANGELOG.md 1.13.0.
