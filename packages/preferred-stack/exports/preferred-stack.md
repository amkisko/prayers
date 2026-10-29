## Preferred stack and tools

- native-first means: name the nearest semantic authority for the job (CPU and OS ABI, browser host, language runtime, database engine, GPU pipeline, build or cluster orchestrator, game or media engine, and similar), then prefer a language whose ordinary execution form lives there
- a portable sandbox, managed VM guest, or engine guest is not OS-native when the job is that host's contract
- match the language of the directory you are changing; follow the matching language pack when the project composes one
- when starting a new tree or an independent package with no owning language yet, choose by nearest authority and proximity band; ask only when two candidates sit in the same band and the choice changes the outcome; record language, authority, band, and why not a closer option
- house shortcuts when proximity and team practice agree: ruby for web application and API work; elixir for concurrent and distributed systems on the BEAM; rust for system programming and performance-critical native code; javascript, html, css for the browser document and style surface
- humane and accessible visual-surface principles for UI/UX, and for clear communication of intent and feedback; label icon-only controls; hide decorative duplicates from the accessibility tree
- when the change presents a screen, document, or other person-facing surface, name that surface in the work product (reply, pull request, live-work note) and record a visual assessment: hierarchy, copy, interactive states, empty/loading/error, a narrow surface, and whether a person can finish the task; record what was assessed and what remains for a human; skip and say so when there is no such surface
- pictures, previews, tickets, and chat threads are source locators for that signal; the assessment is the running product plus the written need
- product-contract and architecture work stay distinct from this visual-surface assessment
- person-facing dates and times follow the product locale form; native HTML date and datetime-local follow the browser locale and are not that form; machine APIs, data attributes, filenames, and CSV machine columns stay ISO unless the product already published another contract
- a catalog picker for growing association lists is a combobox that queries the product's live list API as the person types; each request takes a bounded page; further rows load on type or on scroll; a datalist or a select of every row is not that control
- catalog assignment starts empty when a default first row would apply a change
- a command that writes a record must look like a command

Related: the `preferred-stack` skill owns proximity bands and the selection procedure; `minimal-implementation` keeps scope small and repeats the tree-language match; language packs (`ruby-conventions`, `rust-conventions`, `elixir-conventions`, `kotlin-conventions`) own how to write after the choice; `keep-the-work` covers staying on the failed place after a refusal.
