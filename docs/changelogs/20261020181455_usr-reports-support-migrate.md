# usr/reports, usr/support, and usr/migrate

## Intent

Name three shared workshop trees so a human reviewer can see read-only investigation versus support writes versus manual migrations from the path. Leave `usr/console` undefined in the shared convention.

## Implementation

docs-conventions 3.2.0 fragment and README. ruby-conventions 1.3.1 Related line. Live-work note docs/issues/20261020180900_usr-support-and-migrate.md. Product release 1.26.0.

## Validation

- make PRAY=$HOME/.cargo/bin/pray release: publish wrote docs-conventions 3.2.0 and ruby-conventions 1.3.1 praypkg files; plan/apply/verify exit 0; check-artifacts ok after git add of the two new .praypkg files.
- RBENV_VERSION=3.4.10 make test: exit 0 (validate_skill 13/46, check_artifacts 9/37, catalog_topics 8/33, check_prayer_prose 8/25, security_audit_run 20/29).
- make drift: exit 0.

## Source

docs/issues/20261020180900_usr-support-and-migrate.md
CHANGELOG.md 1.26.0
