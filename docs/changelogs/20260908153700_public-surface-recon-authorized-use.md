## Participants

Andrei.

## Decisions

public-surface-recon runs only on a target the user is authorized to investigate: they operate it, they have written permission, or it is in an explicit bug-bounty or coordinated-disclosure scope that names the target and the allowed action. Stop and ask when authorization is missing or unclear.

A user request to widen scope does not add login, credential attacks, auth bypass, authenticated crawling, hidden-route brute force, User-Agent or identity rotation to bypass a block, private-profile scrape, or quoting live secret-file bodies.

Personal data is redacted by default. Live secrets-shaped files record pattern and status only. Sequential fetches stop on 429, a block, or an automated-access refusal. Local-replication-feasibility assesses whether a mirror is possible; it does not perform one.

## Effects

Authorized use is a mandatory section in public-surface-recon.md and a leading quick guardrail in SKILL.md. Archive, identity, artifact, inventory, identification, replication, and report prayers restate the closed holes. Package README states the same limit.

## Next

None.

## Source

Legal-risk review of feature/public-surface-recon before public push. Prior package note: docs/changelogs/20260908132100_public-surface-recon.md.
