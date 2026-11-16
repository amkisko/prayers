# Prayers evaluation claims review

Scope: fact-check and analyze the supplied proposal for studying Prayfile distribution, composed guidance, and on-demand skills. Research date: 2026-11-16. Repository baseline: `ee0d9ceab8eef870f987e305795425d30475b412`.

## Participants

Andrei Makarov

## Decisions

Keep the proposal's separation of distribution reliability, routing, instruction adherence, task outcomes, cost, and harm. Treat it as a research design proposal, not as evidence that prayers improve engineering work.

Correct unsupported research attribution and universal numerical rules before reusing the text. Preserve useful recommendations as recommendations. Distinguish published observations, this review's methodological inferences, and hypotheses requiring new experiments.

Record a bounded literature review and repository inspection. Do not implement a benchmark, change shared packages, publish artifacts, or claim a model-quality result from this review.

## Effects

### Synthesis

The proposal is a useful starting design with several material overstatements. Research supports separating skill selection from compliance and task success. It does not establish one universal five-stage taxonomy, a sufficient three-repeat sample, or a general optimum of three modules.

The evidence does not support a universal ordering of on-demand skills and always-on context. Vercel reported a Next.js documentation index outperforming its skill conditions [S03]. Another study found no general success improvement from repository context files despite increased inference cost [S04]. SWE-Skills-Bench v2 reported no statistically significant effect for 92 of 98 skills, using skill-derived requirements and explicit invocation [S05]. These are different interventions and populations; their averages should not be combined into a single expected prayers effect.

The most consequential correction is causal: a randomized skill-availability comparison estimates the total effect of offering the package, including its metadata and selection overhead. Dropping runs that did not activate the skill changes that estimand and can introduce selection bias. A separate forced-load experiment can assess availability of the body under a defined protocol. It does not recover the natural-use effect automatically [S16; methodological application].

Source IDs resolve in the [source and search ledger](20261116171015_prayers-evaluation-sources.md#source). The [study plan](../plans/20261116171015_prayers-evaluation-study.md) translates these corrections into a proposed protocol. The [live issue](../issues/20261116171015_prayers-evaluation-evidence.md) owns unresolved project work.

### Contrary pass

Before constructing the claim ledger, the review recorded counterexamples to passive-versus-dynamic superiority, questioned the five-stage attribution and numerical thresholds, and checked context-length confounding, post-treatment selection, verifier limitations, and clustered trials. The full attack log is in the source ledger.

The supplied proposal primed the review. This is parent-prompt contamination; this review is not an independent blinded replication. Contrary evidence was sought before accepting the proposal's preferred conclusions.

### Publication-blocking claims

#### C01: Five stages attributed to recent skill research

- Location: supplied section 2, introduction to the stage mapping.
- Claim: research establishes exposure, retrieval/routing, activation, use/adherence, and outcome as five levels.
- Evidence: Skill-Use defines Trigger, Compliance, and Boundary [S07, section 3]; SRA-Bench separates retrieval, incorporation, and application [S08, abstract]. The supplied text names no paper for its exact five-stage sequence.
- Outcome: unsupported as an attribution. Searches did not identify that exact taxonomy; this does not establish that no such source exists.
- Action: label the five observables as a proposed prayers diagnostic model, or supply the original paper and passage. Related decompositions support its usefulness without establishing its provenance.

#### C02: A causal experiment must vary only one factor at a time

- Location: supplied section 3, heading and fixed/variable rules.
- Evidence: NIST explains that one-factor-at-a-time designs miss interactions [S12].
- Outcome: contested as a universal requirement.
- Action: use controlled paired comparisons for a specified intervention. Use a factorial design when selector, body, catalog size, or loading mode interactions are the question. Pairing alone does not remove order effects, carryover, changing services, or selective exclusions.

#### C03: At least three repetitions per cell establish adequate evidence

- Location: supplied sections 3 and 7.
- Evidence: Agent Skills documentation calls three a starting point for trigger tests [S10, Running multiple times]. Few-run statistical work emphasizes uncertainty, not a universal sufficient count [S14].
- Outcome: unsupported if presented as statistical adequacy; supported as an explicitly provisional pilot setting.
- Action: select confirmation counts from a meaningful effect, required precision, task/repository dependence, and available budget. Report uncertainty even when the pilot is inconclusive.

#### C04: Thirty to eighty tasks and ten fixtures per skill define a scientific minimum

- Location: supplied section 7, items 1 and 2.
- Evidence: no derivation or source for these thresholds was supplied. Official trigger guidance suggests about twenty queries as a practical starting set, not a power guarantee [S10, Designing trigger eval queries].
- Outcome: unsupported as universal minimums.
- Action: retain only as illustrative pilot sizes. Specify whether ten means total or per positive, negative, and boundary stratum. Repeated paraphrases do not supply independent coverage of task families.

#### C05: The proposed three-module threshold

- Location: supplied sections 3, 6 hypothesis 1, and 7.
- Evidence: SkillsBench v4 Appendix F groups different tasks by attached skill count and documentation size [S01]. It does not randomize bundle size on the same task.
- Outcome: partially supported as motivation from a benchmark association. The supplied section 6 already frames the advantage as a hypothesis; its prayers effect is unverifiable, not an established causal threshold.
- Action: preserve the hypothesis framing and test size on the same tasks with explicit content controls. A SkillsBench skill directory, a prose module, and a prayers package are different counting units.

#### C06: Semantic version changes produce effects, while prose polish does not

- Location: supplied section 6, hypothesis 4.
- Evidence: Vercel reports changed outcomes after changing invocation wording while keeping the skill and documentation [S03, Explicit instructions helped, but wording was fragile].
- Outcome: unverifiable as the supplied hypothesis; unsupported if reused as a factual distinction.
- Action: preserve the hypothesis framing. Version labels do not define treatment strength. Freeze actual bytes and test changed wording. Define semantic change and polish before observing results, and permit either to have an effect.

#### C07: All organizational metrics require inter-rater agreement

- Location: supplied section 4E, concluding sentence.
- Evidence: agreement concerns judgment labels; mechanically logged time and counts do not involve multiple raters. This is a measurement-design inference, not an empirical finding about prayers.
- Outcome: unsupported as stated.
- Action: define event boundaries for timing, acceptance, and correction turns. Measure agreement for subjective classifications such as avoidable rework or substantive policy escapes. Preregister confirmatory decisions where feasible; do not make preregistration a condition for all useful exploratory work.

### Material qualifications

#### C08: The normalized-gain formula is a SkillsBench metric

- Location: supplied sections 3 and 4D.
- Evidence: SkillsBench v4 section 4, equation 1, uses `g = (p_skill - p_baseline) / (1 - p_baseline)` [S01].
- Outcome: supported for `0 <= p_baseline < 1`, with probabilities on the same scale and population.
- Action: report absolute paired percentage-point change first. At baseline 1, this formula is undefined, including a tied perfect score. Near 1 it amplifies uncertainty. Negative gain is not bounded below by -1 over the full domain. Distinguish gain computed from pooled rates from a mean of configuration-level gains.

#### C09: CSR and ISR have the stated definitions

- Location: supplied sections 2, 4C, and 7.
- Evidence: AGENTIF section 3.4 defines CSR over individual applicable constraints and ISR over instructions satisfying all constraints [S02].
- Outcome: supported.
- Action: specify micro versus task-macro aggregation, applicability, missing evidence, and the zero-applicable-constraint case. Keep common task constraints identical across arms; score additional skill-specific obligations separately. ISR is not necessarily task success.

#### C10: Loaded bytes or tokens measure activation and use

- Location: supplied section 2, Activation row, and its interpretation.
- Evidence: progressive disclosure distinguishes description exposure from loading the body [S10]. Skill-Use separately evaluates compliance after triggering [S07].
- Outcome: partially supported for observable loading, unsupported for adherence.
- Action: record read/activation events and content identity, not only file size. A file present on disk is not proven model exposure; a successful read is not proof of compliance. Mark incomplete or truncated trace evidence unknown. Account for referenced files and retained context.

#### C11: Generic appended instructions are a recurring risk

- Location: supplied section 4C.
- Evidence: repository-context research reports additional cost without general success improvement [S04]. WebDev-Skills-Bench uses length-matched irrelevant controls to distinguish length distraction from content effects [S09].
- Outcome: partially supported as a workload-dependent risk.
- Action: replace a generic harm assertion with a testable hypothesis. Neither study isolates every generic rule in this catalog, and neither establishes that all appended guidance harms performance.

#### C12: A deterministic verifier should be preferred to a model judge

- Location: supplied sections 2, 4D, and 5.
- Evidence: deterministic acceptance checks are used in skill benchmarks [S05, section 3.3]; the same paper acknowledges possible missed behavior and implementation preference. Model-judge research documents position, verbosity, and self-preference biases [S15, sections 3.3-4].
- Outcome: partially supported as a measurement recommendation.
- Action: use execution checks where they represent the contract, and validate the checks themselves. Use blinded calibrated human or model judgment for outcomes that executable checks do not capture. A script passing does not certify absence of unauthorized side effects.

#### C13: Bootstrap or McNemar follows directly from task aggregation

- Location: supplied section 3.
- Evidence: McNemar consumes paired binary contingency counts [S13]. Task-level repeated outcomes are fractions, not automatically binary observations. Few-run work motivates uncertainty-aware aggregation [S14].
- Outcome: partially supported, with an unspecified analysis unit.
- Action: for repeated task outcomes, preserve arm pairing and cluster by the sampling unit. State whether inference concerns a fixed suite or a task/repository population. Do not pass task means or dependent trial rows to an ordinary McNemar test. Predefine a binary task reduction only when it answers the intended question.

#### C14: Means from different task pools must never be compared

- Location: supplied section 3, final sentence before normalized gain.
- Evidence: matching tasks is the proposed precision and comparability control. The absolute prohibition is stronger than needed; a properly randomized and sampled unpaired experiment can also identify a contrast. This qualification follows from experimental design, not a prayers result.
- Outcome: partially supported as a caution against uncontrolled pool changes.
- Action: prefer matched tasks here. If pools differ, define sampling, assignment, population weights, uncertainty, and the resulting estimand instead of comparing convenience averages.

#### C15: Scope of the three proposed validity layers

- Location: supplied section 5.
- Evidence: the proposed layers cover important issues but omit sampling, treatment identity, interference, outcome-dependent exclusions, and inference dependence [S12, S14, S16; methodological synthesis].
- Outcome: partially supported as a useful checklist. The text does not explicitly claim exhaustiveness; the omissions are design additions, not proof that its listed controls are wrong.
- Action: add construct validity, internal validity, statistical conclusion validity, and transfer limits. Keep synthetic boundary tests as explicitly labeled supplements to authentic work rather than prohibiting all synthetic fixtures.

#### C16: One successful run or a prose diff is not evidence

- Location: supplied section 5.
- Evidence: `agent-artifact` says neither establishes improvement [L01, Benchmark].
- Outcome: partially supported; the supplied wording is too absolute.
- Action: a run is evidence of what occurred under its conditions and may establish a feasibility witness. A diff establishes an artifact change. Neither alone estimates repeatable comparative benefit.

#### C17: A routing improvement need not improve task success

- Location: supplied section 6, hypothesis 3, and section 2 conclusion.
- Evidence: Demystifying Agent Skills separates retrieval behavior from downstream execution [S06, section 5.5].
- Outcome: supported as a possibility, not a measured prayers effect.
- Action: measure routing and outcomes separately. For a mechanism claim, manipulate routing or loading directly; correlations among trace stages do not by themselves identify mediation.

#### C18: Task outcomes, cost, and harm should remain separate

- Location: supplied section 4D and closing paragraph.
- Evidence: this is a defensible proposed decision rule. Official output-evaluation guidance records quality, time, and tokens [S11]; `agent-artifact` requires authorized and unauthorized effects [L01].
- Outcome: supported as a local design recommendation.
- Action: report every attempted run, including failures. Define budget limits and the attempt/retry policy. Report each harm class, attempted and completed violations, and observability gaps separately from average task quality.

#### C19: Proposed human workflow measurements

- Location: supplied section 4E.
- Evidence: no human workflow experiment or raw operational record was supplied.
- Outcome: unverifiable as an actual benefit; the supplied text proposes candidate measurements rather than reporting a workflow result.
- Action: distinguish acceptance from correctness, maintenance activity from utility, and fewer corrections from undetected mistakes. A controlled human workflow study needs its own assignment, carryover, learning, and acceptance protocol.

### Repository claims and untested predictions

#### C20: Distribution, composed context, and on-demand skills are distinct interventions

- Location: supplied opening and section 4A.
- Evidence: README export-selection rules and `Prayfile` distinguish `compose`, `tree`, and whole-file destinations [L01].
- Outcome: supported as a description of this tree.
- Action: test distribution fidelity separately. If two delivery methods expose identical artifacts, do not attribute a task-quality difference to prose content without identifying the changed delivery behavior. The CLI implementation is in another repository and was not audited here.

#### C21: This repository uses a 16 KiB compose budget

- Location: supplied section 4A.
- Evidence: `MAXIMUM_AGENT_CONTEXT_BYTES = 16 * 1024` and the Makefile check implement a 16,384-byte house ceiling [L01].
- Outcome: supported for the local check.
- Action: distinguish file bytes from model tokens and effective runtime context. This is an operational ceiling, not an experimentally established quality optimum. No vendor-wide context-limit claim was audited.

#### C22: Structural checks and context size do not establish agent improvement

- Location: supplied opening attribution to the repository.
- Evidence: `agent-artifact` explicitly requires a fixed harness, requests, repeated raw outcomes, and variance [L01]. An earlier review labels its checks structural [L02]. The inspected Makefile and CI call repository validators rather than a model A/B runner.
- Outcome: supported within the inspected checkout and check paths.
- Action: preserve the distinction. File inventory did not locate a model-evaluation harness; this is a bounded repository observation, not a claim about untracked, external, or future infrastructure.

#### C23: Proposed distribution measurements

- Location: supplied section 4A.
- Evidence: README documents install/plan/apply/verify/drift commands [L01], but this review did not run controlled installation or corruption experiments.
- Outcome: unverifiable as actual reliability; the supplied text proposes acceptance dimensions and does not report installation experiments.
- Action: specify fixture inputs, exact artifact/digest expectations, drift semantics, supported platforms, failure cases, and repeated raw outcomes before claiming reliability. A prose change can itself change expected rendered bytes; define semantically irrelevant drift operationally.

#### C24: Status of the four supplied hypotheses

- Location: supplied section 6.
- Evidence: no prayers execution series was supplied or run. Related literature has different populations and conflicting directions [S03-S09].
- Outcome: unverifiable as effects; the text appropriately labels them hypotheses. Their framing should retain the qualifications in C05 and C06.
- Action: permit positive, null, and negative outcomes. Test selector exclusions, loading mode, bundle size, and revisions under separate estimands. Do not register only the expected winning direction after a pilot.

### Numerical illustration, not a model experiment

For independent Bernoulli trials with a constant failure probability and zero observed failures, invert the zero-event probability for the exact one-sided 95% upper bound [S17]:

```text
(1 - p) ** n = 0.05
p_upper = 1 - 0.05 ** (1.0 / n)
```

This gives 63.16% at three trials and 25.89% at ten trials. Repeated runs of related tasks need not satisfy this model. The illustration shows why a small clean sample cannot certify a low failure rate.

The values and repository file hashes were generated mechanically; their freeze and reproduction command are in the source ledger. They are not observed agent failure rates, a power calculation for the proposed paired comparison, or a safety certification.

### Limits

This was a targeted source audit, not an exhaustive systematic review or a replication of the papers. Preprints, practitioner reports, official specifications, and local artifacts have different evidentiary roles. Published aggregates were checked against the identified passages, not reconstructed from trajectory datasets. Shared benchmark ancestry limits independence between papers. No pooled effect estimate is justified.

## Next

The [live issue](../issues/20261116171015_prayers-evaluation-evidence.md#next) owns the remaining questions. The research and recording request is complete; confirmation runs and any shared-guidance implementation remain future work.

## Source

- User-supplied methodological proposal, reviewed by request; claim locations use its section numbers. No private attachment locator or full-text copy is recorded.
- [Versioned sources, search log, attack log, and numerical freeze](20261116171015_prayers-evaluation-sources.md).
- [Proposed study](../plans/20261116171015_prayers-evaluation-study.md).
- [Live evidence issue](../issues/20261116171015_prayers-evaluation-evidence.md).
