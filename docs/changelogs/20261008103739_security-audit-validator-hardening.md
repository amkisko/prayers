# Security audit validator hardening

## Effects

security-audit 0.1.2 rejects unknown fields on run metadata, coverage units, and findings so the Ruby validator matches schema `additionalProperties: false`. PathVerifier caches per-path source line counts. check_prayer_prose reports original markdown line numbers after closed frontmatter and code fences.

## Source

Upstream: engineering-audit of the working-tree diff. Downstream: packages/security-audit 0.1.2, usr/scripts/check_prayer_prose.rb, CHANGELOG.md Unreleased, docs/issues/20261008100600_security-audit-workflow.md, docs/issues/20261008101725_prayer-prose-formatting.md.
