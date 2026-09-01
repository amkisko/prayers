- test coverage must follow @spec/README.md guidelines;
- use ruby and Rails features according to the codebase versions;
- follow ruby and Rails coding conventions, principles, and best practices;
- schema DDL in `db/migrate`; row backfills in `db/data_migrations`; keep `up` and `change` as schema DDL;
- page large backfills with an id cursor or `offset`/`limit`; pass `total_records` and `processed_count`; `enqueue` the next page; when `enqueue` is absent (console `new.perform`), drain remaining pages in the same `perform`;
- log progress as `processed_count/total_records` or `print "."`;
- unpublished in-repo gem: gemspec next to the library, Gemfile `path:` link, version 0.x, metadata `allowed_push_host` empty so gem push fails;
- development and test isolation: declare the path gem in `group :development, :test` so production never requires it;

Related: `docs-conventions` names `usr/migrate` for console-first scripts that must run before new code is on the process.
