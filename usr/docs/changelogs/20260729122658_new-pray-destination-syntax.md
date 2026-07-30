## Participants

- Andrei Makarov

## Decisions

Consumer docs and the repo Prayfile use compose, tree, and pray with file: only. Legacy target, agent, and exports lists are out of the examples.

Default export resolution selects fragment in compose, skill in tree, and file for file: bindings, so dependency-policy no longer needs an exports array in this repo Prayfile.

## Effects

Updated README consumer examples to match the destination DSL. Removed exports from dependency-policy lines in Prayfile. Bumped getting-started to 1.1.0 with a short compose/tree/file example. Regenerated Prayfile.lock with pray 1.5.1.

## Next

Published getting-started 1.1.0 into prayers/v1 locally. Commit and push when ready for consumers.

## Source

Follows the destination DSL and format work in kiskolabs/pray (compose, tree, pray file:).
