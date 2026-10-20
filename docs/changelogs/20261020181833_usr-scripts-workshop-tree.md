# usr/scripts workshop tree

## Intent

Name `usr/scripts` in shared docs-conventions so maintainer tools (checkout, Makefile, CI, runner on a named path) stay distinct from paste-into-live-console trees.

## Implementation

docs-conventions 3.3.0 fragment and README. ruby-conventions 1.3.2 Related line. Live-work note docs/issues/20261020180900_usr-support-and-migrate.md. Product release 1.27.0.

## Validation

- RBENV_VERSION=3.4.10 make test: exit 0.
- make PRAY=$HOME/.cargo/bin/pray release: publish wrote docs-conventions 3.3.0 and ruby-conventions 1.3.2; plan/apply/verify exit 0; check-artifacts ok after git add of the two new .praypkg files.
- make drift: exit 0.

## Source

docs/issues/20261020180900_usr-support-and-migrate.md
CHANGELOG.md 1.27.0
