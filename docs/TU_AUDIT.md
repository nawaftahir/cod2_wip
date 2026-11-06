# TU Assignment Audit (`0x10001000`–`0x10041db0`)

## Methodology & Data Sources

1. **Address Range**: Game functions in `.text` from `0x10001000` (`Vector2Copy`) to `0x10041db0` (`_start_pass_coef`), sorted by retail address `t`.
2. **Placement Inputs** (read-only):
   - `workspace/work/proof/latest/bind.json` (734 bound functions in `0x10001000`–`0x10041db0`, including relocation-matched functions with unresolved callees).
   - `workspace/work/layout/file_layout.tsv` and `docs/BLOCKERS.md` (adds 253 `hit`, `pinned`, and `blocker-call` functions for 987 placed functions total in `0x10001000`–`0x10041db0`).
   - `workspace/build/codex_boundsoutside_1016_02/gfx.map` and `workspace/work/src/tus.txt` for our TU ownership.
3. **Mac 1.3 Source Oracle** (`SUPPORTED` evidence):
   - Grepped `~/cod2/test/dev/refrences/cod2-mp-macho/PC/gfx_d3d/*.c` and `universal/*.c` for each island function and its retail neighbours.
   - Where Mac has no copy of a function (inlined header helper, stripped `rb_logfile`, or PC-only helper), `Mac File` explicitly states `no copy in Mac` alongside the Mac files of the retail neighbours.
4. **Verdict Rule**:
   - **`MOVE`**: Mac places the function (or the surrounding retail neighbour interval when our TU is a synthetic split absent from Mac or an out-of-cluster helper) in the neighbours' TU.
   - **`CHECK`**: Mac either defines the function in our current TU (disagreeing with retail neighbours, e.g. `Image_BuildWaterMap`, `R_ResetShadowCookies`, `XSurfaceOptimizeRigid`) or has no copy of the function and sits at a COMDAT / inter-TU boundary that requires a bounded LTCG move probe.

---

## 1. Strict Same-Neighbour Islands (`prev_TU == next_TU != our_TU`)

Functions in `0x10001000`–`0x10041db0` whose `our_TU` differs from **both** immediate retail neighbours while those two neighbours belong to the **same** TU (`A:T, B:U, C:T`).
Rows marked `[bind]` appear in `bind.json` alone (7 singletons, 736 B); rows marked `[pinned]` or `[blocker]` appear when `file_layout.tsv` and `BLOCKERS.md` placements are included (11 singletons = 1,379 B; 13 functions = 1,414 B including the 2-function `rb_debug` COMDAT island at `0x10001840`–`0x10001860`).

| # | Function | Retail Addr | Size (B) | Source | Our TU | Neighbours' TU (`prev` / `next`) | Mac File (`fn` \| `prev` / `next`) | Verdict |
|---:|---|---:|---:|---|---|---|---|---|
| 1 | `R_ResetShadowCookies` | `0x100016e9` | 21 | `pinned` | `gfx_d3d/r_shadowcookie.cpp` | `gfx_d3d/r_bsp.cpp` (`R_LoadWorld` @ `0x10001690` / `R_ShutdownWorld` @ `0x10001740`) | `gfx_d3d/r_shadowcookie.c` (called in `r_bsp.c`) \| `gfx_d3d/r_bsp.c` / `gfx_d3d/r_bsp.c` | `CHECK` |
| 2 | `Vector2Set` | `0x10001840` | 14 | `bind` | `gfx_d3d/rb_debug.cpp` | `gfx_d3d/r_bsp_load_obj.cpp` (`I_fround` @ `0x10001810` / `VectorScale` @ `0x10001880`) | `no copy in Mac` \| `no copy in Mac` / `no copy in Mac` (in `r_bsp_load_obj` header COMDATs) | `CHECK` |
| 3 | `VectorSet` | `0x10001860` | 21 | `bind` | `gfx_d3d/rb_debug.cpp` | `gfx_d3d/r_bsp_load_obj.cpp` (`I_fround` @ `0x10001810` / `VectorScale` @ `0x10001880`) | `no copy in Mac` \| `no copy in Mac` / `no copy in Mac` (in `r_bsp_load_obj` header COMDATs) | `CHECK` |
| 4 | `Vector4Set` | `0x100018a0` | 28 | `bind` | `gfx_d3d/r_dpvs.cpp` | `gfx_d3d/r_bsp_load_obj.cpp` (`VectorScale` @ `0x10001880` / `R_GetLumpElemCount` @ `0x10001940`) | `no copy in Mac` \| `no copy in Mac` / `no copy in Mac` (precedes `gfx_d3d/r_bsp_load_obj.c` cluster) | `CHECK` |
| 5 | `Image_BuildWaterMap` | `0x1000d0f0` | 74 | `bind` | `gfx_d3d/r_image_load_obj.cpp` | `gfx_d3d/r_image.cpp` (`Image_PicmipForSemantic` @ `0x1000d090` / `Image_FindExisting` @ `0x1000d140`) | `gfx_d3d/r_image_load_obj.c` (called in `r_image.c`) \| `gfx_d3d/r_image.c` / `no copy in Mac` (`Image_Register` @ `0x1000d200` in `r_image.c`) | `CHECK` |
| 6 | `R_UpdateGfxEntityBoundsCmd` | `0x10020cd0` | 12 | `bind` | `gfx_d3d/r_scene.cpp` | `gfx_d3d/r_rendercmds.cpp` (`R_ProcessFrontendCmdInternal` @ `0x10020be0` / `R_SkinGfxEntityCmd` @ `0x10020ce0`) | `no copy in Mac` \| `gfx_d3d/r_rendercmds.c` / `no copy in Mac` (`R_AbortRenderCommands` @ `0x10020dc0` in `r_rendercmds.c`) | `MOVE` |
| 7 | `R_ConvertPackedColorToFloat` | `0x100236c0` | 77 | `bind` | `gfx_d3d/rb_fog.cpp` | `gfx_d3d/r_scene.cpp` (`I_fmax` @ `0x10023650` / `R_CopyRefEntityToScene` @ `0x10023780`, `R_CompareDumpSceneEntities` @ `0x10023800`) | `no copy in Mac` \| `no copy in Mac` / `gfx_d3d/r_scene.c` (`R_CompareDumpSceneEntities`) | `MOVE` |
| 8 | `XSurfaceOptimizeRigid` | `0x1002da90` | 182 | `blocker` | `gfx_d3d/r_xsurface_optimize.cpp` | `gfx_d3d/r_xsurface_load_obj.cpp` (`XModelReadBlendInfo` @ `0x1002d420` / `XSurfaceFreeVertexBuffer` @ `0x1002db50`) | `gfx_d3d/r_xsurface_optimize.c` \| `no copy in Mac` / `no copy in Mac` | `CHECK` |
| 9 | `XSurfaceFreeVertexBuffer` | `0x1002db50` | 33 | `bind` | `gfx_d3d/r_xsurface_load_obj.cpp` | `gfx_d3d/r_xsurface_optimize.cpp` (`XSurfaceOptimizeRigid` @ `0x1002da90` / `XSurfaceOptimize` @ `0x1002db80`) | `no copy in Mac` \| `gfx_d3d/r_xsurface_optimize.c` / `no copy in Mac` (`XModelOptimize` @ `0x1002dc80` in `r_xsurface_optimize.c`) | `MOVE` |
| 10 | `XSurfaceOptimize` | `0x1002db80` | 180 | `bind` | `gfx_d3d/r_xsurface_optimize.cpp` | `gfx_d3d/r_xsurface_load_obj.cpp` (`XSurfaceFreeVertexBuffer` @ `0x1002db50` / `XSurfaceFreeBuffers` @ `0x1002dc40`) | `no copy in Mac` \| `no copy in Mac` / `no copy in Mac` (inside `r_xsurface_optimize.c` interval `0x1002da90`–`0x1002dcf0`) | `CHECK` |
| 11 | `XSurfaceFreeBuffers` | `0x1002dc40` | 61 | `bind` | `gfx_d3d/r_xsurface_load_obj.cpp` | `gfx_d3d/r_xsurface_optimize.cpp` (`XSurfaceOptimize` @ `0x1002db80` / `XModelOptimize` @ `0x1002dc80`) | `no copy in Mac` \| `no copy in Mac` / `gfx_d3d/r_xsurface_optimize.c` | `MOVE` |
| 12 | `RB_TechniqueName` | `0x10037930` | 304 | `bind` | `gfx_d3d/rb_shade.cpp` | `gfx_d3d/rb_logfile.cpp` (`RB_LogPrint` @ `0x100378f0` / `RB_LogBlend` @ `0x10037a60`) | `no copy in Mac` \| `no copy in Mac` / `no copy in Mac` (inside `rb_logfile` cluster `0x10037810`–`0x10038110`) | `MOVE` |
| 13 | `RB_SunSpriteScreenFraction` | `0x1003b310` | 407 | `blocker` | `gfx_d3d/rb_sunsprite.cpp` | `gfx_d3d/rb_sky.cpp` (`RB_TessSunBillboard` @ `0x1003b0c0` / `RB_TraceSunVisibility` @ `0x1003b4b0`) | `no copy in Mac` (`rb_sunsprite.c` absent in Mac) \| `gfx_d3d/rb_sky.c` / `no copy in Mac` (in `gfx_d3d/rb_sky.c` interval `0x1003a9d0`–`0x1003c050`) | `MOVE` |

> **Note on Rows 8–11 (`0x1002da90`–`0x1002dc80`)**: `XSurfaceOptimizeRigid` (`0x1002da90`) and `XSurfaceOptimize` (`0x1002db80`) only appear as islands because `XSurfaceFreeVertexBuffer` (`0x1002db50`) and `XSurfaceFreeBuffers` (`0x1002dc40`) are currently in `r_xsurface_load_obj.cpp`. Moving `XSurfaceFreeVertexBuffer` and `XSurfaceFreeBuffers` into `r_xsurface_optimize.cpp` merges the entire `0x1002da90`–`0x1002dcf0` range into a single contiguous `r_xsurface_optimize` run matching Mac's `gfx_d3d/r_xsurface_optimize.c`.

---

## 2. Split-TU & Boundary Islands (`prev_TU != our_TU`, `next_TU != our_TU`, `prev_TU != next_TU`)

Functions or small displaced runs in `0x10001000`–`0x10041db0` where `our_TU` differs from **both** adjacent retail TUs (where the two neighbours have different TUs), sits outside `our_TU`'s main retail address cluster, or belongs to a synthetic TU (`rb_surface`) that Mac merges into an adjacent TU (`rb_shade`).

| # | Function | Retail Addr | Size (B) | Source | Our TU | Neighbours' TU (`prev` / `next`) | Mac File (`fn` \| `prev` / `next`) | Verdict |
|---:|---|---:|---:|---|---|---|---|---|
| 14 | `Vector2Copy` | `0x10001000` | 11 | `bind` | `gfx_d3d/r_dpvs.cpp` | `-` (start of `.text`) / `gfx_d3d/r_bsp.cpp` (`VectorCopy` @ `0x10001010`) | `no copy in Mac` \| `-` / `decl/ref only: gfx_d3d/r_bsp.c` | `CHECK` |
| 15 | `I_sel` | `0x100017d0` | 13 | `bind` | `gfx_d3d/r_image.cpp` | `gfx_d3d/r_bsp.cpp` (`R_ReloadWorld` @ `0x100017b0`) / `gfx_d3d/r_image_load_common.cpp` (`I_min` @ `0x100017e0`) | `no copy in Mac` \| `gfx_d3d/r_bsp.c` / `no copy in Mac` | `CHECK` |
| 16 | `I_min` | `0x100017e0` | 9 | `bind` | `gfx_d3d/r_image_load_common.cpp` | `gfx_d3d/r_image.cpp` (`I_sel` @ `0x100017d0`) / `gfx_d3d/r_bsp_load_obj.cpp` (`I_fround` @ `0x10001810`) | `no copy in Mac` \| `no copy in Mac` / `no copy in Mac` | `CHECK` |
| 17 | `I_fround` | `0x10001810` | 33 | `bind` | `gfx_d3d/r_bsp_load_obj.cpp` | `gfx_d3d/r_image_load_common.cpp` (`I_min` @ `0x100017e0`) / `gfx_d3d/rb_debug.cpp` (`Vector2Set` @ `0x10001840`) | `no copy in Mac` \| `no copy in Mac` / `no copy in Mac` | `CHECK` |
| 18 | `VectorScale` | `0x10001880` | 29 | `bind` | `gfx_d3d/r_bsp_load_obj.cpp` | `gfx_d3d/rb_debug.cpp` (`VectorSet` @ `0x10001860`) / `gfx_d3d/r_dpvs.cpp` (`Vector4Set` @ `0x100018a0`) | `no copy in Mac` \| `no copy in Mac` / `no copy in Mac` | `CHECK` |
| 19 | `R_ApplyPicmip_f` | `0x10005290` | 5 | `pinned` | `gfx_d3d/r_material.cpp` | `gfx_d3d/r_caps.cpp` (`R_CheckDxCaps` @ `0x100051e0`) / `gfx_d3d/r_screenshot.cpp` (`R_ScreenShot_f` @ `0x100052a0`, before `R_RegisterCmds` @ `0x100052c0` in `r_cmds`) | `no copy in Mac` (registered in `gfx_d3d/r_cmds.c`) \| `gfx_d3d/r_caps.c` / `no copy in Mac` (`R_RegisterCmds` @ `0x100052c0` in `gfx_d3d/r_cmds.c`) | `MOVE` |
| 20 | `R_ScreenShot_f` | `0x100052a0` | 9 | `pinned` | `gfx_d3d/r_screenshot.cpp` | `gfx_d3d/r_material.cpp` (`R_ApplyPicmip_f` @ `0x10005290`) / `gfx_d3d/r_screenshot.cpp` (`R_ScreenShotJpeg_f` @ `0x100052b0`, before `r_cmds` @ `0x100052c0`) | `no copy in Mac` (registered in `gfx_d3d/r_cmds.c`) \| `no copy in Mac` / `gfx_d3d/r_cmds.c` (`R_RegisterCmds` @ `0x100052c0`) | `MOVE` |
| 21 | `R_ScreenShotJpeg_f` | `0x100052b0` | 9 | `pinned` | `gfx_d3d/r_screenshot.cpp` | `gfx_d3d/r_screenshot.cpp` (`R_ScreenShot_f` @ `0x100052a0`) / `gfx_d3d/r_cmds.cpp` (`R_RegisterCmds` @ `0x100052c0`) | `no copy in Mac` (registered in `gfx_d3d/r_cmds.c`) \| `no copy in Mac` / `gfx_d3d/r_cmds.c` (`R_RegisterCmds` @ `0x100052c0`) | `MOVE` |
| 22 | `VectorLength` | `0x10005bb0` | 33 | `bind` | `gfx_d3d/r_shadowcookie.cpp` | `gfx_d3d/r_dpvs.cpp` (`VectorMA` @ `0x10005b60`) / `universal/com_math.cpp` (`VectorScale4` @ `0x10005be0`) | `no copy in Mac` \| `no copy in Mac` / `no copy in Mac` | `CHECK` |
| 23 | `VectorScale4` | `0x10005be0` | 39 | `bind` | `universal/com_math.cpp` | `gfx_d3d/r_shadowcookie.cpp` (`VectorLength` @ `0x10005bb0`) / `gfx_d3d/r_dpvs.cpp` (`DotProduct4` @ `0x10005c10`) | `no copy in Mac` \| `no copy in Mac` / `no copy in Mac` | `CHECK` |
| 24 | `Vec2Multiply` | `0x1000f120` | 20 | `bind` | `gfx_d3d/r_image_load_obj.cpp` | `gfx_d3d/r_image_load_common.cpp` (`Image_GetCardMemoryAmount` @ `0x1000f020`) / `gfx_d3d/r_marks.cpp` (`VectorAdd` @ `0x1000f140`) | `no copy in Mac` \| `gfx_d3d/r_image_load_common.c` / `no copy in Mac` | `CHECK` |
| 25 | `VectorAdd` | `0x1000f140` | 25 | `bind` | `gfx_d3d/r_marks.cpp` | `gfx_d3d/r_image_load_obj.cpp` (`Vec2Multiply` @ `0x1000f120`) / `gfx_d3d/r_staticmodelcache.cpp` (`R_QuantizeCachedColor` @ `0x1000f180`) | `no copy in Mac` \| `no copy in Mac` / `no copy in Mac` | `CHECK` |
| 26 | `R_QuantizeCachedColor` | `0x1000f180` | 285 | `bind` | `gfx_d3d/r_staticmodelcache.cpp` | `gfx_d3d/r_marks.cpp` (`VectorAdd` @ `0x1000f140`, after `r_image_load_common` @ `0x1000f020`) / `gfx_d3d/r_image_load_obj.cpp` (`Image_ValidateHeader` @ `0x1000f2a0`) | `no copy in Mac` \| `no copy in Mac` / `no copy in Mac` (`Image_LoadWavelet` @ `0x1000f380` in `gfx_d3d/r_image_load_obj.c`) | `CHECK` |
| 27 | `ConvertQuatToMat` | `0x1001d660` | 181 | `bind` | `universal/com_math.cpp` | `gfx_d3d/r_material_load_obj.cpp` (`std::_Rotate` @ `0x1001d550`) / `gfx_d3d/r_model.cpp` (`R_ConvertAnimMatToSkelMat` @ `0x1001d720`) | `decl/ref only: universal/com_math.c` \| `no copy in Mac (C++ template)` / `no copy in Mac` (`R_ModelBounds` @ `0x1001da90` in `gfx_d3d/r_model.c`) | `CHECK` |
| 28 | `Dot2Product` | `0x1002ca40` | 13 | `bind` | `universal/com_convexhull.cpp` | `gfx_d3d/r_water.cpp` (`RB_UploadWaterTexture` @ `0x1002c910`) / `gfx_d3d/r_water_load_obj.cpp` (`R_WatersEquivalent` @ `0x1002ca50`) | `no copy in Mac` \| `gfx_d3d/r_water.c` / `gfx_d3d/r_water_load_obj.c` | `CHECK` |
| 29 | `R_WatersEquivalent` | `0x1002ca50` | 240 | `blocker` | `gfx_d3d/r_water_load_obj.cpp` | `universal/com_convexhull.cpp` (`Dot2Product` @ `0x1002ca40`, after `RB_UploadWaterTexture` @ `0x1002c910` in `r_water`) / `gfx_d3d/r_water_load_obj.cpp` (`R_PickWaterFrequencies` @ `0x1002cb40`) | `gfx_d3d/r_water_load_obj.c` \| `no copy in Mac` (`RB_UploadWaterTexture` in `gfx_d3d/r_water.c`) / `no copy in Mac` (`R_CreateWaterSetup` in `gfx_d3d/r_water_load_obj.c`) | `CHECK` |
| 30 | `RB_ChangePixelShader` | `0x10038430` | 104 | `bind` | `gfx_d3d/rb_state.cpp` | `gfx_d3d/rb_logfile.cpp` (`RB_LogPrintState_1` @ `0x10038110`) / `gfx_d3d/rb_state.cpp` (`RB_ChangeVertexShader` @ `0x100384a0`, before `rb_shade` @ `0x100386b0`) | `no copy in Mac` \| `no copy in Mac` / `gfx_d3d/rb_shade.c` (`RB_SetIndexData` @ `0x100386b0`) | `CHECK` |
| 31 | `RB_ChangeVertexShader` | `0x100384a0` | 104 | `bind` | `gfx_d3d/rb_state.cpp` | `gfx_d3d/rb_state.cpp` (`RB_ChangePixelShader` @ `0x10038430`) / `gfx_d3d/rb_state.cpp` (`RB_ChangeVertexDeclaration` @ `0x10038510`, before `rb_shade` @ `0x100386b0`) | `no copy in Mac` \| `no copy in Mac` / `gfx_d3d/rb_shade.c` (`RB_SetIndexData` @ `0x100386b0`) | `CHECK` |
| 32 | `RB_ChangeVertexDeclaration` | `0x10038510` | 114 | `bind` | `gfx_d3d/rb_state.cpp` | `gfx_d3d/rb_state.cpp` (`RB_ChangeVertexShader` @ `0x100384a0`) / `gfx_d3d/rb_state.cpp` (`RB_SetFVF` @ `0x10038590`, before `rb_shade` @ `0x100386b0`) | `no copy in Mac` \| `no copy in Mac` / `gfx_d3d/rb_shade.c` (`RB_SetIndexData` @ `0x100386b0`) | `CHECK` |
| 33 | `RB_SetFVF` | `0x10038590` | 115 | `bind` | `gfx_d3d/rb_state.cpp` | `gfx_d3d/rb_state.cpp` (`RB_ChangeVertexDeclaration` @ `0x10038510`) / `gfx_d3d/rb_state.cpp` (`RB_DrawIndexedPrimitive` @ `0x10038610`, before `rb_shade` @ `0x100386b0`) | `no copy in Mac` \| `no copy in Mac` / `gfx_d3d/rb_shade.c` (`RB_SetIndexData` @ `0x100386b0`) | `CHECK` |
| 34 | `RB_DrawIndexedPrimitive` | `0x10038610` | 150 | `bind` | `gfx_d3d/rb_state.cpp` | `gfx_d3d/rb_state.cpp` (`RB_SetFVF` @ `0x10038590`) / `gfx_d3d/rb_shade.cpp` (`RB_SetIndexData` @ `0x100386b0`) | `no copy in Mac` \| `no copy in Mac` / `gfx_d3d/rb_shade.c` (`RB_SetIndexData` @ `0x100386b0`) | `CHECK` |
| 35 | `RB_DrawOptimizedTessSurface` | `0x1003a690` | 224 | `pinned` | `gfx_d3d/rb_surface.cpp` | `gfx_d3d/rb_shade.cpp` (`RB_BeginSurface` @ `0x1003a5f0`) / `gfx_d3d/rb_surface.cpp` (`RB_DrawTessSurface` @ `0x1003a7b0`) | `no copy in Mac` (`rb_surface.c` absent in Mac) \| `gfx_d3d/rb_shade.c` (`RB_BeginSurface`) / `gfx_d3d/rb_sky.c` (`RB_CalcSunSpriteSamples` @ `0x1003a9d0`) | `MOVE` |
| 36 | `RB_DrawTessSurface` | `0x1003a7b0` | 199 | `hit` | `gfx_d3d/rb_surface.cpp` | `gfx_d3d/rb_surface.cpp` (`RB_DrawOptimizedTessSurface` @ `0x1003a690`, after `RB_BeginSurface` in `rb_shade`) / `gfx_d3d/rb_surface.cpp` (`RB_EndSurface` @ `0x1003a8d0`) | `no copy in Mac` (`rb_surface.c` absent in Mac) \| `gfx_d3d/rb_shade.c` (`RB_BeginSurface`) / `gfx_d3d/rb_sky.c` (`RB_CalcSunSpriteSamples` @ `0x1003a9d0`) | `MOVE` |
| 37 | `RB_EndSurface` | `0x1003a8d0` | 206 | `pinned` | `gfx_d3d/rb_surface.cpp` | `gfx_d3d/rb_surface.cpp` (`RB_DrawTessSurface` @ `0x1003a7b0`, after `RB_BeginSurface` in `rb_shade`) / `gfx_d3d/rb_sky.cpp` (`RB_CalcSunSpriteSamples` @ `0x1003a9d0`) | `decl/ref only: gfx_d3d/rb_shade.c` (`rb_surface.c` absent in Mac; defined in `rb_shade.c` in opencod2) \| `gfx_d3d/rb_shade.c` / `gfx_d3d/rb_sky.c` | `MOVE` |
| 38 | `Vec2Length` | `0x1003edf0` | 22 | `bind` | `universal/com_math.cpp` | `gfx_d3d/rb_state.cpp` (`RB_ChangeStreamSource` @ `0x1003ed20`) / `gfx_d3d/rb_tess.cpp` (`RB_TessBad` @ `0x1003ef20`) | `no copy in Mac` \| `gfx_d3d/rb_state.c` / `gfx_d3d/rb_tess.c` | `CHECK` |

> **Note on True Single-Function TUs (Not Misplaced Islands)**: Three 1-function TUs in `0x10001000`–`0x10041db0` (`R_RegisterDvars` @ `0x1000aaf0` in `r_dvars.cpp`, 4,046 B; `R_ClearFlares` @ `0x1000bad0` in `r_flares.cpp`, 1 B; `Image_BuildSpecularityMap` @ `0x10029320` in `r_specularityimage.cpp`, 262 B) have `prev_TU != our_TU != next_TU` solely because their entire TU contains only 1 linked function in retail and matches Mac's `r_dvars.c`, `r_flares.c`, and `r_specularityimage.c` in exact alphabetical TU order.

---

## Summary

### Counts & Byte Totals

| Category | Total Islands | Total Bytes | `MOVE` Count | `MOVE` Bytes | `CHECK` Count | `CHECK` Bytes |
|---|---:|---:|---:|---:|---:|---:|
| **1A. Strict Same-Neighbour (`bind.json` only)** | 7 | 736 B | 5 | 487 B | 2 | 249 B |
| **1B. Strict Same-Neighbour (all placed, 1-fn)** | 11 | 1,379 B | 6 | 894 B | 5 | 485 B |
| **1C. Strict Same-Neighbour (incl. 2-fn `rb_debug`)** | 13 | 1,414 B | 6 | 894 B | 7 | 520 B |
| **2. Split-TU & Boundary Islands** | 25 | 2,520 B | 6 | 652 B | 19 | 1,868 B |
| **Combined Total (Tables 1 + 2)** | **38** | **3,934 B** | **12** | **1,546 B** | **26** | **2,388 B** |

### Top 10 Biggest `MOVE` Rows

| Rank | Function | Retail Addr | Size (B) | Current TU | Target (Neighbours') TU | Evidence |
|---:|---|---:|---:|---|---|---|
| 1 | `RB_SunSpriteScreenFraction` | `0x1003b310` | 407 B | `gfx_d3d/rb_sunsprite.cpp` | `gfx_d3d/rb_sky.cpp` | Splits `rb_sky` (`0x1003a9d0`–`0x1003c050`) in two; Mac has no `rb_sunsprite.c` and places surrounding sun functions in `gfx_d3d/rb_sky.c`. |
| 2 | `RB_TechniqueName` | `0x10037930` | 304 B | `gfx_d3d/rb_shade.cpp` | `gfx_d3d/rb_logfile.cpp` | Sits inside `rb_logfile` (`0x10037810`–`0x10038110`) between `RB_LogPrint` and `RB_LogBlend`, 3.4 KB before `rb_shade` (`0x100386b0`). |
| 3 | `RB_DrawOptimizedTessSurface` | `0x1003a690` | 224 B | `gfx_d3d/rb_surface.cpp` | `gfx_d3d/rb_shade.cpp` | Immediately follows `RB_BeginSurface` (`0x1003a5f0`, `rb_shade`); Mac has no `rb_surface.c`. |
| 4 | `RB_EndSurface` | `0x1003a8d0` | 206 B | `gfx_d3d/rb_surface.cpp` | `gfx_d3d/rb_shade.cpp` | Declared/referenced at top of Mac `gfx_d3d/rb_shade.c` (and defined at the end of `rb_shade.c` in `opencod2`); `rb_surface.c` does not exist in Mac. |
| 5 | `RB_DrawTessSurface` | `0x1003a7b0` | 199 B | `gfx_d3d/rb_surface.cpp` | `gfx_d3d/rb_shade.cpp` | Sits between `RB_DrawOptimizedTessSurface` and `RB_EndSurface` at the tail of `rb_shade`. |
| 6 | `R_ConvertPackedColorToFloat` | `0x100236c0` | 77 B | `gfx_d3d/rb_fog.cpp` | `gfx_d3d/r_scene.cpp` | Sits inside `r_scene` (`0x10023630`–`0x100257a0`) 70 KB before `rb_fog` (`0x100348f0`). |
| 7 | `XSurfaceFreeBuffers` | `0x1002dc40` | 61 B | `gfx_d3d/r_xsurface_load_obj.cpp` | `gfx_d3d/r_xsurface_optimize.cpp` | Sits between `XSurfaceOptimize` (`0x1002db80`) and `XModelOptimize` (`0x1002dc80`, Mac `gfx_d3d/r_xsurface_optimize.c`). |
| 8 | `XSurfaceFreeVertexBuffer` | `0x1002db50` | 33 B | `gfx_d3d/r_xsurface_load_obj.cpp` | `gfx_d3d/r_xsurface_optimize.cpp` | Sits between `XSurfaceOptimizeRigid` (`0x1002da90`, Mac `gfx_d3d/r_xsurface_optimize.c`) and `XSurfaceOptimize` (`0x1002db80`). |
| 9 | `R_UpdateGfxEntityBoundsCmd` | `0x10020cd0` | 12 B | `gfx_d3d/r_scene.cpp` | `gfx_d3d/r_rendercmds.cpp` | Sits inside `r_rendercmds` between `R_ProcessFrontendCmdInternal` (`0x10020be0`, Mac `gfx_d3d/r_rendercmds.c`) and `R_SkinGfxEntityCmd` (`0x10020ce0`). |
| 10 | `R_ScreenShot_f` / `R_ScreenShotJpeg_f` / `R_ApplyPicmip_f` | `0x10005290`–`0x100052b0` | 23 B (9+9+5) | `r_screenshot.cpp` / `r_material.cpp` | `gfx_d3d/r_cmds.cpp` | Placed immediately before `R_RegisterCmds` (`0x100052c0`, Mac `gfx_d3d/r_cmds.c`), far ahead of `r_material` (`0x10016390`) and `r_screenshot` (`0x10025920`). |

### Top High-Priority `CHECK` Rows (PC 1.0 Retail Layout vs. Mac 1.3 STABS Disagreements)

1. **`Image_BuildWaterMap` (`0x1000d0f0`, 74 B)**: Mac 1.3 defines it in `gfx_d3d/r_image_load_obj.c`, but in PC 1.0 retail it is placed right inside `r_image` (`0x1000c790`–`0x1000e7a0`) between `Image_PicmipForSemantic` (`0x1000d090`) and `Image_FindExisting` (`0x1000d140`), and is called by `R_ReloadLostImages` (`0x1000d2e0`) in `r_image.cpp`.
2. **`R_QuantizeCachedColor` (`0x1000f180`, 285 B)**: Currently in `gfx_d3d/r_staticmodelcache.cpp` (whose main cluster is at `0x1002aac0`–`0x1002bbf0`), but placed in retail at `0x1000f180` right between `r_image_load_common` (`0x1000f020`) and `r_image_load_obj` (`0x1000f2a0`).
3. **`RB_ChangePixelShader`..`RB_DrawIndexedPrimitive` (`0x10038430`–`0x10038610`, 587 B)**: Currently in `gfx_d3d/rb_state.cpp` (whose main cluster is at `0x1003c100`–`0x1003ed20`), but placed in retail immediately before `RB_SetIndexData` (`0x100386b0`, `gfx_d3d/rb_shade.c`).
4. **`R_WatersEquivalent` (`0x1002ca50`, 240 B) & `Dot2Product` (`0x1002ca40`, 13 B)**: `R_WatersEquivalent` is defined in Mac `gfx_d3d/r_water_load_obj.c` and sits at the boundary between `r_water` (`R_WaterHeightMap` @ `0x1002c7b0`, `RB_UploadWaterTexture` @ `0x1002c910`) and `r_water_load_obj` (`R_PickWaterFrequencies` @ `0x1002cb40`), separated from `RB_UploadWaterTexture` by `Dot2Product` (`0x1002ca40`, currently pulled from `com_convexhull.obj`).
5. **`R_ResetShadowCookies` (`0x100016e9`, 21 B)**: Defined in Mac `gfx_d3d/r_shadowcookie.c`, but placed in PC 1.0 retail inside `r_bsp` (`0x10001010`–`0x100017b0`) immediately after its caller `R_LoadWorld` (`0x10001690`).
