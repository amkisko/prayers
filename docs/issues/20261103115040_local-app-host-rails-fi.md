# Local app host: rails.fi and title.hash instead of example.com

## Participants

Andrei Makarov (@amkisko)

## Decisions

Encode the host rule in `amkisko/ruby-conventions`. Development, system and request specs, `default_url_options`, OAuth callbacks, Capybara app host, and curl against the running app use `https://<app>.rails.fi` or `http://rails.fi`. Prefer project `HOST` / `RAILS_HOST`.

Do not use `example.com`, `example.org`, or `example.net` anywhere in fixtures, stubs, mocks, allowlists, documentation hosts, or fake email. Those names resolve on the public Internet (observed A records under Cloudflare anycast), not to loopback.

Fictional remote host, external-service mock, or fake email that must not hit the local app: `<title>.<hash>` (product label plus short hex, for example `demo.7c3e9a1b` / `user@demo.7c3e9a1b`). House fake mail that is local-app shaped may use `@rails.fi`.

Keep `config.hosts`, Capybara, and mailer host on `*.rails.fi`. Remove leftover `example.com` names from local allowlists.

`public-surface-recon` illustration hosts use the same `<title>.<hash>` shape (`*.demo.7c3e9a1b`), not `rails.fi` (loopback) and not `example.com`. Do not compose `ruby-conventions` into this repository AGENTS.md (publisher path source only).

## Effects

Source packages: `amkisko/ruby-conventions` 1.4.1, `amkisko/public-surface-recon` 1.4.1. README consumer example emails `@rails.fi`. CHANGELOG.md Unreleased names the bumps. Observed: publish wrote both 1.4.1 artifacts; apply updated provisioned public-surface-recon skill files; `make check-artifacts` ok; `make check-prayer-prose` ok; `RBENV_VERSION=3.4.10 make test` exit 0.

## Next

- Consumers bump `amkisko/ruby-conventions` to `~> 1.4` and `amkisko/public-surface-recon` to `~> 1.4`, then `pray install`.
- Product apps: replace local fixture hosts that use `example.com` with `*.rails.fi`; drop `example.com` from local `config.hosts`; use `<title>.<hash>` for fictional remotes and external mocks.
- Commit and merge `trunk/1.34.0` (CHANGELOG cut), then deliver `v1.34.0` tag and GitHub release.

## Source

- DNS: Google DNS DoH `rails.fi` / `foo.rails.fi` A = `127.0.0.1`; `example.com` A = public Cloudflare addresses; `demo.7c3e9a1b` NXDOMAIN (Status 3).
- Downstream: `packages/ruby-conventions/`, `packages/public-surface-recon/`, CHANGELOG.md Unreleased.
