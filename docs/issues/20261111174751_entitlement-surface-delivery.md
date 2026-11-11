# Entitlement-surface delivery guidance

Live work. Skill text is inference input: resource, trace, and boundary modes skipped because these files never become executed bytes and there is no plant.

## Participants

Andrei Makarov (@amkisko)

## Decisions

Expand engineering-audit security review mode so entitlement-surface delivery is a named assessment beside object-level authorization. Keep the mode in security.md. No new skill. No named scanner. No language-specific rule files.

Name the failure: entitlement-surface over-delivery / capability disclosure (CWE-200 when existence or inventory is sensitive). Exact-asset rule: a view composes only the assets for the principal's entitlement set; presence in traffic means the principal may reach that capability's trusted boundary. Trusted-layer authorization stays separate and still fails closed.

Keep invoke, field, and disclosure classes distinct. Omit inaccessible capabilities from layouts and bootstraps; do not ship them as hidden, disabled, or flag-false when existence is sensitive. Intentional public plan marketing is not the same as disclosing admin, partner, unreleased, or other-tenant modules.

Assessment inventories per-view layouts, bootstraps, asset URLs, flags, routes, and source maps; crosses the entitlement matrix; lists shared mega-bundle or full-catalog serializer candidates; proves with two-principal asset and bootstrap diffs. DOM-hide tests without that diff stay futile coverage.

Wire companions: client-surface treats delivered bytes as the received surface; http-identity requires entitlement on cache keys for entitlement-specific responses and flags guessable privileged CDN paths; contracts omit out-of-entitlement capabilities from response and bootstrap shapes; product-surface points usability questions away from this boundary; core test quality includes two-principal asset or bootstrap diffs.

Leave the always-on security fragment unchanged. AGENTS.md had 192 bytes of compose headroom at start of work.

Primary references added in security.md: CWE-200, ASVS 5.0 V8.3.1, WSTG excessive data exposure, WSTG feature flag security bypass.

Collect into distribution release 1.37.0 on candidate `trunk/1.37.0`.

## Effects

Source package bumped: engineering-audit 2.17.0. Object-level Assessment heading renamed to Object-level assessment for parallel structure with Entitlement-surface assessment. Companions updated: client-surface, http-identity, contracts, product-surface, engineering-audit core test quality. Always-on security fragment and AGENTS.md unchanged at 16192 bytes.

Local catalog gained engineering-audit 2.17.0 (artifact sha256:6be886e374b2e03d8289399d183e6c78434f87498b9388069a4701bd5430f4b0). Prayfile.lock and provisioned `.agents/skills/engineering-audit` files match the package sources. README consumer pin moved to `~> 2.17`. CHANGELOG.md has a 1.37.0 heading dated 2026-11-11.

Validation commands and observed results:

- make validate-skills: exit 0; engineering-audit reported valid (with earlier full suite)
- make check-prayer-prose: exit 0; ok
- make test: exit 0; 73 runs, 210 assertions, 0 failures and errors (after staging the 2.17.0 artifact)
- make plan: exit 0; lockfile and AGENTS.md unchanged; provisioned engineering-audit skill files unchanged versus installed tree
- make verify: exit 0
- make drift: exit 0; no findings
- make check-artifacts: exit 0; ok
- make check-agent-context: exit 0; 16192/16384 bytes
- cmp of security.md, client-surface.md, http-identity.md, contracts.md, product-surface.md, and engineering-audit.md between packages and `.agents/skills`: exit 0

No executable product logic changed, so no new specs. Instruction effect on model output has not been experimentally measured.

## Next

- Open or merge release candidate `trunk/1.37.0` onto main
- Tag `v1.37.0` and publish the GitHub release after catalog artifacts are on the release commit
- Consumers bump amkisko/engineering-audit ~> 2.17, then pray install

## Source

Upstream: session research on layout and asset feature leak; packages/engineering-audit security.md and companions; docs/issues/20260914160500_authorization-assessment-guidance.md; CWE-200; OWASP ASVS 5.0 V8; OWASP WSTG excessive data exposure and feature flag bypass.

Downstream: docs/changelogs/20261111174751_engineering-audit-entitlement-surface.md, docs/changelogs/20261111174751_prayers-1-37-0.md, CHANGELOG.md 1.37.0
