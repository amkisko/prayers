## Keep the work

- after a refusal, stay on the place they used until they choose the next step: URL, document, screen, command, or query
- the refusal they see must match what the platform reports; HTTP status when the place is a URL
- an error document is internal; show the error on the requested place
- unknown identifiers keep a real refusal; the status that leaves must match
- leave that place only when it is no longer the identifier of the failed attempt: a moved resource (301/308 to the replacement), an auth gate with a return, a successful submit that earned a new place, or a canonical host or scheme
- a successful GET with an alternate identifier for the same record is a moved resource; redirect show to the canonical identifier; leave POST, PATCH, and live frames on the requested place
- keep the failed command or query visible
- redisplay a failed form on the same place; keep passing and failing answers
- a typed value the widget rewrote is a failed answer; redisplay the string the person typed
- a confirm that cannot run is not consent; nested destroy must ask on that place, then stay on that place after cancel or success unless the person earned a new place
- a catalog picker that failed to load still shows the query the person typed
- on an acknowledged forbidden, stay and offer the next human step the product supports; rewrite to sign-in only when credentials are missing
- warn before a session timeout and give time to extend; restore in-progress answers after re-auth
- restore in-progress answers after a process restart the same way as after re-auth
- a live refresh or reconnect must not wipe the work still on the place

Related: `preferred-stack` states the humane design preference; `engineering-audit` asks whether a person can still operate on the place they used after a refusal.
