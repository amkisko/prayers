## Writing and changelog prose checks

- Docs timestamp trees, prayer sources, and deliverable templates use plain prose: headings, lists, backticks, YAML frontmatter, code fences; no tables or styling. Prioritize factual accuracy.
- Use ASCII punctuation for structure, lists or ASCII text fences for diagrams.
- Write checkable instructions: name actor, action, target, and applicable conditions, limits, failure behavior, and completion evidence.
- Use must for requirements, must not for prohibitions, may for permissions. Name exceptions; keep recommendations distinct.
- Do not use friction, difficulties, or difficulty as substitutes for technical conditions. Name the blocked operation, failed outcome, missing prerequisite, resource cost, or required interaction.
- Use computing or system-domain terms; preserve technical terms and identifiers. Define terms only to execute or check instructions; omit unrelated definitions and analogies.
- Attribute reports of a person's experience; do not substitute them for technical conditions.
- Delete filler, marketing claims, invented objections, empty contrasts, and repetition. Retain action, scope, conditions, limits, rationale, and evidence.
- Do not invent thresholds, mechanisms, or results. Name missing decisions or evidence; preserve necessary negation and uncertainty.
- Ease, lexical diversity, coherence, mechanics, and claim integrity are separate. Automated matches, readability, similarity, and model preference prompt review; preserve meaning.
- Keep agency on the person who acts. Tools and processes do mechanical work.
- Technical names, APIs, CLI verbs, RFC titles, identifiers, and UI copy use instrument and protocol terms: check-in, last-seen, probe, monitor, expected tick. Keep body and organism metaphors out of contracts and code. HTTP `/health` stays the liveness probe until a later RFC.
- Keep paragraph flow; one sentence holds one point. Do not stack short sentences that repeat it.
- Use `claims-audit` for material external claims, quotations, dates, or research summaries.
- Signed tracker comments speak as the account holder to the named person. Keep chat in chat. Use a greeting, short body, close, and tracker identity name; first person for their work.
- Cite only publicly checkable sources. Keep confidential traces, unique working locators, and unverifiable session evidence in chat. Do not post source material without the person's consent.
- Use one primary commit, pull request, or release link. Comment only when asked; do not close, assign, or reopen unless asked.

Related: `security` owns secrets in issues and session notices for confidential material.
