# Pray related versus optional dependency

## Participants

Andrei Makarov (@amkisko)

## Dependency

`pray` / `pray-cli` / `pray-core` 1.26.0 (cargo binary `~/.cargo/bin/pray`, `Prayfile.lock` `generated_by = "pray 1.26.0"`). Fields under test: `spec.related` (1.26.0) and `spec.add_optional_dependency` (older graph API, still present). Distinct from Ruby `pray-cli` gem shims that may lag the cargo CLI.

## Symptom

Two association APIs exist on `*.prayspec`. Readers and agents confuse them with each other and with Bundler/npm/Cargo soft-deps.

Observed while wiring sibling ownership for `amkisko/dependency-policy` upgrade resource compare and peers:

- Prose `Related:` lines and `spec.related` both mean discovery; `add_optional_dependency` looks like a soft install but does not enqueue packages.
- Mutual `add_optional_dependency` edges fail resolve with `dependency cycle detected` even though optional deps are skipped in enqueue.
- `pray explain` prints optional names under `dependencies:` and related names under `related prayers:`. This is helpful once known and easy to misread before that.
- First implementation attempt used optional deps for sibling ownership; install broke; switching to `spec.related` fixed discovery without graph side effects.

Maintainer intent (this repository): keep both. Treat `related` as hyperlinks. Treat `add_optional_dependency` as a more structured referral (name + version constraint, no forced install).

## Evidence

### Pray behavior (1.26.0 source on crates.io)

- Changelog 1.26.0: add advisory `related` references; show them in `pray explain` without installing or resolving targets.
- `spec.related`: string array; canonicalize trims, sorts, and deduplicates; validators allow `ns/name`, `./` / `../` paths, absolute paths, and absolute URIs without user information (`package_relation.rs`).
- `add_dependency` / `add_optional_dependency`: name + constraint; optional flag skips `enqueue_required_dependencies` (`resolve_queue.rs`).
- Cycle rejection walks every dependency name on resolved packages, including optional (`resolve_deps.rs`). Related is not in that graph.
- Lockfile `dependencies = [...]` records dependency names from the spec (optional included). Related is not a lockfile field; explain reads it from the package spec.

### Catalog usage (this repository, 2026-11-02)

- `spec.related` present on: `dependency-policy`, `delivery-budgets`, `engineering-audit`, `agent-artifact`.
- No production `add_optional_dependency` in `packages/**/*.prayspec` after reverting the mistaken wiring.
- Sibling ownership for upgrade resource compare is documented in fragment/README Related prose and in `spec.related`.

### Bundler / RubyGems

- gemspec: `add_dependency` / `add_runtime_dependency`, `add_development_dependency`. No optional runtime edge and no package-to-package `related` field.
- Cross-links use README prose or `metadata` URI keys (homepage, source, docs). Not versioned referrals between gems.
- Gemfile `group ..., optional: true` is app grouping, not gemspec association.

### npm

- `dependencies`: required install.
- `optionalDependencies`: attempt install; failure does not fail the parent install; caller must tolerate absence.
- `peerDependencies` (+ `peerDependenciesMeta.optional`): host/plugin contract; optional peers are not auto-installed the same way as required peers (npm 7+ peer install rules still apply to required peers).

Pray optional is not npm optional: it never attempts install of the optional target from the parent package alone.

### Cargo

- `optional = true` creates a feature-gated compile dependency.
- No first-class docs-only / `see also` dependency table. Community guidance: do not take a real dependency only to hyperlink sibling crates in docs (users.rust-lang.org thread on documentation-only dependencies, 2026).

Pray `related` fills the docs/discovery gap Cargo leaves open. Pray optional is not Cargo optional: there is no feature flag that pulls the package.

### Reading DX

Clear:

```
spec.related = [
  "amkisko/delivery-budgets",
  "amkisko/engineering-audit"
]
```

One keyword, no fake pins, matches explain `related prayers:`.

Misleading if used for hyperlinks:

```
spec.add_optional_dependency "amkisko/delivery-budgets", "~> 1.0"
```

Reads as Bundler/npm soft install; still cycles; version pin implies resolve that does not pull the package.

Structured referral (intended reading of optional): `if this consumer already uses X, prefer constraint C; do not auto-compose X.` That story needs docs and explain labeling; the method name alone under-delivers it today.

### Capability split (maintainer model)

Capability: role
`related`: hyperlink
`add_optional_dependency`: structured referral

Capability: locator
`related`: name, path, or URL
`add_optional_dependency`: package name only

Capability: version constraint
`related`: no
`add_optional_dependency`: yes

Capability: automatic install
`related`: no
`add_optional_dependency`: no

Capability: lockfile edge
`related`: no
`add_optional_dependency`: yes, as a name in the list

Capability: cycle graph
`related`: no
`add_optional_dependency`: yes in 1.26.0

Capability: mutual edges
`related`: accepted
`add_optional_dependency`: rejected in 1.26.0

Capability: explain label
`related`: `related prayers:`
`add_optional_dependency`: `dependencies:`

Both are useful if the product contract matches that list. The optional behavior in 1.26.0 only partly matches `structured referral` because of cycles and the shared `dependencies:` label.

## Suggested fix

Upstream (pray):

1. Document two layers in RFC 0011 / SPEC / changelog: `related` = advisory hyperlinks; `add_optional_dependency` = versioned referral without auto-install (not npm/Cargo optional).
2. Keep both APIs. Do not fold related into optional or the reverse.
3. Make optional match the referral story:
   - explain: label optional separately (for example `optional referrals:` / `optional dependencies:`) instead of mixing with required under one `dependencies:` line;
   - either exclude optional edges from cycle detection, or document one-direction-only referrals and fail with a referral-specific message;
   - state that optional tightens constraints only when the target is already selected another way.
4. Do not add peer/feature machinery until a real plugin-host consumer needs it. Optional referral is enough for `if present, pin range`.
5. Regression: mutual `related` ok; mutual optional either ok (if cycles ignore optional) or explicit error naming referral cycles.

Downstream (this catalog):

1. Sibling ownership and `see also` use `spec.related` (and prose Related where composed).
2. Use `add_optional_dependency` only when a versioned referral is intentional (consumer may already declare the peer; pin range matters).
3. Prefer required `add_dependency` only when compose/tree must pull the other package.
4. Do not treat optional as a substitute for related.

## Next

- Open or update an upstream pray issue/RFC note with this contract (hyperlink vs structured referral).
- After upstream explain/cycle behavior matches the contract, revisit whether any catalog siblings should gain optional referrals in addition to related.
- Keep minimum consumer pray at 1.26+ wherever `spec.related` is published.
- Track ordinary `pray drift` renderer mismatch separately (`docs/dependencies/20261102094751_pray-drift-renderer-mismatch.md`).

## Source

- Pray changelog 1.26.0 (advisory `related`)
- crates.io `pray-core` 1.26.0: `package_relation.rs`, `package_spec.rs`, `resolve_queue.rs`, `resolve_deps.rs`, `lockfile.rs`
- crates.io `pray-cli` 1.26.0: `commands_inspect.rs` (`related prayers:`)
- RubyGems Specification Reference: `add_dependency`, `add_development_dependency`, `metadata`
- npm Docs: `optionalDependencies`, `peerDependencies`, `peerDependenciesMeta`
- Cargo Book: features / optional dependencies
- https://users.rust-lang.org/t/how-should-i-link-to-documentation-only-dependencies/141349
- Local working tree: `packages/dependency-policy/amkisko-dependency-policy.prayspec`, `packages/delivery-budgets/amkisko-delivery-budgets.prayspec`, `packages/engineering-audit/amkisko-engineering-audit.prayspec`, `packages/agent-artifact/amkisko-agent-artifact.prayspec`
- Session analysis canvas: `pray-related-vs-optional-deps.canvas.tsx` (design options; this note records the keep-both contract)
- Live work context: `docs/issues/20261102072748_upgrade-resource-compare.md`
