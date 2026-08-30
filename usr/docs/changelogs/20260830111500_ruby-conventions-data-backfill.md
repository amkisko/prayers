# Ruby-conventions data backfill paging

## Participants

- amkisko

## Decisions

Ship ruby-conventions 1.1.0. Expand the data-migration line into paging, progress, and pasteable connection.execute SQL. Keep the fragment generic. List the package as a path source in this publisher Prayfile so publish includes it without composing it into AGENTS.md.

Later pass: drop host-app method names. Shared fragment keeps Rails connection.execute, DDL then DML, and schema-only idempotent db:migrate.

Later pass: usr/migrate is the shared surface. docs-conventions 2.3.0 names live console-first scripts. ruby-conventions 1.1.0 drops the paste line and points at that tree.

## Effects

ruby-conventions 1.1.0. Fragment 820 bytes. Catalog 1.1.0 artifact 994 bytes. make check-artifacts ok. make apply: AGENTS.md unchanged. make verify exit 0. make drift exit 0.

Later pass: drop host-app method names. Fragment 768 bytes. Catalog character_count 877. Artifact 973 bytes. make package, make publish, unrelated catalogs restored. make apply: AGENTS.md unchanged. make verify exit 0. make drift exit 0.

Later pass: docs-conventions 2.3.0 names usr/migrate. Fragment 1780 bytes. Artifact 2254 bytes. ruby-conventions 1.1.0 fragment 721 bytes. Artifact 935 bytes. make apply: AGENTS.md 16364 bytes (20 under 16 KiB). make verify exit 0. make drift exit 0. make check-artifacts ok.

## Next

Push this branch. Consumers bump docs-conventions ~> 2.3 and ruby-conventions ~> 1.1, then pray install.

## Source

usr/docs/issues/20260830111500_ruby-conventions-data-backfill.md
