# Engineering-audit product modes and libyears

Live work. Skill text is inference input: resource, trace, and boundary modes skipped because these files never become executed bytes and there is no plant.

## Participants

- amkisko

## Decisions

engineering-audit stays language- and framework-agnostic. Optional modes (product surface, privacy, performance, observability, security review, contracts, learned systems) skip when the product has no matching surface. Tool and framework names stay in the consumer repository.

Libyears and equivalent lag metrics belong in dependency-audit Pass 2, not in engineering-audit. Lag is not effort. Bands are starting guidance and differ by ecosystem.

Do not publish a separate tech-audit prayer. Product paths, locales, and named quality scripts stay in consumer overlay.

## Effects

Source packages bumped: engineering-audit 2.6.0, dependency-policy 3.2.0. Product changelog 1.8.0.

make package for both packages. make apply used path sources. AGENTS.md 16328 bytes (56 under 16 KiB). make verify exit 0. make drift exit 0. make publish, unrelated catalog json restored from HEAD, new 2.6.0 and 3.2.0 artifacts kept. make check-artifacts ok after git add of those praypkg files.

## Next

Consumers bump engineering-audit ~> 2.6 and dependency-policy ~> 3.2, then pray install. Local product-health forks can drop duplicated pipeline and libyears pages and keep overlay for paths and locales.

## Source

Upstream: consumer tech-audit catalog (concepts only)
Downstream: CHANGELOG.md 1.8.0, packages/engineering-audit 2.6.0, packages/dependency-policy 3.2.0
