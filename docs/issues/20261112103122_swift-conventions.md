# Swift conventions and ordinary host execution

## Participants

- Andrei Kisko

## Decisions

Add a host-independent Swift language fragment and align the four existing language fragments on ordinary host execution. Keep language selection in `preferred-stack`. Use concepts and precise language rules; omit consumer names, framework recipes, and application-specific interaction contracts. The operator-supplied brief identifies the participant above.

Accept the work when the new package resolves, composes, and verifies from the local catalog, the Swift fragment fits within 2048 bytes, and repository checks pass. Do not change a consumer repository or publish to a remote service.

## Effects

### Contrary pass

The supplied draft is both the authoring brief and the material under review. This shared context can bias the review toward its proposed rules.

- A task may inherit actor isolation. An actor serializes access to state; it is not a dedicated blocking worker. Check the execution contract before prescribing either as an offloading mechanism.
- A command-line program may intentionally wait for its result. Scope responsiveness rules to latency-sensitive execution and cooperative executors.
- Additional execution layers can satisfy isolation, deployment, or target-testing requirements. A blanket prohibition or universal energy comparison would exceed the evidence.
- Permission activation and identity requirements vary by resource and host. Do not turn a conditional lifecycle requirement into a universal restart or signing rule.
- Focus, input pass-through, display ownership, and undo grouping have separate contracts. One consumer's event sequence does not establish a language-wide rule.
- No consumer source or runtime evidence is available here. Treat reports about prior application behavior as unverified testimony and omit them from the shared package.

### Claim ledger

- Location: core concurrency guidance. Claim: creating a task moves work off the current actor. Outcome: unsupported. [Structured task specification](https://github.com/swiftlang/swift-evolution/blob/main/proposals/0304-structured-concurrency.md#context-inheritance) describes inherited actor isolation. Action: explicitly warn that a task may inherit isolation.
- Location: core execution guidance. Claim: `async` implies background execution. Outcome: unsupported. [Async isolation specification](https://github.com/swiftlang/swift-evolution/blob/main/proposals/0461-async-function-isolation.md) makes execution depend on settings and annotations. Action: retain declared concurrency settings and remove implicit offloading advice.
- Location: core IO guidance. Claim: actors provide a blocking worker. Outcome: unsupported. [Executor specification](https://github.com/swiftlang/swift-evolution/blob/main/proposals/0417-task-executor-preference.md#motivation) separates isolation from execution placement. Action: prescribe asynchronous IO or a bounded blocking pool; this pool policy is a house choice.
- Location: core isolation guidance. Claim: actor state remains unchanged across suspension. Outcome: unsupported. [Data-race safety guide](https://www.swift.org/migration/documentation/swift-6-concurrency-migration-guide/dataracesafety/) distinguishes race safety from atomicity. Action: require rechecking state-dependent assumptions after `await`.
- Location: native execution rule in all five fragments. Claim: extra execution layers necessarily waste energy. Outcome: unsupported as a universal comparison. [Execution trade-off documentation](https://docs.kernel.org/virt/kvm/halt-polling.html) describes workload-dependent latency and power effects. [Packaging guidance](https://docs.swift.org/latest/documentation/swiftlinux/packaging/) describes legitimate deployment uses. Action: require a named unmet requirement for additional layers; preserve declared runtimes; make no resource-saving claim without measurements. This selection rule is house policy, not a language restriction.
- Location: API guidance. Claim: API names should communicate intent at the call site. Outcome: supported by [API design guidance](https://www.swift.org/documentation/api-design-guidelines/). Action: retain the guidance. Distinguishing absence from failure is an implementation convention; optional values may still carry domain-specific meaning.
- Location: conditional UI guidance. Claim: every UI-related type must be main-actor isolated. Outcome: partially supported. The [main-actor contract](https://developer.apple.com/documentation/swift/mainactor) defines the executor, not every host's UI requirements. Action: limit the rule to UI state and updates where the host requires that isolation.
- Location: conditional permission guidance. Claim: request permission in the context of the capability being used. Outcome: supported by [permission timing guidance](https://developer.apple.com/design/human-interface-guidelines/privacy/). Claim: every grant requires restart or stable signing. Outcome: unsupported as a universal rule. Action: defer activation and identity requirements to the host and resource; handle denial and revocation.
- Location: conditional input guidance. Claim: a fixed window, display, or undo sequence is universally correct. Outcome: unverifiable from the supplied testimony and not established by language documentation. Action: require an explicit input contract and interaction evidence; omit fixed sequences and all consumer details.

## Next

None. Implementation, local acceptance, and distribution deliver are complete; see the [engineering changelog](../changelogs/20261112103122_swift-conventions.md) and [1.39.0 cut note](../changelogs/20261112132928_prayers-1-39-0.md). Consumer repository pin bumps remain optional for each consumer.

## Source

- The operator-supplied authoring brief, narrowed by the current instruction to omit other products and product-specific details.
- [Swift package](../../packages/swift-conventions/README.md).
- [Engineering changelog](../changelogs/20261112103122_swift-conventions.md).
