# Continuous integration

In-repo automated checks for this repository run on GitHub Actions.

## Workflows

- `.github/workflows/test.yml` - `make validate-skills` and `make test` on pull requests and pushes to `main`.
- `.github/workflows/scorecard.yml` - OpenSSF Scorecard on pushes to `main` and a weekly schedule.

GitLab and Codeberg remotes may mirror the git tree. They do not run these workflows from this repository. Treat GitHub Actions as the CI host unless a later note adds another pipeline.

## Local equivalents

Before push, run `make validate-skills`, `make check-prayer-prose`, and `make test`. Catalog publish paths also need `make check-artifacts` after new `.praypkg` files are staged.

## Branch protection

Required status checks on `main` are a repository settings decision. Enabling protection that requires the Test workflow is recommended after that workflow is green on `main`. This file does not change GitHub settings.
