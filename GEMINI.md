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

## Accepting work (every target)
- **Clean builds only.** Before an accept, move the object dir aside and rebuild (client:
  `mv build/obj build/obj.old`). Incremental and copied `build/` dirs have given fake numbers.
- **`src/` holds verified TUs only.** A TU moves from `workspace/` to `src/` only when the referee
  reports every one of its functions matched; the meter counts `unverified_in_src` (must stay 0).
- **Ties.** A function that flips on unrelated edits (LTCG count/ordering ties) goes in the target's
  tie list, one `# reason` line above each entry (evidence: which unrelated change flipped it). Losing a
  listed tie does not reject a build; losing any other matched function does. Never count a tie flip
  as progress.

## Client targets (`client-1.0`, `client-1.3`)
| Worktree / branch | Binary | Gate | Ties | Meter |
|---|---|---|---|---|
| `client-1.0` / `client/1.0/main` | `binaries/windows/1.0/CoD2MP_s.exe` | `tools/ratchet10.sh` | `data/ties.txt` | `meter-1.0.json` |
| `client-1.3` / `client/1.3/main` | `binaries/windows/1.3/CoD2MP_s.exe` | `tools/ratchet13.sh` | `data/ties13.txt` | `meter-1.3.json` |

- Same toolchain for both: MSVC 7.1 build 3077 `/O2 /GL`, `link /LTCG`, docker image
  `cod2-msvc71-vs2003` (`-ft` adds faketime). Recipe in `toolchain/`; CI needs: `docs/CI_NOTES.md`.
- Gate: `tools/ratchetNN.sh "tag"` builds, runs the referee, prints matched-fn bytes and same-offset
  bytes. `RATCHET OK` -> commit, then `tools/ratchetNN.sh accept` (writes the baseline and the meter).
  `RATCHET REJECT` -> revert your change.
- Docs per target: `docs/STATUS.md` (numbers, leads, next), `docs/KNOWLEDGE.md` (PINNED/SUPPORTED facts),
  `docs/TRIED.md` (what failed, so nobody repeats it), `docs/archive/` (raw old notes). Method: skill `client-recon`.

## Worktree setup (client)
```
cd ~/cod2/test/dev/cod2_wip
git worktree add .worktrees/<work> -b client/1.3/<work> client/1.3/main
cd .worktrees/<work>
cp -r ../../client-1.3/toolchain/vc70 toolchain/   # not in git
export ANCHOR=../../binaries/windows/1.3/CoD2MP_s.exe DXSDK=../../../sdk/sum2004
tools/ratchet13.sh "baseline"                       # fresh tree = clean build; must reproduce the meter
```
(1.0: same with `client/1.0/...`, `client-1.0`, `windows/1.0` and `tools/ratchet10.sh`.) Never copy
`build/` from another tree.
Builds run in their own docker container, so parallel worktrees do not block each other (CPU bound).
Untracked inputs a build needs (vc70, dsound.lib, SDK path): `docs/CI_NOTES.md`.

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
| `docs/RECON_PLAYBOOK.md` | how to start a new target (structure first, gates, meters) |
