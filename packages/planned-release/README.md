# amkisko/planned-release

Compose fragment and skill for planned releases that collect work under a shared milestone.

- `planned-release` fragment - team commitment, collection period, period label (`YYYYwNN`), and agreed prepare and deliver calendar events
- `planned-release` skill - defaults, vocabulary, invariants, binding checklist, lifecycle procedure, and forge-queryable process signals

Compose only when work is collected under a milestone.

Generic guidance only. Forge product names, reviewer lists, and workflow paths stay in the consumer binding. Concept bullets stay in the fragment; defaults and procedures stay in the skill.

Related: `amkisko/branch-naming`, `amkisko/finite-state-machines`, `amkisko/delivery-budgets`, `amkisko/publish-checks`, `amkisko/collaboration-workflow`, `amkisko/engineering-audit`.

## Consumer example

```prayfile
compose "AGENTS.md" do
  pray "amkisko/branch-naming", "~> 1.0"
  pray "amkisko/planned-release", "~> 1.2"
end
```

Record the project binding next to development process docs. Keep `YYYYwNN` milestones and release collection unless the binding records a dated exception. Name the measurement script, sample store, and baseline ceilings in that binding before promoting validators past report-only. Open the skill when writing the binding, preparing or delivering a release, or measuring signals.
