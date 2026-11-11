# Ban example.com hosts; prefer rails.fi and title.hash

## Participants

Andrei Makarov (@amkisko)

## Intent

Remove `example.com` / `.org` / `.net` from local fixtures, documentation illustration hosts, and fake email. Point local app hosts at `*.rails.fi`. Point fictional remotes at `<title>.<hash>`.

## Implementation

`amkisko/ruby-conventions` 1.4.1 host bullets. `amkisko/public-surface-recon` 1.4.1 illustration hosts (`*.demo.7c3e9a1b`). README consumer emails `@rails.fi`. Live-work note `docs/issues/20261103115040_local-app-host-rails-fi.md`. CHANGELOG.md Unreleased.

## Validation

- Google DNS DoH: `rails.fi` and `foo.rails.fi` A = `127.0.0.1`; `example.com` A = public Cloudflare addresses; `demo.7c3e9a1b` NXDOMAIN.
- `make PRAY=$HOME/.cargo/bin/pray publish`: published ruby-conventions 1.4.1 and public-surface-recon 1.4.1.
- `make apply verify check-artifacts check-prayer-prose`: exit 0 after `git add` of new praypkg files.
- `RBENV_VERSION=3.4.10 make test`: exit 0.

## Source

docs/issues/20261103115040_local-app-host-rails-fi.md
CHANGELOG.md Unreleased
