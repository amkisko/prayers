# Ruby-conventions data backfill paging

Live work. Fragment text is inference input.

## Participants

- amkisko

## Decisions

Keep ruby-conventions as one fragment. Expand the data-migration bullet into paging, progress, and pre-deploy paste. Shared prayers stay generic: omit repository paths, product names, and deploy commands. Generator templates and enqueue injection stay in the data-migration gem. working-rules, docs-conventions, and a data-migration skill stay out.

Schema DDL in db/migrate. Row backfills in db/data_migrations. Keep up and change as schema DDL. Page large backfills with an id cursor or offset/limit. Pass total_records and processed_count. enqueue the next page. When enqueue is absent (console new.perform), drain remaining pages in the same perform. Log processed_count/total_records or print a dot. When the fill must run before the new class is on the process, keep pasteable connection.execute SQL (DDL then DML). Later db:migrate is schema-only and idempotent.

Later pass: drop host-app method names from the fragment. Rails up, change, db:migrate, and connection.execute stay. Helper names stay in the consumer overlay and data-migration gem.

Later pass: reverse docs-conventions stay-out for this surface. usr/migrate holds live console-first scripts, language and framework agnostic. docs-conventions 2.3.0 names that tree. ruby-conventions 1.1.0 keeps Rails paging and points at usr/migrate. working-rules and a data-migration skill stay out.

Publisher Prayfile lists ruby-conventions as a path source so pray publish includes it. It is not composed into this repo AGENTS.md.

## Effects

Source package bumped to ruby-conventions 1.1.0. Fragment is 820 bytes (derived catalog character_count 929 with README). pray publish wrote prayers/v1/artifacts/amkisko/ruby-conventions/1.1.0/. Unrelated catalog published_at stamps restored from HEAD. make check-artifacts ok after git add of the 1.1.0 praypkg. make apply: AGENTS.md unchanged. make verify exit 0. make drift exit 0. Prayfile.lock lists amkisko/ruby-conventions 1.1.0 from path.

Later pass: rebuilt 1.1.0 in place without host-app method names. Fragment 768 bytes. Catalog character_count 877. Artifact 973 bytes. make package, make publish, 23 unrelated catalog files restored. make apply: AGENTS.md unchanged. make verify exit 0. make drift exit 0.

Later pass: docs-conventions 2.3.0 names usr/migrate. Fragment 1780 bytes. Catalog character_count 3911. Artifact 2254 bytes. ruby-conventions 1.1.0 fragment 721 bytes. Catalog character_count 830. Artifact 935 bytes. make package for both. make apply: AGENTS.md 16364 bytes (20 under 16 KiB). make publish, 22 unrelated catalog files restored. make verify exit 0. make drift exit 0. make check-artifacts ok after git add of 2.3.0 and rebuilt 1.1.0 praypkg files.

Later pass: merged to main and pushed. Product changelog 1.10.0.

## Next

Consumers bump docs-conventions ~> 2.3 and ruby-conventions ~> 1.1, then pray install. Overlay keeps local template path and process timeouts. Console-first scripts live in usr/migrate.

## Source

Upstream: host app backfill before the schema class is on the process
Downstream: packages/docs-conventions 2.3.0, packages/ruby-conventions 1.1.0, CHANGELOG.md 1.10.0
