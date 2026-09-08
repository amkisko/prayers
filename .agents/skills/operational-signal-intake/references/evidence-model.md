# Evidence model

Keep observation, consequence, and hypothesis independent. One signal may have several consequences and hypotheses; one incident may require several signal forms.

## Three axes

Observation records what the source actually shows: failed or refused outcome, incorrect result, latency, demand, queueing, saturation, state change, access or validation anomaly, missing check-in, or missing and stale telemetry.

Consequence records why it matters: a blocked, delayed, lost, corrupted, or misleading user task; loss of availability, timeliness, correctness, integrity, confidentiality, privacy, or durability; cascading failure; recovery difficulty; or operational cost. Leave consequence unknown when it has not been observed.

Hypothesis records a possible explanation: defect, regression, unsafe input path, ordinary load, resource leak or exhaustion, dependency or platform failure, data skew, retry feedback, expected domain behavior, abuse, malicious activity, or telemetry failure. A hypothesis remains an inference until the evidence establishes it.

## Normalized record

Capture fields that exist and mark material gaps. Do not invent values to complete the record.

- Scope: service, component or operation, environment, region or failure domain, window, timezone, and comparison baseline.
- Provenance: source role, stable locator, observed and ingested times, query or filter, sampling, aggregation, retention, and source trust.
- Generation: release, deployment, configuration, feature state, schema, runtime, and relevant dependency version.
- Observation: condition, value and unit, status, frequency or rate, affected operation, and representative sample with sensitive fields removed.
- Consequence: user task, visible result, scope, duration, reliability property, security or privacy property, and service objective or budget when defined.
- Hypotheses: supporting evidence, conflicting evidence, credible alternatives, confidence, and the next check that would confirm or reject each material inference.
- Disposition: classification, related issue-family record, owning audit or workflow, urgency, proposed action, and whether that action is authorized.

## Intake classifications

Use more than one when the evidence supports it:

- observed user consequence;
- observed reliability degradation;
- suspected resource exhaustion or work amplification;
- suspected security-relevant activity;
- observed security or privacy control failure;
- expected, handled, or refused behavior;
- telemetry gap or telemetry-induced degradation;
- insufficient evidence.

Keep causal or attacker-attribution labels at `suspected` until the relevant audit establishes them.

## Evidence quality

Prefer direct evidence from the named target and generation. Distinguish event time from collection time, totals from rates, gauges from cumulative values, successful responses from correct outcomes, unresolved inventory from current occurrence rate, and missing data from zero.

Match sources by operation, time, environment, generation, and failure domain before claiming correlation. Similar titles, fingerprints, stack lines, or metric movements are leads, not identity or causality.

Record confidence separately from severity and urgency. Strong evidence of a low-impact condition can have high confidence; a weak lead with catastrophic credible impact can justify an urgent next check without being restated as fact.
