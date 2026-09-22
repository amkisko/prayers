## Decisions

Replace the system Python skill validator for this repository. Package skill frontmatter is parsed with the Ruby standard library YAML parser. That parser does not require PyYAML.

The check covers SKILL.md presence, a YAML mapping, a hyphen-case name at most 64 characters, and a nonempty description at most 1024 characters. Extra frontmatter keys are allowed. Extra files in a skill directory are allowed.

make validate-skills runs the check over packages/*/skills/*. make test runs the validator specs. make release runs validate-skills before publish.

## Effects

Added usr/scripts/validate_skill.rb (104 lines) and usr/scripts/validate_skill_test.rb (185 lines). Wired Makefile targets and README publish notes. CHANGELOG.md 1.13.0 names the make target.

Validation commands and observed results:

- make test: exit 0; 13 runs, 35 assertions, 0 failures.
- make validate-skills: exit 0; changelog-update, claims-audit, dependency-audit, engineering-audit, and rfc-process reported valid.
- ruby usr/scripts/validate_skill.rb packages/engineering-audit/skills/engineering-audit packages/changelog-update/skills/changelog-update: exit 0; both reported valid.
- make verify && make drift && make check-artifacts: exit 0; check-artifacts reported ok; verify and drift emitted no findings.
- git diff --check && git diff --cached --check: exit 0, no diagnostics.
- python3 -c "import yaml": exit 1, ModuleNotFoundError: No module named 'yaml'. The new check does not import that module.

## Next

The upstream system validator still needs PyYAML or a stdlib parser. This repository no longer depends on it for package skill checks.

## Source

Existing validator issue: docs/dependencies/20260905124000_skill-validator-pyyaml.md

Prior workaround record: docs/changelogs/20260907112424_negation-guidance-and-action-evidence.md
