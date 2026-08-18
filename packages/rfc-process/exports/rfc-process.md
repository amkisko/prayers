## RFC process

Significant user-facing contract changes start as an RFC. Trivial exemption: bugfixes, typos, and refactors that do not change user-facing contracts.

Claim `rfcs/ids/NNNN` before writing `rfcs/NNNN-slug.md`. Copy `rfcs/0000-template.md`. Omit unused header fields and empty sections. Implementation PRs cite `RFC-NNNN`. Numbering bands, isolation, and extra product tests live in `rfcs/README.md`. Follow the rfc-process skill. Do not renumber existing documents. Do not rewrite as-built RFC bodies unless asked.
