## Preferred stack and tools

- native-first approach for all platforms and languages
- ruby for web application and API development, and for its rich ecosystem of libraries and frameworks
- elixir for concurrent and distributed systems, and for its actor model and fault tolerance
- rust for system programming and performance-critical code
- javascript, html, css for native browser experience
- humane and accessible visual-surface principles for UI/UX, and for clear communication of intent and feedback; label icon-only controls; hide decorative duplicates from the accessibility tree
- when the change presents a screen, document, or other person-facing surface, name that surface in the work product (reply, pull request, live-work note) and record a visual assessment: hierarchy, copy, interactive states, empty/loading/error, a narrow surface, and whether a person can finish the task; record what was assessed and what remains for a human; skip and say so when there is no such surface
- pictures, previews, tickets, and chat threads are source locators for that signal; the assessment is the running product plus the written need
- product-contract and architecture work stay distinct from this visual-surface assessment
- person-facing dates and times follow the product locale form; native HTML date and datetime-local follow the browser locale and are not that form; machine APIs, data attributes, filenames, and CSV machine columns stay ISO unless the product already published another contract
- a catalog picker for growing association lists is a combobox that queries the product's live list API as the person types; each request takes a bounded page; further rows load on type or on scroll; a datalist or a select of every row is not that control
- catalog assignment starts empty when a default first row would apply a change
- a command that writes a record must look like a command

Related: `keep-the-work` covers staying on the failed place after a refusal.
