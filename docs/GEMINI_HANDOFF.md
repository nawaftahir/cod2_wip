# Renderer handoff for Gemini workers (2026-11-07)

You are reconstructing C++ for the CoD2 1.0 renderer DLL `gfx_d3d_mp_x86_s.dll` so that MSVC 7.1
(`/O2 /GL`, `link /LTCG`) rebuilds it byte-identical. Read `CLAUDE.md` (this worktree) and
`../../CLAUDE.md` first; their rules win over anything here. A lead (Claude) reviews and merges
your branch. Your job: produce gate-green commits that add verified functions or move code to
retail offsets, and log every failed attempt.

## Setup (once per worker; N = your worker number)
```
cd ~/cod2/test/dev/cod2_wip
git worktree add .worktrees/gfx-gN -b gfx/gN gfx/recon      # or reuse and: git reset --hard gfx/recon
cd .worktrees/gfx-gN/workspace
export DXSDK=/home/nawaf/cod2/test/dev/sdk/sum2004 GFX_IMAGE=cod2-gfx-ci-local:20261104
sh work/tools/build.sh            # first build is full (~10 min); must end "...regression passed"
```
Shell: all commands run inside WSL (`wsl.exe -e bash -lc '...'` from Windows). Write and edit files
with your file tools on `\\wsl.localhost\Ubuntu\home\nawaf\...` paths; shell heredocs with quotes
break. MSVC 7.1 is C++98: no `auto`, no `nullptr`, no C99 mixed declarations in `.c` files.

## The loop (seconds per probe after the first build)
1. Pick a row in your assigned file from `docs/CHUNKS.md` (retail addr, slot size, first instructions).
2. See retail: `python3 work/tools/fdiff.py <OurName> <retailhex> [size]` (side by side, `*` = differs),
   or disassemble the retail address with capstone when we have no source yet.
3. Ghidra C draft for any retail function: `work/proof/retail/ghidra_unplaced.c` (local, not in git;
   search `// ==== <addr>`). Call graph: `work/proof/retail/ghidra_funcs.tsv`.
4. Edit source in `work/src/gfx_d3d/<file>.cpp` (never `src/` at the root).
5. Probe one symbol: `GFX_PROBE_SYMBOL='<mangled name from build/codex_boundsoutside_1016_02/gfx.map>' sh work/tools/build.sh`
   - `Unverified byte probe failed` = not identical; read `fdiff` and adjust.
   - `Byte probe passed; full gates follow` = identical; the full gate then runs.
6. Full gate (no probe var): `sh work/tools/build.sh` must end
   `Build, referees and checkpoint regression passed`. `checkpoint loss` = you broke a matched
   function: undo that part. Never edit gate tools, allow-lists or hashes to get past a failure.
7. Measure: gained/lost (`git show HEAD:workspace/work/proof/latest/bind.json` vs the new
   `build/.../bind.json`, functions whose `why` is `[]`) and same-offset
   (`work/layout/current.json` field `same_file_offset_equal_bytes`).
8. Commit on `gfx/gN` (identity Nawaf, short message, no Co-Authored-By), with a one-line entry in
   `docs/TRIED.md` for matches AND failures. Do not push. Max 3 probes per function, then log and move on.

## What actually matches (proven this week, in payoff order)
1. **Unreferenced out-of-line copies.** Under LTCG every non-static function or `inline` helper the
   source uses keeps one copy even when inlined everywhere (`/OPT:NOREF`). Retail chunks with no
   callers are these copies. Two kinds:
   - Header helpers (`universal/com_math.h`, `q_shared.h`): emitted at the START of each TU that uses
     them, in header declaration order. If retail's TU front has `I_sel, I_min, FloatAsInt, ...`,
     our TU must use those helpers somewhere (replace hand-written identical code with the helper call).
   - Functions defined in the `.cpp`: emitted at their source position. Our source often has their
     body written inline in a caller; restore them as real non-static functions at that position and
     call them (the optimizer inlines them as before). Examples that matched: `R_FindSpawnVar`,
     `R_LoadMaterials`, `R_LoadLightGridColors`, `R_CopyLightmap`, `R_GetNormalizedColorFromDvar`,
     `Image_ExpandBgr`, `Image_Load`, `R_DpvsPlaneDistToPoint`.
   - Names: KisakCOD (`~/cod2/test/dev/refrences/KisakCOD/src/gfx_d3d/`, CoD4, same lineage) or the
     Mac 1.3 decompile (`refrences/cod2-mp-macho/PC/gfx_d3d/`). If neither names it, use a
     descriptive name with comment `// Name unconfirmed; PINNED out-of-line copy <addr>.`
2. **Order.** Within a TU our function order is source order; move function definitions to retail's
   order when drift shows a swap.
3. **Wrong C type.** `float` vs `double` constants/locals (`fmul dword` vs `qword`), byte stores into
   `GfxColor.array[]` instead of packed integers, 16-bit params, parameter order, arrays vs scalars
   (arrays live in memory, change frame size).

## What does NOT respond to source (log, do not loop on it)
Register choice, scheduling, block layout, SIB base/index order, zero-via-register stores, and
"arg in register vs pushed" (decided by the CALLEE's body: fix the callee first). See
`docs/KNOWLEDGE.md` and grep `docs/TRIED.md` for the function before any attempt.

## Evidence rules
- PINNED = seen in the retail binary; SUPPORTED = a reference agrees; HYPOTHESIS = never ship.
- No inline asm, `_emit`, byte arrays, `#pragma optimize`, `__forceinline`, flag changes, or
  renamed callees without evidence. No edits to `work/tools/*`, `profile.mk`, `tus.txt` unless the
  lead asked. Never leave failed probe edits in the source: restore before committing.
- A change that fits the slot but changes behaviour is not a fix.

## Your assignment
Work only in the TU your lead gave you (one TU per worker), front to back by retail address,
using `docs/CHUNKS.md` (regenerated after batch 1). Round 2 split:
- g7: `r_dpvs` (55 chunks; front plane helpers partly done)   - g8: `r_bsp_load_obj` (27)
- g9: `r_image` (26)   - g10: `r_shadowcookie`   - g11: `r_rendercmds`   - g12: `rb_tess`
Branch from the current `gfx/recon` (batch 1 is merged):
`git worktree add .worktrees/gfx-gN -b gfx/gN gfx/recon` (or `git reset --hard gfx/recon` on a reused one).

Lessons from round 1 (do not repeat):
- Do not edit `work/tools/source_coverage.py` or any hash/allow-list, even to refresh a hash.
  If the gate stops on a reviewed-file hash, stop and report; the lead refreshes it.
- Do not move global data definitions between files (e.g. `ri`, `rg`, `rgp`, `dx`). It shifts
  `.data` and cost 970 same-offset bytes in round 1.
- Keep commits per function or small group, each gate-green.

Report when done: commits, functions gained (names), same-offset before/after, and the list of
chunks you logged as not source-fixable.
