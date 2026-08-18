## IO simulation

- when a product depends on live IO from an external virtual or physical service, ship a simulation of that plant that speaks the same protocol the product already uses;
- give the simulation a control UI so a person can set the parameters that produce that IO while using the product: position, clock, amount, device state, and faults;
- injectable faults: unavailable, slow, valid but false, stale, protocol meaning change, partition, clock disagreement, reset, freeze, drift, duplicated command, command after timeout, reconnect replay, two authorities, obsolete operator display;
- keep the product on its production adapter; the simulation is a plant the adapter talks to;
- point the product at a vendor station when that station already covers those parameters (testmode dashboards, device emulator extended controls);
- a library that only answers request and response has no plant, so it does not need this workbench.

Related: `engineering-audit` enumerates those boundary conditions; `finite-state-machines` models the plant lifecycle; `preferred-stack` covers humane control UI; `minimal-implementation` still requires later calibration on real hardware.
