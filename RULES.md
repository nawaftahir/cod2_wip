# Shared renderer workspace — rules for every agent

## Active workspace override — owner cleanup, 2026-10-20

Use `target/work/` for active reconstruction. Its `src/` contains only compiled
TUs, headers and configuration; tests, layout notes and proof are separate.
Build ONLY with `sh target/work/tools/build.sh`; it reuses one existing build
directory, preserves compiler-visible paths, checks both referees and every
accepted checkpoint extent, and refreshes the map/section report each wave.
`src/tus.txt` is object order; `src/profile.mk` holds per-TU exceptions.
Maintain data ownership and library order in `target/work/layout/README.md`.
No cosmetic TU reordering, duplicate build trees or postponing layout to100%.
This supersedes old active-tree/build-path instructions below. Historical proof
packets remain in place because regression checks depend on them. No source
promotion to `target/verified/src` or the release tree is implied by cleanup.

## Goal (owner, 2026-10-07): CoD2's own renderer source
- Progress = verified **game** code only: `python3 tools/gamecov.py` (CoD2 renderer bytes, not
  JPEG, D3DX or the CRT). 2026-10-08: 67,258/253,580 B = 26.523%. Start at `HANDOFF.md`.
- Do NOT reconstruct D3DX, CRT or JPEG internals. For whole-file identity, link the original
  Summer 2004 / VC7.1 .lib files and upstream IJG 6b. The earlier library work is frozen in
  `archive/library_recon/` (no further effort, never in a release tree).
- One game tree: `target/verified/src`. Build `tools/vb.sh` (or `tools/pb.sh <src> <build>` in
  parallel). A function counts when `bind.json` has `why == []` and `t` == the retail VA.
- Work TU by TU in Mac 1.3 file names (cod2-mp-macho). Handoffs are reviewed by the owner and
  Claude before they replace this direction.

Target: `gfx_d3d_mp_x86_s.dll` 1.0, readable C/C++ that rebuilds **SHA-256 identical**
(`4553b22daff76e1f628d7ba16fda840b8ba415ae5024072b279fe8b820f634f6`). `.text` = 1,089,680 B.
Agents here: Claude, Codex, DeepSeek (and any other the owner adds). The root `../CLAUDE.md`
universal laws apply; this file adds what makes parallel work safe.

## Why one whole-DLL link (the fast method)
The DLL's Rich header (PINNED 2026-09-27) shows 121 objects built `/GL` + `link /LTCG`:
code is generated at link time, with cross-TU inlining and custom register conventions.
Whole-link matching is the integration experiment; retain per-function proof separately.
`make measure` reports discovery coverage, not verified coverage: its masked search does
not yet establish complete target boundaries or correct symbol bindings. Do not add
its percentage to independently verified function coverage. Whole-file SHA remains
the finish line. The reported client comparison is not proof for this renderer.
Non-LTCG parts (CRT, jpeg, D3DX static lib `96/4035`×30, masm ×48) can still be matched per
function, then dropped into the link.

## Layout and loop (game work)
- `target/verified/src` = the game tree (tus.txt = link order). Drafts: `target/scratch/<you>/src`.
- Build: `tools/pb.sh <src> <build>`; one fn: `tools/fd.sh '<Name>@@' <va> <size> <build>`;
  score: `tools/gamecov.py <build>/bind.json`; work list: `tools/ready.py`.
- `make measure` / `cov.py` / CLAIMS.md / runs/ are the old library-era workflow. Don't use them
  for game progress.

## Parallel-safety rules
- Serialize whole-link builds: check running build containers first, run only one renderer link at
  a time, and never launch two builds against the same output directory. Reuse a completed build
  incrementally for bounded source trials.
- **One owner per file** (claimed in `CLAIMS.md`). Never edit a file someone else holds.
- **Shared headers** (`headers/`, `shims/`, anything in 2+ TUs): small append-only edits only,
  in their own commit, rebuilt + measured before commit. Rename/re-type = ask in `CLAIMS.md` first.
- **Work in your own git worktree** (`git worktree add ../gfx-<agent> -b <agent>`), rebase on
  `master` before merge, re-measure after rebase. `master` only moves forward, never regresses.
- **Adding a TU can shift other functions (LTCG regime flips).** Check `delta.py` after every new TU;
  loss >1 KB elsewhere = don't merge, record it in `NOTES.md`.
- Facts others need (names, addresses, ABIs, dead ends) go into `NOTES.md` with a tag:
  **PINNED** (on the binary) / **SUPPORTED** (a ref agrees) / **HYPOTHESIS** (never ship).

## Hard rules
- Never fabricate names, offsets, constants or signatures. DEFER with a reason.
- No `_emit`, byte arrays, naked-asm transplants or post-link patching. Readable source only.
- Never commit binaries (anchor DLL, `.obj`, `.dll`), Ghidra projects or game assets.
- Git identity `Nawaf`, short human commit messages, **no Co-Authored-By**.
- Quote discovery numbers from `make measure`; verified numbers require full boundaries,
  symbol bindings, pinned source/toolchain identity and regression checks. Label both.
- `/FORCE` links and unresolved-symbol/shim builds are experiments, never release proof.
- Verified game source goes in `target/verified/src/` (after review); drafts in `target/scratch/<owner>/`.
  A fully checked candidate file is not proof of the original historical TU grouping.
- Don't touch other workspaces (`glm/`, `codex/`, `claude_client/`, `cod2engine/`); copy in, don't move.

## Sources, in trust order
Target DLL > `codex/renderer/refapi_pinned.json`, `LABEL_CORRECTIONS.md` > Mac 1.3 decompile
(`refrences/cod2-mp-macho/PC/gfx_d3d`, names/types oracle) > KisakCOD `gfx_d3d` (CoD4, shape only)
> `glm/` (research; its labels are unverified).
