# First-party unpublished in-repo packages

Live work. Fragment text is inference input.

## Participants

- amkisko

## Decisions

Keep the first-party packaging stop-gate in amkisko/minimal-implementation. That prayer is already always-on. Every consumer Prayfile would need a new line before a separate package applied.

dependency-policy stays on third-party registry packages.

Stop until one applies before adding a library directory or first-party package. One product owns the contract and is the only caller: keep source in that tree. A second tree in this repository will call the same commands, or the code has no product runtime: start an unpublished in-repo package. Own manifest, own tests, path-linked, 0.x, registry publish blocked. A second repository or a registry consumer exists: extract and publish, then follow dependency-policy.

Path-link the unpublished package rather than publishing for a first consumer or copying a private library into a second app tree.

Mark development-only isolation in the language pack, not in a comment. ruby-conventions names the gemspec, Gemfile path link, empty allowed_push_host, and group :development, :test. rust-conventions and elixir-conventions stay for a later pass.

Skip rfc-process. background-jobs shipped as a fragment stop-gate without an RFC.

Shared text stays generic. Project URLs and consumer library paths stay out.

## Effects

Source packages bumped: minimal-implementation 1.3.0, ruby-conventions 1.2.0. README consumer example constraints bumped to ~> 1.3 and ~> 1.2. CHANGELOG.md 1.11.0 cut on 2026-09-01.

make package for both. make publish wrote prayers/v1/artifacts for 1.3.0 and 1.2.0. 23 unrelated catalog json files restored from HEAD. New .praypkg files git-added. make apply: AGENTS.md 16326 bytes (58 under 16 KiB). make verify exit 0. make drift exit 0. make check-artifacts ok.

Later pass: prose audit. Numbered stop-gate restated as sentences. The two Do not punchlines became one Path-link sentence. Agency moved from the waiting package onto the consumer Prayfile line. Shared text dropped the No/No stack. CHANGELOG 1.11.0 says second in-repo caller.

Later pass: catalog cut. make plan, apply, verify, drift, and check-artifacts ok. Did not rerun make publish. Branch trunk/1.11.0.

## Next

Consumers bump minimal-implementation ~> 1.3 and ruby-conventions ~> 1.2, then pray install. Tag v1.11.0 after merge to main.

## Source

Upstream: first-party packaging stop-gate in minimal-implementation. Unpublished gem layout and Bundler group isolation in ruby-conventions.
Downstream: packages/minimal-implementation 1.3.0, packages/ruby-conventions 1.2.0, CHANGELOG.md 1.11.0
