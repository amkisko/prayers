# Skill validator PyYAML dependency

## Dependency

The system-provided skill-creator quick validator and its undeclared or unavailable PyYAML runtime dependency.

## Symptom

The prescribed validator cannot start, so it does not inspect the updated dependency-audit skill.

## Evidence

Command:

```text
python3 <skill-creator>/scripts/quick_validate.py packages/dependency-policy/skills/dependency-audit
```

Observed result:

```text
ModuleNotFoundError: No module named 'yaml'
```

## Suggested fix

Declare and provision PyYAML with the validator, or parse the small frontmatter contract without a third-party module. This repository now parses that contract with the Ruby standard library YAML parser.

## Next

The local package skill check no longer uses the system validator. Report the missing runtime dependency to the owner of the system skill when that channel is available.

## Source

Downstream: docs/issues/20260905123351_dependency-vulnerability-assessments.md

The same missing yaml import recurred on 2026-09-07 for engineering-audit and changelog-update. Native package builds and an independent Ruby YAML parse completed. Downstream evidence: docs/changelogs/20260907112424_negation-guidance-and-action-evidence.md.

Later pass, 2026-09-07: this repository now checks package SKILL.md frontmatter with usr/scripts/validate_skill.rb and the Ruby standard library YAML parser. make validate-skills and make test cover that check. Downstream: docs/changelogs/20260907143500_skill-frontmatter-validator.md.
