## Decisions

Research scope: assess the two supplied analyses of negation guidance against package sources and primary publications. Recommendations below are proposals. Package sources, managed instructions, and published artifacts remain unchanged.

Clarify writing-prose so an editor can distinguish empty rhetorical contrasts from necessary negation. Preserve scope and uncertainty explicitly. This is an instruction-design recommendation; its effect on agent output has not been measured here.

Keep the short fragment architecture. A required subject, event, consequence template would add an unrelated constraint. Personalization settings belong with the application that owns them. Portable editorial requirements remain useful in repository guidance even when one application has similar defaults.

Proposed writing-prose opening, replacing the existing review sentence:

Review for marketing language, invented objections, empty contrasts, stray em dashes, and paragraph flow; keep notes and metadata honest and plain.

In the existing quality-constructs bullet, replace its final phrase, rewrite for meaning, with:

preserve meaning, necessary negation, scope, and uncertainty when editing

Interpret empty contrasts as corrections that neither answer a stated position nor clarify a material distinction. A direct negative answer, a prohibition, an absence, and an unknown result remain available. The wording protects meaning while leaving editorial judgment with the reviewer.

Consider broadening working-rules' existing validation bullet to cover completed actions:

- report completed actions only with observed evidence; validation output must list exact commands run and observed results;

This covers the unsupported settings-change claim motivating the first attachment, along with tests, installs, and publications. The existing bullet explicitly covers test claims. General claims verification is present elsewhere, but the second attachment overstates the exact overlap.

When implementing the prose clarification, align engineering-audit's and changelog-update's negation-first wording in their package skill sources. Suggested replacement: state the finding directly; preserve necessary negation. Changelog-update's workflow also repeats negation-led sentences and needs the same interpretation.

## Effects

Repository inspected at eeec628. The working tree was clean before this research record was added.

Claim ledger follows. Attachment A is the Russian analysis; attachment B is the English analysis with a claims table.

C1. Location: attachment B, Rezaei and Blanco row and subsequent discussion. Claim: only 17–36% of generated affirmative interpretations preserved meaning. Outcome: unsupported. Source S1, Table 3, printed page 605, gives 64% for AHB and 83% for ACG, with 90% for unrestricted SCG paraphrases. The complements are 36% and 17% failure rates. Nearby paper prose conflicts with the table. Action: cite the table and disclose the inconsistency; the study supports a risk of semantic loss in this method, not a universal error rate for affirmative writing. It also reports improved downstream question answering when paraphrases supplement the original input.

C2. Location: attachment B, Boggia statistics. Outcome: partially supported. S2 Table 4 reports 72%, 70%, and 48% reductions, with p-values 0.03, 0.004, and 0.43. Section 4 reports roughly 2.2 and 0.2 model/human density ratios in oratory and informal Q&A. Its limitations identify pilot samples, one Claude family, an unvalidated English detector, and unequal Italian detector precision for model and human text. English per-genre significance does not survive strict multiplicity correction. Adapter content fidelity is unreported. Action: retain these as attributed exploratory findings; avoid generalizing to current coding agents or calling the effect established across LLMs.

C3. Location: attachments A and B, affirmative phrasing as a general improvement. Outcome: partially supported as a design proposal. Preserving necessary negation and uncertainty follows the requested contract. Neither S1 nor S2 validates the proposed prayer. Contrary evidence S3 finds task- and model-dependent instruction-following effects, including near parity for two older models. Action: distinguish negation in an instruction from negation in generated prose. Validate the actual wording against repository tasks before claiming effectiveness.

C4. Location: attachment A, opening settings-change report; attachment B, Candid row. Outcome: unverifiable for the reported action. S4 supports Candid's existence and description as direct and encouraging. It documents personality alongside memories and custom instructions, and its Candid examples themselves contain contrastive phrasing. Action: distinguish documented product behavior from evidence that a particular setting or preference was saved.

C5. Location: attachment B, Cursor residue and built-in voice claim. Outcome: unverifiable. S5 documents configurable user and project rules. The opened material does not establish a Candid preset or a universal built-in prohibition on the cited rhetorical form. The first attachment does not mention Cursor. Action: omit these assertions from the rationale unless versioned product evidence or the relevant settings are available.

C6. Location: attachment B, Langenkamp attribution. Outcome: unverifiable in this pass. Search located related dictionary material, but direct attempts to open the proposed Earned Parallelism entry failed. Action: omit the attribution; treat the criterion for useful contrasts as editorial judgment.

C7. Location: attachment B, size-neutral swap and compose budget. Outcome: partially supported. AGENTS.md measures 16,322 bytes, leaving 62 below the README's 16,384-byte house ceiling. The first proposed swap adds 20 bytes; both swaps add 73 and project to 16,395, exceeding the ceiling by 11. The full two-part alternative under Decisions has zero byte growth. Action: use measured sizes and distinguish this repository ceiling from a product default.

C8. Location: attachment B, existing guidance and historical constraints. Outcome: supported for writing-prose 3.3.0, the undefined negation-led review wording, skill hook wording, and the 2026-08-15 decision to keep literary rules outside the catalog. Its README scopes writing-prose to traces and changelogs. The fragment currently measures 1,241 bytes. Action: clarify existing owners and avoid adding a personalization block.

C9. Location: attachment B, action-confirmation redundancy. Outcome: partially supported. Working-rules line 12 expressly requires actual passing test execution and exact validation results. Claims-audit requires evidence and outcomes for checkable claims; it does not contain the quoted completed-checks wording. Action: the compact general action-evidence replacement is a reasonable extension, not a verbatim duplicate.

C10. Location: attachment A, directness, affirmative grammar, confidence, repetition, and the unproven/wrong example. Outcome: supported as textual and logical analysis. Lack of proof does not establish falsity. The proposed instruction's first-word ban also restricts necessary direct negative answers. Action: keep these arguments as analysis; avoid presenting them as experimentally established effects on readers. The ambiguity reading of the Russian wording is interpretation, not a verified dictionary claim.

Validation performed:

Command: wc -c AGENTS.md packages/writing-prose/exports/writing-prose.md
Result: 16,322 and 1,241 bytes, exit 0.

An in-memory Ruby comparison replaced the exact phrases above and used String#bytesize and File.size. Result: writing-prose delta 0; working-rules delta -11; both changes project AGENTS.md to 16,311 bytes. These are arithmetic projections, not rendered installation results.

Command: git diff --check
Result: exit 0, no diagnostics; this covers tracked changes only.

Command: git diff --no-index --check /dev/null usr/docs/issues/20260907111611_negation-guidance-claims-review.md
Result: exit 1 for the new-file difference, with no whitespace diagnostics.

No executable code changed. No test suite, installation, package build, or publication ran. Output behavior under the proposed instructions remains untested.

Later pass, 2026-09-07: the user approved implementation. Updated writing-prose 3.4.0, working-rules 2.3.0, engineering-audit 2.7.1, and changelog-update 2.1.1 in package sources referenced by Prayfile. Built and published the four versions to the local catalog, then regenerated managed instructions and the lockfile with make install. AGENTS.md is 16,311 bytes. Full validation and the validator fallback are recorded in usr/docs/changelogs/20260907112424_negation-guidance-and-action-evidence.md. The proposed edits are complete; the earlier unchanged-source statements describe the research pass.

## Next

Observe representative changelogs and audit findings in future use. Include a necessary negative answer, a prohibition, a qualified inference, a real correction, and an unsupported completion claim. Check semantic preservation and accurate action reporting. A count of negation tokens alone cannot establish success. These are future behavior observations, not executed specs or content-matching unit tests.

Research stopped after checking the central cited papers, local ownership and sizes, and contrary evidence. Langenkamp retrieval and the original settings-change claim remain unresolved; neither is required for the recommendation.

## Source

Source access and query date: 2026-09-07. The two user-supplied attachments are the review inputs. Private attachment locations and account settings are omitted.

S1. MohammadHossein Rezaei and Eduardo Blanco, Paraphrasing in Affirmative Terms Improves Negation Understanding, ACL 2024. Primary research. Table 3 and its surrounding analysis, printed page 605, and Table 1. https://aclanthology.org/2024.acl-short.55.pdf

S2. Federico Boggia, Artificial Epanorthosis: Why large language models overuse a classical rhetorical figure, and how to mitigate it, July 2026 arXiv preprint. Primary exploratory research. Sections 4.1, 7.8, and Limitations. https://arxiv.org/html/2607.21498

S3. Alex Bleakley, Saying what not to do: Can state-of-the-art language models understand negated instructions?, 2023 experiment report. Primary author report, older models and format constraints, with linked code. Tables 1–4 and Results and conclusions. https://alexbleakley.com/blog/saying-what-not-to-do

S4. OpenAI Help Center, Customizing Your ChatGPT Personality. Official living documentation. Candid overview, preference interaction, and conversational examples. https://help.openai.com/en/articles/11899719-customizing-your-chatgpt-personality

S5. Cursor, Rules. Official living documentation. User Rules and project-rule scope. https://prod.cursor.com/docs/rules

Local evidence: README.md, Compose budget; Prayfile; packages/writing-prose/exports/writing-prose.md; packages/writing-prose/amkisko-writing-prose.prayspec; packages/working-rules/exports/working-rules.md; packages/claims-audit/skills/claims-audit/claims-audit.md; packages/engineering-audit/skills/engineering-audit/engineering-audit.md; packages/changelog-update/skills/changelog-update/changelog-update.md; usr/docs/changelogs/20260815131000_writing-prose-3-claims-audit.md.

Web query log: Rezaei Blanco 2024 affirmative interpretations CondaQA 17 36 negation; "Langenkamp" "earned parallelism"; "negation" affirmative negative instructions language models prompt study; site.cursor.com/docs "Candid"; site.cursor.com/docs/rules "User Rules"; site.langenkamp.io "Earned Parallelism". The first queries located S1 and contrary evidence S3; Cursor results led to S5 but did not establish the claimed preset or voice default. Langenkamp direct retrieval remained unsuccessful. S2 and S4 were opened from the supplied citations.
