## Participants

- Andrei Makarov

## Decisions

Add a Credentials and Secrets section to amkisko/working-rules so AGENTS.md carries generic credential hygiene: prefer secret stores or OS helpers, allow references in config, keep live secrets out of command lines and process-visible arguments, and do not commit or paste secrets.

Phrase for any project; keep product-harder rules (for example CLI bans on env or flag API keys) in repository docs.

## Effects

Bumped amkisko/working-rules to 2.0.1 with Credentials and Secrets inline. Later moved to amkisko/security; see usr/docs/changelogs/20260726230011_security-package-credentials-and-secrets.md.

## Next

Superseded by the security package split.

## Source

Follow-on from community file rollout and diff review of timely-cli, scout-cli, and related SECURITY.md overlays.
