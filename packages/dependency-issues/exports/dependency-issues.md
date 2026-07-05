## Dependency issues

When work surfaces a clearly visible bug or defect in a dependency — wrong behavior, broken API contract, regression between versions, or a fix already merged upstream but not released — say so in the task output and suggest a concrete fix path: upgrade, pin, patch, vendor, workaround, or upstream report.

Store evidence under `docs/dependencies/#{YYYYMMDDHHMMSS}_<kebab-case-title>.md`; no README index in that tree. Each file should make these findable (use `##` headings or equivalent; omit empty sections): **Dependency** (name, version constraint, lockfile entry if any), **Symptom** (what breaks and where), **Evidence** (repro steps, logs, stack traces, links to issues or commits), **Suggested fix** (upgrade, pin, patch, workaround, or upstream report), **Next** (todo, planned, open questions), **Source** (links upstream—issue, PR, release note, commit—and downstream materializations in this repo). Git history is the edit log.

Do not open drive-by dependency hunts; record only issues encountered while doing the requested work and only when the defect is evident from behavior or published upstream facts, not speculation.

For proactive selection, alteration, and audit rules, use `dependency-policy` and the dependency-audit skill.
