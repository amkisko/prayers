## Planned release

A planned release is the team's agreement to ship a named collection of work together. Compose this fragment only when the project collects that work under a shared period label and a forge milestone.

- Commitment: one release id names one intended payload; membership stays explicit and queryable on the milestone.
- Collection period: work changes are assigned into that milestone from open until prepare (cut), or until close when there is no cut.
- Period label: default release id is `YYYYwNN` (ISO week-year, lowercase `w`, ISO week). A two-week sprint uses the last ISO week of the sprint as the milestone title.
- Calendar event: the binding names the agreed prepare (cut) and deliver (publish) moments; they stay distinct observations unless the binding makes them the same event.

The `planned-release` skill owns defaults, vocabulary, invariants, binding, lifecycle, and process signals.

Related: `branch-naming` owns branch prefixes; `finite-state-machines` owns lifecycle modeling; `changelog-update` and `writing-prose` own release notes voice; `delivery-budgets` owns ship-path size and timing gates; `publish-checks` owns review hygiene before publish; `collaboration-workflow` owns where durable process notes live; `engineering-audit` reviews process integrity when auditing a release path.
