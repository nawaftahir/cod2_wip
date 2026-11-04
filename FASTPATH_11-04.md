# Renderer fast path (research note, 2026-11-04)

Read-only study. No builds run, no source edited. Numbers measured today unless marked ESTIMATE.

## 1. How gfx gates progress and where the time goes

- Meter: PROGRESS.md:5 `C/C++ 117113/253580 = 46.18%, 722 bodies`, +587 B / +1 body for the
  whole 11-04 step. The 253,580 denominator excludes libraries (D3DX/CRT/IJG) and 36 asm bodies.
  Retail .text is 1,089,680 B, so ~77% of .text is library/non-game code.
- One gate script, `target/work/tools/build.sh` (49 lines), does everything every time:
  full docker MSVC build (`-B` whenever any header hash changes, build.sh:19-26), then
  `../tools/cmp.py` (byte referee), `../tools/bindcheck.py` (symbol-binding referee),
  `regression.py` (all 2512 protected extents must survive), `check_checkpoint.py`,
  `source_coverage.py`, `layout.py`. One build lock (`flock -n`, build.sh:15), one tree,
  no parallel builds (RULES.md "serialize links").
- Per accepted body, extra cost on top of that: native behaviour fixtures written first
  (WHOLEFILE.md:31 "Run native behavior fixtures first"; 209 test files in target/work/tests),
  a JSON proof receipt, a PROGRESS/ATTEMPTS write-up (PROGRESS 2972 lines, ATTEMPTS 3561 lines).
- Measured yield: PROGRESS.md:273/308/347 "eight / six / 10 original builds ... zero workers"
  per checkpoint, each checkpoint about one body. WHOLEFILE.md lists four 11-04 sweeps
  (fullscreen 149 B, world copy 472 B x2, parser) with zero gain. WORKERS.md: one Gemini
  worker, 5 bodies, otherwise single-agent.
- Root causes of slowness: (a) one serialized whole-DLL build per probe, (b) fixture + receipt
  overhead per body, (c) single agent, (d) spelling sweeps on hard 150-500 B bodies instead of
  draining easy ones, (e) layout/TU structure still "candidate" (tus.txt header: order is
  inferred from median accepted address), so /GL inlining context is wrong for many bodies
  (WHOLEFILE.md:"investigate original TU/inlining context instead").

## 2. Reference sources

| Source | What it gives | Coverage |
|---|---|---|
| `refrences/cod2-mp-macho/PC/gfx_d3d/` | Mac 1.3 client, renderer statically linked, decompiled from a STABS binary: names, source file per function, types | 61 r_*/rb_* files, 1,287,783 B of C. Files: r_bsp, r_bsp_load_obj, r_buffers, r_caps, r_cmds, r_debug, r_dpvs, r_dvars, r_flares, r_font(_load_obj), r_fog, r_image(_load_obj/_load_common/_wavelet), r_jpeg, r_light(_load_obj), r_loadworld_new, r_marks, r_material(_load_obj), r_model(_load_obj), r_outdoor, r_rendercmds, r_rendertarget, r_scene, r_screenshot, r_shadowcookie, r_sky(_load_obj), r_specularityimage, r_splitscreen, r_staticmodel(_load_obj/cache), r_surfbounds, r_texturemem, r_utils, r_water(_load_obj), r_xsurface(_load_obj/_optimize), rb_backend, rb_debug, rb_fog, rb_imagefilter, rb_imagetouch, rb_light, rb_shade, rb_sky, rb_state, rb_tess |
| KisakCOD (CoD4) | close descendant, same TU names, PC D3D9 paths | 100 gfx_d3d .cpp |
| opencod2 / OpenCoD2-Plus | structural, partial | 124 gfx files |
| CoD2rev_Server | no renderer (server only) | 0 |
| 1.0 client tree | refexport/refimport, shared com_* headers (already used: target/src/opencod2/headers, PC/universal/com_types.h) | interface only |

ESTIMATE: essentially all 253,580 game bytes map to a named Mac file + function (the Mac is
1.3 and GL, so the D3D-specific bodies such as rb_state/r_caps/r_texturemem are names+types
only; Kisak covers their D3D9 shape). The Mac file list also IS the TU set: gfx tus.txt has
115 lines vs 61 Mac gfx files + libraries; diff the two to close the TU list.

## 3. Near-identical DLLs

Unmasked 24-byte window hit of MP 1.0 .text found in the other .text (crude, no reloc masking,
so real similarity is higher):

| DLL | .text | hit |
|---|---|---|
| SP 1.0 `gfx_d3d_x86_s.dll` (= cod2engineold/binaries/windows/1.0, sha 63df3122) | 1,089,552 | 82.4% |
| MP patch build in `D:\Activision\Call of Duty 2\` (Mar 2006, sha aed5b8de) | 1,090,928 | 77.0% |
| MP 1.3.4054 | 664,578 | 2.9% (different build, useless for bytes) |

None has symbols, so they do not help match MP 1.0. They are almost free SECOND targets: once
MP 1.0 is done, SP 1.0 (128 B smaller .text) should be a few `#ifdef` away. Run classify13-style
masked pairing later to size it; not on the critical path.

## 4. Fastest plan to SHA-identical

Phase 0, structure (1 lead, ~1 day): fix the TU set from the Mac file list + Kisak, freeze
link order and per-TU flags, data/rdata contributor order, library objs. This is the fix for
the /GL inlining-context misses; matched code should never re-roll after this.

Phase 1, tooling (reuse as-is from claude_client13/tools, path-adapted):
- `cmp13.py`/`cmp13` per-function relocation-masked referee on one build image, `ratchet_fn.py`
  (no function lost vs a good.json, net bytes >= 0), `why13.py` (cause grouping),
  `layout13.py` (gap report), `classify13.py` (for SP later). Keep gfx `bindcheck.py` in the
  ratchet: it caught the Com_Parse vs Com_ParseOnLine misbinding (PROGRESS.md:25-28).
- Add a per-TU compile+compare fast loop (compile one .obj, compare its functions against
  retail bytes with masking) so agents iterate in seconds; full link only at the lead's ratchet.
  Note /GL+LTCG: obj-level compare is a filter, the linked ratchet is the authority.

Phase 2, waves: up to 6 agents in own worktrees (`worktrees/wN`, own build dir), one area each
(material/image loaders, BSP/world load, scene/dpvs, backend/tess/state, models/xsurface,
fonts/sky/water/flares). Each drains the easiest unmatched bodies in its TUs first
(`target/work/proof/nov03_ready.tsv`: 160 bodies / 45,626 B with no unresolved callees),
skips anything in ATTEMPTS.md, delivers commits; the lead merges and ratchets in batches.

Keep: byte + binding referee, protected-extent regression (as the ratchet's no-loss rule),
no fabrication, PINNED/SUPPORTED/HYPOTHESIS tags, ATTEMPTS tried-lists.
Relax to slow path: per-body native fixtures (byte+binding identity already proves behaviour;
keep fixtures only for ABI/struct-layout changes to shared headers), per-body JSON receipts and
PROGRESS prose (one receipt per ratchet batch), full `-B` rebuild on any header touch (cache per
TU), single build lock (one per worktree).

Phase 3, whole file: section placement, imports/exports (GetRefAPI only), relocs, PE metadata,
SHA, then GPU smoke. Then SP 1.0 as a variant.

Order of magnitude, ESTIMATE (not measured): 136,467 B left in ~1,000 bodies. At today's ~600 B
per step it is 200+ steps. With 6 agents on a per-function ratchet and easy-first draining,
expect roughly 100-250 agent-hours for code to ~95%, plus a long tail of hard /GL bodies and
~20-40 lead hours of layout/PE work.
