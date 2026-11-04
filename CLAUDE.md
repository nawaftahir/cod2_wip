# cod2_wip

Private work monorepo for every CoD2 reconstruction target (github.com/nawaftahir/cod2_wip).
The universal laws in `dev/CLAUDE.md` still apply. `cod2engine` stays the clean release repo;
nothing here goes there automatically.

## Branches and worktrees
| Branch | Checked out at | Holds |
|---|---|---|
| `main` | `cod2_wip/` | shared only: `binaries/`, `status/`, `tools/dashboard/`, docs, page workflow |
| `<target>/main` | `cod2_wip/<target>/` | the target's confirmed line (gate green, meter not worse) |
| `<target>/<work>` | `cod2_wip/.worktrees/<work>/` | all in-progress work for that target |

- **Never work in `cod2_wip/` (main) or `cod2_wip/<target>/` directly.** Start a work worktree:
  `git worktree add .worktrees/<work> -b <target>/<work> <target>/main`
- Inside a target: `src/` is matched source, `workspace/` is work in progress.
- Land work by merging `<target>/<work>` into `<target>/main` from the `<target>/` worktree, only
  after the target's referee passes. Old imported branches live under `<target>/`.
- Stay inside your target's tree. Change `main` (anchors, dashboard, status) only when asked.
- Push on "push it". Pushing a work branch runs CI; it never changes the page.

## Automation (the page updates itself; never hand-edit numbers)
- Each target has one CI workflow named after it (`radiant`, `client`, `gfx`) that runs on push to
  `<target>/**`: build, referee, write the meter, fail if the meter drops.
- The meter lives on `<target>/main`: `ledger/meter.json` or `meter*.json` at its root (one per
  binary, e.g. `meter-1.0.json`, `meter-1.3.json`). Only the referee writes it.
- When that CI passes on `<target>/main`, the `progress page` workflow on main rebuilds GitHub Pages
  from every `*/main` meter plus `status/*.json`. Local preview: `python3 tools/dashboard/build.py`,
  open `site/index.html`.
- Meter fields: `tools/dashboard/README.md`. Emit every field your referee can measure (sections,
  TUs, functions); the page shows what it gets and marks the rest "not measured".

## Cost
- Let CI do repeated checks (full gate, regression, meter) instead of agents rerunning them by hand.
  Locally, rebuild only the TU you changed and let CI do the full gate on push.
- Cheapest model that can do the job; batch similar functions; never retry an attempt already in
  the target's "tried" list.
- One CI run per meaningful push, not per tiny commit: commit locally, push in batches.
- Report bytes gained vs tokens spent.

## Layout on main
| Path | What |
|---|---|
| `binaries/` | retail anchors, read-only. `sha256sum -c SHA256SUMS`. Never rebuild over them |
| `status/` | meters for finished or not-yet-imported targets (servers) |
| `tools/dashboard/` | builds the progress page; meter format in its README |
| `MIGRATE.md` | importing a target from its old repo |
