- test coverage must follow @spec/README.md guidelines;
- use ruby and Rails features according to the codebase versions;
- follow ruby and Rails coding conventions, principles, and best practices;
- schema DDL in `db/migrate`; row backfills in `db/data_migrations`; keep `up` and `change` as schema DDL;
- page large backfills with an id cursor or `offset`/`limit`; pass `total_records` and `processed_count`; `enqueue` the next page; when `enqueue` is absent (console `new.perform`), drain remaining pages in the same `perform`;
- log progress as `processed_count/total_records` or `print "."`;
- unpublished in-repo gem: gemspec next to the library, Gemfile `path:` link, version 0.x, metadata `allowed_push_host` empty so gem push fails;
- development and test isolation: declare the path gem in `group :development, :test` so production never requires it;
- generate the public path from the slug column when present, otherwise the primary key; lookup uuid-shaped text as primary key, then slug, then integer primary key only when the schema holds integers; do not put display names in HTTP paths;
- do not override `Model.find` or enable global FriendlyId finders; a `belongs_to` finder must exist on the relation;
- `path(record)` uses `to_param`; path of a raw id string does not;
- person-facing date and datetime fields are text (or a widget bound to the product form), not native `date` or `datetime-local`, when the product locale is not the browser locale;
- ActiveRecord `TimeZoneConverter` converts strings through `in_time_zone` before DateTime cast; a parse prepend on Date or DateTime does not see those strings unless the converter is also prepended; ISO JSON and params stay on the default caster;
- association pickers reuse the existing admin list API with a bounded page; they do not pluck the full table into the form;

Related: `docs-conventions` names `usr/migrate` for console-first scripts that must run before new code is on the process.
