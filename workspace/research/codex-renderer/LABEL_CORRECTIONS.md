# Renderer naming corrections — 2026-09-26

GLM's exported addresses are useful, but its naming pass applied a v60 adapter
map to this API-59 target. Do not trust its names as recovered prototypes.
Addresses/behavior below are PINNED in the DLL; replacement names are SUPPORTED
by the Mac client naming/behavior reference, not claimed historical provenance.

| Address | GLM label | Supported replacement | Target evidence |
|---|---|---|---|
| 0x10001430 | R_ClearFogs | R_SetSunLightOverride | accepts vec3 pointer; conditional 12-byte copy into world +0xc8 |
| 0x10001460 | R_SetSunLightOverride | R_ResetSunLightOverride | no args; copies 12 bytes from world +0xe0 to +0xc8 |
| 0x1000c000 | R_TextWidth | R_TextHeight | one pointer argument; returns dword at +4; no string traversal |
| 0x1000aac0 | R_ResetSunLightParseParams | R_SetCullDist | float stack argument; clamp nonpositive to positive zero; global store |

Cross-check references in `refrences/cod2-mp-macho/PC/gfx_d3d/`:
`r_bsp.c:56`, `r_bsp.c:107`, `r_font.c:178`, `r_dpvs.c:220`.
The Mac port is 1.3 and never overrides 1.0 target code/ABI/offsets.

Another shared-name correction: GLM's `g_dvar_refraction` at 0x101ce708 is
SUPPORTED as **r_rendererInUse**, not a dedicated refraction toggle:
`r_material.c:256` and `r_bsp.c:107` both use that renderer selector to skip work
when its current integer equals 2. The clean tree uses `renderer_in_use_dvar`.
Its pointer and +8 integer access are PINNED on the 1.0 target.

## Floating-point behavior that must survive reconstruction

The 1.0 SetCullDist body tests `distance <= 0.0f`, storing zero on that branch
and preserving the argument otherwise. Its x87 status test routes unordered NaN
to the preserve branch. Negative zero becomes positive zero. The Mac reference's
`distance > 0 ? distance : 0` is not equivalent for NaN; do not copy it literally.
`test_renderer_queries.c` tests these edge cases. The target constant at
0x1019bc84 is four zero bytes and is bound as the compiler's float-zero constant.

## Preservation

Checkpoint44: legacy `R_BeginFrame` at **0x10021f90** is SUPPORTED as
**R_EndFrame**. Target synchronizes/unlocks, transfers debug globals, submits
render commands, decommits temporary skin memory and clears its byte count.
Complete86-byte source proof and bindings are in BATCH_44_REVIEW.md.

Checkpoint 42: GLM's `R_EndFrame` at **0x10021ff0** is SUPPORTED as
**R_BeginDebugFrame**: saves current command/backend state, conditionally unlocks
skin cache and switches to debug buffers. Complete73-byte source match and
PINNED pointer/flag ordering are documented in BATCH_42_REVIEW.md. Together
with checkpoint41's corrected EndDebugFrame, this forms the actual debug pair.

Checkpoint 41: GLM's `R_BeginDebugFrame` at **0x10022040** is SUPPORTED as
**R_EndDebugFrame**. Target code emits an end command, clears backend counters,
executes/ends rendering, then restores saved command/backend pointers and an
optional cache lock. opencod2 `r_rendercmds.c:958` and KisakCOD
`r_rendercmds.cpp:1802` agree. Its 0x10020ec0 helper is SUPPORTED as
`R_AddCmdEndOfList`: header shorts 0/4 and four-byte accounting are PINNED.
See BATCH_41_REVIEW.md for full extents, interfaces and both-referee proof.

Original GLM sources and database labels remain untouched for provenance.
The recovery snapshot preserves their old names and is explicitly unreviewed.
`refapi_pinned.json` now separates `legacy_name_unverified` from the ten checked
`name_supported` entries; slot destinations remain independently instruction-pinned.
Do not auto-generate public headers or callee prototypes from legacy labels.
