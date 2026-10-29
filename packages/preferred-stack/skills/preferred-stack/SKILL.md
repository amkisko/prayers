---
name: preferred-stack
description: >-
  Choose a programming language or language combo by nearest semantic
  authority and execution proximity. Use for greenfield trees, independent
  packages with no owning language, polyglot boundaries, native versus WASM,
  managed versus AOT native images, TypeScript versus JavaScript host
  questions, or when house shortcuts conflict with the job's host. Do not use
  to override an existing tree language or to rewrite UX visual-assessment
  rules already in the compose fragment.
---

# Preferred stack selection

The compose fragment defines native-first, tree match, greenfield stop-gates, house shortcuts, and visual-surface rules. This skill owns the selection procedure and proximity bands when the language is not already fixed by the tree.

## Quick reference

```text
confirm tree ownership -> name nearest authority -> place proximity band -> shortlist candidates -> apply house shortcut or ask on a tie -> record choice -> follow matching language pack
```

Read `references/proximity-bands.md` when placing a language or combo into a band, or when a transpile layer, WASM target, managed runtime, or engine host is in play.

## When to use

- starting a repository, library, or independent package with no owning language yet;
- adding a polyglot boundary (native helper beside a managed app, SQL beside an API, shader beside a host);
- deciding native versus WASM, JVM or CLR versus a native image, browser JS versus a server JS runtime, or engine-hosted guests;
- resolving whether TypeScript, another typed front end, or a JS-like transpile changes proximity (it inherits the execution host).

Skip when the directory already has a language. Match that language and open the matching language pack. Skip ordinary edits inside an owned tree. Skip visual-assessment work already covered by the compose fragment.

## Procedure

1. Confirm ownership. If the path already belongs to a language tree, stop. Match that language.
2. Name the nearest semantic authority the new code must speak: CPU/ISA or freestanding ABI, OS ABI and syscalls, browser document and style engines, a named language VM or runtime, a database engine, a GPU shader pipeline, a build or cluster orchestrator, a game or media engine, or another named host.
3. Place the work in a proximity band from `references/proximity-bands.md`. The band is a house heuristic about ordinary execution placement.
4. Shortlist languages whose common execution form lives in that band. Prefer the closest band that still meets the contract. Familiar source syntax does not move a guest into a closer band.
5. Apply a house shortcut only when proximity and team practice agree (ruby web/API, elixir concurrent/distributed on the BEAM, rust systems/native performance, javascript/html/css browser surface).
6. Ask the person when two candidates remain in the same band and the choice changes architecture or operability. Do not ask when the tree or authority already decides.
7. Record in the work product: chosen language or combo, nearest authority, proximity band, and why a closer option was rejected or unavailable.
8. Follow the matching language pack when the project composes one. Follow `minimal-implementation` and `dependency-policy` before adding frameworks or registry packages.

## Output shape

Use labeled bullets:

- language or combo: ...
- nearest authority: ...
- proximity band: ...
- house shortcut applied: yes/no and which
- closer options rejected: ...
- language pack in project: ... or none

## Traps

- TypeScript (and similar typed fronts) inherits the JavaScript host after type erasure or type stripping. "TypeScript Native" compiler tooling names the toolchain, not the application runtime.
- Rust, Zig, Go, or C targeting WASM inherit the WASM host and its imports, not the OS-native band of the same source language.
- NativeAOT, Graal native image, and Kotlin/Native move closer to OS ABI than their managed defaults, but they still carry a runtime subset. Place them by the shipped execution form, not by the language family name alone.
- Engine-hosted languages (Flutter Dart, Unity C#, Godot scripts) stay engine-proximate even when a release build emits native machine code.
- SQL and infrastructure languages stay proximate to their engine or orchestrator, including embedded engines such as SQLite.

## Routing

- `minimal-implementation` for scope and first-party packaging stop-gates;
- `dependency-policy` before adding a third-party package;
- language packs for idioms after the choice;
- `infer-conventions` when encoding how this tree writes;
- `engineering-audit` when reviewing an existing polyglot boundary, not for the initial pick.
