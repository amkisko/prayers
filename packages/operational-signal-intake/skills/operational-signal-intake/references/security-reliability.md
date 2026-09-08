# Security, reliability, and user consequence

Use this reference when a live signal may involve a vulnerability, abuse, resource exhaustion, unresponsiveness, sensitive telemetry, or user-facing harm.

## Keep the claims distinct

- A security lead is an observation with possible security relevance. It is not yet a confirmed weakness or incident.
- Availability degradation means authorized use was prevented or delayed. It does not establish malicious intent.
- Resource exhaustion is a possible mechanism. Name the constrained resource and ceiling before claiming it.
- A denial-of-service attack requires evidence that an actor deliberately caused or attempted the denial. High demand, latency, connection growth, or CPU use alone does not establish that attribution.
- A vulnerability conclusion requires a reachable weakness, relevant attacker control or misuse conditions, and a credible adverse consequence. Route that assessment to security mode; use dependency-audit when a dependency is involved.

## Security lead checks

1. Identify the input, actor class, exposed surface, and trust boundary without retaining unnecessary personal data.
2. Check whether an untrusted actor can control the input, rate, sequence, size, cardinality, or destination that reaches the suspected path.
3. Establish whether authentication, authorization, validation, isolation, rate control, resource bounds, or failure posture was bypassed or failed.
4. Name the observed or credible consequence for confidentiality, integrity, availability, privacy, or accountability.
5. Seek independent evidence from the same target, generation, and window. Consider benign activity, operator action, defects, and instrumentation faults as alternatives.
6. Keep the classification at `suspected security-relevant activity` until the attacker path and consequence are supported.

Do not test a live or third-party target, submit exploit payloads, or increase load without explicit authorization that names the target and allowed action.

## Availability and exhaustion path

Trace the path instead of jumping from a utilization value to a cause:

```text
demand or input
→ work and amplification
→ waits, queues, retries, or retained resources
→ constrained resource and ceiling
→ rejection, timeout, incorrect result, or stalled progress
→ user or operator consequence
```

At each step record the observed value, baseline, unit, window, and contradictory evidence. Check ordinary traffic growth, an expensive input shape, resource leaks, unbounded cardinality, retry storms, poison work, lock contention, dependency slowness, deployment changes, and telemetry overhead before attributing intent.

A protective response can also harm valid users. Record whether refusal status and retry guidance are honest, whether fallback works, whether a person's place and in-progress work survive, and whether protection fails open or causes a wider shared-resource failure.

## User consequence

Identify the task the person or operator attempted and what they experienced. A fast exception is failure; a slow success can miss its service commitment; a successful protocol response with incorrect content can also be failure.

Record whether the task was blocked, delayed, duplicated, lost, corrupted, or misleading; whether retry was safe; whether partial work survived; and whether the interface distinguished refusal, unavailability, and unknown outcome. Do not use internal error counts as a substitute for this evidence.

## Telemetry is also a boundary

Inspect the signal path when it could be part of the problem:

- confidentiality: event payloads, error messages, traces, and labels may expose secrets, personal data, identifiers, or system details;
- integrity: untrusted fields may be forged, injected, replayed, reordered, sampled, or attributed to the wrong actor or generation;
- availability: excessive log volume, high-cardinality attributes, queues, exporters, or collectors may consume application or monitoring resources;
- detection: a broken, delayed, filtered, overflowing, or tampered telemetry path can create false quiet or hide affected subgroups.

Route telemetry design and capacity to observability and resource modes. Route sensitive contents to privacy and trace-and-identification modes. Route spoofing, injection, exposure, and attacker access to security mode.

## Primary references

- NIST SP 800-61 Rev. 3, adverse event analysis, source correlation, and impact estimation: https://doi.org/10.6028/NIST.SP.800-61r3
- NIST Cybersecurity Framework 2.0, continuous monitoring and adverse event analysis: https://doi.org/10.6028/NIST.CSWP.29
- NIST CSRC glossary, denial of service: https://csrc.nist.gov/glossary/term/denial_of_service
- MITRE CWE-400, uncontrolled resource consumption: https://cwe.mitre.org/data/definitions/400.html
- MITRE CWE-117 and CWE-209, log integrity and sensitive error messages: https://cwe.mitre.org/data/definitions/117.html and https://cwe.mitre.org/data/definitions/209.html
- Google SRE, monitoring distributed systems: https://sre.google/sre-book/monitoring-distributed-systems/
- OpenTelemetry, signals and collector security: https://opentelemetry.io/docs/concepts/signals/ and https://opentelemetry.io/docs/security/
