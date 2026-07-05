# amkisko shared prayers

Central distribution point for reusable agent guidance across amkisko gems and libraries.

Packages here are generic guidance only: no project URLs, credentials, client names, deployment commands, or repository-specific paths. Project-specific context stays in the repository itself (for example under `docs/`), not in shared prayers.

## Install pray

The reference CLI lives in [kiskolabs/pray](https://github.com/kiskolabs/pray).

```sh
cargo install --git https://github.com/kiskolabs/pray --locked pray
```

## Use shared prayers in a project

From your project root:

```sh
pray init
```

Point `Prayfile` at package paths while developing locally (sibling checkout under `amkisko/`):

```prayfile
agent "amkisko/working-rules", path: "../prayers/packages/working-rules", exports: ["working-rules"]
```

After pushing this repository, consumers can switch to a git source:

```prayfile
source "amkisko", git: "https://github.com/amkisko/prayers", distribution: "prayers"
agent "amkisko/working-rules", "~> 1.0", source: "amkisko", exports: ["working-rules"]
```

Example consumer `Prayfile` for a Ruby gem:

```prayfile
prayfile "1"

source "amkisko", path: "../prayers/prayers"

target :agents do
  output "AGENTS.md"
  skills ".agents/skills"
end

agent "amkisko/working-rules", "~> 1.0", source: "amkisko", exports: ["working-rules"]
agent "amkisko/docs-conventions", "~> 1.0", source: "amkisko", exports: ["docs-conventions"]
agent "amkisko/ruby-conventions", "~> 1.0", source: "amkisko", exports: ["ruby-conventions"]
agent "amkisko/minimal-implementation", "~> 1.0", source: "amkisko", exports: ["minimal-implementation"]
agent "amkisko/finite-state-machines", "~> 1.0", source: "amkisko", exports: ["finite-state-machines"]
agent "amkisko/branch-naming", "~> 1.0", source: "amkisko", exports: ["branch-naming"]
agent "amkisko/preferred-stack", "~> 1.0", source: "amkisko", exports: ["preferred-stack"]
agent "amkisko/writing-prose", "~> 1.0", source: "amkisko", exports: ["writing-prose"]
agent "amkisko/rejected-changes", "~> 1.0", source: "amkisko", exports: ["rejected-changes"]
agent "amkisko/publish-checks", "~> 1.0", source: "amkisko", exports: ["publish-checks"]
agent "amkisko/collaboration-workflow", "~> 1.0", source: "amkisko", exports: ["collaboration-workflow"]
agent "amkisko/engineering-audit", "~> 1.0", source: "amkisko", exports: ["skill"]
agent "amkisko/changelog-update", "~> 1.0", source: "amkisko", exports: ["skill"]

render mode: :managed, conflict: :fail, churn: :minimal
```

Swap `ruby-conventions` for `rust-conventions` or `elixir-conventions` on `.rs` and `.ex` trees.

Resolve and render:

```sh
pray install
pray plan
pray apply
pray verify
```

## Publish or update a package

```sh
make publish
make release
```

## Package catalog

| Package | Type | Summary |
|---------|------|---------|
| `amkisko/working-rules` | fragment | Language-neutral engineering working rules |
| `amkisko/docs-conventions` | fragment | Docs tree naming and five-heading structure |
| `amkisko/dependency-issues` | fragment | Dependency bug evidence and fix suggestions |
| `amkisko/ruby-conventions` | fragment | Ruby and Rails stack conventions |
| `amkisko/rust-conventions` | fragment | Rust stack conventions |
| `amkisko/elixir-conventions` | fragment | Elixir and OTP stack conventions |
| `amkisko/minimal-implementation` | fragment | Smallest correct change discipline |
| `amkisko/finite-state-machines` | fragment | Explicit lifecycle modeling |
| `amkisko/branch-naming` | fragment | Branch prefix conventions |
| `amkisko/preferred-stack` | fragment | Language and UX preferences |
| `amkisko/writing-prose` | fragment | Plain technical writing checks |
| `amkisko/rejected-changes` | fragment | Changes likely rejected in review |
| `amkisko/publish-checks` | fragment | Pre-publish engineering checklist |
| `amkisko/collaboration-workflow` | fragment | Durable context and agent traces |
| `amkisko/getting-started` | fragment | How to install pray and wire a consumer |
| `amkisko/engineering-audit` | skill | Pipeline-aware engineering audit |
| `amkisko/changelog-update` | skill | Changelog layering and house style |

## Layout

```text
prayers/                  # distribution root (index, metadata, artifacts)
packages/                 # package sources (.prayspec + content)
Prayfile                  # publisher manifest for this repo
Makefile                  # install, publish, release, serve, clean
```
