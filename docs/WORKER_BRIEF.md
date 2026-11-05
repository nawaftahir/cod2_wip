# Renderer worker brief (cheap agents: Sonnet, Haiku, Gemini)

Goal: make ONE blocker from `docs/BLOCKERS.md` byte-identical to retail. Its callers
already match, so one fix credits all of them. Rules in `CLAUDE.md` still apply.

## Pick
- Prefer status `same size, bytes differ`, then small `size differs`. Skip `chain:` rows
  (fix the named blocker instead).
- Grep `docs/TRIED.md` for the name first. Never repeat a logged attempt.
- One blocker per worker. Tell the lead which one you took.

## Setup (once per worker)
```
cd ~/cod2/test/dev/cod2_wip
git worktree add .worktrees/gfx-wN -b gfx/wN gfx/recon
cd .worktrees/gfx-wN/workspace
export DXSDK=/home/nawaf/cod2/test/dev/sdk/sum2004 GFX_IMAGE=cod2-gfx-ci-local:20261104
sh work/tools/build.sh            # first build is full; must pass before you edit
```
Each worktree has its own build dir. Never copy `build/` between worktrees.

## Loop (max 3 probes per blocker)
1. Find our source: `grep -rn "BlockerName" work/src/gfx_d3d/*.cpp`.
2. Diff ours vs retail: retail address is in BLOCKERS.md; ours is in
   `build/codex_boundsoutside_1016_02/gfx.map`. Disassemble both (pefile + capstone)
   and compare side by side. Find the FIRST differing instruction and explain it.
3. Change the source in the most natural C way that explains the diff. Evidence for names,
   offsets and constants: retail binary, `refrences/cod2-mp-macho/PC/gfx_d3d/` (Mac 1.3,
   logic may differ), CoD2rev. Never guess a name, type or struct offset.
4. Probe: `GFX_PROBE_SYMBOL='<mangled name from gfx.map>' sh work/tools/build.sh`
   - exit 3 / "probe failed": not matched. Note the new size, try the next idea.
   - full pass: the byte referee, binding referee and regression all ran green.
5. After 3 failures: restore the file (`git checkout -- <file>`), append a short entry to
   `docs/TRIED.md` (what differs, each attempt, resulting size), commit, stop.

## Forbidden
Inline asm, `_emit`, byte arrays, copied retail bytes, `#pragma optimize` hacks, compiler
flag changes, editing tools/gates/meters, touching other targets. Do not run
`write_meter.py`, do not push.

## Deliver
A commit on `gfx/wN` with the source change (gate passed) or the TRIED entry. Report:
blocker, result, bytes it unblocks, probes used.
