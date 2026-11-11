# Agent guidance audit fixes

## Participants

Andrei Makarov (@amkisko)

## Decisions

Make pre-inference selection, authorized action, failure, completion, and evidence explicit in agent-artifact review. Keep selector-critical use cases and exclusions in frontmatter. Validate packaged skill identity and required local read paths. Keep dependency comparison checkouts isolated and external writes permission-bound.

## Effects

Updated source packages: `agent-artifact` 1.3.0, `engineering-audit` 2.15.0, `public-surface-recon` 1.4.0, and the in-progress `dependency-policy` 4.2.0. Extended skill, prose, tool-version, and agent-context budget checks. Reduced the generated always-loaded context from 27,229 to 15,871 bytes. Added exact Ruby and Pray maintenance requirements. Audit evidence and benchmark limits are in `docs/reviews/20261102094751_agent-guidance-engineering-prose-audit.md`.

## Next

- Publish package artifacts only through the ordinary release path.

## Source

- `docs/reviews/20261102094751_agent-guidance-engineering-prose-audit.md`
- `packages/agent-artifact/skills/agent-artifact/SKILL.md`
- `packages/engineering-audit/skills/engineering-audit/learned-systems.md`
- `packages/public-surface-recon/skills/public-surface-recon/SKILL.md`
