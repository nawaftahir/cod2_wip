# cod2_wip

Public source work monorepo for every CoD2 reconstruction target (github.com/nawaftahir/cod2_wip).
The universal laws in `dev/CLAUDE.md` still apply. `cod2engine` stays the clean release repo;
nothing here goes there automatically. Compiler/SDK payloads for the renderer stay in its private CI package.

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

## Pushing (owner, 2026-11-05)
Standing "push it" for this repo: agents push their `<target>/<work>` branches and merge into
`<target>/main` once the gate and CI are green. `cod2engine` is the owner's alone: never push,
commit or open PRs there.

## Offset first (every target, from day one)
Order of work for any binary, especially under /GL + /LTCG:
1. **Structure:** function set per TU, link order, function order, data ownership equal retail
   (`docs/RECON_PLAYBOOK.md`).
2. **Sizes, front to back:** make every function the same SIZE as retail, starting at the first point
   where our offsets drift (`tools/drift*.py`). Offsets depend on sizes and order, not exact bytes, so
   a same-size function with a register diff blocks nothing after it; fix missing code, stubs and
   wrong inlining first. Regions can be worked in parallel (each owns its internal drift).
3. **Bytes last:** register/scheduling residues are matched once offsets are stable, where ties have
   settled and every match is permanent.
Never trade behaviour for size: a source change that fits a slot but changes what the code does
(fall-through, dropped branch, wrong error path) is not a fix, even if the meter rises.
Primary meter: whole-file same-offset. Matched-fn counts at any address are secondary: code-first
matching away from retail offsets re-rolls LTCG ties and has to be redone (client 1.3, 11-04).

## Accepting work (every target)
- **Clean builds only.** Before an accept, move the object dir aside and rebuild (client:
  `mv build/obj build/obj.old`). Incremental and copied `build/` dirs have given fake numbers.
- **`src/` holds verified TUs only.** A TU moves from `workspace/` to `src/` only when the referee
  reports every one of its functions matched; the meter counts `unverified_in_src` (must stay 0).
- **Ties.** A function that flips on unrelated edits (LTCG count/ordering ties) goes in the target's
  tie list, one `# reason` line above each entry (evidence: which unrelated change flipped it). Losing a
  listed tie does not reject a build; losing any other matched function does. Never count a tie flip
  as progress.

## Renderer target

`gfx/main` is checked out at `gfx/`; renderer work uses `gfx/<work>` in
`.worktrees/`. Read that target's `CLAUDE.md` and `docs/STATUS.md`.
`make check` runs its clean source/byte/binding gate. CI workflow `gfx` writes
`ledger/meter.json`, retains every accepted extent and checks that `src/`
contains verified files only. The SDK/compiler/anchor live in the PRIVATE
`ghcr.io/nawaftahir/cod2-gfx-ci` package; no payloads enter public Git.
The old `dev/gfx` and archived research are backups, not build dependencies.

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
- Each target has one CI workflow named after it (`radiant`, `client`, `gfx`, `servers`) that runs on push to
  `<target>/**`: build, referee, write the meter, fail if the meter drops.
- The meter lives on `<target>/main`: `ledger/meter.json` or `meter*.json` at its root (one per
  binary, e.g. `meter-1.0.json`, `meter-1.3.json`). Only the referee writes it.
- When that CI passes on `<target>/main`, the `progress page` workflow on main rebuilds GitHub Pages
  from every `*/main` meter plus `status/*.json`. Local preview: `python3 tools/dashboard/build.py`,
  open `site/index.html`.
- Meter fields: `tools/dashboard/README.md`. Emit every field your referee can measure (sections,
  TUs, functions); the page shows what it gets and marks the rest "not measured".

## Metrics must be exactly right
Every number on the page must be exact, reproducible, and mean what its label says.
- Produced only by CI from a clean build of the commit it names. Never hand-written, estimated,
  rounded up, copied from an incremental or stale build, or carried over from another branch.
- Each number is computed one way and labelled with that way. If two methods disagree (e.g. referee
  credit vs bytes identical in place), the meter reports both, and finding out why is a task.
- Never undercount or overcount: a function or TU counts as verified only when its bytes are proven
  identical (referee match or byte-identical at the same offset); a known blind spot of a tool
  (twin caps, unpaired names, padding) is fixed in the tool, not left as a silent gap.
- Every metric tool has a self-test (a known-good case and a deliberately broken one) that runs in CI.
- If a number looks wrong, stop and verify it against the binaries before reporting or building on it.
- A change to how a number is computed is announced in the commit and the page, never silent.

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
| `status/` | meters for not-yet-imported targets (servers: CI meters on `servers/main`) |
| `tools/dashboard/` | builds the progress page; meter format in its README |
| `MIGRATE.md` | importing a target from its old repo |
| `docs/RECON_PLAYBOOK.md` | how to start a new target (structure first, gates, meters) |
