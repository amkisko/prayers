# Dependency security guidance audit

Live work. Initial audit followed by a fix pass.

## Participants

- amkisko

## Decisions

Audit the uncommitted dependency-policy 4.0.0 and collaboration-workflow 2.2.0 release. Run security, contract, and learned-systems modes because the package guides tool-using agents through attacker-path decisions. Skip product surface, privacy, performance, observability, boundary and control, resource and budget, and trace and identification because the changed tree is inference input with no person-facing place, personal-data flow, service runtime, physical boundary, or executed bytes.

## Findings

### Active exploit testing has no authorization boundary

Severity: high. Confidence: high.

Location: packages/dependency-policy/skills/dependency-audit/references/vulnerability-assessment.md, applicability walk.

Why it matters: the instruction to test whether attacker-controlled input satisfies exploit conditions can turn a passive assessment into probing or exploitation of a live or third-party target. The later phrase "safe reproduction" does not define the allowed target or authorization.

Kind: observed contract ambiguity.

Smallest credible fix: default to static inspection, local fixtures, and non-mutating checks. Require explicit authorization and a named target before probing a live or third-party system.

### An incidental signal loads the full dependency audit

Severity: medium. Confidence: high.

Location: packages/dependency-policy/skills/dependency-audit/SKILL.md, reference routing.

Why it matters: the entrypoint always loads selection-and-alteration and the full recon, security, freshness, and ecosystem audit before it conditionally loads vulnerability assessment. A signal found during ordinary work can therefore expand into unrelated OSINT and freshness work.

Kind: observed routing behavior.

Smallest credible fix: route an observed security signal directly to vulnerability-assessment. Load selection rules for dependency changes and the full audit reference only for requested graph or supply-chain audits.

### Unconfirmed signals conflict with the dependency trace contract

Severity: medium. Confidence: high.

Location: packages/dependency-policy/skills/dependency-audit/references/vulnerability-assessment.md, Recording and disclosure; packages/dependency-issues/exports/dependency-issues.md; packages/docs-conventions/exports/docs-conventions.md.

Why it matters: vulnerability-assessment sends every public, non-sensitive signal to usr/docs/dependencies, while the existing contract reserves that tree for upstream defects evidenced by behavior or published facts and rejects speculation.

Kind: observed contract conflict.

Smallest credible fix: keep an unresolved suspicious signal in usr/docs/issues until evidence establishes an upstream defect or a published advisory. Store the dependency assessment in usr/docs/dependencies once that threshold is met, with cross-links when both records exist.

### Open security signals can be recorded and then forgotten

Severity: medium. Confidence: high.

Location: packages/dependency-policy/skills/dependency-audit/references/dependency-audit.md, Pass 1 and Ranking; packages/dependency-policy/skills/dependency-audit/references/vulnerability-assessment.md, Status, Priority and disposition, and recording fields.

Why it matters: the completion goal covers graph-matching advisories rather than every newly supported signal, ranking starts with affected targets, and an under_investigation record may omit Next. Suspicious behavior without an advisory can fall outside the goal; unresolved high-exposure evidence has no required follow-up condition.

Kind: observed lifecycle gap.

Smallest credible fix: cover all plausible dependency security signals in the assessment goal. Require Next for under_investigation, including a responsible person and a review date or evidence condition. Rank unresolved signals by credible exposure and consequence until applicability is settled.

### Security findings have two output contracts

Severity: medium. Confidence: high.

Location: packages/dependency-policy/skills/dependency-audit/references/dependency-audit.md, Pass 1 report and Required output per finding.

Why it matters: the Pass 1 report requires target, status, applicability, priority inputs, and disposition; the later required-output table omits those fields. An agent can follow the generic table and produce an incomplete security record.

Kind: observed contract ambiguity.

Smallest credible fix: state that the vulnerability-assessment record extends the generic finding fields, or include the security-only fields in the required-output section.

### The ordinary-work trigger has no forward check

Severity: medium. Confidence: high.

Location: dependency-policy 4.0.0 release validation.

Why it matters: package, render, and checksum checks prove that the instruction is present; they do not prove that an agent notices a plausible dependency security signal, loads only the relevant procedure, and records it. The preceding implementation needed a follow-up because this behavior was initially missed.

Kind: observed missing coverage, not futile coverage.

Smallest credible fix: outside the prayers package, run and record a release-level case where ordinary work exposes suspicious dependency behavior and a control case with an ordinary non-security bug. The first should load vulnerability-assessment and preserve a scoped record; the second should continue without a dependency audit.

## Prose

The prose has no marketing odor, branded-agent language, or new stray em dash. The status vocabulary, applicability walk, and private-disclosure boundary are direct and readable.

Fix pass applied the earlier low-severity edits: record durable project value in the live-work queue; name a product release as one target; CHANGELOG says four assessment statuses; treat each score as one input to local priority and business-impact decisions.

## Effects

The initial audit was read-only. Package source and provisioned skill files matched. Catalog, artifact, and torrent hashes and lengths matched for dependency-policy 4.0.0 and collaboration-workflow 2.2.0. `git diff --check`, `make verify`, `make drift`, and `make check-artifacts` completed successfully.

Fix pass: resolved the authorization gap by limiting the default assessment to published sources, static inspection, and local non-mutating fixtures. Live or third-party testing now requires explicit authorization naming both the target and allowed actions. An incidental signal now loads the target-scoped assessment first and does not start general recon or freshness work by default.

Unresolved signals now remain in `usr/docs/issues/` until an advisory or evidence establishes an upstream defect. Every `under_investigation` assessment requires a responsible person and a review date or evidence condition. The full-audit completion goal, ranking, alteration checks, and required output now cover plausible signals and the security-only record fields.

Release routing walkthrough: an ordinary task that surfaces suspicious dependency behavior matches the package-scoped skill trigger, selects only `vulnerability-assessment.md`, and preserves an unresolved public signal in the live-work queue. An ordinary non-security bug matches none of the dependency-security triggers and does not start a dependency audit. This is a deterministic check of the generated instruction contract, not an independent model evaluation.

The prose fixes use active agency, name a product release as one target, avoid implying VEX artifact conformance, and state scoring guidance positively. The final package source, provisioned skill, catalog, artifact, and torrent agree. AGENTS.md is 16,327 bytes, 57 bytes under the 16 KiB house limit.

The external claim audit supports the CISA VEX statuses and not-affected reasons, the complete-prevention condition for inline mitigation, CISA KEV as evidence of exploitation in the wild, FIRST EPSS as a next-30-day exploitation probability, and FIRST CVSS as technical severity characteristics. Every material external claim in scope had primary-source support.

Later pass: prose audit of the working-tree diff. Live notes dropped the remaining Do-not punchline and the stale remain-list in Prose. Catalog still has negation-led routing and disclosure lines and a preserve-without-review punchline. Inline-mitigation prose says prevent exploitation; CISA also requires complete prevention of known attack vectors and protections that cannot be subverted or disabled.

Later pass: catalog voice repairs shipped in place on dependency-policy 4.0.0 and collaboration-workflow 2.2.0. Inline mitigation now requires complete prevention of known attack vectors and protections that cannot be subverted or disabled. AGENTS.md is 16,322 bytes, 62 bytes under the 16 KiB house limit.

## Next

The package findings are resolved. Keep independent model-behavior evaluation outside the prayers package; a consumer may run it through a general, non-branded harness when one is available.

## Source

Implementation: usr/docs/issues/20260905123351_dependency-vulnerability-assessments.md
CISA Minimum Requirements for Vulnerability Exploitability eXchange: https://www.cisa.gov/sites/default/files/2023-04/minimum-requirements-for-vex-508c.pdf
CISA Known Exploited Vulnerabilities Catalog: https://www.cisa.gov/known-exploited-vulnerabilities-catalog
FIRST Exploit Prediction Scoring System: https://www.first.org/epss/
FIRST CVSS v4.0 Specification: https://www.first.org/cvss/v4.0/specification-document
