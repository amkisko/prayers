# amkisko/durable-cache

Cache versus durable truth on a multi-instance service with a shared store.

Exports:

- `durable-cache` fragment — wipe test, single commit point, revalidate on read, side effects as log readers

Compose only on multi-instance services with a shared store. Skip for libraries.

Related: `amkisko/working-rules`, `amkisko/background-jobs`, `amkisko/engineering-audit`, `amkisko/finite-state-machines`.
