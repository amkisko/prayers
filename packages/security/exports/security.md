## Credentials and Secrets

- Prefer a secret store or OS credential helper over embedding live secrets in config files, scripts, or documentation. Named managers (for example 1Password, Bitwarden, KeePassXC) are fine; the requirement is isolation, not a specific vendor.
- Config and project files may hold references (vault paths, item ids, redacted fingerprints). They must not hold live tokens, API keys, passwords, or client secrets.
- Do not pass secrets on command lines or in other process-visible arguments. Prefer secret-store lookup, short-lived credentials, or stdin/file descriptors that do not persist in shell history.
- Do not commit secrets, paste them into issues or pull requests, or write them to logs. Rotate anything that may have been exposed.

## Tracking and identification

- A redacted fingerprint above is a hash of a secret for config references. A device fingerprint is fields that combine to identify a person or device across sessions or observers.
- Identifiers, IP addresses, device marks, and combined attributes are personal data. They can unmask a person, a location, or a session secret. Emit them only when the feature they asked for this session needs them and they were shown that this product would.
- Silent analytics ids, leftover marks after logout, and canvas or hardware probes are security events. They can locate a person, stitch sessions, or leak a credential-shaped token.
