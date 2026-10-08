# Agent discovery guidance from public readiness scanners

Fold useful agent HTTP discovery practice into prayers. Do not vendor-wrap a readiness score or commerce protocols by default.

## Participants

Andrei Makarov.

## Decisions

Encode package work on feature/agent-discovery-guidance:

- public-surface-recon 1.2.0: new agent-discovery-surface prayer; site-type gating; maturity labels; no tool invoke; no third-party scanner by default.
- agent-artifact 1.2.0: local tree versus HTTP-published discovery; public skill bodies untrusted.
- engineering-audit 2.13.0: learned-systems trust boundary for public discovery metadata.
- security 1.5.0: crawl preferences are not access control.
- agent-discovery 1.0.0: new skill with maturity ladder for product publishers; tree only; do not compose into AGENTS.md.

Content Signals, DNS-AID, Web Bot Auth, and MCP card paths stay draft or vendor proposal where applicable. Commerce protocols stay opt-in. Cloudflare Agent Readiness score is not a house pass/fail.

## Effects

Package sources, Prayfile tree entry, README catalog row, and CHANGELOG Unreleased updated. Observed: make validate-skills passed; make publish with PRAY from cargo wrote five new .praypkg artifacts and catalog metadata; make install provisioned .agents/skills including agent-discovery and agent-discovery-surface; AGENTS.md gained the security preference line; make check-artifacts ok after git add of the five artifacts; make test passed (validate_skill_test, check_artifacts_test, catalog_topics_test); pray verify passed. AGENTS.md is 20922 bytes, still over the 16 KiB house target. Unrelated local security-audit WIP was left out of this branch.

## Next

Consumers bump pins and pray install for the bumped packages. Tree agent-discovery only when a product publishes agent HTTP discovery. Commit and open pull request when asked.

## Source

Upstream: https://isitagentready.com/ , https://blog.cloudflare.com/agent-readiness/ , RFC 9727, RFC 8288, RFC 8414, RFC 9728. Downstream: packages/public-surface-recon, packages/agent-artifact, packages/engineering-audit, packages/security, packages/agent-discovery, CHANGELOG.md Unreleased, README.md, Prayfile.
