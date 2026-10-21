# docs-conventions Participants omitted for current operator

## Participants

- Andrei Makarov

## Decisions

`amkisko/docs-conventions` 3.3.0 required five findable fields in issues, reviews, changelogs, and meetings. It limited Participants to humans but did not say when a known current operator must be named. The same wording appeared in the 3.1.1 artifact observed by a consumer.

The 3.4.1 guidance names the current operator when the current session provides their display name or that person confirms it. Solo sessions still get one Participants line.

The guidance omits Participants when identifying the operator would require inference. Git configuration, commit history, filesystem paths, OS accounts, and login names do not prove who operated the current session.

Other humans who decided or reported in the episode are included when known. Agents, tools, binaries, and people whose only connection is an earlier code change stay out.

Problem / Fix and similar ticket outlines do not replace Participants, Decisions, Effects, Next, and Source. Their content maps into Decisions and Effects.

A consumer workflow that always supplies a confirmed operator identity may add an `infer-conventions` check for a missing or blank Participants section. This package documents the option and does not ship the check.

## Effects

During ordinary work in one consumer repository, Andrei Makarov observed new live-work notes that omitted Participants or replaced the five headings with a Problem / Fix outline. This is testimony from that review; the consumer files and a reproducible count are not part of this repository.

Inspection of the published 3.1.1 and 3.3.0 artifacts confirmed that both said only "Participants (humans only; omit agents, tools, and binaries)." Repository search found no shipped Participants checker in `usr/scripts` or `amkisko/infer-conventions`.

Package `amkisko/docs-conventions` 3.4.0 added an identity inference chain. The prose audit rejected that chain because repository and machine metadata do not prove the current operator. Version 3.4.1 replaces it with confirmed identity only and updates the export and README.

The release also extends `check-prayer-prose` to timestamp-tree notes and catalog JSON.

Tagged prayers `v1.28.0` on commit `e00e452` and published https://github.com/amkisko/prayers/releases/tag/v1.28.0.

## Next

1. Consumers run `pray update`, `pray plan`, and `pray apply` for docs-conventions 3.4.1.
2. Consumers may backfill open notes when the operator is known.
3. A later session review may check whether omissions recur after consumers install 3.4.1.

## Source

- `packages/docs-conventions/exports/docs-conventions.md`
- `packages/docs-conventions/README.md`
- `prayers/v1/artifacts/amkisko/docs-conventions/3.1.1/amkisko-docs-conventions-3.1.1.praypkg`
- `prayers/v1/artifacts/amkisko/docs-conventions/3.3.0/amkisko-docs-conventions-3.3.0.praypkg`
- `prayers/v1/artifacts/amkisko/docs-conventions/3.4.0/amkisko-docs-conventions-3.4.0.praypkg`
- `docs/changelogs/20260726221452_docs-conventions-human-participants.md`
