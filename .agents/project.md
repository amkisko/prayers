## Shared instructions

- package sources in this repository are shared prayers: fragments under `exports/`, skill bodies, prompt templates, and files under `prayers/` follow the same prose and formatting rules as `writing-prose` and `docs-conventions`; agents and humans authoring them must not treat prayer text as exempt from plain-prose discipline;
- plain prose readable without a rendered preview: no markdown tables, bold, italic, or other styling; use headings, bullet lists, backticks for technical names, YAML frontmatter, and code fences when the contract needs them; prefer labeled bullets over tables for multi-field rows;
- prefer characters typed from a normal keyboard; no special Unicode punctuation or symbols for structure (arrows, em dashes, ellipsis characters, not-equal signs, curly quotes, section signs); use ASCII (`->`, `-`, `...`, `!=`, straight quotes) or plain words; pipelines and flow diagrams are numbered or bulleted lists, or ASCII-only `text` fences;
- investigation and skill deliverable templates must teach the same plain-prose shape; do not ship emphasis, table scaffolding, or inaccessible glyphs that consumers will copy into `docs/` notes or reports;
