# amkisko shared prayers

Central distribution point for reusable agent guidance across amkisko gems and libraries.

Packages here are generic guidance only: no project URLs, credentials, client names, deployment commands, or repository-specific paths. Project-specific context stays in the repository itself (`docs/` for human-facing material, `usr/docs/` for agent trace, `usr/migrate/` for console-first scripts), not in shared prayers.

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
  pray "amkisko/working-rules", "~> 2.4"
  pray "amkisko/security", "~> 1.2"
  pray "amkisko/docs-conventions", "~> 2.4"
  pray "amkisko/dependency-issues", "~> 2.1"
  pray "amkisko/dependency-policy", "~> 4.0"
  pray "amkisko/ruby-conventions", "~> 1.2"
  pray "amkisko/minimal-implementation", "~> 1.4"
  pray "amkisko/finite-state-machines", "~> 1.2"
  pray "amkisko/branch-naming", "~> 1.0"
  pray "amkisko/preferred-stack", "~> 1.5"
  pray "amkisko/keep-the-work", "~> 1.2"
  pray "amkisko/background-jobs", "~> 1.0"
  pray "amkisko/io-simulation", "~> 1.0"
  pray "amkisko/writing-prose", "~> 3.3"
  pray "amkisko/claims-audit", "~> 1.0"
  pray "amkisko/rfc-process", "~> 1.2"
  pray "amkisko/rejected-changes", "~> 1.0"
  pray "amkisko/publish-checks", "~> 1.0"
  pray "amkisko/collaboration-workflow", "~> 2.3"
end

tree ".agents/skills" do
  pray "amkisko/dependency-policy", "~> 4.0"
  pray "amkisko/engineering-audit", "~> 2.7"
  pray "amkisko/operational-signal-intake", "~> 1.0"
  pray "amkisko/changelog-update", "~> 2.1"
  pray "amkisko/claims-audit", "~> 1.0"
  pray "amkisko/rfc-process", "~> 1.2"
  pray "amkisko/public-surface-recon", "~> 1.0"
  pray "amkisko/infer-conventions", "~> 1.0"
  pray "amkisko/session-review", "~> 1.0"
end

pray "amkisko/community-security", "~> 1.2", file: "SECURITY.md"
pray "amkisko/community-code-of-conduct", "~> 1.2", file: "CODE_OF_CONDUCT.md"
pray "amkisko/community-governance", "~> 1.1", file: "GOVERNANCE.md"
pray "amkisko/community-contributing", "~> 1.1", file: "CONTRIBUTING.md"
```

Swap `ruby-conventions` for `rust-conventions` or `elixir-conventions` on `.rs` and `.ex` trees. Compose one language pack, not all three. Products with a person-facing place compose `keep-the-work` next to `preferred-stack`. Products with background workers compose `background-jobs`. Library-only trees may omit both.

Export selection follows the destination: fragments in `compose`, skills in `tree`, whole files with `file:`. Omit `export:` / `exports:` when only one compatible export exists. Tree `dependency-policy` whenever you compose it: selection heuristics live in the skill. Tree `rfc-process` whenever you compose it: numbering and template live in the skill. Tree `public-surface-recon` when doing external blackbox recon; do not compose it into AGENTS.md. Tree `infer-conventions` when encoding how a tree actually writes as executable checks; do not compose it into AGENTS.md. Tree `session-review` when reviewing agent sessions; do not compose it into AGENTS.md.

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
git add prayers/v1/artifacts
make check-artifacts
```

`make validate-skills` checks package `SKILL.md` frontmatter with the Ruby standard library YAML parser. `make check-artifacts` checks catalog `.praypkg` paths with the same Ruby runtime. `make test` runs those checkers' specs.

`make release` runs validate-skills, publish, plan, apply, verify, then check-artifacts. If check-artifacts reports untracked files, add those paths and rerun `make check-artifacts` only. Catalog `published_at` is an integer unix time. Do not rerun `make publish` after a successful catalog write: it can rebuild a same-version artifact when package source drifted.

## Package catalog

| Package | Type | Summary |
|---------|------|---------|
| `amkisko/working-rules` | fragment | Language-neutral engineering working rules |
| `amkisko/security` | fragment | Credential, secret, tracking, and ownership hygiene for agents |
| `amkisko/docs-conventions` | fragment | usr/docs trees, usr/migrate, purpose, and heading templates |
| `amkisko/dependency-issues` | fragment | Dependency bug evidence and fix suggestions |
| `amkisko/dependency-policy` | fragment + skill | Stop-before-add gate, target-scoped vulnerability assessment, and lag metrics |
| `amkisko/ruby-conventions` | fragment | Ruby and Rails stack conventions |
| `amkisko/rust-conventions` | fragment | Rust stack conventions |
| `amkisko/elixir-conventions` | fragment | Elixir and OTP stack conventions |
| `amkisko/minimal-implementation` | fragment | Smallest correct change discipline |
| `amkisko/finite-state-machines` | fragment | Explicit lifecycle modeling, including digital and physical state |
| `amkisko/branch-naming` | fragment | Branch prefix conventions |
| `amkisko/preferred-stack` | fragment | Language, UX, and visual-assessment communication |
| `amkisko/keep-the-work` | fragment | Stay on the failed place and keep answers after a refusal |
| `amkisko/background-jobs` | fragment | Shallow jobs, enqueue context, retries, destination failure |
| `amkisko/io-simulation` | fragment | Simulated plant, control UI, and injectable IO faults |
| `amkisko/writing-prose` | fragment | Plain technical writing checks |
| `amkisko/claims-audit` | fragment + skill | Claim hygiene and factual verification |
| `amkisko/rfc-process` | fragment + skill | RFC numbering, template, types, and statuses |
| `amkisko/rejected-changes` | fragment | Changes likely rejected in review |
| `amkisko/publish-checks` | fragment | Pre-publish engineering checklist |
| `amkisko/collaboration-workflow` | fragment | Durable context, discovered improvements, and agent traces |
| `amkisko/getting-started` | fragment | How to install pray and wire a consumer |
| `amkisko/engineering-audit` | skill | Language-agnostic pipeline audit with skippable product modes |
| `amkisko/operational-signal-intake` | skill | Provider-neutral intake for live service, reliability, security, and user-impact evidence |
| `amkisko/changelog-update` | skill | Changelog layering and house style |
| `amkisko/public-surface-recon` | skill | Blackbox public web recon: HTTP, archives, public repos only |
| `amkisko/infer-conventions` | skill | Find how a tree writes; encode genuine forks as executable checks |
| `amkisko/session-review` | skill | Review agent sessions for repeated work, corrections, and reusable patterns |
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
