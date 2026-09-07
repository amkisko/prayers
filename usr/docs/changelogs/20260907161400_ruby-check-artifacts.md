## Decisions

Replace usr/scripts/check_artifacts.py with a Ruby checker that uses the standard library JSON parser and git. make check-artifacts and make test call that checker. Package skill validation already ran on Ruby.

The check still requires each catalog version.artifact path to exist as a file and, inside a git work tree, to be tracked. Versions without an artifact key are skipped. A directory that is not a git work tree reports missing files and treats present files as acceptable.

No new gem. JSON, Open3, Pathname, and Set are standard library.

## Effects

Added usr/scripts/check_artifacts.rb (93 lines) and usr/scripts/check_artifacts_test.rb. Deleted usr/scripts/check_artifacts.py. Makefile check-artifacts and test targets, README publish notes, and CHANGELOG.md Unreleased name the Ruby checker.

Validation commands and observed results:

- make test: exit 0; validate_skill 13 runs, 35 assertions; check_artifacts 9 runs, 37 assertions; 0 failures.
- make check-artifacts: exit 0; check-artifacts reported ok.
- make validate-skills: exit 0; changelog-update, claims-audit, dependency-audit, engineering-audit, and rfc-process reported valid.
- make verify && make drift: exit 0; both emitted no findings.
- git diff --check && git diff --cached --check: exit 0, no diagnostics.

## Next

Publisher scripts in usr/scripts are Ruby. Historical notes still mention the system Python skill-creator validator, which remains an upstream dependency of that tool.

## Source

Prior Python catalog check: usr/scripts/check_artifacts.py in git history before this change.

Skill frontmatter already on Ruby: usr/docs/changelogs/20260907143500_skill-frontmatter-validator.md
