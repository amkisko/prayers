## Participants

- Andrei Makarov

## Decisions

Ship Credentials and Secrets as amkisko/security 1.0.0 (AGENTS.md fragment), not inside working-rules.

Keep amkisko/community-security as the root SECURITY.md file package. Naming: security is agent guidance; community-security is the public security policy file.

## Effects

Added packages/security. Reverted working-rules content and published 2.0.2 without the Credentials section. Updated Prayfile, README catalog, and consumer example. make release publishes both packages.

Supersedes the 2.0.1 placement noted in usr/docs/changelogs/20260726225843_working-rules-credentials-and-secrets.md.

## Next

Push prayers. Consumers add agent "amkisko/security", "~> 1.0", and run pray update --latest.

## Source

Follow-up after reviewing whether credentials belonged in working-rules.
