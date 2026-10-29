# amkisko/planned-release

Compose fragment for planned releases that collect work under a shared milestone.

Essential agreements: two-week sprint cadence, ISO week release ids (`YYYYwNN`), release collection into a milestone, optional candidate before cut, cut versus publish, shared-bench evidence, and separated health signals.

Do not compose this package for trees that never collect a payload under a milestone. Continuous release-from-stable without a release collection is out of scope here.

Generic guidance only. Forge product names, reviewer lists, and workflow paths stay in the consumer binding. Week numbering and milestone collection do not.

Related: `amkisko/branch-naming`, `amkisko/finite-state-machines`, `amkisko/delivery-budgets`, `amkisko/publish-checks`, `amkisko/collaboration-workflow`.

## Consumer example

```prayfile
compose "AGENTS.md" do
  pray "amkisko/branch-naming", "~> 1.0"
  pray "amkisko/planned-release", "~> 1.0"
end
```

Record the project binding next to development process docs. Keep `YYYYwNN` milestones and release collection unless the binding records a dated exception.
