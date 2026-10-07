# Docs reviews tree

Live work. Convention change for durable review-episode notes.

## Participants

- amkisko

## Decisions

Add a fifth docs timestamp tree, reviews, for one review episode from session-review or ci-review. Scope, coverage, recommendations, and outcome stay there. Open implementation work after a review goes to issues. Upstream defects stay in dependencies. Pitch, plan, and the live-work queue stay in issues.

Do not put review episodes under dependencies. Do not overload meetings for non-sitting retrospectives.

Bump docs-conventions to 3.1.0, session-review to 1.2.0, and ci-review to 1.1.0 so Record points at docs/reviews. change-review and other finding notes stay on docs/issues.

## Effects

Package sources and skill Record sections updated. CHANGELOG 1.24.0 lists the three package bumps. Historical package-design issues stay under docs/issues; only future review episodes use docs/reviews.

Validated with ruby usr/scripts/validate_skill.rb on session-review and ci-review (both valid). Ran make PRAY=$HOME/.cargo/bin/pray install plan apply verify: docs-conventions 3.1.0, session-review 1.2.0, ci-review 1.1.0 locked; AGENTS.md names five trees including reviews; provisioned skills Record under docs/reviews. Catalog artifacts published in prayers 1.24.0.

## Next

Consumers bump docs-conventions ~> 3.1, session-review ~> 1.2, and ci-review ~> 1.1, then pray update, plan, apply.

## Source

Upstream: packages/docs-conventions, packages/session-review, packages/ci-review. Downstream: docs/changelogs/20261007190624_docs-reviews-tree.md, docs/changelogs/20261007163007_prayers-1-24-0.md, docs/issues/20261007160956_ci-review.md, docs/issues/20260918093132_session-review.md.
