# API contract migration skill

## Participants

Andrei Makarov (@amkisko)

## Decisions

Add a protocol-neutral migration skill instead of embedding one REST-to-GraphQL result as a universal engineering rule. Keep client query-cache behavior and flexible query controls conditional. Route detailed API replacement work from engineering-audit.

## Effects

Added `amkisko/api-contract-migration` 1.0.0 with observable equivalence, reversible per-surface rollout, separated measurement planes, cache-aware comparison, old-path retirement, and qualified client-cache and flexible-query references. Updated `amkisko/engineering-audit` to 2.16.0.

The supporting fact check and benchmark limits are recorded in `docs/reviews/20261102111635_api-contract-migration-claims-review.md`.

## Next

- Publish only through the ordinary release path.

## Source

- `packages/api-contract-migration/`
- `packages/engineering-audit/`
- `docs/reviews/20261102111635_api-contract-migration-claims-review.md`
