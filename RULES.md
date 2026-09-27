# Shared renderer workspace — rules for every agent

Target: `gfx_d3d_mp_x86_s.dll` 1.0, readable C/C++ that rebuilds **SHA-256 identical**
(`4553b22daff76e1f628d7ba16fda840b8ba415ae5024072b279fe8b820f634f6`). `.text` = 1,089,680 B.
Agents here: Claude, Codex, DeepSeek (and any other the owner adds). The root `../CLAUDE.md`
universal laws apply; this file adds what makes parallel work safe.

## Why one whole-DLL link (the fast method)
The DLL's Rich header (PINNED 2026-09-27) shows 121 objects built `/GL` + `link /LTCG`:
code is generated at link time, with cross-TU inlining and custom register conventions.
Per-object `/O2` matching only fits leaf / non-LTCG code. So the ONLY progress number is the
coverage of the linked DLL (`make measure`). This took the client from ~0.6% to 51%.
Non-LTCG parts (CRT, jpeg, D3DX static lib `96/4035`×30, masm ×48) can still be matched per
function, then dropped into the link.

## Layout
- `target/src/tus.txt` — TUs in link order; `target/Makefile` — build in `cod2-msvc71-build`.
- `target/src/gfx_d3d/` — Mac 1.3 decompile (61 files), raw port input.
- `target/src/codex/` — Codex's verified candidates. `headers/`, `shims/` — shared Mac-derived headers.
- `tools/` — `cmp.py` (match), `cov.py` (coverage), `delta.py` (gained/lost), `fdiff.py` (one fn).
- `runs/rNNN.json` — every committed measure. `STATUS.md` — one line per commit.

## Loop
1. Claim a TU in `CLAIMS.md` (one owner per file; shared headers: see below).
2. `cd target; make` (~1 min) → `make measure`. Diff one fn:
   `python3 ../tools/fdiff.py build/gfx_d3d_mp_x86_s.dll build/gfx_d3d_mp_x86_s.map <anchor> '<Mangled>@@' <hexaddr>`.
3. Batch several independent fixes per build. Revert what didn't help.
4. Commit only if coverage did not drop and `delta.py` loses nothing real (`$L…` labels are noise).
   Add a `STATUS.md` line (run, coverage, who, what). Release your claim.

## Parallel-safety rules
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
- Quote only numbers `make measure` printed.
- Don't touch other workspaces (`glm/`, `codex/`, `claude_client/`, `cod2engine/`); copy in, don't move.

## Sources, in trust order
Target DLL > `codex/renderer/refapi_pinned.json`, `LABEL_CORRECTIONS.md` > Mac 1.3 decompile
(`refrences/cod2-mp-macho/PC/gfx_d3d`, names/types oracle) > KisakCOD `gfx_d3d` (CoD4, shape only)
> `glm/` (research; its labels are unverified).
