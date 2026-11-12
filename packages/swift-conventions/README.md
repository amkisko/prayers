# amkisko/swift-conventions

Swift implementation conventions for apps, libraries, command-line tools, servers, and scripts. The core follows the tree's declared toolchain and execution model. Conditional rules apply to interactive UI, protected resources, and multi-surface input only when present.

Compose one language pack for the owning tree:

```prayfile
compose "AGENTS.md" do
  pray "amkisko/swift-conventions", "~> 1.0"
end
```

Keep application-specific interaction contracts and host acceptance procedures in the consumer's project overlay. This fragment supplies no framework recipes or universal window, gesture, restart, or signing policy.

`preferred-stack` owns language selection. Language packs own implementation after selection. Ordinary host execution includes the declared runtime; additional execution layers require a named constraint. Resource or energy comparisons require comparable measurements.

Sources for the language rules:

- [API design guidance](https://www.swift.org/documentation/api-design-guidelines/): clarity at the call site, naming, and parameter roles.
- [Concurrency language guide](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/concurrency/): isolation, suspension, structured tasks, and cancellation.
- [Async isolation specification](https://github.com/swiftlang/swift-evolution/blob/main/proposals/0461-async-function-isolation.md): execution depends on language features and isolation settings; `async` alone is not an offloading contract.
- [Executor specification](https://github.com/swiftlang/swift-evolution/blob/main/proposals/0417-task-executor-preference.md): blocking IO needs suitable execution placement outside the cooperative pool.
- [Main-actor contract](https://developer.apple.com/documentation/swift/mainactor): UI isolation where the host requires it.
- [Permission timing guidance](https://developer.apple.com/design/human-interface-guidelines/privacy/): request access in the context of a feature that needs it.

Related: `amkisko/preferred-stack`, `amkisko/engineering-audit`, `amkisko/delivery-budgets`, `amkisko/infer-conventions`.
