# Proposed prayers evaluation study

Scope: design only. This protocol repairs the supplied proposal using the [claims review](../reviews/20261116171015_prayers-evaluation-claims-review.md). It has not been executed or approved as an implementation project.

## Participants

Andrei Makarov

## Decisions

### Questions and estimands

Use a separate question for each intervention. Define the task population, repository sampling, model-harness configuration, permissions, treatment, outcome, budget, and aggregation before confirmation runs.

- Distribution: does a pinned package reach the intended destination with expected bytes and references, including specified failure and drift cases? The endpoint is delivery fidelity, not model success.
- Natural availability: for the declared task distribution, what is the task-macro difference in acceptable completion when a named skill is available through the normal catalog versus absent, under equal total run budgets?
- Loaded content: what changes when the named body and references are provided through a prescribed loading protocol? This is a different intervention from natural discovery.
- Composition: on the same tasks, what changes when the selected package is replaced by a specified focused set or full compose? The result concerns that package combination, not a universal size optimum.
- Workflow: does the intervention change time to independently accepted work for the participating people? This requires a separate human study and does not follow from an agent benchmark.

The primary availability contrast keeps the base project instructions and unrelated skill inventory fixed. A no-skill arm still retains mandatory system, authorization, and sandbox rules. Record which instructions remain; baseline is not instruction-free.

### Artifact and environment identity

Freeze task and repository revisions, package versions and content hashes, composed bytes, all exposed descriptions, loaded references, tools and grants, model identifier, harness revision, reasoning and sampling settings, image digest, verifier revision, dependency state, and network policy. Record unavailable provider settings as unavailable.

Use fresh contexts and isolated workspaces for every run. Reset agent memory, filesystem changes, caches, and external fixture state where they can transmit treatment information. Keep the base context identical. Record truncation and context compaction when observable.

Randomize or counterbalance arm order within task/repetition blocks. Interleave arms within time blocks if a remote model or service can drift. A shared random seed is only an available sampling control, not a guarantee of matching internal decisions or deterministic execution.

### Task construction and holdout

Sample authentic tasks across the claimed surfaces, including correct abstention and requests requiring no mutation. Include difficult near-misses and overlap cases. Keep synthetic boundary cases in a labeled diagnostic stratum.

Separate development, pilot, and confirmation sets. Hold out task families or repositories when the transfer claim concerns unseen families or repositories. Avoid skill descriptions that disclose a benchmark answer or task-specific oracle. Validate that expert solutions pass and representative incorrect or unauthorized solutions fail the verifier.

A pilot may use the supplied 30-80 task range and three repetitions when affordable; these are planning examples only. Determine the confirmation sample from desired precision or power, the smallest useful effect, observed paired variability, repository/task dependence, and resource limits. Do not treat three repetitions as three new task families.

### Mechanism experiments

Do not launch every ablation as one large initial grid. Select the experiment that answers the next unresolved question.

1. Availability experiment: absent versus naturally discoverable skill. Keep every assigned run in the total-effect analysis, including non-activation.
2. Loading experiment: natural selection versus prescribed exposure of the same body and references. Attribute the contrast to the loading protocol, including its framing and timing.
3. Representation experiment: give matched information and resources as ordinary documentation, always-on instructions, or a skill. Match content and access; record unavoidable framing and token-cost differences.
4. Size experiment: vary a named bundle on the same tasks. Added relevant material changes both amount and content. A length-matched irrelevant control can diagnose distraction; it does not alone isolate every semantic mechanism.
5. Selector/body experiment: use a two-by-two design if the question is whether a revised selector and revised body interact. Keep grants and unrelated skill descriptions fixed.
6. Revision experiment: compare frozen N and N+1 artifacts with the same confirmation tasks. A release number does not establish a meaningful treatment contrast.

Activation and adherence are post-assignment observables. Report conditional rates as diagnostics with their denominators. Do not describe the activated subset as the randomized population or infer mediation solely from its correlations.

### Observables and metrics

The five proposed stages are local observables, not an attributed scientific standard.

- Exposure: catalog entry and initial instructions actually delivered to the agent, with content identity.
- Selection: requested skill and accepted owner/set/sequence, compared with independently defined positive, negative, and boundary labels. Record abstention and all selected distractors.
- Loading: body/reference read events, completeness, timing, and exposed content identity. File size is a cost measure; it does not prove use.
- Adherence: observable applicable requirements, classified as pass, fail, not applicable, or unknown. Separate common task requirements from additional skill procedures.
- Outcome: independently acceptable final state and authorized actions, plus time, tokens, tool calls, retries, and harm observations.

Publish routing confusion counts before precision and recall. State the query mixture because precision depends on prevalence. Define false activation as `FP / (FP + TN)` if using the negative-request denominator; do not silently substitute `FP / (TP + FP)`. Score valid alternate skills and multi-skill ownership explicitly. Keep unknown trace coverage visible.

For common requirements, report `CSR_micro = satisfied applicable constraints / all applicable constraints`. Also report task-macro constraint success when task weighting matters. Define ISR as the fraction of eligible instructions satisfying every applicable required constraint. Do not count an unobserved check as satisfied or let changing skill obligations change the primary task denominator.

Use task pass as the primary outcome only when the verifier represents the acceptance contract. Supplement with calibrated blinded judgment for prose or other open-ended work. Conceal condition labels, vary answer order, and validate judges against a human-labeled sample. Agreement measures consistency, not automatic correctness.

Define `success@budget` as the fraction of assigned runs that satisfy the declared acceptance contract within the declared total token, time, and tool-call caps under the declared attempt policy. Include catalog/body overhead and all retries. Report task success and each boundary violation separately; a composite acceptable-completion metric may additionally require both success and no observed prohibited effect.

Report cost for every attempted run, not only successful runs. State cached-token accounting and price date if reporting currency. A cheap failed run and an expensive correct run answer different tradeoffs; show the joint outcomes rather than hiding either in a single ratio.

### Statistical analysis

For task `t`, arm `a`, and `R` registered repeats, define `p[t,a] = sum(pass[t,a,r]) / R`. The equally weighted fixed-suite contrast is `mean_t(p[t,treatment] - p[t,control])`. If the estimand concerns a production mixture, preregister the weights instead.

Declare what uncertainty means. For a fixed suite, variation comes from repeated executions. For inference to sampled tasks or repositories, preserve that sampling hierarchy. Use a paired cluster or hierarchical bootstrap, a randomization analysis, or an appropriate hierarchical model chosen for that estimand. A task bootstrap alone does not quantify every source of run or provider uncertainty.

Ordinary exact McNemar applies to independent paired binary units. Repeated task fractions and correlated trial rows require another analysis or an explicitly justified binary reduction. Report changed-to-pass and changed-to-fail counts, effect sizes, intervals, and per-domain or per-repository heterogeneity. Prespecify primary comparisons and address multiplicity for exploratory package searches.

Report normalized gain only as a secondary descriptive measure when baseline is below 1. State whether it is calculated before or after averaging across configurations. Recompute nonlinear statistics inside resampling when estimating their uncertainty.

Fix exclusion and rerun rules before confirmation. Separate harness failure, provider failure, agent timeout, and task failure. A budget timeout is an outcome under a budget estimand; invalid infrastructure trials need a visible accounting and replacement rule. Never rerun only a losing arm until it passes. Keep pilot tuning and any sequential stopping separate from fixed-sample confirmation.

### Evidence and decision

Each raw row needs task/repository identity, arm, repetition/block, frozen artifact references, exposure/loading events, outcome and constraint labels, harm events, verifier output, run status, and resource accounting. Store raw rows once; derive summaries mechanically. Keep private traces and credentials out of public records.

Set a useful-benefit threshold, uncertainty rule, cost ceiling, and harm criteria before confirmation. Zero observed harms is not proof of zero risk. If the result is imprecise, report it as inconclusive. If a revision only improves a structural check, report that structural improvement without claiming an agent effect.

## Next

The [live issue](../issues/20261116171015_prayers-evaluation-evidence.md#next) owns task selection, harness choice, sample planning, and any implementation decision.

## Source

- [Claims review and qualifications](../reviews/20261116171015_prayers-evaluation-claims-review.md).
- [Source ledger](../reviews/20261116171015_prayers-evaluation-sources.md): S10-S17 support the measurement and design cautions. The protocol is this review's proposed application, not a published or executed prayers study.
- `packages/agent-artifact/skills/agent-artifact/SKILL.md`, Benchmark and Selection and effect contract.
