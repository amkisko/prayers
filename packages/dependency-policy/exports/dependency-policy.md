## Dependency policy

Rules for adding, changing, or removing third-party packages. Apply across languages (Ruby, Rust, Elixir, JavaScript, and others). Names vary by ecosystem; concepts do not.

Terminology:

- package manifest — declares intent (`gemspec`, `package.json`, `Cargo.toml`, `mix.exs`, etc.)
- lockfile — pins the resolved graph CI and developers install
- registry — published versions consumers resolve (`RubyGems`, `npm`, `crates.io`, `Hex`, etc.)
- hot path — code on the security, auth, crypto, IO, or request/response boundary users rely on

### Before adding a dependency

Stop until one of these applies:

- stdlib or the framework for this tree already covers it;
- an installed transitive dependency already covers it without a second library for the same job;
- the feature genuinely needs a new package and tests will prove behavior.

Then prefer packages that:

- share a trusted maintainer cluster and spec family with dependencies already on the hot path (same author group, same protocol stack, same RFC family);
- align with the domain protocol being implemented (do not bolt on a parallel HTTP client, JWT stack, or crypto helper when the main stack already carries one);
- show real adoption on the registry and recent maintenance (commits and published versions; registry publish date matters when upstream release tags lag);
- keep bus factor visible: a coherent maintainer cluster is good for integration; a lone micro-package on a hot path is a supply-chain risk unless adoption and release cadence are strong.

Reject or defer when:

- the capability duplicates an existing node in the graph;
- issues-per-star and open pull request backlog suggest maintainer strain on a small package;
- a major version adds native extensions or platform matrices the CI matrix does not exercise;
- license or export-control terms conflict with product use.

### When altering dependencies

- run advisory scans on every lockfile or variant graph CI installs (root lockfile alone is not enough when matrix gemfiles, workspaces, or target-specific locks exist);
- keep hot-path and direct runtime packages at the latest safe registry version unless a documented exception explains the pin;
- tighten package manifest floors when security fixes require a minimum version; lockfiles protect this repo, manifests protect downstream consumers;
- on major upgrades, grep for adapters (HTTP mocks, test doubles, middleware, FFI shims) and run the full CI matrix;
- delete redundant packages when a transitive or cluster dependency subsumes them; wrap remaining vendor exceptions at trust boundaries with project error types, not raw vendor exceptions in user-facing paths;
- list exact commands and observed results in validation output; never claim a clean audit without running it.

### Automation

- gate CI on advisory checks for the ecosystems that exist in the repository; drop automated update config for ecosystems with no manifest;
- use grouped automated update pull requests for lockfiles; human review still applies selection rules above;
- run the dependency-audit skill when asked for a dependency audit, before a release that changes hot-path packages, or after a published advisory names a package in the graph.

Full dependency audits rely on deep recon and OSINT, not only lockfile scanners. Automated advisory and outdated checks are necessary baseline; they are not sufficient for hot-path packages or for add/replace decisions.

### Relationship to other prayers

- `dependency-issues` — record upstream defects encountered during real work; do not open drive-by hunts;
- `minimal-implementation` — no new dependency when an existing path suffices;
- `engineering-audit` — code and pipeline review; dependency-audit focuses on the supply graph.
