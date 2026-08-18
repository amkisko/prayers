# amkisko shared prayers

Central distribution point for reusable agent guidance across amkisko gems and libraries.

Packages here are generic guidance only: no project URLs, credentials, client names, deployment commands, or repository-specific paths. Project-specific context stays in the repository itself (`docs/` for human-facing material, `usr/docs/` for agent trace), not in shared prayers.

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
compose "AGENTS.md" do
  pray "amkisko/working-rules", path: "../prayers/packages/working-rules"
end
```

After pushing this repository, consumers can switch to a git source:

```prayfile
source "amkisko", git: "https://github.com/amkisko/prayers.git"
compose "AGENTS.md" do
  pray "amkisko/working-rules", "~> 2.0"
end
```

Example consumer `Prayfile`:

```prayfile
prayfile "1"

pray do
  support_email "contact@example.com"
  security_email "security@example.com"
end

source "amkisko", git: "https://github.com/amkisko/prayers.git"

compose "AGENTS.md" do
  pray ".agents/project.md"
  pray "amkisko/working-rules", "~> 2.1"
  pray "amkisko/security", "~> 1.0"
  pray "amkisko/docs-conventions", "~> 2.1"
  pray "amkisko/dependency-issues", "~> 2.0"
  pray "amkisko/dependency-policy", "~> 3.0"
  pray "amkisko/ruby-conventions", "~> 1.0"
  pray "amkisko/minimal-implementation", "~> 1.0"
  pray "amkisko/finite-state-machines", "~> 1.0"
  pray "amkisko/branch-naming", "~> 1.0"
  pray "amkisko/preferred-stack", "~> 1.0"
  pray "amkisko/io-simulation", "~> 1.0"
  pray "amkisko/writing-prose", "~> 3.2"
  pray "amkisko/claims-audit", "~> 1.0"
  pray "amkisko/rfc-process", "~> 1.2"
  pray "amkisko/rejected-changes", "~> 1.0"
  pray "amkisko/publish-checks", "~> 1.0"
  pray "amkisko/collaboration-workflow", "~> 2.1"
end

tree ".agents/skills" do
  pray "amkisko/dependency-policy", "~> 3.0"
  pray "amkisko/engineering-audit", "~> 2.0"
  pray "amkisko/changelog-update", "~> 2.1"
  pray "amkisko/claims-audit", "~> 1.0"
  pray "amkisko/rfc-process", "~> 1.2"
end

pray "amkisko/community-security", "~> 1.1", file: "SECURITY.md"
pray "amkisko/community-code-of-conduct", "~> 1.1", file: "CODE_OF_CONDUCT.md"
pray "amkisko/community-governance", "~> 1.1", file: "GOVERNANCE.md"
pray "amkisko/community-contributing", "~> 1.1", file: "CONTRIBUTING.md"
```

Swap `ruby-conventions` for `rust-conventions` or `elixir-conventions` on `.rs` and `.ex` trees. Compose one language pack, not all three.

Export selection follows the destination: fragments in `compose`, skills in `tree`, whole files with `file:`. Omit `export:` / `exports:` when only one compatible export exists. Tree `dependency-policy` whenever you compose it: selection heuristics live in the skill. Tree `rfc-process` whenever you compose it: numbering and template live in the skill.

## Compose budget

Always-on `AGENTS.md` fragments share a 32 KiB Codex cap with project overlay. Keep the composed file under 16 KiB.

- Prefer fragments under 1 KB. Over 2 KB belongs in a skill, with a short when-pointer in the fragment.
- Do not compose `getting-started`; it is README material.
- Compose one language pack.

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
| `amkisko/security` | fragment | Credential and secret handling for agents |
| `amkisko/docs-conventions` | fragment | Docs tree naming and five-heading structure |
| `amkisko/dependency-issues` | fragment | Dependency bug evidence and fix suggestions |
| `amkisko/dependency-policy` | fragment + skill | Stop-before-add gate and dependency audit |
| `amkisko/ruby-conventions` | fragment | Ruby and Rails stack conventions |
| `amkisko/rust-conventions` | fragment | Rust stack conventions |
| `amkisko/elixir-conventions` | fragment | Elixir and OTP stack conventions |
| `amkisko/minimal-implementation` | fragment | Smallest correct change discipline |
| `amkisko/finite-state-machines` | fragment | Explicit lifecycle modeling |
| `amkisko/branch-naming` | fragment | Branch prefix conventions |
| `amkisko/preferred-stack` | fragment | Language and UX preferences |
| `amkisko/io-simulation` | fragment | Control UI for simulated external IO |
| `amkisko/writing-prose` | fragment | Plain technical writing checks |
| `amkisko/claims-audit` | fragment + skill | Claim hygiene and factual verification |
| `amkisko/rfc-process` | fragment + skill | RFC numbering, template, types, and statuses |
| `amkisko/rejected-changes` | fragment | Changes likely rejected in review |
| `amkisko/publish-checks` | fragment | Pre-publish engineering checklist |
| `amkisko/collaboration-workflow` | fragment | Durable context and agent traces |
| `amkisko/getting-started` | fragment | How to install pray and wire a consumer |
| `amkisko/engineering-audit` | skill | Pipeline-aware engineering audit |
| `amkisko/changelog-update` | skill | Changelog layering and house style |
| `amkisko/community-security` | file | Shared SECURITY.md |
| `amkisko/community-code-of-conduct` | file | Shared CODE_OF_CONDUCT.md |
| `amkisko/community-governance` | file | Shared GOVERNANCE.md |
| `amkisko/community-contributing` | file | Shared CONTRIBUTING.md |

## Layout

```text
prayers/                  # distribution root (index, metadata, artifacts)
packages/                 # package sources (.prayspec + content)
Prayfile                  # publisher manifest for this repo
Makefile                  # install, publish, release, serve, clean
```

## Links

- [GitHub](https://github.com/amkisko/prayers)
- [GitLab](https://gitlab.com/amkisko/prayers)
- [SonarCloud](https://sonarcloud.io/project/overview?id=amkisko_prayers)
- [Snyk](https://snyk.io/test/github/amkisko/prayers)
- [Codecov](https://app.codecov.io/github/amkisko/prayers)
- [OpenSSF Scorecard](https://scorecard.dev/viewer/?uri=github.com/amkisko/prayers)

