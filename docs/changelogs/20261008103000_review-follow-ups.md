# Review follow-ups from session and CI retrospectives

## Intent

Close eligible Next items from docs/reviews/20261008102520_session-review.md and docs/reviews/20261008102521_ci-review.md: catch prayer styling before publish, document release and CI hosts, and give external-skill intake one shared checklist.

## Implementation

Added usr/scripts/check_prayer_prose.rb and tests; wired into make check-prayer-prose, make test, and make release. Added .github/workflows/test.yml. Added docs/release-runbook.md and docs/ci.md. Shipped claims-audit 1.2.2 with references/external-skill-intake.md. Left scorecard.yml and GitHub branch protection unchanged.

## Validation

- make test: exit 0 including check_prayer_prose_test and check-prayer-prose scan
- make publish / install for claims-audit 1.2.2: exit 0
- make check-artifacts: ok

## Source

docs/reviews/20261008102520_session-review.md
docs/reviews/20261008102521_ci-review.md
