## Keep the work

- after a refusal, stay on the place they used until they choose the next step: URL, document, screen, command, or query
- the refusal they see must match what the platform reports; HTTP status when the place is a URL
- an error document is internal; show the error on the requested place
- unknown identifiers keep a real refusal; the status that leaves must match
- leave that place only when it is no longer the identifier of the failed attempt: a moved resource (301/308 to the replacement), an auth gate with a return, a successful submit that earned a new place, or a canonical host or scheme
- keep the failed command or query visible
- redisplay a failed form on the same place; keep passing and failing answers
- on an acknowledged forbidden, stay and offer the next human step the product supports; rewrite to sign-in only when credentials are missing
- warn before a session timeout and give time to extend; restore in-progress answers after re-auth

Related: `preferred-stack` states the humane design preference; `engineering-audit` asks whether a person can still operate on the place they used after a refusal.
