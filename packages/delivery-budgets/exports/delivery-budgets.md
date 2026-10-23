## Delivery budgets

Every product that ships a byte-bearing artifact keeps a named size budget and a sibling build-timing signal for the same ship path. Size is delivery burden. Timing is delivery-path cost. Do not mix them in one metric series.

- name each shipped artifact (store upload, container image, path inside an image, gem, wasm, static bundle);
- fail CI when size exceeds an absolute ceiling, or (when a baseline exists) grows beyond the allowed growth over that baseline;
- gate the metric the recipient pays for (installed or on-disk bytes versus transfer or compressed bytes); keep those as distinct series;
- measure wall-clock build or push time for that same ship path; keep timings in a separate report kind;
- every size or timing sample records when and where so samples compare across runners: start and finish timestamps, repository, run identity or URL, workflow, job, step, and runner class;
- name the metric and tool explicitly (file bytes, local image size, registry or manifest compressed size, path disk usage, wall seconds);
- update the baseline in the same change when growth is intentional; a missing baseline may skip the growth check until the first real sample, but the absolute ceiling still applies;
- prefer one gate tool and one budget file shape across artifacts in a repository;
- ingest (dashboard or webhook) is optional infrastructure; the local CI gate is not optional when the product ships.

Skip only for trees that never become shipped bytes (pure specification or prose), and state that reason.

Related: `engineering-audit` resource and budget mode audits utilization during a review; this fragment requires continuous CI budgets on the ship path. `ci-review` studies run health after the fact. `publish-checks` covers review hygiene, not byte ceilings.
