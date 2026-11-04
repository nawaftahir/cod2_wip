# cod2_wip

Private work monorepo for every CoD2 reconstruction target. The universal laws in `dev/CLAUDE.md`
still apply. `cod2engine` stays the clean release repo; nothing here goes there automatically.

## Branches and worktrees
- **`main` = confirmed only.** A commit lands on main only after the target's referee confirms it
  (meter not worse, gate green). Every push to main rebuilds the progress page.
- **All work happens on branches, each in its own worktree.** Never edit in the main checkout.
  Branch names: `<target>/<work>`, e.g. `radiant/agent/gemini`, `client/1.3`, `gfx/workers/gemini`.
  ```sh
  git worktree add .worktrees/<work> -b <target>/<work> <target>/main
  ```
- Land work by merging the branch into `<target>/main` from the `<target>/` worktree, then push only on "push it".
- A target lives on its own branches, checked out as `<target>/` (worktree of `<target>/main`); `src/` is built source, `workspace/` is work in progress. Touch `binaries/`, `tools/`, `status/` or
  another target only when the task says so.

## Layout
| Path | What |
|---|---|
| <target>/ | worktree of <target>/main, one reconstruction target (radiant, client, gfx) |
| `binaries/` | retail anchors, read-only. Never rebuild over them; check with `sha256sum -c SHA256SUMS` |
| `status/` | hand-kept meters for finished or not-yet-imported targets |
| `tools/dashboard/` | builds the progress page |
| `research/`, `data/` (LFS), `docs/` | research inputs, big generated files, workspace docs |

Importing a target from its old repo: `MIGRATE.md`.

## Meter contract (progress page)
Each target keeps one meter on `<target>/main`: `ledger/meter.json` (radiant's format) or
`meter.json` at its root. Write it only from a referee run, never by hand. Fields read:
`text_bytes, matched_bytes, same_offset_bytes, file_bytes, matched_functions, game_functions,
sha_identical`, optional `name, binary, version, note`. One target with several binaries
(e.g. client 1.0 and 1.3) uses one file each: `meter-1.0.json`, `meter-1.3.json`.
Preview locally: `python3 tools/dashboard/build.py` and open `site/index.html`.
