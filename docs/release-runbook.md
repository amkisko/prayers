# Release runbook

Checklist for cutting a prayers distribution release. Prefer this over rediscovering trunk naming and publish steps in chat.

## Before the cut

1. Confirm `CHANGELOG.md` Unreleased bullets name the packages and versions that actually change.
2. Confirm package `*.prayspec` versions match those bullets.
3. Run `make validate-skills`, `make check-prayer-prose`, and `make test`.
4. Use a `trunk/<title>` branch for the release candidate when integrating before `main` (see branch-naming). Patch and feature work stay on their own prefixes until merged.

## Publish catalog artifacts

1. Run `make publish` (updates `prayers/v1` and rewrites catalog topics).
2. `git add` new and updated `.praypkg` files under `prayers/v1/artifacts/` plus catalog JSON changes.
3. Run `make check-artifacts`.
4. Run `make install`, `make apply`, and `make verify` when compose or tree inputs changed.
5. Run `make drift` and fix tracked drift before review.

`make release` runs validate-skills, check-prayer-prose, publish, plan, apply, verify, and check-artifacts. It does not create a git tag or GitHub release.

## Tag and GitHub release

1. Merge the trunk branch to `main` when ready.
2. Tag `vX.Y.Z` on the release commit that matches the CHANGELOG heading.
3. Create the GitHub release from that tag with the CHANGELOG section as the body.
4. Consumers bump Prayfile pins only when constraints require it (for example `~> 3.7`).

## After the cut

1. Clear or replace Unreleased bullets that shipped.
2. Record durable notes under `docs/changelogs/` when the cut needs engineering detail beyond CHANGELOG.md.
