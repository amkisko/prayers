## Dependency policy

Rules for adding, changing, or removing third-party packages. Apply across languages. Names vary by ecosystem; concepts do not.

Terminology:

- package manifest - declares intent (`gemspec`, `package.json`, `Cargo.toml`, `mix.exs`, etc.)
- lockfile - pins the resolved graph CI and developers install
- registry - published versions consumers resolve (`RubyGems`, `npm`, `crates.io`, `Hex`, etc.)
- hot path - code on the security, auth, crypto, IO, or request/response boundary users rely on

Stop until one of these applies before adding a dependency:

- stdlib or the framework for this tree already covers it;
- an installed transitive dependency already covers it without a second library for the same job;
- the feature needs a new package and tests will prove behavior.

Run dependency-audit for direct dependency changes, graph audits, releases with hot-path package changes, and plausible dependency vulnerability or exploitation signals found during ordinary work. Keep the evidence and assessment in the live-work or dependency record.

On resolved lockfile graph or runtime-pin upgrades (automated or human), map upstream changelog or release notes to this tree's usage, then gather before/after resource samples for install or graph storage, resident memory, CPU or a stated proxy, and shipped bundle or image size when the product ships bytes. Use isolated checkouts and the same consumer-owned measure commands on both revisions. Report the comparison; write to a change request only when authorized. Cheaper or smaller without comparable samples is inference. Absolute ship-path ceilings stay in `delivery-budgets`. When measured load shows a dependency no longer meets named requirements, reassess replace, remove, or narrow first-party work through dependency-audit before custom code.

Related: `dependency-issues` records upstream defects found during real work; `minimal-implementation` covers YAGNI before adding deps and before custom replacement; `engineering-audit` covers code and pipeline review; `delivery-budgets` owns continuous size and build-timing gates; `pressure-benchmarking` owns load ladders and ceiling ratchet episodes, not one-change upgrade deltas.
