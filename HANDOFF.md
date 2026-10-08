# Renderer handoff — 2026-10-08 (read this first)

## The only goal
CoD2's **own** renderer source for `gfx_d3d_mp_x86_s.dll` 1.0, function by function, that
binds byte-identical at the retail VA. The owner wants it so CoD2 can be extended.

**Does NOT count, do NOT work on:** D3DX / the HLSL shader compiler, DxErr, the CRT, STL
internals, IJG JPEG. They are Microsoft or third-party code and get linked from the original
.lib files later. Earlier work on them is frozen in `archive/library_recon/` (with the old
handoff `HANDOFF_codex_1006.md`). Don't read it for direction, don't extend it, don't audit it.

## Number (the only one to quote)
`python3 tools/gamecov.py` (reads `target/build/v/bind.json`):

**game source 439 fns 67,258 / 253,580 B = 26.523%** (cold rebuild 2026-10-08).

- Game code = 0x10001000-0x10041db0 + 0x10057990-0x10062200 (SUPPORTED: GLM sizes + the JPEG
  gaps). Anything outside those ranges is library and never counts.
- A function counts only when bind.json has `why == []` **and** `t` == the retail VA exactly.
- Next milestone: 30% = 76,074 B (+8,816 B).

## Where things are
| Path | What |
|---|---|
| `target/verified/src/` | The single game tree. Only verified work lands here. |
| `target/verified/HANDOFF.md` | Per-round checkpoints, near-misses, debts, next chains. |
| `target/scratch/AGENT_BRIEF.md` | How to build, diff and verify one function; lessons. |
| `target/scratch/READY2_game.tsv` | Work list from the retail call graph (regenerate below). |
| `tools/` | `vb.sh`, `pb.sh`, `fd.sh`, `gamecov.py`, `ready.py`, `bindcheck.py`. |
| `archive/scratch_game_1008/` | Old agent drafts and backups (game). Mine for drafts only. |
| `archive/library_recon/` | Frozen library work. Not yours. |

## Loop
    cd gfx/target
    cp -r verified/src scratch/codex/src             # your draft tree
    ../tools/pb.sh scratch/codex/src build/codex     # ~40 s, parallel-safe
    ../tools/fd.sh '<Name>@@' <retail-va> <size> build/codex   # ours vs retail
    python3 ../tools/gamecov.py build/codex/bind.json
    python3 ../tools/ready.py scratch/READY2_game.tsv          # refresh the work list
Before proposing a merge: diff your bind.json against `build/v/bind.json` by retail VA and
prove no game function was lost. Leave the merge into `verified/src` to Claude/owner review.

## What to work on (in this order)
1. Near-misses listed in `target/verified/HANDOFF.md` (IntersectPlanes, RB_ProjectionMatrixChanged,
   Material_ReleaseVertexDecls, XModelUnoptimize ...). Several unlock their callers.
2. Caller chains. Most remaining leaves take LTCG register arguments and only match once their
   callers are in source: RB_EndSurface 0x1003a8d0 (+ 0x1003a690/a7b0/a580/a340, 0x10034910,
   0x1003a000), R_LoadWorld 0x10001690, Material_LoadMaterial 0x1001c4e0, 0x100137f0.
3. Names from the Mac PC tree `refrences/cod2-mp-macho/PC/gfx_d3d/*.c`. GLM names are often wrong.

## Hard rules (owner)
- No inline asm, `_emit`, byte arrays, retail-byte copying, `{}` stubs, dummy callbacks or
  non-retail helper functions. Readable C/C++ only. Unknown name/offset/constant = DEFER.
- No commits, no pushes: the owner reviews and commits. Don't touch glm/, codex/,
  claude_client/, cod2engine/, cod2engineold/binaries. Never delete root-owned `_CL_*` files.
- Report in plain words: verified list (name, VA, bytes, file), files changed, near-misses.
  Never quote a number that isn't `gamecov.py` output on a finished build.
