# First-party unpublished in-repo packages

## Participants

- amkisko

## Decisions

Ship minimal-implementation 1.3.0 with a first-party packaging stop-gate after the YAGNI list. Ship ruby-conventions 1.2.0 with unpublished gem layout and development and test Bundler group isolation. Keep dependency-policy on third-party registry packages. Skip rfc-process. Cut CHANGELOG.md 1.11.0.

## Effects

minimal-implementation fragment 2249 bytes. Catalog character_count 2353. Artifact 1685 bytes. ruby-conventions fragment 985 bytes. Catalog character_count 1094. Artifact 1086 bytes. 23 unrelated catalog json files restored from HEAD. make apply: AGENTS.md 16326 bytes (58 under 16 KiB). make verify exit 0. make drift exit 0. make check-artifacts ok after git add of 1.3.0 and 1.2.0 praypkg files.

Later pass: prose audit of the live-work issue and the CHANGELOG bullets. Fragments unchanged. Catalog cut to 1.11.0. make plan, apply, verify, drift, and check-artifacts ok. Did not rerun make publish.

## Next

Consumers bump minimal-implementation ~> 1.3 and ruby-conventions ~> 1.2, then pray install. Tag v1.11.0 after merge to main.

## Source

usr/docs/issues/20260901181840_first-party-unpublished-packages.md
Downstream: CHANGELOG.md 1.11.0
