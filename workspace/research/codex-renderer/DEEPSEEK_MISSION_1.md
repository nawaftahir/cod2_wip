# Renderer image cluster — large bounded worker mission

Read `AGENTS.md`, `glm/AGENTS.md`, `codex/renderer/NEXT_SESSION.md`,
`LABEL_CORRECTIONS.md`, and BATCH_22, 28, 30–40 reports before implementation.
Work from `/home/nawaf/cod2/test/dev`. This is renderer-only; leave the client,
server, GLM workspace and canonical `cod2engine/` untouched.

## Deliverable

Produce one coherent, readable image-loading source cluster plus a replayable
review packet, not hundreds of standalone guesses. Own only
`codex/renderer/scratch/deepseek_image_1/`. Copy the current
`scratch/wavelet_load_entry/` baseline there; preserve originals. Keep existing
source provenance. Do not import the unreviewed `wavelet_solid_color` experiment
as an established match.

The baseline already has real allocation, file parsing, bitmap/DXT/wavelet
loading, texture creation and upload source, with targeted host checks. Its
remaining externs and byte mismatches are the work, not permission to invent
implementations. No original historical TU boundary is established yet.

## Scope and order

1. Audit the actual complete boundaries and caller/callee interfaces of
   Image_LoadBuiltin `0x100108a0` and its procedural helpers:
   `0x100100f0`, `0x1000fce0`, `0x10020a70`, `0x1000fe90`,
   `0x10010680`, `0x10010850`, `0x100107b0`.
   Record instructions proving parameter roles, globals, pixel order and constants.
   Implement only confirmed helpers, grouped with their real callers. If one
   helper cannot be established, DEFER that helper and continue the others.
2. Reconcile existing genuine source in the SAME candidate cluster:
   `0x1000cb40` registry lookup, `0x1000cc10` allocation,
   `0x10010ab0` load entry, `0x1000c910` release, `0x1000d450` reload,
   `0x1000d090` picmip, `0x1000edc0` clamp, `0x1000ee30` setup,
   `0x1000ca70` accounting, `0x1000ea20` 2D/cube upload,
   `0x1000ec00` volume upload, `0x1000f5a0` bitmap,
   `0x1000f7b0` DXT, `0x1000f380` wavelet loader,
   `0x10010d40` wavelet decode and its actual helpers.
   This is a shared caller/context problem: do not launch an independent agent
   on each member or repeatedly change public ABI to chase registers.
3. Extend the existing assert-based 32-bit fixture chain for real builtin source
   and confirmed procedural pixel generation. Mock only external services, not
   the new functions being tested. Keep retail/GPU testing clearly separate.
4. Produce the final single-cluster regression and an honest per-address packet.

## Evidence and reusable tools

Target anchor:
`cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll`;
SHA-256 `4553b22daff76e1f628d7ba16fda840b8ba415ae5024072b279fe8b820f634f6`.
Use `audit_legacy.load_matcher()` rather than modifying GLM's matcher paths.
Disassemble complete target bodies; Ghidra inventory lengths have proved wrong.

Existing references, in descending relevance AFTER target evidence:

- `glm/data/decomp/`: this target's decompilation and existing draft source.
- `refrences/cod2-mp-macho/PC/gfx_d3d/`: naming/structural reference, modified
  implementations must be detected rather than copied blindly.
- `refrences/opencod2/src/PC/gfx_d3d/`: source structure/behavior reference.
- `refrences/KisakCOD/src/gfx_d3d/`: CoD4 analog, NOT CoD2 version/layout proof.
- `refrences/opencod2-web/`: browser adaptations, not retail byte evidence.

Fresh build (one object reused across all comparisons):

```sh
python3 codex/renderer/verify_jpeg_reference.py --reference codex/renderer/scratch/deepseek_image_1 --source j_wavelet.c --start 0x1000c910 --end 0x10061ca0
```

The script name is historical; it builds this image overlay too. Use the pinned
image/flags recorded in its inputs. If Docker access is denied, request approval
or report the environment blocker; never invent results. Do not run every command
below after every edit: replay saved objects first; build after a material change.

```sh
python3 codex/renderer/verify_image_family.py --run codex/renderer/<fresh-run>
python3 codex/renderer/check_image_file.py
```

The second command replays the OLD established packet, not the new candidate.
For selected-source checks inspect/reuse `check_image_dispatch.main(run, fixture)`
and `check_image_path_formatter.main(run, fixture)`. Record precisely which source
was tested. `check_image_memory_size.verify_local_switch` handles full switch
sections. Generic raw-length discovery does not correctly classify mixed tables.
Use both original GLM referee and instruction-aware strict checks, actual symbol
bindings, full table/data bytes and deliberately wrong-binding rejection.

Retain all established image matches: eight-function group 1,141 code bytes;
header 67, dispatcher 261, formatter 26, file loader 240. These are existing
reviewable matches, NOT new progress. Alpha/switch table data is separate.

## Fixed traps — do not spend tokens re-deriving these

- `.text` denominator is 1,089,680 bytes, not GLM's old figure.
- CC10 is **109 bytes**, ending at RET0x1000cc7c followed by three CC bytes.
  Correction independently confirmed in BATCH_43: the prior 125-byte instruction
  in this mission was wrong. CB40 is 82, not72; EA20 is472, not459.
- Struct prefix 36 bytes; allocation name pointer +32, trailing name +36.
- Image_Load entry: name EAX, semantic ECX, track EDX. Builtin entry:
  name EAX, semantic EBX, track EDX. Compiler-generated private interfaces
  must arise from genuine source/caller context, not register shims.
- Solid-color helper's observed bytes are blue, green, red, alpha. Identity
  normal is FF 80 80 80. Confirm each procedural helper independently.
- Clamp uses MIN(width,height), not reference MAX.
- Format 16 source slices are three bytes/pixel; row/card accounting uses four.
- Volume upload does not reset retry=0 despite a misleading decompilation.
- File payload=file+28 must stay distinct from filebase before validation.
- `Image_Release`: null texture does not zero cardMemory; mapType still resets.
- CRT `_vsnprintf` strict-only 86-byte result is DEFER because legacy referee
  disagrees; do not fix that unrelated harness issue in this mission.

## Cost limits and stop condition

No new SDK, orchestrator, agent framework or decompiler installation. Reuse the
existing toolchain, fixtures and saved objects. One worker owns this cluster.
At most three evidence-backed source/context experiments per unresolved mismatch
family before documenting it and moving on. Additional experiments require new
binary/caller evidence, not random source spellings or broad flags sweeps.

Stop after a complete pass through the scope and final regression, or an honest
environment blocker. Write `REPORT.md` and `packet.json` under your owned folder:
per-address MATCH/DEFER, audited extent, symbol, source/object/input hashes,
commands/log paths, exact flags, all bindings, reference divergences, fixtures,
new unique code bytes excluding retained matches, and unresolved dependencies.
Persist target facts and failed experiments there. No marker variants, byte
emission, naked ABI wrappers, retail copying, post-link patching or weakened gates.
Return the packet to Codex for independent review. Do not claim canonical
acceptance, complete GPU behavior or whole-DLL identity.
