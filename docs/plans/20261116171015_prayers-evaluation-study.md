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

Sample authentic tasks across the claimed surfaces, including correct abstention and requests requiring no mutation. Include requests that share a selector's vocabulary but fall outside its scope, and requests that match more than one selector. Keep synthetic boundary cases in a labeled diagnostic stratum.

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

### Proposed reporting boundary

This reporting design is a proposal for the study, not an implementation decision. Preserve `confess` as explicit package acceptance or rejection feedback. Store experimental observations in a separate versioned event contract; a verdict is not an independently verified task outcome.

Pray must own package and delivery facts: package/version, artifact and rendered-content hashes, selected exports, composition identity, operation, result/error category, elapsed time, and delivered byte counts. The harness must own assignment, model execution, exposure, selection/loading observations, budgets, and run termination. The verifier or reviewer must own acceptance, applicable-constraint labels, and observed prohibited effects. Each record must identify its producer and evidence coverage; delivery does not prove reading or adherence.

The minimum internal study records must include the following fields. These are private analysis records, not the remote telemetry payload:

- Identity: schema version, study-local event/run/task/repository references, protocol revision, arm, repetition/block, and frozen artifact/environment references. Use study-local references for private repositories and people; retain any identifying mapping separately.
- Assignment and completeness: every assigned run, start/terminal status, and distinct task failure, timeout, cancellation, harness failure, and provider failure. Reconcile assignments with terminal records so a missing report cannot disappear from the denominator.
- Mechanism: descriptions actually exposed, selected skills and abstention, observed body/reference reads and content identity, and adherence labels with pass/fail/not-applicable/unknown states. Missing observation must remain unknown.
- Outcome: verifier identity and result, independent acceptance when available, constraint results, and separately recorded boundary violations. Keep an optional human package verdict separate from these results.
- Resources: elapsed time, input/output/cached tokens when available, tool calls, retries, and instruction overhead. Record unavailable counters explicitly and retain costs for failed attempts.
- Reporting integrity: event identity and sequence, acknowledgement state, and known dropped or rejected records. A receiver must deduplicate repeated deliveries without dropping distinct repeated trials.

Start with an explicitly enabled local JSONL export and a documented schema. Add a configurable remote receiver only when the selected study needs it. The consumer or study operator must authorize the destination independently of the package source. Publisher-controlled package metadata must not enable reporting or redirect an authorized stream. No central service, automatic federation, or global participant identity is required. Any later OTLP adapter must preserve the numeric export restrictions and must not add automatic host, process, user, or resource attributes; durable study rows remain the analysis source.

Before collection, the operator must declare fields, recipients, retention/deletion rules, and any permitted linking between runs. Remote reporting must default to off. A preview must show the destination and exact fields before authorization. Export must use an allowlist and omit prompts, source code, transcripts, command arguments, free-form errors, local paths, credentials, network/device fingerprints, and global identifiers. A hash of private input is not automatically safe to publish; artifact hashes are for public or explicitly approved material. Additional trace collection requires a separate declared purpose and authorization.

A remote exporter must bound its queue, request time, retries, and payload size. Receiver failure must not change the package operation result; the exporter must expose delivery failure separately. Study analysis must flag unreconciled or lost records as incomplete evidence. Before accepting remote data, a receiver must validate the schema, enforce its authentication/access policy and submission limits, and deduplicate event identities. A payload digest alone does not authenticate its producer, and producer authentication does not establish outcome correctness.

### Numeric-only remote reports

The operator's revised preference supersedes the earlier proposal for agent-authored action descriptions or evidence references in reports. Remote metric payloads must contain only fixed schema fields with bounded numeric values and registered numeric category codes. Protocol field names are fixed; the agent must not supply field names, labels, notes, arbitrary identifiers, encoded text, evidence locators, or extra attributes. The operator must approve the study/package/arm codebook independently of the agent. This restriction applies to both clients and receivers.

The exporter must derive values from local recorded observations and verifier results. Candidate measures are assigned/completed/failed/timeout counts, observed selection/loading counts, applicable/pass/fail/unknown constraint counts, token/tool/retry counts, and declared duration or token histograms. Every measure must declare its unit, producer, denominator where applicable, observation coverage, and allowed range. Missing observations must remain separately counted or coded as unknown; they must not become zero or pass. Keep any separately authorized agent assessment in a distinct coded measure, never in a measured-compliance counter. Numeric representation alone does not establish measurement provenance.

External reports must default to aggregates for approved study/package/arm groups. Retain task-level pairing and identifiers in the private study dataset so aggregate export does not remove the information needed for the registered analysis. Before enabling export, the operator must define aggregation windows, precision, bounded histogram categories, small-group release rules, and repeated-release limits. No numerical threshold is selected by this note. Suppressed or unreleased measurements must remain visible in coverage accounting. Public or further-distributed releases require their own release policy; receiver ownership does not authorize redistribution.

The report builder must reject unregistered fields/codes and out-of-range values, recompute measurements from approved local sources, and prevent the agent from submitting arbitrary numeric payloads. A finalize operation with no metric-value arguments is a candidate interface. Agent-supplied numbers are not a substitute for local measurements. The exporter must exclude exact wall-clock timestamps, private identifiers/hashes, and arbitrary-precision values from the metric payload. Any delivery identifier must be exporter-generated and scoped to the approved stream. Authentication and transport metadata remain subject to the recipient and retention policy; a numeric payload does not remove those disclosures.

Privacy qualification: numeric-only reporting is a format restriction, not a guarantee of confidentiality. [OpenTelemetry's sensitive-data guidance](https://opentelemetry.io/docs/security/handling-sensitive-data/) recommends data minimization and aggregation and explains why even hashed numeric user identifiers may fail to anonymize a person. [Census reconstruction research](https://www.census.gov/library/working-papers/2025/adrm/CES-WP-25-57.html) provides a counterexample to the general claim that aggregate statistics cannot disclose individual information; it does not measure this proposed Pray design. Neither source establishes this proposal's leakage rate or proves the benefit of any untested release policy.

### Proposed agent reporting instruction

The study operator must enable reporting through the harness or consumer project instructions, with the approved fields, tool or local destination, recipients, and resource limit. A package body must not authorize its own reporting. Put the reporting condition outside the measured skill so it also covers assigned runs without selection. Hold this condition and its overhead constant across compared arms; document any reporting instrumentation as part of the intervention environment.

Define reporting success as accurate, complete coded observations within the configured budget, including non-use and unknown evidence. Do not reward package activation, report volume, positive verdicts, or claims that guidance improved the result. Skill selection must continue to follow task relevance. The harness must derive remote measurements from observable events; agent reporting must not introduce free-form explanations or hidden reasoning.

The following is a proposed instruction contract, not an available Pray command:

```text
When the operator has enabled study reporting, use only the configured
typed reporting interface. Do not activate skills to produce a report.

Before normal task completion, finalize this run's recorded observations
once. The harness must calculate the approved numeric measures. Do not
provide arbitrary numbers, text, labels, identifiers, or evidence locators.
If the protocol requests an agent assessment, choose only a registered
category; the exporter must identify it separately from measured results.
Keep missing observations unknown. Do not infer task success or benefit
from selection, reading, or your own compliance claim.

Do not submit a free-form summary or an accepted/rejected confession
through study reporting. Package feedback requires separate authorization
and must not bypass the study's numeric-only export policy.

If reporting is unavailable or fails, follow only the configured fallback
within its resource limit. Do not invent a command or destination, repeatedly
ask for consent already granted, or claim delivery without acknowledgement.
Expose reporting failure separately and finish the authorized task.
```

The harness must create assignment/start records and account for missing terminal summaries after crashes, cancellation, or timeouts; an end-of-task instruction cannot guarantee those records. Label agent assertions separately from tool-observed events and independent verifier results. Reuse the operator's existing authorization while its fields, purpose, and recipients remain unchanged. A reporting instruction does not override higher-priority authorization or privacy rules.

Before rollout, evaluate reporting on applicable, non-applicable, conflicting, and no-selection tasks, with missing observations, unavailable tools, receiver failure, and interrupted runs. Include attempts to send free text, arbitrary numbers, unknown fields/codes, identifying metadata, and repeated overlapping aggregates. Compare coverage, unsupported assertions, private-data emission, duplicate submissions, and reporting overhead. Keep this instrumentation check separate from the study's package-benefit result; no behavioral improvement has been measured here.

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
