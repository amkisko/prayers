# Proximity bands

House heuristic for preferred-stack selection. Place work by the ordinary execution form that must satisfy the contract. A band describes execution placement relative to the named authority; it does not measure speed. Examples are illustrative, not a complete catalog.

## Terms

- nearest semantic authority - the machine, host, runtime, engine, or orchestrator whose rules the new code must obey first;
- ordinary execution form - how that code commonly runs in production for this job (native machine code on an OS ABI, bytecode on a named VM, sandbox bytecode with host imports, engine guest, query plan, and similar);
- proximity - how close that execution form sits to the named authority;
- transpile inherits target - a source layer that erases or emits into another host keeps the host's band (TypeScript into a JavaScript host; Haxe into a chosen backend).

## OS or hardware proximate

Nearest authority is the CPU ISA, freestanding ABI, or OS ABI and syscalls. Ordinary form is AOT native machine code with little or no language VM between the program and that ABI.

Examples: Assembly; C freestanding or POSIX; C++; Rust native; Zig native; Fortran; Ada; other systems languages shipping native binaries for that ABI.

Use when the contract is memory layout, syscalls, drivers, kernels, tight native libraries, or similar OS/hardware work.

## Language-runtime proximate

Nearest authority is a language VM or runtime inside a native process (scheduler, GC, bytecode interpreter or JIT). The process is native; the program primarily speaks the runtime's model.

Examples: Go native; Swift with its runtime; JVM languages; CLR / .NET managed execution (ECMA-335 Virtual Execution System / CIL); BEAM (Erlang, Elixir); CPython; MRI / YARV Ruby; PHP Zend; Haskell GHC runtime; OCaml native with its runtime.

AOT native images from managed families (NativeAOT, Graal native image, Kotlin/Native) sit between this band and OS-proximate. Place them by the shipped runtime subset and ABI surface, not by the language name alone.

## Host or engine proximate

Nearest authority is an application, browser, game, media, or automation host. The program runs as a guest of that host even when parts compile to native code.

Examples: JavaScript in a browser (engine plus DOM and Web APIs); Node, Deno, or Bun on a JS engine plus their runtime; embedded Lua or QuickJS inside a host app; Flutter Dart; Unity or Godot scripting; Max/MSP, SuperCollider, and similar media engines; OS automation hosts (AppleScript, AutoHotkey).

## Sandbox or portable bytecode proximate

Nearest authority is a portable sandbox or bytecode machine plus host-provided imports. WebAssembly modules execute in a Wasm runtime; OS-like services arrive through host APIs such as WASI, not as direct OS ABI calls from the module.

Examples: Rust WASM, Go WASM, AssemblyScript, C# Blazor WASM, Ruby or Python compiled to Wasm guests.

Treat same-language native and Wasm targets as different bands.

## Data, build, or orchestrator proximate

Nearest authority is a database engine, build graph, image builder, cluster reconciler, or infrastructure orchestrator. The language is a query, schema, or plan for that engine.

Examples: SQL and procedural SQL dialects; Cypher; Terraform HCL; Dockerfile; Kubernetes manifests; Ansible; Nix; Make; CMake; Protobuf or OpenAPI as schema for generators.

## GPU and hardware-description proximate

Nearest authority is a GPU shader pipeline, compute runtime, or hardware description / synthesis flow.

Examples: GLSL, HLSL, Metal Shading Language, WGSL, CUDA; Verilog, SystemVerilog, VHDL.

## TypeScript and typed JavaScript fronts

TypeScript is a typed superset that preserves JavaScript runtime behavior and erases types for execution. Node may strip erasable types and run the remaining JavaScript. Proximity follows the JavaScript host (browser, Node, Deno, Bun), not the TypeScript checker.

Native TypeScript compiler tooling names the toolchain. Application proximity still follows the JavaScript host. AssemblyScript is a different constrained language aimed at Wasm, not ordinary TypeScript.

## Using a band

1. Name the authority.
2. Name the ordinary execution form for the shipped artifact.
3. Pick the band that matches that form.
4. Prefer a candidate inside that band. Move to a more distant band only with an explicit reason in the work product.

## Checkable anchors

These public sources support specific runtime claims in this note. Band membership for house shortcuts remains a team policy choice.

- TypeScript Handbook: TypeScript preserves JavaScript runtime behavior and erases types for execution (https://www.typescriptlang.org/docs/handbook/typescript-from-scratch).
- Node.js Learn: browsers and Node.js run JavaScript; Node may strip erasable TypeScript syntax and execute the remaining JavaScript without treating that as a separate application runtime (https://nodejs.org/learn/typescript/transpile, https://nodejs.org/learn/typescript/run-natively).
- ECMA-335: Common Language Infrastructure defines CIL and a Virtual Execution System that loads and runs managed modules (https://ecma-international.org/publications-and-standards/standards/ecma-335/).
- WebAssembly runtimes execute Wasm binaries in a host VM; OS-like services arrive through host imports such as WASI rather than as direct OS ABI calls from the module (survey overview: https://dl.acm.org/doi/full/10.1145/3714465).
