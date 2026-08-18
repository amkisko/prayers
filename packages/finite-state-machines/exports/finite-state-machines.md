## Finite state machines

- model lifecycles with explicit finite state machines when status, allowed transitions, and side effects matter; prefer named states and guarded transitions over scattered conditionals and implicit enums alone;
- finite state machines are not only for workflow logic: they can compactly represent ordered sets or maps of strings supporting fast prefix, suffix, and fuzzy search; consider tries and automata when matching catalogs, codes, routes, or searchable vocabularies at scale;
- when digital reported state and physical process state can diverge, name both machines and the observation that couples them; occupancy listing is not the lock; a reported identity is not the person or sample at the station.

Related: `engineering-audit` boundary mode asks when those states disagree without an alarm; `io-simulation` injects the faults that cause the split.
