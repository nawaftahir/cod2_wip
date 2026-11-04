# Importing a target into cod2_wip

One target per session. Order: radiant, then client, then gfx, then research.
Do not touch the old repo's worktrees; they keep running until the target is cut over.

Paths below: `$WIP=~/cod2/test/dev/cod2_wip`, `$T` = target name, `$SRC` = old repo.

| $T | $SRC | old branches -> |
|---|---|---|
| radiant | `dev/radiant` | `radiant/*` |
| client | `dev/claude_client` | `client/*` (`client-1.3` -> `client/1.3`) |
| gfx | `dev/gfx` | `gfx/*` |

## 1. Freeze
- Stop the target's agents. In every worktree of `$SRC`, commit dirty work to `freeze/<yyyy-mm-dd>-<worktree>`.
- `git -C $SRC push --all origin` (backup), and tar `$SRC/.git` to `D:\cod2_anchor_backup\`.

## 2. Rewrite on a scratch clone (never the live repo)
```sh
pip install --user git-filter-repo   # once
git clone --mirror $SRC /tmp/imp-$T && cd /tmp/imp-$T
git filter-repo --to-subdirectory-filter targets/$T \
  --refname-callback 'return refname.replace(b"refs/heads/", b"refs/heads/'$T'/", 1)'
```
Also strip junk from history with `--path-glob ... --invert-paths`: build outputs, `*.obj`,
`core.*`, `_CL_*`, Ghidra project dirs. Keep retail binaries (they move in step 4).

## 3. Merge
```sh
cd $WIP
git fetch /tmp/imp-$T 'refs/heads/*:refs/heads/*'
git merge --allow-unrelated-histories $T/main -m "Import $T"   # client: $T/master
```
Check: `git log --oneline -- targets/$T | wc -l` equals the old commit count.

## 4. Move shared pieces
- `.github/workflows/*` from `targets/$T/` to root `.github/workflows/$T.yml`; add
  `paths: [targets/$T/**, binaries/$T/**]` and `defaults.run.working-directory: targets/$T`
  (docker `-v` mounts become `$PWD/targets/$T`). Branch filters get the `$T/` prefix.
- Retail anchors are already in `binaries/`. Point the target's tools there instead of its own copy
  (radiant: `binaries/CoD2Radiant.exe` -> `../../binaries/radiant/1.0/CoD2Radiant.exe`), then drop the copy.
- Large generated files to `data/$T/` (LFS patterns in `.gitattributes`).

## 5. Prove, then cut over
- The target writes its meter on main (see "Meter contract" in `CLAUDE.md`); radiant already does.
  Delete any `status/` entry the meter replaces.
- Target's own gate passes from `targets/$T` (radiant: `tools/ci_gate.py`, meter equals the old one).
- Push only on "push it". CI green once.
- Recreate the target's worktrees from `$WIP` (`git worktree add`), fix hard-coded paths.
- Archive the old GitHub repo (read-only). Never delete it.
- Tick the target below.

## Status
- [x] radiant (2026-11-04: branch radiant/main, worktree radiant/, gate 813/813)
- [x] client (2026-11-04: client/1.0/main + client/1.3/main, worktrees client-1.0/ client-1.3/, gates 1,336,591 + 1,503,407)
- [ ] gfx
- [ ] research (glm, modtools, codex)
- [ ] docs (RECON_PLAYBOOK, WHOLEFILE, track AGENTS.md path updates)
