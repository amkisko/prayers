# Prayfile publish remote

Live work. Publisher dest is a project contract. Resource, trace, and boundary modes skipped: no executed product bytes and no plant.

## Participants

- amkisko

## Decisions

Declare the in-repo catalog dest in Prayfile with publish "prayers", path: "prayers". Do not list a package block: every path-owned declared package is the default set. Do not add a URL remote. Leave getting-started, rust-conventions, and elixir-conventions out of Prayfile; they stay catalog-only until a separate pass lists them as path packages.

make publish runs pray publish with no dest flags. make serve uses --to prayers. check-artifacts still reads ./prayers.

Requires pray 1.19.0. Older parsers reject the publish statement.

This pass is publisher workflow. No person-facing product surface to assess.

## Effects

Prayfile gained the named path remote. Makefile publish dropped --root. Makefile serve uses --to prayers. README publish section names the remote. Prayfile.lock generated_by is pray 1.19.0. manifest_hash is sha256:adc98c6423190595b898d8fa4418d044c5a3015bddf67d437f5dba2027829bd9.

pray publish --dry-run listed 29 path-owned packages to dest prayers and wrote nothing. getting-started, rust-conventions, and elixir-conventions were absent from that list.

Validation commands and observed results:

- pray version: pray 1.19.0
- pray install: exit 0; lock rewritten for 1.19.0 and the new manifest_hash
- pray plan: exit 0; lockfile and all destinations unchanged
- pray apply: exit 0
- pray verify && pray drift: exit 0; both emitted no findings
- pray publish --dry-run: exit 0; 29 packages, dest prayers
- make test: exit 0; validate_skill 13 runs, 39 assertions; check_artifacts 9 runs, 37 assertions; 0 failures
- make check-artifacts: exit 0; check-artifacts reported ok
- git diff --check && git diff --cached --check: exit 0, no diagnostics

Did not run a live catalog publish.

## Next

getting-started, rust-conventions, and elixir-conventions remain catalog-only until listed as path packages.

## Source

Upstream: pray 1.19.0 RFC 0118
Downstream: Prayfile, Makefile, README.md, CHANGELOG.md Unreleased, usr/docs/changelogs/20260918160400_prayfile-publish-remote.md
