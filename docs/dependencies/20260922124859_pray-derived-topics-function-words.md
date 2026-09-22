# Pray derived topics keep function words

## Dependency

pray 1.20.0. Catalog writer uses pray-core derived_metadata. STOPWORDS in pray-core 1.20.0 src/derived_metadata.rs: a, an, and, are, as, at, be, by, for, from, has, have, in, is, it, its, of, on, or, package, the, this, to, was, we, with, you, your. Tokens shorter than 4 characters are dropped. Remaining tokens are ranked by frequency. The first five become topics.

## Symptom

Catalog JSON under prayers/v1/packages/amkisko/*.json stores derived_metadata.topics with function words. docs-conventions 3.0.0 topics are what, only, that, docs, open. Latest versions across this catalog also rank when, that, only, work, they, will, before, after. Search and browse quality is poor. The field looks hand-authored and is not.

## Evidence

pray publish wrote those topics. Package prayspec files have no topics field. Live source for docs-conventions 3.0.0 uses phrases such as what the product does not do, only when, and open questions. Those words pass the stop list because they are four letters or longer.

Observed latest topics for docs-conventions 3.0.0: what, only, that, docs, open.

tokenize in derived_metadata.rs also stops after 512 tokens, so ranking is the head of the file, not the whole package.

Derived metadata is an annotation layer. It does not change artifact hash or version identity. https://github.com/kiskolabs/pray

## Suggested fix

Upstream: expand STOPWORDS to cover function words that pass the four-letter floor: what, that, this, when, only, also, into, from is already listed, over, after, before, without, within, they, them, their, will, would, should, could, about, under, other, such, than, then, both, each, more, most, some, same. Rank after filtering. Prefer package summary and export names over raw fragment frequency, or let a prayspec topics list win when present.

Workaround in this repo: after pray publish, usr/scripts/catalog_topics.rb rewrites derived_metadata.topics from derived_metadata.summary with an expanded stop list. Artifact hash, tree hash, and signature stay. Do not bump packages only to refresh topics. make publish runs that rewriter.

Later pass 2026-09-22: this catalog rewrite is in place. Do not open an upstream issue or pull request from this note.

## Next

Leave pray STOPWORDS as an upstream defect. New publishes in this repo stay filtered by catalog_topics.rb until a pray release ranks summaries the same way.

## Source

pray-core 1.20.0 src/derived_metadata.rs STOPWORDS, tokenize, top_topics.
Downstream: prayers/v1/packages/amkisko/docs-conventions.json 3.0.0, collaboration-workflow.json and other latest records in that tree.
