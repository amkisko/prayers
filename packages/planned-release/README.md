# amkisko/planned-release

Compose fragment for planned releases that collect work under a shared milestone.

Essential agreements: two-week sprint cadence, ISO week as atomic unit (`YYYYwNN`), release collection into a milestone, optional candidate before cut, cut versus publish, forge-visible evidence, and forge-queryable process signals with sample identity, audit disposition, and project baseline ceilings.

Compose only when work is collected under a milestone.

Generic guidance only. Forge product names, reviewer lists, and workflow paths stay in the consumer binding. Week numbering and milestone collection stay in this fragment.

Related: `amkisko/branch-naming`, `amkisko/finite-state-machines`, `amkisko/delivery-budgets`, `amkisko/publish-checks`, `amkisko/collaboration-workflow`, `amkisko/engineering-audit`.

## Consumer example

```prayfile
compose "AGENTS.md" do
  pray "amkisko/branch-naming", "~> 1.0"
  pray "amkisko/planned-release", "~> 1.0"
end
```

Record the project binding next to development process docs. Keep `YYYYwNN` milestones and release collection unless the binding records a dated exception. Name the measurement script, sample store, and baseline ceilings in that binding before promoting validators past report-only.
