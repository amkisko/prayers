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

Declare and provision PyYAML with the validator, or parse the small frontmatter contract without a third-party module. This repository uses its native package validation and an independent YAML parse as the workaround.

## Next

Report the missing runtime dependency to the owner of the system skill when that channel is available.

## Source

Downstream: usr/docs/issues/20260905123351_dependency-vulnerability-assessments.md
