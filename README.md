# cod2_wip

Private work monorepo for the CoD2 engine reconstruction. Messy on purpose: WIP, agent branches,
retail anchor binaries. Release-ready targets get promoted by hand into `cod2engine` (clean, no
binaries). Never make this repo public.

| Path | What |
|---|---|
| `radiant/` | CoD2Radiant.exe 1.0 (was `cod2radiant.git`); worktree of branch `radiant/main` |
| `targets/client/` | CoD2MP_s.exe 1.0 + 1.3 (was `claude_client.git`) |
| `targets/gfx/` | gfx_d3d_mp_x86_s.dll 1.0 (was `gfx.git`) |
| `research/` | glm, modtools, codex research |
| `binaries/` | retail anchors, read-only: `windows/<ver>/`, `linux/`, `radiant/1.0/`, `modtools/1.0/`. Check with `sha256sum -c SHA256SUMS` |
| `data/` | big generated files (stabs, DBs, exports), Git LFS |
| `docs/` | workspace docs (playbook, whole-file checklist) |

Branches: `<target>/<work>`, e.g. `radiant/agent/gemini`, `client/1.3`. `main` holds every target.

Importing a target: see `MIGRATE.md`.

## Layout
`main` holds only the retail anchors (`binaries/`) and these docs. Each target lives on its own
branches (`radiant/main`, `radiant/web/easy`, ...) and is checked out as a worktree in its folder:
`git worktree add radiant radiant/main`. Agent worktrees go in `.worktrees/<name>`. Inside a target,
`src/` is the built source and `workspace/` holds everything in progress.
