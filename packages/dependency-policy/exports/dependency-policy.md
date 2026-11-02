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

On resolved lockfile graph or runtime-pin upgrades (automated or human), gather before/after resource samples for install or graph storage, resident memory, CPU or a stated proxy, and shipped bundle or image size when the product ships bytes. The reviewing agent uses isolated checkouts and the same small consumer-owned measurement commands for both revisions. It reports the comparison and writes to a change request only when authorized. Cheaper or smaller without comparable samples is inference. Continuous absolute ship-path ceilings stay in `delivery-budgets`.

Related: `dependency-issues` records upstream defects found during real work; `minimal-implementation` covers YAGNI before adding deps; `engineering-audit` covers code and pipeline review; `delivery-budgets` owns continuous size and build-timing gates.
