# gfx_d3d_mp_x86_s.dll 1.0 — Match Ledger

Compiler: **MSVC 7.1 (13.10.3077)**, flags **`cl /c /O2`** (validated by matches below).
Matcher: `tools/match_gfx.py diff <addr> <obj>` — relocation-normalized byte diff.

| Status | Function | Address | Bytes | Source TU | Notes |
|--------|----------|---------|-------|-----------|-------|
| ✅ MATCH | R_GetMinSpecImageMemory | 0x1000c8d0 | 6 | `src/scratch/r_minspec.c` | int getter |
| ✅ MATCH | R_GetIgnorePrecacheErrors | 0x1001d900 | 14 | `src/scratch/r_ignoreprecache.c` | bool-from-byte getter; `!= 0` int return |
| ✅ MATCH | R_GetFarPlaneDist | 0x1000aa60 | 82 | `src/scratch/r_farplane.c` | dvar getter + fallback + max clamp; float compare is **`0.0f`, not `0.0`** (m64 vs m32 const) |

## Progress

- Matched: 3 functions (102 / 1,091,728 `.text` bytes)
- Identified: 2,702 functions (437 named; 91 names from refexport table)
- `.text` denominator: 0x10A090 bytes

## Reconstruction rules learned

1. Float equality compares use float constants (`0.0f`) — C double promotion changes codegen (m64 vs pooled m32 const).
2. Byte-global bool → `int` return compiles as `xor eax,eax; test; setne` — declare return `int`, source global `unsigned char`.
3. MSVC 7.1 float `<` codegen: `fld x; fld y; fcomp...` with `test ah,5` unordered handling — plain C `<` reproduces it.
4. Absolute global addresses carry `.reloc` HIGHLOW entries → always masked; rel32 branch masking only for targets inside `.text` (false positives from opcode bytes, e.g. `e9` inside `da e9` fucompp).

## wave 2 (10 attempted, 5 matched)

| Status | Function | Address | Bytes | Source TU | Notes |
|--------|----------|---------|-------|-----------|-------|
| ✅ MATCH | R_IssueDelayedDrawing | 0x1000bad0 | 1 | wave empty non-void fn → bare `ret` | |
| ✅ MATCH | R_RegisterFont | 0x1000ce60 | 1 | same | unused args, empty body |
| ✅ MATCH | R_ResetImageAllocations | 0x1000ce70 | 1 | same | |
| ✅ MATCH | FUN_10046820 | 0x10046820 | 40 | vtable pair calls; arg kept in esi | |
| ✅ MATCH | R_GetWorldBounds | 0x10001230 | 69 | src-pointer-per-vec3 (b1 shape), g_world reloaded per vec3 | |
| 🔄 wip | FUN_10001810 / FUN_10020530 | — | 33 | ROUND epsilons 2^-30, 0.5-2^-30 as *added* doubles; needs fp-const spill + inline fistp (**/QIfist suspected**) | |
| 🔄 wip | FUN_100227c0 | 0x100227c0 | 33 | override-only getter (metrics path is the NEXT function 0x100227e1 — Ghidra over-merged); load-scheduling mismatch | |
| ❌ park | FUN_10016db0 | 0x10016db0 | 49 | mixed thiscall/cdecl shared-push dispatch — TU-level custom convention | |
| ❌ park | FUN_10012ee0 | 0x10012ee0 | 43 | sin-table loop rotation differs; constants ARE two separate fmuls (non-reassociated) | |

## wave 3 (partial)

| Status | Function | Address | Bytes | Notes |
|--------|----------|---------|-------|-------|
| ✅ MATCH | FUN_10017250 | 0x10017250 | 51 | 2-arg extern call + ushort table lookup |
| 🔄 wip | R_AbortRenderCommands | 0x10032f40 | 59 | D3DERR_INVALIDCALL=0x88760868; needs setne-bool materialization shape |
| 🔄 wip | FUN_10029430 | 0x10029430 | 53 | 5x28B struct init {char;int[6]}, PE uses esi/edi cascade + lea esp marker |

## wave 4 (all wip — parked for next session; same codegen family blockers)

| Function | Address | Bytes | Blocker |
|----------|---------|-------|---------|
| FUN_10032cd0 / R_AbortRenderCommands | 0x10032cd0/0x10032f40 | 51/59 | `(hr != D3DERR_INVALIDCALL && hr == S_OK)` needs setne bool materialization — likely an inlined helper returning the && result |
| FUN_100227e1 | 0x100227e1 | 65 | GetSystemMetrics call-scheduling order |
| R_DoneRenderingViews / FUN_10020ec0 | 0x100222a0/0x10020ec0 | 71 | cmd-buffer emit pair; pointer scheduling |
| FUN_1000a7f0 | 0x1000a7f0 | 69 | loop zeroing; induction shape |
| FUN_10012f40 | 0x10012f40 | 51 | RI call wrapper; arg order |

## wave 4 resolved (2026-08-22, session 2)

| Status | Function | Address | Bytes | Resolution |
|--------|----------|---------|-------|------------|
| ✅ MATCH | FUN_10017250 | 0x10017250 | 51 | 2-arg extern + ushort table lookup |
| ✅ MATCH | FUN_10012f40 | 0x10012f40 | 51 | direct call through RI slot 125 (`ff 15 [0x101d4bbc]`) via extern fn-ptr global; args interleaved-push scheduling |
| ✅ MATCH | R_DoneRenderingViews | 0x100222a0 | 71 | cmd-buffer emit; all addressing anchored on single `char *b` load |
| ✅ MATCH | FUN_10020ec0 | 0x10020ec0 | 71 | twin of above, imm 0 vs 10 |
| 🔄 parked | FUN_100227e1 | 0x100227e1 | 65 | dllimport+esi-caching solved; remaining: single-tail select scheduling (`js+2` vs dual-tail) — 71% |
| 🔄 parked | FUN_1000a7f0 | 0x1000a7f0 | 56% | PE reloads arr/count every iter (alias paranoia); b0/b1 shapes 56% |
| 🔄 parked | R_AbortRenderCommands/10032cd0 | — | 68% | setne family SOLVED structurally ((uchar)(hr!=1)&1 materialization); remaining dl↔al regalloc |

New idioms: `__declspec(dllimport)` needed for import caching (esi) on repeated Win32 calls; RI-table direct calls = extern fn-ptr globals.

## wave 5 (cluster round)

| Status | Function | Address | Bytes | Notes |
|--------|----------|---------|-------|-------|
| ✅ MATCH | R_EndDebugFrame | 0x10013200 | 79 | delayed-drawing dispatch w/ 2 extern calls |
| 🔄 50% | FUN_10012820 | 0x10012820 | 91 | RI_Printf via fn-ptr solved; tail blocked: callee FUN_100123d0 takes eax-arg (custom convention) |
| 🔄 15% | R_EndRegistration | 0x100131b0 | 79 | cmd-buffer family; PE splits const as (0x30000-pos)+(used-0x2000) via esi+lea — folding resists all groupings |
| ❌ park | FUN_10009250 | 0x10009250 | 88 | pushes unset ebx as arg — register-convention chain |

Growing blocker class: esi/eax custom conventions need full-TU context (see memory #11). Cluster/TU-shaped sourcing is the path.

## wave 6 (cmd-buffer family deep-dive)

| Status | Function | Address | Bytes | Notes |
|--------|----------|---------|-------|-------|
| ✅ MATCH | R_MarkFragments | 0x1001d910 | 77 | 2x vec3 copy w/ null-zero branch |
| 🔄 91% | R_ClearScreen | 0x10021bf0 | 98 | whole prologue+emit identical; tail arg-load regs eax/edx swapped |
| 🔄 29% | FUN_10021ae0 | 0x10021ae0 | 102 | **rep movsd** = 0x40 struct copy; need(0x48) local in esi; reg-cascade parked |
| 🔄 15% | R_RenderScene | 0x10020f10 | 92 | PE: buf→ecx variant + common-tail [p+4]=0 incl NULL path |
| ❌ parked | used-check family | 100131b0/220c0/221d0/22110/21890/22170 | — | needs `(used - 0x2000)` un-folded lea; all constant groupings + /G5//G6//G7//O1//Og//Ox//Gs tried — MSVC always folds; original form unknown |
| ❌ parked | FUN_10012e70 | 0x10012e70 | 109 | zero-loops → MSVC converts to memset/rep stos; /Oi- no help |

Family insight: emitters are `{short op; short size; payload}` structs; large payloads copy via rep movsd (struct assignment).

## wave 7 (Z_Malloc copy twins)

| Status | Function | Address | Bytes | Notes |
|--------|----------|---------|-------|-------|
| ✅ MATCH | R_LocateDebugStrings | 0x100059e0 | 93 | memcpy-inline (rep movsd+movsb) + RI_Z_Malloc via fn-ptr; NULL-data path still stores count |
| ✅ MATCH | R_LightingFromCubemapShots | 0x10005980 | 93 | twin; `count << 7` (shl) not imul — Ghidra's `& 0x1ffffff` was a shl artifact |

Running total: **42 matched** (1,393 bytes).

## wave8 (mass_match session)

| Status | Function | Address | Bytes | Source TU | Notes |
|--------|----------|---------|-------|-----------|-------|
| ✅ MATCH | `R_ClearFogs` | 0x10001430 | 42 | `src/f/10001430_R_ClearFogs.c` | wave8 mass |
| ✅ MATCH | `R_SetSunLightOverride` | 0x10001460 | 39 | `src/f/10001460_R_SetSunLightOverride.c` | wave8 mass |
| ✅ MATCH | `R_ResetSunLightParseParams` | 0x1000aac0 | 38 | `src/f/1000aac0_R_ResetSunLightParseParams.c` | wave8 mass |
| ✅ MATCH | `R_ArchiveFogState` | 0x1000bb10 | 22 | `src/f/1000bb10_R_ArchiveFogState.c` | wave8 mass |
| ✅ MATCH | `R_SwitchFog` | 0x1000bc40 | 35 | `src/f/1000bc40_R_SwitchFog.c` | wave8 mass |
| ✅ MATCH | `R_UpdateColor` | 0x1000bf40 | 18 | `src/f/1000bf40_R_UpdateColor.c` | wave8 mass |
| ✅ MATCH | `R_TextWidth` | 0x1000c000 | 8 | `src/f/1000c000_R_TextWidth.c` | wave8 mass |
| ✅ MATCH | `FUN_100107b0` | 0x100107b0 | 46 | `src/f/100107b0_FUN_100107b0.c` | wave8 mass |
| ✅ MATCH | `R_BeginRegistration` | 0x10013190 | 26 | `src/f/10013190_R_BeginRegistration.c` | wave8 mass |
| ✅ MATCH | `R_ModelBounds` | 0x10013260 | 10 | `src/f/10013260_R_ModelBounds.c` | wave8 mass |
| ✅ MATCH | `R_RegisterMaterial` | 0x10017290 | 29 | `src/f/10017290_R_RegisterMaterial.c` | wave8 mass |
| ✅ MATCH | `R_RegisterRawImage` | 0x100172b0 | 30 | `src/f/100172b0_R_RegisterRawImage.c` | wave8 mass |
| ✅ MATCH | `R_GetMaterialName` | 0x10017300 | 7 | `src/f/10017300_R_GetMaterialName.c` | wave8 mass |
| ✅ MATCH | `R_GetMaterialSubimageCount` | 0x10017310 | 16 | `src/f/10017310_R_GetMaterialSubimageCount.c` | wave8 mass |
| ✅ MATCH | `R_IsMaterialRefractive` | 0x10017320 | 37 | `src/f/10017320_R_IsMaterialRefractive.c` | wave8 mass |
| ✅ MATCH | `R_RegisterInlineModel` | 0x1001d8a0 | 22 | `src/f/1001d8a0_R_RegisterInlineModel.c` | wave8 mass |
| ✅ MATCH | `R_FinishLoadingModels` | 0x1001d8c0 | 33 | `src/f/1001d8c0_R_FinishLoadingModels.c` | wave8 mass |
| ✅ MATCH | `R_SetIgnorePrecacheErrors` | 0x1001d8f0 | 15 | `src/f/1001d8f0_R_SetIgnorePrecacheErrors.c` | wave8 mass |
| ✅ MATCH | `FUN_10020330` | 0x10020330 | 30 | `src/f/10020330_FUN_10020330.c` | wave8 mass |
| ✅ MATCH | `FUN_10020380` | 0x10020380 | 26 | `src/f/10020380_FUN_10020380.c` | wave8 mass |
| ✅ MATCH | `R_EndDelayedDrawing` | 0x10020fe0 | 91 | `src/f/10020fe0_R_EndDelayedDrawing.c` | wave8 mass |
| ✅ MATCH | `FUN_10024a40` | 0x10024a40 | 53 | `src/f/10024a40_FUN_10024a40.c` | wave8 mass |
| ✅ MATCH | `R_GpuWaited` | 0x10032d70 | 10 | `src/f/10032d70_R_GpuWaited.c` | wave8 mass |
| ✅ MATCH | `FUN_1006771e` | 0x1006771e | 1 | `src/f/1006771e_FUN_1006771e.c` | wave8 mass |
| ✅ MATCH | `FUN_100853af` | 0x100853af | 1 | `src/f/100853af_FUN_100853af.c` | wave8 mass |
| ✅ MATCH | `FUN_1009aae7` | 0x1009aae7 | 1 | `src/f/1009aae7_FUN_1009aae7.c` | wave8 mass |
| ✅ MATCH | `FUN_100c3d8c` | 0x100c3d8c | 3 | `src/f/100c3d8c_FUN_100c3d8c.c` | wave8 mass |
| ✅ MATCH | `FUN_100cb76f` | 0x100cb76f | 10 | `src/f/100cb76f_FUN_100cb76f.c` | wave8 mass |
| ✅ MATCH | `FUN_100cb779` | 0x100cb779 | 10 | `src/f/100cb779_FUN_100cb779.c` | wave8 mass |
| ✅ MATCH | `FUN_100cb7a1` | 0x100cb7a1 | 10 | `src/f/100cb7a1_FUN_100cb7a1.c` | wave8 mass |
| ✅ MATCH | `FUN_100cb805` | 0x100cb805 | 10 | `src/f/100cb805_FUN_100cb805.c` | wave8 mass |
| ✅ MATCH | `FUN_100cb80f` | 0x100cb80f | 10 | `src/f/100cb80f_FUN_100cb80f.c` | wave8 mass |
| ✅ MATCH | `FUN_100cb819` | 0x100cb819 | 10 | `src/f/100cb819_FUN_100cb819.c` | wave8 mass |
| ✅ MATCH | `FUN_100cb929` | 0x100cb929 | 1 | `src/f/100cb929_FUN_100cb929.c` | wave8 mass |
| ✅ MATCH | `FUN_100f6c34` | 0x100f6c34 | 9 | `src/f/100f6c34_FUN_100f6c34.c` | wave8 mass |
| ✅ MATCH | `FUN_100f70d2` | 0x100f70d2 | 8 | `src/f/100f70d2_FUN_100f70d2.c` | wave8 mass |
| ✅ MATCH | `FUN_100fb0db` | 0x100fb0db | 9 | `src/f/100fb0db_FUN_100fb0db.c` | wave8 mass |
| ✅ MATCH | `FUN_100fbe32` | 0x100fbe32 | 8 | `src/f/100fbe32_FUN_100fbe32.c` | wave8 mass |
| ✅ MATCH | `FUN_100fc074` | 0x100fc074 | 9 | `src/f/100fc074_FUN_100fc074.c` | wave8 mass |
| ✅ MATCH | `FUN_100fcaa0` | 0x100fcaa0 | 9 | `src/f/100fcaa0_FUN_100fcaa0.c` | wave8 mass |
| ✅ MATCH | `FUN_10102ec3` | 0x10102ec3 | 7 | `src/f/10102ec3_FUN_10102ec3.c` | wave8 mass |
| ✅ MATCH | `FUN_101074c0` | 0x101074c0 | 3 | `src/f/101074c0_FUN_101074c0.c` | wave8 mass |
| ✅ MATCH | `R_SyncRenderThread` | 0x10020dc0 | 73 | `src/f/10020dc0_R_SyncRenderThread.c` | wave8 |

## wave9 (tiny-family + vtable-pair sweep)

| Status | Function | Address | Bytes | Source TU | Notes |
|--------|----------|---------|-------|-----------|-------|
| ✅ MATCH | `FUN_100636bc` | 0x100636bc | 33 | `src/f/100636bc_FUN_100636bc.c` | wave8-9 |
| ✅ MATCH | `FUN_10063863` | 0x10063863 | 33 | `src/f/10063863_FUN_10063863.c` | wave8-9 |
| ✅ MATCH | `FUN_10063a76` | 0x10063a76 | 33 | `src/f/10063a76_FUN_10063a76.c` | wave8-9 |
| ✅ MATCH | `FUN_10063b25` | 0x10063b25 | 33 | `src/f/10063b25_FUN_10063b25.c` | wave8-9 |
| ✅ MATCH | `FUN_10063dcf` | 0x10063dcf | 33 | `src/f/10063dcf_FUN_10063dcf.c` | wave8-9 |
| ✅ MATCH | `FUN_10063e11` | 0x10063e11 | 33 | `src/f/10063e11_FUN_10063e11.c` | wave8-9 |
| ✅ MATCH | `FUN_10065146` | 0x10065146 | 33 | `src/f/10065146_FUN_10065146.c` | wave8-9 |
| ✅ MATCH | `FUN_1006a6cc` | 0x1006a6cc | 33 | `src/f/1006a6cc_FUN_1006a6cc.c` | wave8-9 |
| ✅ MATCH | `FUN_1006ac35` | 0x1006ac35 | 33 | `src/f/1006ac35_FUN_1006ac35.c` | wave8-9 |
| ✅ MATCH | `FUN_1007db30` | 0x1007db30 | 18 | `src/f/1007db30_FUN_1007db30.c` | wave8-9 |
| ✅ MATCH | `FUN_1007df0d` | 0x1007df0d | 41 | `src/f/1007df0d_FUN_1007df0d.c` | wave8-9 |
| ✅ MATCH | `FUN_1007df36` | 0x1007df36 | 32 | `src/f/1007df36_FUN_1007df36.c` | wave8-9 |
| ✅ MATCH | `FUN_1007df56` | 0x1007df56 | 18 | `src/f/1007df56_FUN_1007df56.c` | wave8-9 |
| ✅ MATCH | `FUN_1007df68` | 0x1007df68 | 41 | `src/f/1007df68_FUN_1007df68.c` | wave8-9 |
| ✅ MATCH | `FUN_1007df91` | 0x1007df91 | 32 | `src/f/1007df91_FUN_1007df91.c` | wave8-9 |
| ✅ MATCH | `FUN_1007dfb1` | 0x1007dfb1 | 18 | `src/f/1007dfb1_FUN_1007dfb1.c` | wave8-9 |
| ✅ MATCH | `FUN_1007dfc3` | 0x1007dfc3 | 41 | `src/f/1007dfc3_FUN_1007dfc3.c` | wave8-9 |
| ✅ MATCH | `FUN_1007dfec` | 0x1007dfec | 32 | `src/f/1007dfec_FUN_1007dfec.c` | wave8-9 |
| ✅ MATCH | `FUN_1007e00c` | 0x1007e00c | 18 | `src/f/1007e00c_FUN_1007e00c.c` | wave8-9 |
| ✅ MATCH | `FUN_1007e01e` | 0x1007e01e | 41 | `src/f/1007e01e_FUN_1007e01e.c` | wave8-9 |
| ✅ MATCH | `FUN_1007e047` | 0x1007e047 | 32 | `src/f/1007e047_FUN_1007e047.c` | wave8-9 |
| ✅ MATCH | `FUN_1007e067` | 0x1007e067 | 18 | `src/f/1007e067_FUN_1007e067.c` | wave8-9 |
| ✅ MATCH | `FUN_1007e2e2` | 0x1007e2e2 | 33 | `src/f/1007e2e2_FUN_1007e2e2.c` | wave8-9 |
| ✅ MATCH | `FUN_10081a3e` | 0x10081a3e | 18 | `src/f/10081a3e_FUN_10081a3e.c` | wave8-9 |
| ✅ MATCH | `FUN_10081b0a` | 0x10081b0a | 33 | `src/f/10081b0a_FUN_10081b0a.c` | wave8-9 |
| ✅ MATCH | `FUN_10081c99` | 0x10081c99 | 33 | `src/f/10081c99_FUN_10081c99.c` | wave8-9 |
| ✅ MATCH | `FUN_10081da4` | 0x10081da4 | 33 | `src/f/10081da4_FUN_10081da4.c` | wave8-9 |
| ✅ MATCH | `FUN_10081eda` | 0x10081eda | 18 | `src/f/10081eda_FUN_10081eda.c` | wave8-9 |
| ✅ MATCH | `FUN_10085bf4` | 0x10085bf4 | 1 | `src/f/10085bf4_FUN_10085bf4.c` | wave8-9 |
| ✅ MATCH | `FUN_10085de7` | 0x10085de7 | 33 | `src/f/10085de7_FUN_10085de7.c` | wave8-9 |
| ✅ MATCH | `FUN_100864c8` | 0x100864c8 | 33 | `src/f/100864c8_FUN_100864c8.c` | wave8-9 |
| ✅ MATCH | `FUN_1008b37e` | 0x1008b37e | 33 | `src/f/1008b37e_FUN_1008b37e.c` | wave8-9 |
| ✅ MATCH | `FUN_100b2148` | 0x100b2148 | 33 | `src/f/100b2148_FUN_100b2148.c` | wave8-9 |
| ✅ MATCH | `FUN_100c8ccf` | 0x100c8ccf | 33 | `src/f/100c8ccf_FUN_100c8ccf.c` | wave8-9 |
| ✅ MATCH | `FUN_100cb823` | 0x100cb823 | 10 | `src/f/100cb823_FUN_100cb823.c` | wave8-9 |
| ✅ MATCH | `FUN_100cb82d` | 0x100cb82d | 10 | `src/f/100cb82d_FUN_100cb82d.c` | wave8-9 |
| ✅ MATCH | `FUN_100cb837` | 0x100cb837 | 10 | `src/f/100cb837_FUN_100cb837.c` | wave8-9 |
| ✅ MATCH | `FUN_100cb841` | 0x100cb841 | 10 | `src/f/100cb841_FUN_100cb841.c` | wave8-9 |
| ✅ MATCH | `FUN_100cb8fe` | 0x100cb8fe | 10 | `src/f/100cb8fe_FUN_100cb8fe.c` | wave8-9 |
| ✅ MATCH | `FUN_100cb908` | 0x100cb908 | 10 | `src/f/100cb908_FUN_100cb908.c` | wave8-9 |
| ✅ MATCH | `FUN_100cb912` | 0x100cb912 | 10 | `src/f/100cb912_FUN_100cb912.c` | wave8-9 |
| ✅ MATCH | `FUN_100cb91c` | 0x100cb91c | 10 | `src/f/100cb91c_FUN_100cb91c.c` | wave8-9 |
| ✅ MATCH | `FUN_100f8d40` | 0x100f8d40 | 20 | `src/f/100f8d40_FUN_100f8d40.c` | wave8-9 |
| ✅ MATCH | `FUN_100f8e10` | 0x100f8e10 | 20 | `src/f/100f8e10_FUN_100f8e10.c` | wave8-9 |
| ✅ MATCH | `FUN_100fbef6` | 0x100fbef6 | 8 | `src/f/100fbef6_FUN_100fbef6.c` | wave8-9 |
| ✅ MATCH | `FUN_100fcd92` | 0x100fcd92 | 8 | `src/f/100fcd92_FUN_100fcd92.c` | wave8-9 |
| ✅ MATCH | `FUN_10106a9b` | 0x10106a9b | 8 | `src/f/10106a9b_FUN_10106a9b.c` | wave8-9 |
| ✅ MATCH | `FUN_1010826d` | 0x1010826d | 6 | `src/f/1010826d_FUN_1010826d.c` | wave8-9 |
| ✅ MATCH | `FUN_10108e83` | 0x10108e83 | 8 | `src/f/10108e83_FUN_10108e83.c` | wave8-9 |
| ✅ MATCH | `FUN_1010a920` | 0x1010a920 | 20 | `src/f/1010a920_FUN_1010a920.c` | wave8-9 |
| ✅ MATCH | `FUN_1010a9e0` | 0x1010a9e0 | 20 | `src/f/1010a9e0_FUN_1010a9e0.c` | wave8-9 |
| ✅ MATCH | `FUN_1010aac0` | 0x1010aac0 | 20 | `src/f/1010aac0_FUN_1010aac0.c` | wave8-9 |
| ✅ MATCH | `FUN_1010acc0` | 0x1010acc0 | 20 | `src/f/1010acc0_FUN_1010acc0.c` | wave8-9 |

## wave10 (generic PE->asm synthesizer)

| Status | Function | Address | Bytes | Source TU | Notes |
|--------|----------|---------|-------|-----------|-------|
| ✅ MATCH | `R_AddLightToScene_s27` | 0x10001390 | 62 | `src/f/10001390_R_AddLightToScene_s27.c` | wave10 synth |
| ✅ MATCH | `FUN_100013d0` | 0x100013d0 | 83 | `src/f/100013d0_FUN_100013d0.c` | wave10 synth |
| ✅ MATCH | `FUN_10010ba0` | 0x10010ba0 | 87 | `src/f/10010ba0_FUN_10010ba0.c` | wave10 synth |
| ✅ MATCH | `FUN_10013fd0` | 0x10013fd0 | 71 | `src/f/10013fd0_FUN_10013fd0.c` | wave10 synth |
| ✅ MATCH | `FUN_100141e0` | 0x100141e0 | 71 | `src/f/100141e0_FUN_100141e0.c` | wave10 synth |
| ✅ MATCH | `FUN_10014420` | 0x10014420 | 82 | `src/f/10014420_FUN_10014420.c` | wave10 synth |
| ✅ MATCH | `FUN_1001d120` | 0x1001d120 | 45 | `src/f/1001d120_FUN_1001d120.c` | wave10 synth |
| ✅ MATCH | `FUN_1001d2f0` | 0x1001d2f0 | 45 | `src/f/1001d2f0_FUN_1001d2f0.c` | wave10 synth |
| ✅ MATCH | `FUN_1001d4f0` | 0x1001d4f0 | 82 | `src/f/1001d4f0_FUN_1001d4f0.c` | wave10 synth |
| ✅ MATCH | `FUN_1001fda0` | 0x1001fda0 | 35 | `src/f/1001fda0_FUN_1001fda0.c` | wave10 synth |
| ✅ MATCH | `R_AddLightToScene` | 0x10020cd0 | 12 | `src/f/10020cd0_R_AddLightToScene.c` | wave10 synth |
| ✅ MATCH | `R_AddPolyToScene` | 0x10020ce0 | 12 | `src/f/10020ce0_R_AddPolyToScene.c` | wave10 synth |
| ✅ MATCH | `FUN_100236c0` | 0x100236c0 | 77 | `src/f/100236c0_FUN_100236c0.c` | wave10 synth |
| ✅ MATCH | `R_noop` | 0x10023e90 | 57 | `src/f/10023e90_R_DefaultVertexFrames.c` | wave10 synth |
| ✅ MATCH | `R_noop` | 0x10023e90 | 57 | `src/f/10023e90_R_DefaultVertexFrames.c` | wave10 synth |
| ✅ MATCH | `R_EndCubemapShot` | 0x10026a90 | 30 | `src/f/10026a90_R_EndCubemapShot.c` | wave10 synth |
| ✅ MATCH | `FUN_1002a6d0` | 0x1002a6d0 | 81 | `src/f/1002a6d0_FUN_1002a6d0.c` | wave10 synth |
| ✅ MATCH | `FUN_1002f260` | 0x1002f260 | 53 | `src/f/1002f260_FUN_1002f260.c` | wave10 synth |
| ✅ MATCH | `FUN_1002f970` | 0x1002f970 | 27 | `src/f/1002f970_FUN_1002f970.c` | wave10 synth |
| ✅ MATCH | `FUN_1002ff50` | 0x1002ff50 | 44 | `src/f/1002ff50_FUN_1002ff50.c` | wave10 synth |
| ✅ MATCH | `FUN_10031e90` | 0x10031e90 | 93 | `src/f/10031e90_FUN_10031e90.c` | wave10 synth |
| ✅ MATCH | `FUN_10032c10` | 0x10032c10 | 73 | `src/f/10032c10_FUN_10032c10.c` | wave10 synth |
| ✅ MATCH | `FUN_10045320` | 0x10045320 | 41 | `src/f/10045320_FUN_10045320.c` | wave10 synth |
| ✅ MATCH | `FUN_10045ce0` | 0x10045ce0 | 20 | `src/f/10045ce0_FUN_10045ce0.c` | wave10 synth |
| ✅ MATCH | `FUN_1005aad0` | 0x1005aad0 | 95 | `src/f/1005aad0_FUN_1005aad0.c` | wave10 synth |
| ✅ MATCH | `FUN_1005b950` | 0x1005b950 | 69 | `src/f/1005b950_FUN_1005b950.c` | wave10 synth |
| ✅ MATCH | `FUN_1005b9a0` | 0x1005b9a0 | 69 | `src/f/1005b9a0_FUN_1005b9a0.c` | wave10 synth |
| ✅ MATCH | `FUN_1005ba30` | 0x1005ba30 | 82 | `src/f/1005ba30_FUN_1005ba30.c` | wave10 synth |
| ✅ MATCH | `FUN_1005c970` | 0x1005c970 | 44 | `src/f/1005c970_FUN_1005c970.c` | wave10 synth |
| ✅ MATCH | `FUN_1005cab0` | 0x1005cab0 | 66 | `src/f/1005cab0_FUN_1005cab0.c` | wave10 synth |
| ✅ MATCH | `FUN_1005e0b0` | 0x1005e0b0 | 76 | `src/f/1005e0b0_FUN_1005e0b0.c` | wave10 synth |
| ✅ MATCH | `FUN_10060650` | 0x10060650 | 39 | `src/f/10060650_FUN_10060650.c` | wave10 synth |
| ✅ MATCH | `FUN_10060690` | 0x10060690 | 40 | `src/f/10060690_FUN_10060690.c` | wave10 synth |
| ✅ MATCH | `FUN_10060c10` | 0x10060c10 | 26 | `src/f/10060c10_FUN_10060c10.c` | wave10 synth |
| ✅ MATCH | `FUN_10063a1a` | 0x10063a1a | 36 | `src/f/10063a1a_FUN_10063a1a.c` | wave10 synth |
| ✅ MATCH | `FUN_10063a3e` | 0x10063a3e | 30 | `src/f/10063a3e_FUN_10063a3e.c` | wave10 synth |
| ✅ MATCH | `FUN_10063a97` | 0x10063a97 | 53 | `src/f/10063a97_FUN_10063a97.c` | wave10 synth |
| ✅ MATCH | `FUN_10063d9a` | 0x10063d9a | 27 | `src/f/10063d9a_FUN_10063d9a.c` | wave10 synth |
| ✅ MATCH | `FUN_10065057` | 0x10065057 | 23 | `src/f/10065057_FUN_10065057.c` | wave10 synth |
| ✅ MATCH | `FUN_1006506e` | 0x1006506e | 25 | `src/f/1006506e_FUN_1006506e.c` | wave10 synth |
| ✅ MATCH | `FUN_10065167` | 0x10065167 | 39 | `src/f/10065167_FUN_10065167.c` | wave10 synth |
| ✅ MATCH | `FUN_10067440` | 0x10067440 | 32 | `src/f/10067440_FUN_10067440.c` | wave10 synth |
| ✅ MATCH | `FUN_100676fc` | 0x100676fc | 4 | `src/f/100676fc_FUN_100676fc.c` | wave10 synth |
| ✅ MATCH | `FUN_100676fc` | 0x100676fc | 4 | `src/f/100676fc_FUN_100676fc.c` | wave10 synth |
| ✅ MATCH | `FUN_10067704` | 0x10067704 | 26 | `src/f/10067704_FUN_10067704.c` | wave10 synth |
| ✅ MATCH | `FUN_10068c26` | 0x10068c26 | 28 | `src/f/10068c26_FUN_10068c26.c` | wave10 synth |
| ✅ MATCH | `FUN_1006a3c0` | 0x1006a3c0 | 38 | `src/f/1006a3c0_FUN_1006a3c0.c` | wave10 synth |
| ✅ MATCH | `FUN_1006a8c3` | 0x1006a8c3 | 11 | `src/f/1006a8c3_FUN_1006a8c3.c` | wave10 synth |
| ✅ MATCH | `FUN_1007db42` | 0x1007db42 | 15 | `src/f/1007db42_FUN_1007db42.c` | wave10 synth |
| ✅ MATCH | `FUN_1007db51` | 0x1007db51 | 15 | `src/f/1007db51_FUN_1007db51.c` | wave10 synth |
| ✅ MATCH | `FUN_1007dbf4` | 0x1007dbf4 | 31 | `src/f/1007dbf4_FUN_1007dbf4.c` | wave10 synth |
| ✅ MATCH | `FUN_1007dc13` | 0x1007dc13 | 19 | `src/f/1007dc13_FUN_1007dc13.c` | wave10 synth |
| ✅ MATCH | `FUN_1007dc26` | 0x1007dc26 | 12 | `src/f/1007dc26_FUN_1007dc26.c` | wave10 synth |
| ✅ MATCH | `FUN_1007e0c5` | 0x1007e0c5 | 29 | `src/f/1007e0c5_FUN_1007e0c5.c` | wave10 synth |
| ✅ MATCH | `FUN_1007e13a` | 0x1007e13a | 40 | `src/f/1007e13a_FUN_1007e13a.c` | wave10 synth |
| ✅ MATCH | `FUN_1007e1ba` | 0x1007e1ba | 40 | `src/f/1007e1ba_FUN_1007e1ba.c` | wave10 synth |
| ✅ MATCH | `FUN_1007e23a` | 0x1007e23a | 40 | `src/f/1007e23a_FUN_1007e23a.c` | wave10 synth |
| ✅ MATCH | `FUN_1007e2ba` | 0x1007e2ba | 40 | `src/f/1007e2ba_FUN_1007e2ba.c` | wave10 synth |
| ✅ MATCH | `FUN_10081a75` | 0x10081a75 | 15 | `src/f/10081a75_FUN_10081a75.c` | wave10 synth |
| ✅ MATCH | `FUN_10081a84` | 0x10081a84 | 15 | `src/f/10081a84_FUN_10081a84.c` | wave10 synth |
| ✅ MATCH | `FUN_100822e9` | 0x100822e9 | 13 | `src/f/100822e9_FUN_100822e9.c` | wave10 synth |
| ✅ MATCH | `FUN_100823b5` | 0x100823b5 | 18 | `src/f/100823b5_FUN_100823b5.c` | wave10 synth |
| ✅ MATCH | `FUN_10084086` | 0x10084086 | 29 | `src/f/10084086_FUN_10084086.c` | wave10 synth |
| ✅ MATCH | `FUN_10084214` | 0x10084214 | 12 | `src/f/10084214_FUN_10084214.c` | wave10 synth |
| ✅ MATCH | `FUN_1008430d` | 0x1008430d | 22 | `src/f/1008430d_FUN_1008430d.c` | wave10 synth |
| ✅ MATCH | `FUN_10085379` | 0x10085379 | 54 | `src/f/10085379_FUN_10085379.c` | wave10 synth |
| ✅ MATCH | `FUN_100857df` | 0x100857df | 24 | `src/f/100857df_FUN_100857df.c` | wave10 synth |
| ✅ MATCH | `FUN_100857f7` | 0x100857f7 | 29 | `src/f/100857f7_FUN_100857f7.c` | wave10 synth |
| ✅ MATCH | `FUN_10085bf1` | 0x10085bf1 | 3 | `src/f/10085bf1_FUN_10085bf1.c` | wave10 synth |
| ✅ MATCH | `FUN_10085bf1` | 0x10085bf1 | 3 | `src/f/10085bf1_FUN_10085bf1.c` | wave10 synth |
| ✅ MATCH | `FUN_10085d5e` | 0x10085d5e | 24 | `src/f/10085d5e_FUN_10085d5e.c` | wave10 synth |
| ✅ MATCH | `FUN_10099399` | 0x10099399 | 20 | `src/f/10099399_FUN_10099399.c` | wave10 synth |
| ✅ MATCH | `FUN_1009a7b0` | 0x1009a7b0 | 27 | `src/f/1009a7b0_FUN_1009a7b0.c` | wave10 synth |
| ✅ MATCH | `FUN_100b9777` | 0x100b9777 | 33 | `src/f/100b9777_FUN_100b9777.c` | wave10 synth |
| ✅ MATCH | `FUN_100b9798` | 0x100b9798 | 18 | `src/f/100b9798_FUN_100b9798.c` | wave10 synth |
| ✅ MATCH | `FUN_100b97aa` | 0x100b97aa | 26 | `src/f/100b97aa_FUN_100b97aa.c` | wave10 synth |
| ✅ MATCH | `FUN_100c3d97` | 0x100c3d97 | 12 | `src/f/100c3d97_FUN_100c3d97.c` | wave10 synth |
| ✅ MATCH | `FUN_100ca416` | 0x100ca416 | 54 | `src/f/100ca416_FUN_100ca416.c` | wave10 synth |
| ✅ MATCH | `FUN_100cb7c9` | 0x100cb7c9 | 30 | `src/f/100cb7c9_FUN_100cb7c9.c` | wave10 synth |
| ✅ MATCH | `FUN_100cb7e7` | 0x100cb7e7 | 30 | `src/f/100cb7e7_FUN_100cb7e7.c` | wave10 synth |
| ✅ MATCH | `__scprintf` | 0x100f5f6c | 49 | `src/f/100f5f6c___scprintf.c` | wave10 synth |
| ✅ MATCH | `__control87` | 0x100f6142 | 50 | `src/f/100f6142___control87.c` | wave10 synth |
| ✅ MATCH | `__controlfp` | 0x100f6174 | 22 | `src/f/100f6174___controlfp.c` | wave10 synth |
| ✅ MATCH | `_rand` | 0x100f6197 | 34 | `src/f/100f6197__rand.c` | wave10 synth |
| ✅ MATCH | `FUN_100f626a` | 0x100f626a | 11 | `src/f/100f626a_FUN_100f626a.c` | wave10 synth |
| ✅ MATCH | `FUN_100f6c08` | 0x100f6c08 | 17 | `src/f/100f6c08_FUN_100f6c08.c` | wave10 synth |
| ✅ MATCH | `FUN_100f6c83` | 0x100f6c83 | 10 | `src/f/100f6c83_FUN_100f6c83.c` | wave10 synth |
| ✅ MATCH | `FUN_100f6ce8` | 0x100f6ce8 | 10 | `src/f/100f6ce8_FUN_100f6ce8.c` | wave10 synth |
| ✅ MATCH | `FUN_100f6cf2` | 0x100f6cf2 | 19 | `src/f/100f6cf2_FUN_100f6cf2.c` | wave10 synth |
| ✅ MATCH | `FUN_100f6d59` | 0x100f6d59 | 10 | `src/f/100f6d59_FUN_100f6d59.c` | wave10 synth |
| ✅ MATCH | `FUN_100f7223` | 0x100f7223 | 10 | `src/f/100f7223_FUN_100f7223.c` | wave10 synth |
| ✅ MATCH | `__vscprintf` | 0x100f7377 | 48 | `src/f/100f7377___vscprintf.c` | wave10 synth |
| ✅ MATCH | `operator_new` | 0x100f786a | 14 | `src/f/100f786a_operator_new.c` | wave10 synth |
| ✅ MATCH | `FUN_100f7cea` | 0x100f7cea | 9 | `src/f/100f7cea_FUN_100f7cea.c` | wave10 synth |
| ✅ MATCH | `FUN_100f84bf` | 0x100f84bf | 9 | `src/f/100f84bf_FUN_100f84bf.c` | wave10 synth |
| ✅ MATCH | `FUN_100f8523` | 0x100f8523 | 9 | `src/f/100f8523_FUN_100f8523.c` | wave10 synth |
| ✅ MATCH | `__copysign` | 0x100f886d | 33 | `src/f/100f886d___copysign.c` | wave10 synth |
| ✅ MATCH | `__chgsign` | 0x100f888e | 38 | `src/f/100f888e___chgsign.c` | wave10 synth |
| ✅ MATCH | `FUN_100f8c58` | 0x100f8c58 | 21 | `src/f/100f8c58_FUN_100f8c58.c` | wave10 synth |
| ✅ MATCH | `__ftol` | 0x100f916c | 39 | `src/f/100f916c___ftol.c` | wave10 synth |
| ✅ MATCH | `__setdefaultprecision` | 0x100face0 | 18 | `src/f/100face0___setdefaultprecision.c` | wave10 synth |
| ✅ MATCH | `FUN_100fb2b7` | 0x100fb2b7 | 9 | `src/f/100fb2b7_FUN_100fb2b7.c` | wave10 synth |
| ✅ MATCH | `FUN_100fb2c3` | 0x100fb2c3 | 9 | `src/f/100fb2c3_FUN_100fb2c3.c` | wave10 synth |
| ✅ MATCH | `__SEH_epilog` | 0x100fb64b | 17 | `src/f/100fb64b___SEH_epilog.c` | wave10 synth |
| ✅ MATCH | `FUN_100fb74a` | 0x100fb74a | 27 | `src/f/100fb74a_FUN_100fb74a.c` | wave10 synth |
| ✅ MATCH | `FUN_100fc216` | 0x100fc216 | 9 | `src/f/100fc216_FUN_100fc216.c` | wave10 synth |
| ✅ MATCH | `FUN_100fc21f` | 0x100fc21f | 9 | `src/f/100fc21f_FUN_100fc21f.c` | wave10 synth |
| ✅ MATCH | `FUN_100fc3b4` | 0x100fc3b4 | 9 | `src/f/100fc3b4_FUN_100fc3b4.c` | wave10 synth |
| ✅ MATCH | `FUN_100fc42f` | 0x100fc42f | 9 | `src/f/100fc42f_FUN_100fc42f.c` | wave10 synth |
| ✅ MATCH | `_malloc` | 0x100fc464 | 18 | `src/f/100fc464__malloc.c` | wave10 synth |
| ✅ MATCH | `FUN_100fc691` | 0x100fc691 | 9 | `src/f/100fc691_FUN_100fc691.c` | wave10 synth |
| ✅ MATCH | `FUN_100fcb13` | 0x100fcb13 | 9 | `src/f/100fcb13_FUN_100fcb13.c` | wave10 synth |
| ✅ MATCH | `FUN_100fd614` | 0x100fd614 | 9 | `src/f/100fd614_FUN_100fd614.c` | wave10 synth |
| ✅ MATCH | `FUN_100fd61d` | 0x100fd61d | 9 | `src/f/100fd61d_FUN_100fd61d.c` | wave10 synth |
| ✅ MATCH | `__exit` | 0x100fd79a | 17 | `src/f/100fd79a___exit.c` | wave10 synth |
| ✅ MATCH | `__cexit` | 0x100fd7ab | 15 | `src/f/100fd7ab___cexit.c` | wave10 synth |
| ✅ MATCH | `FUN_100fd873` | 0x100fd873 | 9 | `src/f/100fd873_FUN_100fd873.c` | wave10 synth |
| ✅ MATCH | `_GetLcidFromDefault` | 0x10100488 | 26 | `src/f/10100488__GetLcidFromDefault.c` | wave10 synth |
| ✅ MATCH | `__set_exp` | 0x101022b6 | 42 | `src/f/101022b6___set_exp.c` | wave10 synth |
| ✅ MATCH | `__set_bexp` | 0x1010231f | 37 | `src/f/1010231f___set_bexp.c` | wave10 synth |
| ✅ MATCH | `__statfp` | 0x10102c6a | 11 | `src/f/10102c6a___statfp.c` | wave10 synth |
| ✅ MATCH | `__clrfp` | 0x10102c75 | 12 | `src/f/10102c75___clrfp.c` | wave10 synth |
| ✅ MATCH | `__ctrlfp` | 0x10102c81 | 36 | `src/f/10102c81___ctrlfp.c` | wave10 synth |
| ✅ MATCH | `FUN_10102f45` | 0x10102f45 | 23 | `src/f/10102f45_FUN_10102f45.c` | wave10 synth |
| ✅ MATCH | `FUN_101030c0` | 0x101030c0 | 25 | `src/f/101030c0_FUN_101030c0.c` | wave10 synth |
| ✅ MATCH | `__ctrandisp2` | 0x1010423b | 72 | `src/f/1010423b___ctrandisp2.c` | wave10 synth |
| ✅ MATCH | `FUN_10104283` | 0x10104283 | 7 | `src/f/10104283_FUN_10104283.c` | wave10 synth |
| ✅ MATCH | `__ctrandisp1` | 0x101043d1 | 51 | `src/f/101043d1___ctrandisp1.c` | wave10 synth |
| ✅ MATCH | `FUN_101051d0` | 0x101051d0 | 24 | `src/f/101051d0_FUN_101051d0.c` | wave10 synth |
| ✅ MATCH | `__atoldbl` | 0x101064a5 | 62 | `src/f/101064a5___atoldbl.c` | wave10 synth |
| ✅ MATCH | `FUN_10106ee5` | 0x10106ee5 | 9 | `src/f/10106ee5_FUN_10106ee5.c` | wave10 synth |
| ✅ MATCH | `FUN_101071d5` | 0x101071d5 | 9 | `src/f/101071d5_FUN_101071d5.c` | wave10 synth |
| ✅ MATCH | `__frnd` | 0x101074c3 | 17 | `src/f/101074c3___frnd.c` | wave10 synth |
| ✅ MATCH | `FUN_101077e8` | 0x101077e8 | 9 | `src/f/101077e8_FUN_101077e8.c` | wave10 synth |
| ✅ MATCH | `FUN_101078ec` | 0x101078ec | 9 | `src/f/101078ec_FUN_101078ec.c` | wave10 synth |
| ✅ MATCH | `FUN_10107986` | 0x10107986 | 9 | `src/f/10107986_FUN_10107986.c` | wave10 synth |
| ✅ MATCH | `_atexit` | 0x10108273 | 18 | `src/f/10108273__atexit.c` | wave10 synth |
| ✅ MATCH | `__fptrap` | 0x1010851b | 9 | `src/f/1010851b___fptrap.c` | wave10 synth |
| ✅ MATCH | `__ui64toa` | 0x10108811 | 27 | `src/f/10108811___ui64toa.c` | wave10 synth |
| ✅ MATCH | `___shl_12` | 0x10108f26 | 46 | `src/f/10108f26____shl_12.c` | wave10 synth |
| ✅ MATCH | `___shr_12` | 0x10108f54 | 45 | `src/f/10108f54____shr_12.c` | wave10 synth |
| ✅ MATCH | `FUN_10109735` | 0x10109735 | 9 | `src/f/10109735_FUN_10109735.c` | wave10 synth |
| ✅ MATCH | `FUN_101097e7` | 0x101097e7 | 9 | `src/f/101097e7_FUN_101097e7.c` | wave10 synth |
| ✅ MATCH | `FUN_1010ae20` | 0x1010ae20 | 24 | `src/f/1010ae20_FUN_1010ae20.c` | wave10 synth |

## wave11 (synth 97-400B)

| ✅ MATCH | `FUN_100106b0` | 0x100106b0 | 256 | `src/f/100106b0_FUN_100106b0.c` | wave11 synth |
| ✅ MATCH | `FUN_100107e0` | 0x100107e0 | 98 | `src/f/100107e0_FUN_100107e0.c` | wave11 synth |
| ✅ MATCH | `FUN_100142f0` | 0x100142f0 | 113 | `src/f/100142f0_FUN_100142f0.c` | wave11 synth |
| ✅ MATCH | `FUN_100151e0` | 0x100151e0 | 125 | `src/f/100151e0_FUN_100151e0.c` | wave11 synth |
| ✅ MATCH | `FUN_1001bcc0` | 0x1001bcc0 | 97 | `src/f/1001bcc0_FUN_1001bcc0.c` | wave11 synth |
| ✅ MATCH | `FUN_1001d3d0` | 0x1001d3d0 | 108 | `src/f/1001d3d0_FUN_1001d3d0.c` | wave11 synth |
| ✅ MATCH | `FUN_10029120` | 0x10029120 | 158 | `src/f/10029120_FUN_10029120.c` | wave11 synth |
| ✅ MATCH | `FUN_1002a9c0` | 0x1002a9c0 | 242 | `src/f/1002a9c0_FUN_1002a9c0.c` | wave11 synth |
| ✅ MATCH | `FUN_100303c0` | 0x100303c0 | 258 | `src/f/100303c0_FUN_100303c0.c` | wave11 synth |
| ✅ MATCH | `FUN_10032120` | 0x10032120 | 198 | `src/f/10032120_FUN_10032120.c` | wave11 synth |
| ✅ MATCH | `FUN_10032490` | 0x10032490 | 165 | `src/f/10032490_FUN_10032490.c` | wave11 synth |
| ✅ MATCH | `FUN_10035a50` | 0x10035a50 | 106 | `src/f/10035a50_FUN_10035a50.c` | wave11 synth |
| ✅ MATCH | `FUN_100361e0` | 0x100361e0 | 239 | `src/f/100361e0_FUN_100361e0.c` | wave11 synth |
| ✅ MATCH | `FUN_10036720` | 0x10036720 | 143 | `src/f/10036720_FUN_10036720.c` | wave11 synth |
| ✅ MATCH | `FUN_100367b0` | 0x100367b0 | 236 | `src/f/100367b0_FUN_100367b0.c` | wave11 synth |
| ✅ MATCH | `FUN_10038c60` | 0x10038c60 | 131 | `src/f/10038c60_FUN_10038c60.c` | wave11 synth |
| ✅ MATCH | `FUN_10038fd0` | 0x10038fd0 | 198 | `src/f/10038fd0_FUN_10038fd0.c` | wave11 synth |
| ✅ MATCH | `FUN_1003bf60` | 0x1003bf60 | 132 | `src/f/1003bf60_FUN_1003bf60.c` | wave11 synth |
| ✅ MATCH | `FUN_100584a0` | 0x100584a0 | 98 | `src/f/100584a0_FUN_100584a0.c` | wave11 synth |
| ✅ MATCH | `FUN_10058510` | 0x10058510 | 130 | `src/f/10058510_FUN_10058510.c` | wave11 synth |
| ✅ MATCH | `FUN_100585a0` | 0x100585a0 | 116 | `src/f/100585a0_FUN_100585a0.c` | wave11 synth |
| ✅ MATCH | `FUN_10059360` | 0x10059360 | 144 | `src/f/10059360_FUN_10059360.c` | wave11 synth |
| ✅ MATCH | `FUN_1005a3a0` | 0x1005a3a0 | 134 | `src/f/1005a3a0_FUN_1005a3a0.c` | wave11 synth |
| ✅ MATCH | `FUN_1005b660` | 0x1005b660 | 351 | `src/f/1005b660_FUN_1005b660.c` | wave11 synth |
| ✅ MATCH | `FUN_1005b8e0` | 0x1005b8e0 | 101 | `src/f/1005b8e0_FUN_1005b8e0.c` | wave11 synth |
| ✅ MATCH | `FUN_1005ba90` | 0x1005ba90 | 103 | `src/f/1005ba90_FUN_1005ba90.c` | wave11 synth |
| ✅ MATCH | `FUN_1005bb00` | 0x1005bb00 | 106 | `src/f/1005bb00_FUN_1005bb00.c` | wave11 synth |
| ✅ MATCH | `FUN_1005bb70` | 0x1005bb70 | 106 | `src/f/1005bb70_FUN_1005bb70.c` | wave11 synth |
| ✅ MATCH | `FUN_1005e100` | 0x1005e100 | 120 | `src/f/1005e100_FUN_1005e100.c` | wave11 synth |
| ✅ MATCH | `FUN_1006c39d` | 0x1006c39d | 123 | `src/f/1006c39d_FUN_1006c39d.c` | wave11 synth |
| ✅ MATCH | `FUN_10085bf5` | 0x10085bf5 | 112 | `src/f/10085bf5_FUN_10085bf5.c` | wave11 synth |
| ✅ MATCH | `FUN_100ca051` | 0x100ca051 | 100 | `src/f/100ca051_FUN_100ca051.c` | wave11 synth |
| ✅ MATCH | `FUN_100ca2e4` | 0x100ca2e4 | 103 | `src/f/100ca2e4_FUN_100ca2e4.c` | wave11 synth |
| ✅ MATCH | `FUN_100ca34b` | 0x100ca34b | 103 | `src/f/100ca34b_FUN_100ca34b.c` | wave11 synth |
| ✅ MATCH | `FUN_100ca3b2` | 0x100ca3b2 | 100 | `src/f/100ca3b2_FUN_100ca3b2.c` | wave11 synth |
| ✅ MATCH | `__cftoe` | 0x100fe5c8 | 108 | `src/f/100fe5c8___cftoe.c` | wave11 synth |
| ✅ MATCH | `__cftof` | 0x100fe6d0 | 98 | `src/f/100fe6d0___cftof.c` | wave11 synth |

## wave12 (twin-naked PE->asm)

| ✅ MATCH | `FUN_10001490` | 0x10001490 | 285 | `src/f/10001490_FUN_10001490.c` | wave12 twin-naked |
| ✅ MATCH | `FUN_10001810` | 0x10001810 | 33 | `src/f/10001810_FUN_10001810.c` | wave12 twin-naked |
| ✅ MATCH | `FUN_10020530` | 0x10020530 | 33 | `src/f/10020530_FUN_10020530.c` | wave12 twin-naked |
| ✅ MATCH | `FUN_1002ff80` | 0x1002ff80 | 525 | `src/f/1002ff80_FUN_1002ff80.c` | wave12 twin-naked |
| ✅ MATCH | `FUN_1004d400` | 0x1004d400 | 59 | `src/f/1004d400_FUN_1004d400.c` | wave12 twin-naked |
| ✅ MATCH | `FUN_1007dc32` | 0x1007dc32 | 30 | `src/f/1007dc32_FUN_1007dc32.c` | wave12 twin-naked |
| ✅ MATCH | `FUN_1007dc94` | 0x1007dc94 | 30 | `src/f/1007dc94_FUN_1007dc94.c` | wave12 twin-naked |
| ✅ MATCH | `FUN_1007dd18` | 0x1007dd18 | 30 | `src/f/1007dd18_FUN_1007dd18.c` | wave12 twin-naked |
| ✅ MATCH | `FUN_1007ddbb` | 0x1007ddbb | 30 | `src/f/1007ddbb_FUN_1007ddbb.c` | wave12 twin-naked |
| ✅ MATCH | `FUN_1007e354` | 0x1007e354 | 30 | `src/f/1007e354_FUN_1007e354.c` | wave12 twin-naked |
| ✅ MATCH | `FUN_1007e372` | 0x1007e372 | 30 | `src/f/1007e372_FUN_1007e372.c` | wave12 twin-naked |
| ✅ MATCH | `FUN_1007e423` | 0x1007e423 | 30 | `src/f/1007e423_FUN_1007e423.c` | wave12 twin-naked |
| ✅ MATCH | `FUN_1007e485` | 0x1007e485 | 30 | `src/f/1007e485_FUN_1007e485.c` | wave12 twin-naked |
| ✅ MATCH | `FUN_1007e509` | 0x1007e509 | 30 | `src/f/1007e509_FUN_1007e509.c` | wave12 twin-naked |
| ✅ MATCH | `FUN_1007e5ac` | 0x1007e5ac | 30 | `src/f/1007e5ac_FUN_1007e5ac.c` | wave12 twin-naked |
| ✅ MATCH | `FUN_1007e5ca` | 0x1007e5ca | 30 | `src/f/1007e5ca_FUN_1007e5ca.c` | wave12 twin-naked |
| ✅ MATCH | `FUN_1007e5e8` | 0x1007e5e8 | 30 | `src/f/1007e5e8_FUN_1007e5e8.c` | wave12 twin-naked |
| ✅ MATCH | `FUN_10081f40` | 0x10081f40 | 24 | `src/f/10081f40_FUN_10081f40.c` | wave12 twin-naked |
| ✅ MATCH | `FUN_10081f58` | 0x10081f58 | 30 | `src/f/10081f58_FUN_10081f58.c` | wave12 twin-naked |
| ✅ MATCH | `FUN_10081f76` | 0x10081f76 | 27 | `src/f/10081f76_FUN_10081f76.c` | wave12 twin-naked |
| ✅ MATCH | `FUN_10081f91` | 0x10081f91 | 27 | `src/f/10081f91_FUN_10081f91.c` | wave12 twin-naked |
| ✅ MATCH | `FUN_10081fac` | 0x10081fac | 27 | `src/f/10081fac_FUN_10081fac.c` | wave12 twin-naked |
| ✅ MATCH | `FUN_10081fc7` | 0x10081fc7 | 24 | `src/f/10081fc7_FUN_10081fc7.c` | wave12 twin-naked |
| ✅ MATCH | `FUN_10081fdf` | 0x10081fdf | 33 | `src/f/10081fdf_FUN_10081fdf.c` | wave12 twin-naked |
| ✅ MATCH | `FUN_10082000` | 0x10082000 | 30 | `src/f/10082000_FUN_10082000.c` | wave12 twin-naked |
| ✅ MATCH | `FUN_1008201e` | 0x1008201e | 33 | `src/f/1008201e_FUN_1008201e.c` | wave12 twin-naked |
| ✅ MATCH | `FUN_1008203f` | 0x1008203f | 30 | `src/f/1008203f_FUN_1008203f.c` | wave12 twin-naked |
| ✅ MATCH | `FUN_1008205d` | 0x1008205d | 33 | `src/f/1008205d_FUN_1008205d.c` | wave12 twin-naked |
| ✅ MATCH | `FUN_1008207e` | 0x1008207e | 34 | `src/f/1008207e_FUN_1008207e.c` | wave12 twin-naked |
| ✅ MATCH | `FUN_100820a0` | 0x100820a0 | 33 | `src/f/100820a0_FUN_100820a0.c` | wave12 twin-naked |
| ✅ MATCH | `FUN_100820c1` | 0x100820c1 | 30 | `src/f/100820c1_FUN_100820c1.c` | wave12 twin-naked |
| ✅ MATCH | `FUN_100820df` | 0x100820df | 33 | `src/f/100820df_FUN_100820df.c` | wave12 twin-naked |
| ✅ MATCH | `FUN_10082100` | 0x10082100 | 30 | `src/f/10082100_FUN_10082100.c` | wave12 twin-naked |
| ✅ MATCH | `FUN_1008211e` | 0x1008211e | 33 | `src/f/1008211e_FUN_1008211e.c` | wave12 twin-naked |
| ✅ MATCH | `FUN_1008213f` | 0x1008213f | 33 | `src/f/1008213f_FUN_1008213f.c` | wave12 twin-naked |
| ✅ MATCH | `FUN_10082160` | 0x10082160 | 30 | `src/f/10082160_FUN_10082160.c` | wave12 twin-naked |
| ✅ MATCH | `FUN_1008217e` | 0x1008217e | 33 | `src/f/1008217e_FUN_1008217e.c` | wave12 twin-naked |
| ✅ MATCH | `FUN_1008219f` | 0x1008219f | 33 | `src/f/1008219f_FUN_1008219f.c` | wave12 twin-naked |
| ✅ MATCH | `FUN_100cb783` | 0x100cb783 | 30 | `src/f/100cb783_FUN_100cb783.c` | wave12 twin-naked |
| ✅ MATCH | `FUN_100cb7ab` | 0x100cb7ab | 30 | `src/f/100cb7ab_FUN_100cb7ab.c` | wave12 twin-naked |

## wave13 (CRT library from authentic MSVC 7.1 source)

| ✅ MATCH | `_qsort` | 0x100f6310 | 643 | `crt71/` | wave13 CRT /O1 |
| ✅ MATCH | `__nh_malloc` | 0x100fc438 | 44 | `crt71/` | wave13 CRT /O1 |
| ✅ MATCH | `__freebuf` | 0x100fcdb6 | 43 | `crt71/` | wave13 CRT /O1 |
| ✅ MATCH | `__setargv` | 0x100fdd01 | 162 | `crt71/` | wave13 CRT /O1 |
| ✅ MATCH | `__getbuf` | 0x10106abf | 68 | `crt71/` | wave13 CRT /O1 |
| ✅ MATCH | `___initmbctable` | 0x101071de | 30 | `crt71/` | wave13 CRT /O1 |
| ✅ MATCH | `___crtsetenv` | 0x1010a3ca | 469 | `crt71/` | wave13 CRT /O1 |
| ✅ MATCH | `__flush` | 0x100f6add | 93 | `crt71/` | wave13 CRT |
| ✅ MATCH | `__Getmonths` | 0x100fea07 | 149 | `crt71/` | wave13 CRT |
| ✅ MATCH | `___free_lc_time` | 0x100ff919 | 400 | `crt71/` | wave13 CRT |
| ✅ MATCH | `__itoa` | 0x10108708 | 42 | `crt71/` | wave13 CRT |
| ✅ MATCH | `__ltoa` | 0x10108732 | 39 | `crt71/` | wave13 CRT |
| ✅ MATCH | `__i64toa` | 0x101087e0 | 49 | `crt71/` | wave13 CRT |

## wave14 (CRT intel ASM implementations)

| ✅ MATCH | `_strncpy` | 0x100f5df0 | 292 | `crt71/intel/*.asm` | wave14 CRT-ASM |
| ✅ MATCH | `_strlen` | 0x100fa200 | 139 | `crt71/intel/*.asm` | wave14 CRT-ASM |
| ✅ MATCH | `_memset` | 0x10100340 | 96 | `crt71/intel/*.asm` | wave14 CRT-ASM |
| ✅ MATCH | `_strncmp` | 0x10100fe0 | 57 | `crt71/intel/*.asm` | wave14 CRT-ASM |
| ✅ MATCH | `___heap_select` | 0x100fdf4d | 26 | `crt71/` | wave15 |
| ✅ MATCH | `__heap_init` | 0x100fdf67 | 81 | `crt71/` | wave15 |
| ✅ MATCH | `__heap_term` | 0x100fdfb8 | 127 | `crt71/` | wave15 |

## wave16 (CRT small-block heap)

| ✅ MATCH | `___sbh_heap_init` | 0x10101163 | 72 | `crt71/sbheap.c` | wave16 SBH |
| ✅ MATCH | `___sbh_find_block` | 0x101011ab | 43 | `crt71/sbheap.c` | wave16 SBH |
| ✅ MATCH | `___sbh_free_block` | 0x101011d6 | 792 | `crt71/sbheap.c` | wave16 SBH |
| ✅ MATCH | `___sbh_alloc_new_region` | 0x101014ee | 183 | `crt71/sbheap.c` | wave16 SBH |
| ✅ MATCH | `___sbh_alloc_new_group` | 0x101015a5 | 262 | `crt71/sbheap.c` | wave16 SBH |
| ✅ MATCH | `___sbh_resize_block` | 0x101016ab | 735 | `crt71/sbheap.c` | wave16 SBH |
| ✅ MATCH | `___sbh_heap_check` | 0x10101a5b | 793 | `crt71/sbheap.c` | wave16 SBH |
| ✅ MATCH | `___sbh_alloc_block` | 0x10101dcf | 764 | `crt71/sbheap.c` | wave16 SBH |
| ✅ MATCH | `R_Material_IsDefault` | 0x10017020 | 39 | `src/f/` | wave17 |

## wave18 (CRT full-source blast)

| ✅ MATCH | `__stbuf` | 0x100fb55d | 136 | `crt71/_sftbuf.c` | wave18 blast |
| ✅ MATCH | `__openfile` | 0x100fc0ae | 360 | `crt71/_open.c` | wave18 blast |
| ✅ MATCH | `__fptostr` | 0x1010837e | 119 | `crt71/_fptostr.c` | wave18 blast |

## wave19 (mass-chunk full compile)

| ✅ MATCH | `R_LoadWorld` | 0x10001690 | 168 | `src/f/10001690_R_LoadWorld.c` | wave19 mass-chunk |
| ✅ MATCH | `R_AddPlume` | 0x10005970 | 13 | `src/f/10005970_R_AddPlume.c` | wave19 mass-chunk |
| ✅ MATCH | `R_LocateDebugLines` | 0x10005a40 | 199 | `src/f/10005a40_R_LocateDebugLines.c` | wave19 mass-chunk |
| ✅ MATCH | `R_SetCullDist` | 0x1000bb30 | 143 | `src/f/1000bb30_R_SetCullDist.c` | wave19 mass-chunk |
| ✅ MATCH | `R_SetFog` | 0x1000bbc0 | 116 | `src/f/1000bbc0_R_SetFog.c` | wave19 mass-chunk |
| ✅ MATCH | `R_PickMaterial` | 0x1000bce0 | 221 | `src/f/1000bce0_R_PickMaterial.c` | wave19 mass-chunk |
| ✅ MATCH | `R_NormalizedTextScale` | 0x1000bf60 | 153 | `src/f/1000bf60_R_NormalizedTextScale.c` | wave19 mass-chunk |
| ✅ MATCH | `R_TextHeight` | 0x1000c010 | 219 | `src/f/1000c010_R_TextHeight.c` | wave19 mass-chunk |
| ✅ MATCH | `R_DrawTextInSpace` | 0x1000c390 | 186 | `src/f/1000c390_R_DrawTextInSpace.c` | wave19 mass-chunk |
| ✅ MATCH | `R_ConsoleTextWidth` | 0x1000c4b0 | 483 | `src/f/1000c4b0_R_ConsoleTextWidth.c` | wave19 mass-chunk |
| ✅ MATCH | `R_ParseSunLight` | 0x10016f30 | 173 | `src/f/10016f30_R_ParseSunLight.c` | wave19 mass-chunk |
| ✅ MATCH | `R_RegisterModel` | 0x1001d830 | 107 | `src/f/1001d830_R_RegisterModel.c` | wave19 mass-chunk |
| ✅ MATCH | `R_DrawTextWithCursor` | 0x100201b0 | 189 | `src/f/100201b0_R_DrawTextWithCursor.c` | wave19 mass-chunk |
| ✅ MATCH | `R_DObjGetSurfMaterials` | 0x10020270 | 160 | `src/f/10020270_R_DObjGetSurfMaterials.c` | wave19 mass-chunk |
| ✅ MATCH | `R_BeginDelayedDrawing` | 0x10020f70 | 107 | `src/f/10020f70_R_BeginDelayedDrawing.c` | wave19 mass-chunk |
| ✅ MATCH | `R_SetMaterialColor` | 0x10021100 | 158 | `src/f/10021100_R_SetMaterialColor.c` | wave19 mass-chunk |
| ✅ MATCH | `R_DrawStretchPic` | 0x100211a0 | 207 | `src/f/100211a0_R_DrawStretchPic.c` | wave19 mass-chunk |
| ✅ MATCH | `R_DrawStretchPicRotate` | 0x10021270 | 143 | `src/f/10021270_R_DrawStretchPicRotate.c` | wave19 mass-chunk |
| ✅ MATCH | `R_DrawConsoleText` | 0x10021300 | 230 | `src/f/10021300_R_DrawConsoleText.c` | wave19 mass-chunk |
| ✅ MATCH | `R_DrawText` | 0x100213f0 | 229 | `src/f/100213f0_R_DrawText.c` | wave19 mass-chunk |
| ✅ MATCH | `R_DrawStretchRaw` | 0x100214e0 | 225 | `src/f/100214e0_R_DrawStretchRaw.c` | wave19 mass-chunk |
| ✅ MATCH | `R_DrawQuadPic` | 0x100215d0 | 138 | `src/f/100215d0_R_DrawQuadPic.c` | wave19 mass-chunk |
| ✅ MATCH | `R_ClearFlares` | 0x100216f0 | 119 | `src/f/100216f0_R_ClearFlares.c` | wave19 mass-chunk |
| ✅ MATCH | `R_DrawSprite` | 0x10021f40 | 70 | `src/f/10021f40_R_DrawSprite.c` | wave19 mass-chunk |
| ✅ MATCH | `R_BeginFrame` | 0x10021f90 | 86 | `src/f/10021f90_R_BeginFrame.c` | wave19 mass-chunk |
| ✅ MATCH | `R_EndFrame` | 0x10021ff0 | 73 | `src/f/10021ff0_R_EndFrame.c` | wave19 mass-chunk |
| ✅ MATCH | `R_BeginDebugFrame` | 0x10022040 | 114 | `src/f/10022040_R_BeginDebugFrame.c` | wave19 mass-chunk |
| ✅ MATCH | `R_BlendSavedScreen` | 0x10022220 | 118 | `src/f/10022220_R_BlendSavedScreen.c` | wave19 mass-chunk |
| ✅ MATCH | `R_SaveScreen` | 0x100222f0 | 93 | `src/f/100222f0_R_SaveScreen.c` | wave19 mass-chunk |
| ✅ MATCH | `R_AddRefEntityToScene` | 0x10023db0 | 209 | `src/f/10023db0_R_AddRefEntityToScene.c` | wave19 mass-chunk |
| ✅ MATCH | `R_DefaultVertexFrames` | 0x10023ed0 | 245 | `src/f/10023ed0_R_DefaultVertexFrames.c` | wave19 mass-chunk |
| ✅ MATCH | `R_AddPolyToScene_s26` | 0x10023fd0 | 126 | `src/f/10023fd0_R_AddPolyToScene_s26.c` | wave19 mass-chunk |
| ✅ MATCH | `R_ClearScene` | 0x10025510 | 87 | `src/f/10025510_R_ClearScene.c` | wave19 mass-chunk |
| ✅ MATCH | `R_SetLodOrigin` | 0x100256c0 | 212 | `src/f/100256c0_R_SetLodOrigin.c` | wave19 mass-chunk |
| ✅ MATCH | `R_ResetSunLightOverride` | 0x100257a0 | 371 | `src/f/100257a0_R_ResetSunLightOverride.c` | wave19 mass-chunk |
| ✅ MATCH | `R_FreeImageAllocations` | 0x10026a50 | 136 | `src/f/10026a50_R_FreeImageAllocations.c` | wave19 mass-chunk |
| ✅ MATCH | `R_BeginCubemapShot` | 0x10026a70 | 20 | `src/f/10026a70_R_BeginCubemapShot.c` | wave19 mass-chunk |
| ✅ MATCH | `R_SaveCubemapShot` | 0x100270e0 | 139 | `src/f/100270e0_R_SaveCubemapShot.c` | wave19 mass-chunk |
| ✅ MATCH | `R_ShutdownDebug` | 0x10032540 | 28 | `src/f/10032540_R_ShutdownDebug.c` | wave19 mass-chunk |
| ✅ MATCH | `R_IsGpuFenceFinished` | 0x10032d80 | 160 | `src/f/10032d80_R_IsGpuFenceFinished.c` | wave19 mass-chunk |
| ✅ MATCH | `FUN_100cb926` | 0x100cb926 | 3 | `src/f/100cb926_FUN_100cb926.c` | wave19 mass-chunk |
| ✅ MATCH | `__initptd` | 0x100fb101 | 19 | `src/f/100fb101___initptd.c` | wave19 mass-chunk |
| ✅ MATCH | `__initptd` | 0x100fb101 | 19 | `src/f/100fb101___initptd.c` | wave19 mass-chunk |

## wave20 (MASM byte-exact assembly)

| Status | Function | Address | Bytes | Source TU | Notes |
|--------|----------|---------|-------|-----------|-------|
| ✅ MATCH | `FUN_10002620` | 0x10002620 | 108 | `src/masm/10002620_FUN_10002620.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10002db0` | 0x10002db0 | 140 | `src/masm/10002db0_FUN_10002db0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10002e80` | 0x10002e80 | 72 | `src/masm/10002e80_FUN_10002e80.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10003f90` | 0x10003f90 | 226 | `src/masm/10003f90_FUN_10003f90.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100046e0` | 0x100046e0 | 68 | `src/masm/100046e0_FUN_100046e0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10004dc0` | 0x10004dc0 | 371 | `src/masm/10004dc0_FUN_10004dc0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10005440` | 0x10005440 | 197 | `src/masm/10005440_FUN_10005440.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10005680` | 0x10005680 | 131 | `src/masm/10005680_FUN_10005680.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10005820` | 0x10005820 | 143 | `src/masm/10005820_FUN_10005820.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100062a0` | 0x100062a0 | 95 | `src/masm/100062a0_FUN_100062a0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100092b0` | 0x100092b0 | 234 | `src/masm/100092b0_FUN_100092b0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10009690` | 0x10009690 | 55 | `src/masm/10009690_FUN_10009690.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10009700` | 0x10009700 | 58 | `src/masm/10009700_FUN_10009700.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10009820` | 0x10009820 | 156 | `src/masm/10009820_FUN_10009820.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10009a70` | 0x10009a70 | 184 | `src/masm/10009a70_FUN_10009a70.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1000a780` | 0x1000a780 | 72 | `src/masm/1000a780_FUN_1000a780.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1000c910` | 0x1000c910 | 87 | `src/masm/1000c910_FUN_1000c910.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1000d0f0` | 0x1000d0f0 | 74 | `src/masm/1000d0f0_FUN_1000d0f0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1000df90` | 0x1000df90 | 230 | `src/masm/1000df90_FUN_1000df90.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1000ee30` | 0x1000ee30 | 246 | `src/masm/1000ee30_FUN_1000ee30.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1000f020` | 0x1000f020 | 135 | `src/masm/1000f020_FUN_1000f020.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1000f180` | 0x1000f180 | 285 | `src/masm/1000f180_FUN_1000f180.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1000f350` | 0x1000f350 | 37 | `src/masm/1000f350_FUN_1000f350.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1000fb30` | 0x1000fb30 | 74 | `src/masm/1000fb30_FUN_1000fb30.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1000fbd0` | 0x1000fbd0 | 86 | `src/masm/1000fbd0_FUN_1000fbd0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1000fc30` | 0x1000fc30 | 169 | `src/masm/1000fc30_FUN_1000fc30.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1000fce0` | 0x1000fce0 | 119 | `src/masm/1000fce0_FUN_1000fce0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100100f0` | 0x100100f0 | 102 | `src/masm/100100f0_FUN_100100f0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10010ab0` | 0x10010ab0 | 43 | `src/masm/10010ab0_FUN_10010ab0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10010ae0` | 0x10010ae0 | 68 | `src/masm/10010ae0_FUN_10010ae0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10010b30` | 0x10010b30 | 99 | `src/masm/10010b30_FUN_10010b30.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10013950` | 0x10013950 | 236 | `src/masm/10013950_FUN_10013950.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10013e50` | 0x10013e50 | 56 | `src/masm/10013e50_FUN_10013e50.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10014040` | 0x10014040 | 90 | `src/masm/10014040_FUN_10014040.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10014f30` | 0x10014f30 | 131 | `src/masm/10014f30_FUN_10014f30.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100153f0` | 0x100153f0 | 376 | `src/masm/100153f0_FUN_100153f0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100171f0` | 0x100171f0 | 81 | `src/masm/100171f0_FUN_100171f0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100179a0` | 0x100179a0 | 230 | `src/masm/100179a0_FUN_100179a0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10018890` | 0x10018890 | 75 | `src/masm/10018890_FUN_10018890.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10019700` | 0x10019700 | 123 | `src/masm/10019700_FUN_10019700.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1001c3c0` | 0x1001c3c0 | 63 | `src/masm/1001c3c0_FUN_1001c3c0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1001ca80` | 0x1001ca80 | 320 | `src/masm/1001ca80_FUN_1001ca80.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1001e220` | 0x1001e220 | 50 | `src/masm/1001e220_FUN_1001e220.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1001ee00` | 0x1001ee00 | 105 | `src/masm/1001ee00_FUN_1001ee00.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1001f480` | 0x1001f480 | 65 | `src/masm/1001f480_FUN_1001f480.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1001f520` | 0x1001f520 | 135 | `src/masm/1001f520_FUN_1001f520.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1001ffc0` | 0x1001ffc0 | 484 | `src/masm/1001ffc0_FUN_1001ffc0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10020900` | 0x10020900 | 78 | `src/masm/10020900_FUN_10020900.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10020a70` | 0x10020a70 | 136 | `src/masm/10020a70_FUN_10020a70.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10021c80` | 0x10021c80 | 225 | `src/masm/10021c80_FUN_10021c80.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100227e1` | 0x100227e1 | 65 | `src/masm/100227e1_FUN_100227e1.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10024380` | 0x10024380 | 117 | `src/masm/10024380_FUN_10024380.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100244b0` | 0x100244b0 | 301 | `src/masm/100244b0_FUN_100244b0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10024920` | 0x10024920 | 156 | `src/masm/10024920_FUN_10024920.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100249c0` | 0x100249c0 | 97 | `src/masm/100249c0_FUN_100249c0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10025300` | 0x10025300 | 126 | `src/masm/10025300_FUN_10025300.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100259a0` | 0x100259a0 | 363 | `src/masm/100259a0_FUN_100259a0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100261b0` | 0x100261b0 | 138 | `src/masm/100261b0_FUN_100261b0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10028170` | 0x10028170 | 234 | `src/masm/10028170_FUN_10028170.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10028720` | 0x10028720 | 100 | `src/masm/10028720_FUN_10028720.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10029780` | 0x10029780 | 285 | `src/masm/10029780_FUN_10029780.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100298a0` | 0x100298a0 | 97 | `src/masm/100298a0_FUN_100298a0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1002a200` | 0x1002a200 | 69 | `src/masm/1002a200_FUN_1002a200.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1002a520` | 0x1002a520 | 67 | `src/masm/1002a520_FUN_1002a520.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1002a730` | 0x1002a730 | 79 | `src/masm/1002a730_FUN_1002a730.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1002ab90` | 0x1002ab90 | 87 | `src/masm/1002ab90_FUN_1002ab90.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1002b630` | 0x1002b630 | 82 | `src/masm/1002b630_FUN_1002b630.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1002b790` | 0x1002b790 | 82 | `src/masm/1002b790_FUN_1002b790.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1002c0b0` | 0x1002c0b0 | 78 | `src/masm/1002c0b0_FUN_1002c0b0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1002c850` | 0x1002c850 | 183 | `src/masm/1002c850_FUN_1002c850.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1002ce40` | 0x1002ce40 | 120 | `src/masm/1002ce40_FUN_1002ce40.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1002dcf0` | 0x1002dcf0 | 162 | `src/masm/1002dcf0_FUN_1002dcf0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1002df40` | 0x1002df40 | 82 | `src/masm/1002df40_FUN_1002df40.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1002e850` | 0x1002e850 | 393 | `src/masm/1002e850_FUN_1002e850.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1002ee80` | 0x1002ee80 | 368 | `src/masm/1002ee80_FUN_1002ee80.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1002f2a0` | 0x1002f2a0 | 140 | `src/masm/1002f2a0_FUN_1002f2a0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1002f900` | 0x1002f900 | 108 | `src/masm/1002f900_FUN_1002f900.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100302b0` | 0x100302b0 | 271 | `src/masm/100302b0_FUN_100302b0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100305d0` | 0x100305d0 | 212 | `src/masm/100305d0_FUN_100305d0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100308c0` | 0x100308c0 | 84 | `src/masm/100308c0_FUN_100308c0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10030a40` | 0x10030a40 | 111 | `src/masm/10030a40_FUN_10030a40.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10030b60` | 0x10030b60 | 60 | `src/masm/10030b60_FUN_10030b60.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10030ba0` | 0x10030ba0 | 111 | `src/masm/10030ba0_FUN_10030ba0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10030cd0` | 0x10030cd0 | 257 | `src/masm/10030cd0_FUN_10030cd0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10031420` | 0x10031420 | 70 | `src/masm/10031420_FUN_10031420.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10031cc0` | 0x10031cc0 | 91 | `src/masm/10031cc0_FUN_10031cc0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10032400` | 0x10032400 | 144 | `src/masm/10032400_FUN_10032400.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10032890` | 0x10032890 | 440 | `src/masm/10032890_FUN_10032890.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10034010` | 0x10034010 | 184 | `src/masm/10034010_FUN_10034010.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100345e0` | 0x100345e0 | 277 | `src/masm/100345e0_FUN_100345e0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10034840` | 0x10034840 | 170 | `src/masm/10034840_FUN_10034840.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10036040` | 0x10036040 | 188 | `src/masm/10036040_FUN_10036040.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100366b0` | 0x100366b0 | 100 | `src/masm/100366b0_FUN_100366b0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100376c0` | 0x100376c0 | 194 | `src/masm/100376c0_FUN_100376c0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10037790` | 0x10037790 | 94 | `src/masm/10037790_FUN_10037790.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100388f0` | 0x100388f0 | 39 | `src/masm/100388f0_FUN_100388f0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10038c00` | 0x10038c00 | 90 | `src/masm/10038c00_FUN_10038c00.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10039610` | 0x10039610 | 95 | `src/masm/10039610_FUN_10039610.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10039980` | 0x10039980 | 71 | `src/masm/10039980_FUN_10039980.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1003a690` | 0x1003a690 | 273 | `src/masm/1003a690_FUN_1003a690.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1003abd0` | 0x1003abd0 | 110 | `src/masm/1003abd0_FUN_1003abd0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1003e9b0` | 0x1003e9b0 | 101 | `src/masm/1003e9b0_FUN_1003e9b0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1003fae0` | 0x1003fae0 | 105 | `src/masm/1003fae0_FUN_1003fae0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1003fb50` | 0x1003fb50 | 72 | `src/masm/1003fb50_FUN_1003fb50.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10041030` | 0x10041030 | 121 | `src/masm/10041030_FUN_10041030.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10041390` | 0x10041390 | 38 | `src/masm/10041390_FUN_10041390.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100415f0` | 0x100415f0 | 153 | `src/masm/100415f0_FUN_100415f0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10041be0` | 0x10041be0 | 188 | `src/masm/10041be0_FUN_10041be0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10044520` | 0x10044520 | 195 | `src/masm/10044520_FUN_10044520.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10045ac0` | 0x10045ac0 | 70 | `src/masm/10045ac0_FUN_10045ac0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100463d0` | 0x100463d0 | 235 | `src/masm/100463d0_FUN_100463d0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10046690` | 0x10046690 | 396 | `src/masm/10046690_FUN_10046690.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10047b40` | 0x10047b40 | 45 | `src/masm/10047b40_FUN_10047b40.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10049fa0` | 0x10049fa0 | 393 | `src/masm/10049fa0_FUN_10049fa0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1004a5d0` | 0x1004a5d0 | 154 | `src/masm/1004a5d0_FUN_1004a5d0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1004a720` | 0x1004a720 | 96 | `src/masm/1004a720_FUN_1004a720.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1004a8a0` | 0x1004a8a0 | 105 | `src/masm/1004a8a0_FUN_1004a8a0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1004d350` | 0x1004d350 | 170 | `src/masm/1004d350_FUN_1004d350.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1004d460` | 0x1004d460 | 187 | `src/masm/1004d460_FUN_1004d460.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1004ebd0` | 0x1004ebd0 | 169 | `src/masm/1004ebd0_FUN_1004ebd0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1004f960` | 0x1004f960 | 128 | `src/masm/1004f960_FUN_1004f960.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1004fe50` | 0x1004fe50 | 341 | `src/masm/1004fe50_FUN_1004fe50.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10055000` | 0x10055000 | 167 | `src/masm/10055000_FUN_10055000.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100550b0` | 0x100550b0 | 104 | `src/masm/100550b0_FUN_100550b0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10055120` | 0x10055120 | 104 | `src/masm/10055120_FUN_10055120.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10055e00` | 0x10055e00 | 79 | `src/masm/10055e00_FUN_10055e00.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10056d80` | 0x10056d80 | 132 | `src/masm/10056d80_FUN_10056d80.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10057990` | 0x10057990 | 58 | `src/masm/10057990_FUN_10057990.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100588d0` | 0x100588d0 | 123 | `src/masm/100588d0_FUN_100588d0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10058f40` | 0x10058f40 | 100 | `src/masm/10058f40_FUN_10058f40.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10058fb0` | 0x10058fb0 | 253 | `src/masm/10058fb0_FUN_10058fb0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10059870` | 0x10059870 | 134 | `src/masm/10059870_FUN_10059870.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10059ee0` | 0x10059ee0 | 100 | `src/masm/10059ee0_FUN_10059ee0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10059f50` | 0x10059f50 | 167 | `src/masm/10059f50_FUN_10059f50.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1005a270` | 0x1005a270 | 209 | `src/masm/1005a270_FUN_1005a270.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1005c3f0` | 0x1005c3f0 | 115 | `src/masm/1005c3f0_FUN_1005c3f0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1005c470` | 0x1005c470 | 131 | `src/masm/1005c470_FUN_1005c470.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1005c800` | 0x1005c800 | 107 | `src/masm/1005c800_FUN_1005c800.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1005dc70` | 0x1005dc70 | 240 | `src/masm/1005dc70_FUN_1005dc70.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1005df00` | 0x1005df00 | 135 | `src/masm/1005df00_FUN_1005df00.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1005e5e0` | 0x1005e5e0 | 157 | `src/masm/1005e5e0_FUN_1005e5e0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1005ec20` | 0x1005ec20 | 170 | `src/masm/1005ec20_FUN_1005ec20.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10060350` | 0x10060350 | 68 | `src/masm/10060350_FUN_10060350.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10060950` | 0x10060950 | 83 | `src/masm/10060950_FUN_10060950.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100609b0` | 0x100609b0 | 53 | `src/masm/100609b0_FUN_100609b0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10060ad0` | 0x10060ad0 | 38 | `src/masm/10060ad0_FUN_10060ad0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10062301` | 0x10062301 | 226 | `src/masm/10062301_FUN_10062301.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100623e3` | 0x100623e3 | 228 | `src/masm/100623e3_FUN_100623e3.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100624c7` | 0x100624c7 | 229 | `src/masm/100624c7_FUN_100624c7.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100625ac` | 0x100625ac | 227 | `src/masm/100625ac_FUN_100625ac.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1006268f` | 0x1006268f | 305 | `src/masm/1006268f_FUN_1006268f.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100627c0` | 0x100627c0 | 305 | `src/masm/100627c0_FUN_100627c0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100628f1` | 0x100628f1 | 308 | `src/masm/100628f1_FUN_100628f1.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10062a25` | 0x10062a25 | 308 | `src/masm/10062a25_FUN_10062a25.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10062b59` | 0x10062b59 | 306 | `src/masm/10062b59_FUN_10062b59.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10062db3` | 0x10062db3 | 231 | `src/masm/10062db3_FUN_10062db3.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10062e9a` | 0x10062e9a | 114 | `src/masm/10062e9a_FUN_10062e9a.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10062f0c` | 0x10062f0c | 18 | `src/masm/10062f0c_FUN_10062f0c.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100635fe` | 0x100635fe | 190 | `src/masm/100635fe_FUN_100635fe.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10063884` | 0x10063884 | 129 | `src/masm/10063884_FUN_10063884.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10063905` | 0x10063905 | 111 | `src/masm/10063905_FUN_10063905.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10063a5c` | 0x10063a5c | 26 | `src/masm/10063a5c_FUN_10063a5c.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10063d5f` | 0x10063d5f | 59 | `src/masm/10063d5f_FUN_10063d5f.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10063db5` | 0x10063db5 | 26 | `src/masm/10063db5_FUN_10063db5.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10063df7` | 0x10063df7 | 26 | `src/masm/10063df7_FUN_10063df7.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10063e32` | 0x10063e32 | 68 | `src/masm/10063e32_FUN_10063e32.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10063e76` | 0x10063e76 | 47 | `src/masm/10063e76_FUN_10063e76.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10063ea5` | 0x10063ea5 | 64 | `src/masm/10063ea5_FUN_10063ea5.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10063f9f` | 0x10063f9f | 57 | `src/masm/10063f9f_FUN_10063f9f.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100642b5` | 0x100642b5 | 96 | `src/masm/100642b5_FUN_100642b5.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10064c94` | 0x10064c94 | 55 | `src/masm/10064c94_FUN_10064c94.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10064f37` | 0x10064f37 | 153 | `src/masm/10064f37_FUN_10064f37.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10064fd0` | 0x10064fd0 | 135 | `src/masm/10064fd0_FUN_10064fd0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1006512c` | 0x1006512c | 26 | `src/masm/1006512c_FUN_1006512c.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100651a5` | 0x100651a5 | 116 | `src/masm/100651a5_FUN_100651a5.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10066f3d` | 0x10066f3d | 126 | `src/masm/10066f3d_FUN_10066f3d.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10066fbb` | 0x10066fbb | 115 | `src/masm/10066fbb_FUN_10066fbb.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1006702e` | 0x1006702e | 112 | `src/masm/1006702e_FUN_1006702e.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100673e4` | 0x100673e4 | 92 | `src/masm/100673e4_FUN_100673e4.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10067460` | 0x10067460 | 49 | `src/masm/10067460_FUN_10067460.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10067491` | 0x10067491 | 29 | `src/masm/10067491_FUN_10067491.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10067634` | 0x10067634 | 90 | `src/masm/10067634_FUN_10067634.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1006771f` | 0x1006771f | 106 | `src/masm/1006771f_FUN_1006771f.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10067789` | 0x10067789 | 91 | `src/masm/10067789_FUN_10067789.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10067b01` | 0x10067b01 | 74 | `src/masm/10067b01_FUN_10067b01.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10067b4b` | 0x10067b4b | 137 | `src/masm/10067b4b_FUN_10067b4b.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10067bd4` | 0x10067bd4 | 106 | `src/masm/10067bd4_FUN_10067bd4.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10068533` | 0x10068533 | 67 | `src/masm/10068533_FUN_10068533.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100686c0` | 0x100686c0 | 451 | `src/masm/100686c0_FUN_100686c0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10068b85` | 0x10068b85 | 65 | `src/masm/10068b85_FUN_10068b85.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10068bc6` | 0x10068bc6 | 54 | `src/masm/10068bc6_FUN_10068bc6.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10068bfc` | 0x10068bfc | 42 | `src/masm/10068bfc_FUN_10068bfc.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100698e2` | 0x100698e2 | 41 | `src/masm/100698e2_FUN_100698e2.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1006a6ff` | 0x1006a6ff | 31 | `src/masm/1006a6ff_FUN_1006a6ff.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1006a777` | 0x1006a777 | 144 | `src/masm/1006a777_FUN_1006a777.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1006b268` | 0x1006b268 | 29 | `src/masm/1006b268_FUN_1006b268.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1006b285` | 0x1006b285 | 47 | `src/masm/1006b285_FUN_1006b285.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1006c34c` | 0x1006c34c | 27 | `src/masm/1006c34c_FUN_1006c34c.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1006c367` | 0x1006c367 | 27 | `src/masm/1006c367_FUN_1006c367.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1006c382` | 0x1006c382 | 27 | `src/masm/1006c382_FUN_1006c382.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1006c418` | 0x1006c418 | 32 | `src/masm/1006c418_FUN_1006c418.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1006c449` | 0x1006c449 | 99 | `src/masm/1006c449_FUN_1006c449.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1006c4ac` | 0x1006c4ac | 129 | `src/masm/1006c4ac_FUN_1006c4ac.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1006c52d` | 0x1006c52d | 57 | `src/masm/1006c52d_FUN_1006c52d.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1006c827` | 0x1006c827 | 163 | `src/masm/1006c827_FUN_1006c827.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1006d594` | 0x1006d594 | 69 | `src/masm/1006d594_FUN_1006d594.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1006d5d9` | 0x1006d5d9 | 404 | `src/masm/1006d5d9_FUN_1006d5d9.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1006d76d` | 0x1006d76d | 406 | `src/masm/1006d76d_FUN_1006d76d.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1006d903` | 0x1006d903 | 278 | `src/masm/1006d903_FUN_1006d903.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1006da19` | 0x1006da19 | 284 | `src/masm/1006da19_FUN_1006da19.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1006db35` | 0x1006db35 | 32 | `src/masm/1006db35_FUN_1006db35.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1006db55` | 0x1006db55 | 218 | `src/masm/1006db55_FUN_1006db55.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1006dc2f` | 0x1006dc2f | 114 | `src/masm/1006dc2f_FUN_1006dc2f.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1006dd5c` | 0x1006dd5c | 87 | `src/masm/1006dd5c_FUN_1006dd5c.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1006ddb3` | 0x1006ddb3 | 64 | `src/masm/1006ddb3_FUN_1006ddb3.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1006e16c` | 0x1006e16c | 131 | `src/masm/1006e16c_FUN_1006e16c.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1006e26a` | 0x1006e26a | 158 | `src/masm/1006e26a_FUN_1006e26a.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10070bef` | 0x10070bef | 309 | `src/masm/10070bef_FUN_10070bef.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1007107a` | 0x1007107a | 270 | `src/masm/1007107a_FUN_1007107a.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1007a504` | 0x1007a504 | 302 | `src/masm/1007a504_FUN_1007a504.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1007ce9d` | 0x1007ce9d | 257 | `src/masm/1007ce9d_FUN_1007ce9d.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1007d48d` | 0x1007d48d | 71 | `src/masm/1007d48d_FUN_1007d48d.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1007d4d4` | 0x1007d4d4 | 65 | `src/masm/1007d4d4_FUN_1007d4d4.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1007d733` | 0x1007d733 | 187 | `src/masm/1007d733_FUN_1007d733.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1007d82f` | 0x1007d82f | 29 | `src/masm/1007d82f_FUN_1007d82f.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1007d84c` | 0x1007d84c | 29 | `src/masm/1007d84c_FUN_1007d84c.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1007d869` | 0x1007d869 | 113 | `src/masm/1007d869_FUN_1007d869.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1007d8da` | 0x1007d8da | 142 | `src/masm/1007d8da_FUN_1007d8da.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1007da77` | 0x1007da77 | 33 | `src/masm/1007da77_FUN_1007da77.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1007dbc1` | 0x1007dbc1 | 51 | `src/masm/1007dbc1_FUN_1007dbc1.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1007e079` | 0x1007e079 | 43 | `src/masm/1007e079_FUN_1007e079.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1007e0a4` | 0x1007e0a4 | 33 | `src/masm/1007e0a4_FUN_1007e0a4.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1007e0e2` | 0x1007e0e2 | 44 | `src/masm/1007e0e2_FUN_1007e0e2.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1007e10e` | 0x1007e10e | 44 | `src/masm/1007e10e_FUN_1007e10e.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1007e162` | 0x1007e162 | 44 | `src/masm/1007e162_FUN_1007e162.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1007e18e` | 0x1007e18e | 44 | `src/masm/1007e18e_FUN_1007e18e.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1007e1e2` | 0x1007e1e2 | 44 | `src/masm/1007e1e2_FUN_1007e1e2.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1007e20e` | 0x1007e20e | 44 | `src/masm/1007e20e_FUN_1007e20e.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1007e262` | 0x1007e262 | 44 | `src/masm/1007e262_FUN_1007e262.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1007e28e` | 0x1007e28e | 44 | `src/masm/1007e28e_FUN_1007e28e.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1008103e` | 0x1008103e | 36 | `src/masm/1008103e_FUN_1008103e.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100813b7` | 0x100813b7 | 36 | `src/masm/100813b7_FUN_100813b7.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100813db` | 0x100813db | 139 | `src/masm/100813db_FUN_100813db.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10081466` | 0x10081466 | 56 | `src/masm/10081466_FUN_10081466.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1008149e` | 0x1008149e | 80 | `src/masm/1008149e_FUN_1008149e.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100814ee` | 0x100814ee | 96 | `src/masm/100814ee_FUN_100814ee.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1008154e` | 0x1008154e | 61 | `src/masm/1008154e_FUN_1008154e.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1008158b` | 0x1008158b | 82 | `src/masm/1008158b_FUN_1008158b.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100815dd` | 0x100815dd | 76 | `src/masm/100815dd_FUN_100815dd.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10081629` | 0x10081629 | 76 | `src/masm/10081629_FUN_10081629.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10081675` | 0x10081675 | 76 | `src/masm/10081675_FUN_10081675.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100816c1` | 0x100816c1 | 76 | `src/masm/100816c1_FUN_100816c1.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1008170d` | 0x1008170d | 76 | `src/masm/1008170d_FUN_1008170d.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10081759` | 0x10081759 | 76 | `src/masm/10081759_FUN_10081759.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100817a5` | 0x100817a5 | 75 | `src/masm/100817a5_FUN_100817a5.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100817f0` | 0x100817f0 | 76 | `src/masm/100817f0_FUN_100817f0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1008183c` | 0x1008183c | 75 | `src/masm/1008183c_FUN_1008183c.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10081887` | 0x10081887 | 76 | `src/masm/10081887_FUN_10081887.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100818d3` | 0x100818d3 | 76 | `src/masm/100818d3_FUN_100818d3.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1008191f` | 0x1008191f | 75 | `src/masm/1008191f_FUN_1008191f.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1008196a` | 0x1008196a | 76 | `src/masm/1008196a_FUN_1008196a.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100819b6` | 0x100819b6 | 76 | `src/masm/100819b6_FUN_100819b6.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10081a12` | 0x10081a12 | 44 | `src/masm/10081a12_FUN_10081a12.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10081a93` | 0x10081a93 | 92 | `src/masm/10081a93_FUN_10081a93.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10081b2b` | 0x10081b2b | 54 | `src/masm/10081b2b_FUN_10081b2b.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10081b61` | 0x10081b61 | 41 | `src/masm/10081b61_FUN_10081b61.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10081eec` | 0x10081eec | 42 | `src/masm/10081eec_FUN_10081eec.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10081f16` | 0x10081f16 | 42 | `src/masm/10081f16_FUN_10081f16.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100822b1` | 0x100822b1 | 29 | `src/masm/100822b1_FUN_100822b1.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100822f6` | 0x100822f6 | 14 | `src/masm/100822f6_FUN_100822f6.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10082304` | 0x10082304 | 33 | `src/masm/10082304_FUN_10082304.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10082325` | 0x10082325 | 144 | `src/masm/10082325_FUN_10082325.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100823c7` | 0x100823c7 | 318 | `src/masm/100823c7_FUN_100823c7.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10082505` | 0x10082505 | 240 | `src/masm/10082505_FUN_10082505.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100825f5` | 0x100825f5 | 67 | `src/masm/100825f5_FUN_100825f5.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10082638` | 0x10082638 | 11 | `src/masm/10082638_FUN_10082638.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1008269b` | 0x1008269b | 34 | `src/masm/1008269b_FUN_1008269b.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100827da` | 0x100827da | 27 | `src/masm/100827da_FUN_100827da.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100827f5` | 0x100827f5 | 33 | `src/masm/100827f5_FUN_100827f5.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10082816` | 0x10082816 | 25 | `src/masm/10082816_FUN_10082816.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1008282f` | 0x1008282f | 41 | `src/masm/1008282f_FUN_1008282f.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1008289e` | 0x1008289e | 93 | `src/masm/1008289e_FUN_1008289e.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10082948` | 0x10082948 | 80 | `src/masm/10082948_FUN_10082948.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10082999` | 0x10082999 | 208 | `src/masm/10082999_FUN_10082999.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10082aa4` | 0x10082aa4 | 39 | `src/masm/10082aa4_FUN_10082aa4.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10082b1e` | 0x10082b1e | 67 | `src/masm/10082b1e_FUN_10082b1e.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10082bbd` | 0x10082bbd | 96 | `src/masm/10082bbd_FUN_10082bbd.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10082c8c` | 0x10082c8c | 120 | `src/masm/10082c8c_FUN_10082c8c.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10082d4e` | 0x10082d4e | 73 | `src/masm/10082d4e_FUN_10082d4e.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10082ddb` | 0x10082ddb | 51 | `src/masm/10082ddb_FUN_10082ddb.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10082e6e` | 0x10082e6e | 69 | `src/masm/10082e6e_FUN_10082e6e.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10082f4a` | 0x10082f4a | 192 | `src/masm/10082f4a_FUN_10082f4a.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1008309e` | 0x1008309e | 186 | `src/masm/1008309e_FUN_1008309e.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100831b4` | 0x100831b4 | 103 | `src/masm/100831b4_FUN_100831b4.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100832a4` | 0x100832a4 | 127 | `src/masm/100832a4_FUN_100832a4.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100834b8` | 0x100834b8 | 81 | `src/masm/100834b8_FUN_100834b8.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10083553` | 0x10083553 | 80 | `src/masm/10083553_FUN_10083553.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100835f3` | 0x100835f3 | 66 | `src/masm/100835f3_FUN_100835f3.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10083676` | 0x10083676 | 65 | `src/masm/10083676_FUN_10083676.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100836d8` | 0x100836d8 | 121 | `src/masm/100836d8_FUN_100836d8.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100839cd` | 0x100839cd | 65 | `src/masm/100839cd_FUN_100839cd.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10083aeb` | 0x10083aeb | 324 | `src/masm/10083aeb_FUN_10083aeb.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10083cb4` | 0x10083cb4 | 169 | `src/masm/10083cb4_FUN_10083cb4.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10083d5d` | 0x10083d5d | 105 | `src/masm/10083d5d_FUN_10083d5d.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100840a3` | 0x100840a3 | 56 | `src/masm/100840a3_FUN_100840a3.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100840db` | 0x100840db | 313 | `src/masm/100840db_FUN_100840db.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10084323` | 0x10084323 | 195 | `src/masm/10084323_FUN_10084323.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10084e61` | 0x10084e61 | 146 | `src/masm/10084e61_FUN_10084e61.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10084ef3` | 0x10084ef3 | 146 | `src/masm/10084ef3_FUN_10084ef3.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10084f85` | 0x10084f85 | 149 | `src/masm/10084f85_FUN_10084f85.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1008501a` | 0x1008501a | 149 | `src/masm/1008501a_FUN_1008501a.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100850af` | 0x100850af | 147 | `src/masm/100850af_FUN_100850af.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100853b0` | 0x100853b0 | 31 | `src/masm/100853b0_FUN_100853b0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1008540c` | 0x1008540c | 51 | `src/masm/1008540c_FUN_1008540c.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1008543f` | 0x1008543f | 42 | `src/masm/1008543f_FUN_1008543f.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10085469` | 0x10085469 | 49 | `src/masm/10085469_FUN_10085469.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1008549a` | 0x1008549a | 56 | `src/masm/1008549a_FUN_1008549a.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100854d2` | 0x100854d2 | 88 | `src/masm/100854d2_FUN_100854d2.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1008552a` | 0x1008552a | 134 | `src/masm/1008552a_FUN_1008552a.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100855b0` | 0x100855b0 | 56 | `src/masm/100855b0_FUN_100855b0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100855e8` | 0x100855e8 | 28 | `src/masm/100855e8_FUN_100855e8.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10085604` | 0x10085604 | 359 | `src/masm/10085604_FUN_10085604.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1008576b` | 0x1008576b | 116 | `src/masm/1008576b_FUN_1008576b.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10085814` | 0x10085814 | 45 | `src/masm/10085814_FUN_10085814.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10085841` | 0x10085841 | 30 | `src/masm/10085841_FUN_10085841.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10085abe` | 0x10085abe | 180 | `src/masm/10085abe_FUN_10085abe.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10085c65` | 0x10085c65 | 188 | `src/masm/10085c65_FUN_10085c65.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10085d21` | 0x10085d21 | 61 | `src/masm/10085d21_FUN_10085d21.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10085d76` | 0x10085d76 | 45 | `src/masm/10085d76_FUN_10085d76.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10085da3` | 0x10085da3 | 30 | `src/masm/10085da3_FUN_10085da3.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100860e0` | 0x100860e0 | 89 | `src/masm/100860e0_FUN_100860e0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10086139` | 0x10086139 | 96 | `src/masm/10086139_FUN_10086139.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10086199` | 0x10086199 | 87 | `src/masm/10086199_FUN_10086199.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100861f0` | 0x100861f0 | 80 | `src/masm/100861f0_FUN_100861f0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10086240` | 0x10086240 | 82 | `src/masm/10086240_FUN_10086240.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10086292` | 0x10086292 | 79 | `src/masm/10086292_FUN_10086292.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100863a0` | 0x100863a0 | 210 | `src/masm/100863a0_FUN_100863a0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100864e9` | 0x100864e9 | 79 | `src/masm/100864e9_FUN_100864e9.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10086538` | 0x10086538 | 142 | `src/masm/10086538_FUN_10086538.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100865c6` | 0x100865c6 | 26 | `src/masm/100865c6_FUN_100865c6.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100865e0` | 0x100865e0 | 59 | `src/masm/100865e0_FUN_100865e0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10086858` | 0x10086858 | 65 | `src/masm/10086858_FUN_10086858.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10086899` | 0x10086899 | 56 | `src/masm/10086899_FUN_10086899.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100868d1` | 0x100868d1 | 33 | `src/masm/100868d1_FUN_100868d1.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100868f2` | 0x100868f2 | 46 | `src/masm/100868f2_FUN_100868f2.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10086920` | 0x10086920 | 279 | `src/masm/10086920_FUN_10086920.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10086b14` | 0x10086b14 | 106 | `src/masm/10086b14_FUN_10086b14.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10086c69` | 0x10086c69 | 31 | `src/masm/10086c69_FUN_10086c69.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10086c88` | 0x10086c88 | 33 | `src/masm/10086c88_FUN_10086c88.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10086ca9` | 0x10086ca9 | 95 | `src/masm/10086ca9_FUN_10086ca9.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10086d6c` | 0x10086d6c | 273 | `src/masm/10086d6c_FUN_10086d6c.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10086e7d` | 0x10086e7d | 49 | `src/masm/10086e7d_FUN_10086e7d.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10086f0d` | 0x10086f0d | 59 | `src/masm/10086f0d_FUN_10086f0d.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100872f1` | 0x100872f1 | 258 | `src/masm/100872f1_FUN_100872f1.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10087a5d` | 0x10087a5d | 221 | `src/masm/10087a5d_FUN_10087a5d.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10088445` | 0x10088445 | 45 | `src/masm/10088445_FUN_10088445.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10088472` | 0x10088472 | 165 | `src/masm/10088472_FUN_10088472.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10089348` | 0x10089348 | 178 | `src/masm/10089348_FUN_10089348.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100896fc` | 0x100896fc | 78 | `src/masm/100896fc_FUN_100896fc.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1008974a` | 0x1008974a | 128 | `src/masm/1008974a_FUN_1008974a.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10089d4b` | 0x10089d4b | 106 | `src/masm/10089d4b_FUN_10089d4b.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1008a09a` | 0x1008a09a | 181 | `src/masm/1008a09a_FUN_1008a09a.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1008a646` | 0x1008a646 | 38 | `src/masm/1008a646_FUN_1008a646.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1008a7ee` | 0x1008a7ee | 94 | `src/masm/1008a7ee_FUN_1008a7ee.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1008a84c` | 0x1008a84c | 98 | `src/masm/1008a84c_FUN_1008a84c.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1008a8ae` | 0x1008a8ae | 203 | `src/masm/1008a8ae_FUN_1008a8ae.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1008ac46` | 0x1008ac46 | 141 | `src/masm/1008ac46_FUN_1008ac46.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1008af0b` | 0x1008af0b | 25 | `src/masm/1008af0b_FUN_1008af0b.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1008af24` | 0x1008af24 | 224 | `src/masm/1008af24_FUN_1008af24.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1008b00e` | 0x1008b00e | 16 | `src/masm/1008b00e_FUN_1008b00e.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1008b352` | 0x1008b352 | 44 | `src/masm/1008b352_FUN_1008b352.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1008be66` | 0x1008be66 | 94 | `src/masm/1008be66_FUN_1008be66.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1008d884` | 0x1008d884 | 129 | `src/masm/1008d884_FUN_1008d884.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1008d905` | 0x1008d905 | 97 | `src/masm/1008d905_FUN_1008d905.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1009295e` | 0x1009295e | 47 | `src/masm/1009295e_FUN_1009295e.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1009935c` | 0x1009935c | 61 | `src/masm/1009935c_FUN_1009935c.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100997e2` | 0x100997e2 | 100 | `src/masm/100997e2_FUN_100997e2.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100998ff` | 0x100998ff | 20 | `src/masm/100998ff_FUN_100998ff.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10099913` | 0x10099913 | 12 | `src/masm/10099913_FUN_10099913.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10099ab4` | 0x10099ab4 | 36 | `src/masm/10099ab4_FUN_10099ab4.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10099bdd` | 0x10099bdd | 178 | `src/masm/10099bdd_FUN_10099bdd.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1009a36a` | 0x1009a36a | 94 | `src/masm/1009a36a_FUN_1009a36a.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1009a3ce` | 0x1009a3ce | 124 | `src/masm/1009a3ce_FUN_1009a3ce.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1009a44a` | 0x1009a44a | 286 | `src/masm/1009a44a_FUN_1009a44a.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1009a568` | 0x1009a568 | 72 | `src/masm/1009a568_FUN_1009a568.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1009b381` | 0x1009b381 | 271 | `src/masm/1009b381_FUN_1009b381.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1009b490` | 0x1009b490 | 291 | `src/masm/1009b490_FUN_1009b490.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1009bccf` | 0x1009bccf | 254 | `src/masm/1009bccf_FUN_1009bccf.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1009bee5` | 0x1009bee5 | 132 | `src/masm/1009bee5_FUN_1009bee5.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1009c8b6` | 0x1009c8b6 | 316 | `src/masm/1009c8b6_FUN_1009c8b6.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1009c9f2` | 0x1009c9f2 | 95 | `src/masm/1009c9f2_FUN_1009c9f2.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1009ca51` | 0x1009ca51 | 115 | `src/masm/1009ca51_FUN_1009ca51.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100a07e3` | 0x100a07e3 | 89 | `src/masm/100a07e3_FUN_100a07e3.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100a482d` | 0x100a482d | 174 | `src/masm/100a482d_FUN_100a482d.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100a5a4f` | 0x100a5a4f | 147 | `src/masm/100a5a4f_FUN_100a5a4f.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100a6002` | 0x100a6002 | 57 | `src/masm/100a6002_FUN_100a6002.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100a6e19` | 0x100a6e19 | 61 | `src/masm/100a6e19_FUN_100a6e19.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100a7df5` | 0x100a7df5 | 107 | `src/masm/100a7df5_FUN_100a7df5.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100a7e60` | 0x100a7e60 | 104 | `src/masm/100a7e60_FUN_100a7e60.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100a97cd` | 0x100a97cd | 90 | `src/masm/100a97cd_FUN_100a97cd.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100a9827` | 0x100a9827 | 312 | `src/masm/100a9827_FUN_100a9827.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100ab063` | 0x100ab063 | 125 | `src/masm/100ab063_FUN_100ab063.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100ab0e0` | 0x100ab0e0 | 249 | `src/masm/100ab0e0_FUN_100ab0e0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100ab7e6` | 0x100ab7e6 | 142 | `src/masm/100ab7e6_FUN_100ab7e6.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100ab874` | 0x100ab874 | 99 | `src/masm/100ab874_FUN_100ab874.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100abfd6` | 0x100abfd6 | 104 | `src/masm/100abfd6_FUN_100abfd6.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100ac840` | 0x100ac840 | 308 | `src/masm/100ac840_FUN_100ac840.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100ac974` | 0x100ac974 | 71 | `src/masm/100ac974_FUN_100ac974.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100ad87a` | 0x100ad87a | 126 | `src/masm/100ad87a_FUN_100ad87a.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100ae879` | 0x100ae879 | 248 | `src/masm/100ae879_FUN_100ae879.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100ae971` | 0x100ae971 | 353 | `src/masm/100ae971_FUN_100ae971.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100afe3a` | 0x100afe3a | 29 | `src/masm/100afe3a_FUN_100afe3a.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100afe7d` | 0x100afe7d | 79 | `src/masm/100afe7d_FUN_100afe7d.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100afecc` | 0x100afecc | 69 | `src/masm/100afecc_FUN_100afecc.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100b0384` | 0x100b0384 | 94 | `src/masm/100b0384_FUN_100b0384.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100b03e2` | 0x100b03e2 | 98 | `src/masm/100b03e2_FUN_100b03e2.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100b59f1` | 0x100b59f1 | 98 | `src/masm/100b59f1_FUN_100b59f1.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100b80be` | 0x100b80be | 98 | `src/masm/100b80be_FUN_100b80be.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100b8143` | 0x100b8143 | 57 | `src/masm/100b8143_FUN_100b8143.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100b872e` | 0x100b872e | 56 | `src/masm/100b872e_FUN_100b872e.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100b895e` | 0x100b895e | 103 | `src/masm/100b895e_FUN_100b895e.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100b9661` | 0x100b9661 | 57 | `src/masm/100b9661_FUN_100b9661.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100b9975` | 0x100b9975 | 58 | `src/masm/100b9975_FUN_100b9975.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100b9e11` | 0x100b9e11 | 117 | `src/masm/100b9e11_FUN_100b9e11.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100b9ffd` | 0x100b9ffd | 70 | `src/masm/100b9ffd_FUN_100b9ffd.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100ba043` | 0x100ba043 | 70 | `src/masm/100ba043_FUN_100ba043.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100ba089` | 0x100ba089 | 70 | `src/masm/100ba089_FUN_100ba089.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100ba0cf` | 0x100ba0cf | 70 | `src/masm/100ba0cf_FUN_100ba0cf.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100bb114` | 0x100bb114 | 178 | `src/masm/100bb114_FUN_100bb114.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100be137` | 0x100be137 | 81 | `src/masm/100be137_FUN_100be137.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100beac6` | 0x100beac6 | 231 | `src/masm/100beac6_FUN_100beac6.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100c1571` | 0x100c1571 | 279 | `src/masm/100c1571_FUN_100c1571.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100c1978` | 0x100c1978 | 112 | `src/masm/100c1978_FUN_100c1978.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100c229a` | 0x100c229a | 77 | `src/masm/100c229a_FUN_100c229a.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100c24e3` | 0x100c24e3 | 317 | `src/masm/100c24e3_FUN_100c24e3.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100c2985` | 0x100c2985 | 157 | `src/masm/100c2985_FUN_100c2985.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100c2a22` | 0x100c2a22 | 54 | `src/masm/100c2a22_FUN_100c2a22.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100c2a58` | 0x100c2a58 | 54 | `src/masm/100c2a58_FUN_100c2a58.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100c3c29` | 0x100c3c29 | 355 | `src/masm/100c3c29_FUN_100c3c29.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100c3da3` | 0x100c3da3 | 99 | `src/masm/100c3da3_FUN_100c3da3.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100c40ff` | 0x100c40ff | 168 | `src/masm/100c40ff_FUN_100c40ff.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100c4a15` | 0x100c4a15 | 118 | `src/masm/100c4a15_FUN_100c4a15.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100c5108` | 0x100c5108 | 30 | `src/masm/100c5108_FUN_100c5108.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100c6123` | 0x100c6123 | 64 | `src/masm/100c6123_FUN_100c6123.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100c6163` | 0x100c6163 | 122 | `src/masm/100c6163_FUN_100c6163.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100c7450` | 0x100c7450 | 160 | `src/masm/100c7450_FUN_100c7450.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100c74f0` | 0x100c74f0 | 413 | `src/masm/100c74f0_FUN_100c74f0.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100c7b3a` | 0x100c7b3a | 48 | `src/masm/100c7b3a_FUN_100c7b3a.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100c8c80` | 0x100c8c80 | 79 | `src/masm/100c8c80_FUN_100c8c80.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100c98b1` | 0x100c98b1 | 262 | `src/masm/100c98b1_FUN_100c98b1.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100c99b7` | 0x100c99b7 | 23 | `src/masm/100c99b7_FUN_100c99b7.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100c99ce` | 0x100c99ce | 70 | `src/masm/100c99ce_FUN_100c99ce.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100c9a14` | 0x100c9a14 | 107 | `src/masm/100c9a14_FUN_100c9a14.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100cad4d` | 0x100cad4d | 114 | `src/masm/100cad4d_FUN_100cad4d.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100cb92a` | 0x100cb92a | 72 | `src/masm/100cb92a_FUN_100cb92a.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100cb972` | 0x100cb972 | 101 | `src/masm/100cb972_FUN_100cb972.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100cbab5` | 0x100cbab5 | 64 | `src/masm/100cbab5_FUN_100cbab5.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100cbaf5` | 0x100cbaf5 | 38 | `src/masm/100cbaf5_FUN_100cbaf5.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100cbb65` | 0x100cbb65 | 71 | `src/masm/100cbb65_FUN_100cbb65.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100cbbac` | 0x100cbbac | 26 | `src/masm/100cbbac_FUN_100cbbac.asm` | wave20 MASM |
| ✅ MATCH | `_StringCopyWorkerA@12` | 0x100cc691 | 61 | `src/masm/100cc691__StringCopyWorkerA@12.asm` | wave20 MASM |
| ✅ MATCH | `_StringCopyWorkerW@12` | 0x100cc6ce | 68 | `src/masm/100cc6ce__StringCopyWorkerW@12.asm` | wave20 MASM |
| ✅ MATCH | `_StringVPrintfWorkerW@16` | 0x100cc75e | 77 | `src/masm/100cc75e__StringVPrintfWorkerW@16.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100cc7ab` | 0x100cc7ab | 55 | `src/masm/100cc7ab_FUN_100cc7ab.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100cc7e2` | 0x100cc7e2 | 57 | `src/masm/100cc7e2_FUN_100cc7e2.asm` | wave20 MASM |
| ✅ MATCH | `_StringCchPrintfW` | 0x100f5871 | 41 | `src/masm/100f5871__StringCchPrintfW.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100f589a` | 0x100f589a | 35 | `src/masm/100f589a_FUN_100f589a.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100f58bd` | 0x100f58bd | 35 | `src/masm/100f58bd_FUN_100f58bd.asm` | wave20 MASM |
| ✅ MATCH | `__abstract_cw` | 0x100f5fc8 | 146 | `src/masm/100f5fc8___abstract_cw.asm` | wave20 MASM |
| ✅ MATCH | `__hw_cw` | 0x100f605a | 142 | `src/masm/100f605a___hw_cw.asm` | wave20 MASM |
| ✅ MATCH | `__fflush_lk` | 0x100f6b3a | 46 | `src/masm/100f6b3a___fflush_lk.asm` | wave20 MASM |
| ✅ MATCH | `__fclose_lk` | 0x100f703d | 76 | `src/masm/100f703d___fclose_lk.asm` | wave20 MASM |
| ✅ MATCH | `__fwrite_lk` | 0x100f70da | 263 | `src/masm/100f70da___fwrite_lk.asm` | wave20 MASM |
| ✅ MATCH | `___toupper_mt` | 0x100f7235 | 201 | `src/masm/100f7235____toupper_mt.asm` | wave20 MASM |
| ✅ MATCH | `_toupper` | 0x100f72fe | 34 | `src/masm/100f72fe__toupper.asm` | wave20 MASM |
| ✅ MATCH | `_atol` | 0x100f73a7 | 136 | `src/masm/100f73a7__atol.asm` | wave20 MASM |
| ✅ MATCH | `___tolower_mt` | 0x100f74e3 | 200 | `src/masm/100f74e3____tolower_mt.asm` | wave20 MASM |
| ✅ MATCH | `_tolower` | 0x100f75ab | 34 | `src/masm/100f75ab__tolower.asm` | wave20 MASM |
| ✅ MATCH | `__CRT_INIT@12` | 0x100f75cd | 385 | `src/masm/100f75cd___CRT_INIT@12.asm` | wave20 MASM |
| ✅ MATCH | `__amsg_exit` | 0x100f7832 | 48 | `src/masm/100f7832___amsg_exit.asm` | wave20 MASM |
| ✅ MATCH | `__stricmp` | 0x100f78cf | 105 | `src/masm/100f78cf___stricmp.asm` | wave20 MASM |
| ✅ MATCH | `__fpmath` | 0x100f7981 | 30 | `src/masm/100f7981___fpmath.asm` | wave20 MASM |
| ✅ MATCH | `__strdup` | 0x100f799f | 43 | `src/masm/100f799f___strdup.asm` | wave20 MASM |
| ✅ MATCH | `___freetlocinfo` | 0x100f79d6 | 208 | `src/masm/100f79d6____freetlocinfo.asm` | wave20 MASM |
| ✅ MATCH | `__strcats` | 0x100f7b6a | 36 | `src/masm/100f7b6a___strcats.asm` | wave20 MASM |
| ✅ MATCH | `_isalpha` | 0x100f8541 | 63 | `src/masm/100f8541__isalpha.asm` | wave20 MASM |
| ✅ MATCH | `_isdigit` | 0x100f85f4 | 58 | `src/masm/100f85f4__isdigit.asm` | wave20 MASM |
| ✅ MATCH | `_isxdigit` | 0x100f862e | 63 | `src/masm/100f862e__isxdigit.asm` | wave20 MASM |
| ✅ MATCH | `_isspace` | 0x100f866d | 58 | `src/masm/100f866d__isspace.asm` | wave20 MASM |
| ✅ MATCH | `_isalnum` | 0x100f86e1 | 63 | `src/masm/100f86e1__isalnum.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100f88ca` | 0x100f88ca | 235 | `src/masm/100f88ca_FUN_100f88ca.asm` | wave20 MASM |
| ✅ MATCH | `__isnan` | 0x100f8c6d | 46 | `src/masm/100f8c6d___isnan.asm` | wave20 MASM |
| ✅ MATCH | `__fpclass` | 0x100f8c9b | 156 | `src/masm/100f8c9b___fpclass.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100f9142` | 0x100f9142 | 40 | `src/masm/100f9142_FUN_100f9142.asm` | wave20 MASM |
| ✅ MATCH | `__inc` | 0x100f9442 | 22 | `src/masm/100f9442___inc.asm` | wave20 MASM |
| ✅ MATCH | `__fltin2` | 0x100fa28b | 149 | `src/masm/100fa28b___fltin2.asm` | wave20 MASM |
| ✅ MATCH | `write_char` | 0x100fa439 | 51 | `src/masm/100fa439_write_char.asm` | wave20 MASM |
| ✅ MATCH | `write_multi_char` | 0x100fa46c | 36 | `src/masm/100fa46c_write_multi_char.asm` | wave20 MASM |
| ✅ MATCH | `write_string` | 0x100fa490 | 55 | `src/masm/100fa490_write_string.asm` | wave20 MASM |
| ✅ MATCH | `__freeptd` | 0x100fb2cc | 47 | `src/masm/100fb2cc___freeptd.asm` | wave20 MASM |
| ✅ MATCH | `__lock_file2` | 0x100fb4e8 | 35 | `src/masm/100fb4e8___lock_file2.asm` | wave20 MASM |
| ✅ MATCH | `__unlock_file2` | 0x100fb53a | 35 | `src/masm/100fb53a___unlock_file2.asm` | wave20 MASM |
| ✅ MATCH | `__ftbuf` | 0x100fb5e5 | 42 | `src/masm/100fb5e5___ftbuf.asm` | wave20 MASM |
| ✅ MATCH | `__floor_default` | 0x100fbb0a | 211 | `src/masm/100fbb0a___floor_default.asm` | wave20 MASM |
| ✅ MATCH | `__isindst_lk` | 0x100fc8d6 | 391 | `src/masm/100fc8d6___isindst_lk.asm` | wave20 MASM |
| ✅ MATCH | `__aulldiv` | 0x100fcc30 | 104 | `src/masm/100fcc30___aulldiv.asm` | wave20 MASM |
| ✅ MATCH | `___isctype_mt` | 0x100fd505 | 119 | `src/masm/100fd505____isctype_mt.asm` | wave20 MASM |
| ✅ MATCH | `__allmul` | 0x100fd5b0 | 52 | `src/masm/100fd5b0___allmul.asm` | wave20 MASM |
| ✅ MATCH | `__initterm` | 0x100fd626 | 24 | `src/masm/100fd626___initterm.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100fd775` | 0x100fd775 | 14 | `src/masm/100fd775_FUN_100fd775.asm` | wave20 MASM |
| ✅ MATCH | `__FF_MSGBANNER` | 0x100fe38f | 57 | `src/masm/100fe38f___FF_MSGBANNER.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100fe41e` | 0x100fe41e | 60 | `src/masm/100fe41e_FUN_100fe41e.asm` | wave20 MASM |
| ✅ MATCH | `__fassign` | 0x100fe4bf | 62 | `src/masm/100fe4bf___fassign.asm` | wave20 MASM |
| ✅ MATCH | `__shift` | 0x100fe4fd | 29 | `src/masm/100fe4fd___shift.asm` | wave20 MASM |
| ✅ MATCH | `__cftof2` | 0x100fe634 | 156 | `src/masm/100fe634___cftof2.asm` | wave20 MASM |
| ✅ MATCH | `__cftog` | 0x100fe732 | 154 | `src/masm/100fe732___cftog.asm` | wave20 MASM |
| ✅ MATCH | `__cfltcvt` | 0x100fe7cc | 81 | `src/masm/100fe7cc___cfltcvt.asm` | wave20 MASM |
| ✅ MATCH | `__ms_p5_test_fdiv` | 0x100fe81d | 64 | `src/masm/100fe81d___ms_p5_test_fdiv.asm` | wave20 MASM |
| ✅ MATCH | `FUN_100fe8a0` | 0x100fe8a0 | 232 | `src/masm/100fe8a0_FUN_100fe8a0.asm` | wave20 MASM |
| ✅ MATCH | `__store_str` | 0x100feccf | 32 | `src/masm/100feccf___store_str.asm` | wave20 MASM |
| ✅ MATCH | `__Strftime_mt` | 0x100ff48e | 197 | `src/masm/100ff48e___Strftime_mt.asm` | wave20 MASM |
| ✅ MATCH | `__Strftime` | 0x100ff553 | 50 | `src/masm/100ff553___Strftime.asm` | wave20 MASM |
| ✅ MATCH | `___free_lconv_num` | 0x100ffb3b | 95 | `src/masm/100ffb3b____free_lconv_num.asm` | wave20 MASM |
| ✅ MATCH | `___free_lconv_mon` | 0x100ffd9a | 217 | `src/masm/100ffd9a____free_lconv_mon.asm` | wave20 MASM |
| ✅ MATCH | `_TranslateName` | 0x10100428 | 96 | `src/masm/10100428__TranslateName.asm` | wave20 MASM |
| ✅ MATCH | `_LcidFromHexString` | 0x10100619 | 53 | `src/masm/10100619__LcidFromHexString.asm` | wave20 MASM |
| ✅ MATCH | `_GetPrimaryLen` | 0x1010064e | 29 | `src/masm/1010064e__GetPrimaryLen.asm` | wave20 MASM |
| ✅ MATCH | `_CountryEnumProc@4` | 0x1010066b | 148 | `src/masm/1010066b__CountryEnumProc@4.asm` | wave20 MASM |
| ✅ MATCH | `_TestDefaultLanguage` | 0x101006ff | 113 | `src/masm/101006ff__TestDefaultLanguage.asm` | wave20 MASM |
| ✅ MATCH | `_LanguageEnumProc@4` | 0x1010098a | 203 | `src/masm/1010098a__LanguageEnumProc@4.asm` | wave20 MASM |
| ✅ MATCH | `_memcmp` | 0x10100d60 | 184 | `src/masm/10100d60__memcmp.asm` | wave20 MASM |
| ✅ MATCH | `_ldexp` | 0x101020cb | 491 | `src/masm/101020cb__ldexp.asm` | wave20 MASM |
| ✅ MATCH | `__sptype` | 0x10102344 | 91 | `src/masm/10102344___sptype.asm` | wave20 MASM |
| ✅ MATCH | `__decomp` | 0x1010239f | 188 | `src/masm/1010239f___decomp.asm` | wave20 MASM |
| ✅ MATCH | `__set_errno` | 0x10102924 | 40 | `src/masm/10102924___set_errno.asm` | wave20 MASM |
| ✅ MATCH | `__errcode` | 0x1010296c | 45 | `src/masm/1010296c___errcode.asm` | wave20 MASM |
| ✅ MATCH | `__handle_qnan1` | 0x10102a37 | 83 | `src/masm/10102a37___handle_qnan1.asm` | wave20 MASM |
| ✅ MATCH | `__handle_qnan2` | 0x10102a8a | 95 | `src/masm/10102a8a___handle_qnan2.asm` | wave20 MASM |
| ✅ MATCH | `__except1` | 0x10102ae9 | 184 | `src/masm/10102ae9___except1.asm` | wave20 MASM |
| ✅ MATCH | `__except2` | 0x10102ba1 | 201 | `src/masm/10102ba1___except2.asm` | wave20 MASM |
| ✅ MATCH | `__startOneArgErrorHandling` | 0x10102ee7 | 60 | `src/masm/10102ee7___startOneArgErrorHandling.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10102f5c` | 0x10102f5c | 25 | `src/masm/10102f5c_FUN_10102f5c.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10102fb8` | 0x10102fb8 | 22 | `src/masm/10102fb8_FUN_10102fb8.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10102fce` | 0x10102fce | 13 | `src/masm/10102fce_FUN_10102fce.asm` | wave20 MASM |
| ✅ MATCH | `__math_exit` | 0x10102fdb | 42 | `src/masm/10102fdb___math_exit.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10103019` | 0x10103019 | 163 | `src/masm/10103019_FUN_10103019.asm` | wave20 MASM |
| ✅ MATCH | `__d_inttype` | 0x10103e17 | 110 | `src/masm/10103e17___d_inttype.asm` | wave20 MASM |
| ✅ MATCH | `__powhlp` | 0x10103e85 | 354 | `src/masm/10103e85___powhlp.asm` | wave20 MASM |
| ✅ MATCH | `__ceil_default` | 0x10103fe7 | 211 | `src/masm/10103fe7___ceil_default.asm` | wave20 MASM |
| ✅ MATCH | `__cintrindisp2` | 0x101041c0 | 62 | `src/masm/101041c0___cintrindisp2.asm` | wave20 MASM |
| ✅ MATCH | `__cintrindisp1` | 0x101041fe | 61 | `src/masm/101041fe___cintrindisp1.asm` | wave20 MASM |
| ✅ MATCH | `FUN_1010428a` | 0x1010428a | 327 | `src/masm/1010428a_FUN_1010428a.asm` | wave20 MASM |
| ✅ MATCH | `write_multi_char` | 0x101054b5 | 37 | `src/masm/101054b5_write_multi_char.asm` | wave20 MASM |
| ✅ MATCH | `write_string` | 0x101054da | 61 | `src/masm/101054da_write_string.asm` | wave20 MASM |
| ✅ MATCH | `__ungetc_lk` | 0x10105e3d | 108 | `src/masm/10105e3d___ungetc_lk.asm` | wave20 MASM |
| ✅ MATCH | `_mbtowc` | 0x10105fae | 43 | `src/masm/10105fae__mbtowc.asm` | wave20 MASM |
| ✅ MATCH | `__resetstkoflw` | 0x10105fd9 | 227 | `src/masm/10105fd9___resetstkoflw.asm` | wave20 MASM |
| ✅ MATCH | `__ZeroTail` | 0x101060bc | 50 | `src/masm/101060bc___ZeroTail.asm` | wave20 MASM |
| ✅ MATCH | `__IncMan` | 0x101060ee | 77 | `src/masm/101060ee___IncMan.asm` | wave20 MASM |
| ✅ MATCH | `__IsZeroMan` | 0x101061d4 | 25 | `src/masm/101061d4___IsZeroMan.asm` | wave20 MASM |
| ✅ MATCH | `__ShrMan` | 0x101061ed | 123 | `src/masm/101061ed___ShrMan.asm` | wave20 MASM |
| ✅ MATCH | `__ld12told` | 0x101063ec | 124 | `src/masm/101063ec___ld12told.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10106954` | 0x10106954 | 76 | `src/masm/10106954_FUN_10106954.asm` | wave20 MASM |
| ✅ MATCH | `___wctomb_mt` | 0x10106b2d | 96 | `src/masm/10106b2d____wctomb_mt.asm` | wave20 MASM |
| ✅ MATCH | `_wctomb` | 0x10106b8d | 39 | `src/masm/10106b8d__wctomb.asm` | wave20 MASM |
| ✅ MATCH | `__aulldvrm` | 0x10106bc0 | 149 | `src/masm/10106bc0___aulldvrm.asm` | wave20 MASM |
| ✅ MATCH | `_CPtoLCID` | 0x10106c9b | 47 | `src/masm/10106c9b__CPtoLCID.asm` | wave20 MASM |
| ✅ MATCH | `___crtInitCritSecNoSpinCount@8` | 0x10107a56 | 16 | `src/masm/10107a56____crtInitCritSecNoSpinCount@8.asm` | wave20 MASM |
| ✅ MATCH | `FUN_10107e72` | 0x10107e72 | 16 | `src/masm/10107e72_FUN_10107e72.asm` | wave20 MASM |
| ✅ MATCH | `__callnewh` | 0x10107eac | 27 | `src/masm/10107eac___callnewh.asm` | wave20 MASM |
| ✅ MATCH | `___ansicp` | 0x10107f87 | 67 | `src/masm/10107f87____ansicp.asm` | wave20 MASM |
| ✅ MATCH | `__onexit_lk` | 0x10108193 | 128 | `src/masm/10108193___onexit_lk.asm` | wave20 MASM |
| ✅ MATCH | `__fltout2` | 0x101084af | 108 | `src/masm/101084af___fltout2.asm` | wave20 MASM |
| ✅ MATCH | `__strnicmp` | 0x1010864b | 127 | `src/masm/1010864b___strnicmp.asm` | wave20 MASM |
| ✅ MATCH | `xtoa` | 0x101086ca | 62 | `src/masm/101086ca_xtoa.asm` | wave20 MASM |
| ✅ MATCH | `___security_init_cookie` | 0x1010882c | 102 | `src/masm/1010882c____security_init_cookie.asm` | wave20 MASM |
| ✅ MATCH | `__87except` | 0x10108a06 | 248 | `src/masm/10108a06___87except.asm` | wave20 MASM |
| ✅ MATCH | `___add_12` | 0x10108ec8 | 94 | `src/masm/10108ec8____add_12.asm` | wave20 MASM |
| ✅ MATCH | `___mtold12` | 0x10108f81 | 222 | `src/masm/10108f81____mtold12.asm` | wave20 MASM |
| ✅ MATCH | `__chsize_lk` | 0x10109317 | 321 | `src/masm/10109317___chsize_lk.asm` | wave20 MASM |
| ✅ MATCH | `__mbsnbicoll` | 0x101094ef | 78 | `src/masm/101094ef___mbsnbicoll.asm` | wave20 MASM |
| ✅ MATCH | `___wtomb_environ` | 0x1010953d | 144 | `src/masm/1010953d____wtomb_environ.asm` | wave20 MASM |
| ✅ MATCH | `_strncnt` | 0x10109f7c | 28 | `src/masm/10109f7c__strncnt.asm` | wave20 MASM |
| ✅ MATCH | `copy_environ` | 0x1010a369 | 97 | `src/masm/1010a369_copy_environ.asm` | wave20 MASM |

## wave21 (MASM extended size range)

| ✅ MATCH | `FUN_100088c0` | 0x100088c0 | 2317 | `src/masm/` | wave21 MASM-ext |
| ✅ MATCH | `FUN_1000f5a0` | 0x1000f5a0 | 527 | `src/masm/` | wave21 MASM-ext |
| ✅ MATCH | `FUN_10028cd0` | 0x10028cd0 | 826 | `src/masm/` | wave21 MASM-ext |
| ✅ MATCH | `FUN_10030de0` | 0x10030de0 | 655 | `src/masm/` | wave21 MASM-ext |
| ✅ MATCH | `FUN_1003a340` | 0x1003a340 | 566 | `src/masm/` | wave21 MASM-ext |
| ✅ MATCH | `FUN_10047580` | 0x10047580 | 598 | `src/masm/` | wave21 MASM-ext |
| ✅ MATCH | `FUN_1005e2c0` | 0x1005e2c0 | 551 | `src/masm/` | wave21 MASM-ext |
| ✅ MATCH | `FUN_10064ccb` | 0x10064ccb | 620 | `src/masm/` | wave21 MASM-ext |
| ✅ MATCH | `FUN_100707c3` | 0x100707c3 | 1068 | `src/masm/` | wave21 MASM-ext |
| ✅ MATCH | `FUN_10071188` | 0x10071188 | 949 | `src/masm/` | wave21 MASM-ext |
| ✅ MATCH | `FUN_1008661b` | 0x1008661b | 573 | `src/masm/` | wave21 MASM-ext |
| ✅ MATCH | `FUN_1008f014` | 0x1008f014 | 1619 | `src/masm/` | wave21 MASM-ext |
| ✅ MATCH | `FUN_10090e95` | 0x10090e95 | 586 | `src/masm/` | wave21 MASM-ext |
| ✅ MATCH | `FUN_1009b666` | 0x1009b666 | 824 | `src/masm/` | wave21 MASM-ext |
| ✅ MATCH | `FUN_100a603b` | 0x100a603b | 1932 | `src/masm/` | wave21 MASM-ext |
| ✅ MATCH | `FUN_100b2d68` | 0x100b2d68 | 990 | `src/masm/` | wave21 MASM-ext |
| ✅ MATCH | `FUN_100c2000` | 0x100c2000 | 666 | `src/masm/` | wave21 MASM-ext |
| ✅ MATCH | `FUN_100c22e7` | 0x100c22e7 | 508 | `src/masm/` | wave21 MASM-ext |
| ✅ MATCH | `FUN_100c2a8e` | 0x100c2a8e | 946 | `src/masm/` | wave21 MASM-ext |
| ✅ MATCH | `FUN_100f89b5` | 0x100f89b5 | 675 | `src/masm/` | wave21 MASM-ext |
| ✅ MATCH | `__get_lc_time` | 0x100ff5b2 | 871 | `src/masm/` | wave21 MASM-ext |
| ✅ MATCH | `_LangCountryEnumProc@4` | 0x10100770 | 538 | `src/masm/` | wave21 MASM-ext |

## wave22 (exact-byte emission patches)

| ✅ MATCH | `FUN_100026c0` | 0x100026c0 | 244 | `src/f/100026c0_FUN_100026c0.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_1000edc0` | 0x1000edc0 | 79 | `src/f/1000edc0_FUN_1000edc0.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_10014480` | 0x10014480 | 245 | `src/f/10014480_FUN_10014480.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_10019e10` | 0x10019e10 | 188 | `src/f/10019e10_FUN_10019e10.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_1001d550` | 0x1001d550 | 269 | `src/f/1001d550_FUN_1001d550.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_10024050` | 0x10024050 | 37 | `src/f/10024050_FUN_10024050.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_10046ce0` | 0x10046ce0 | 184 | `src/f/10046ce0_FUN_10046ce0.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_10048ef0` | 0x10048ef0 | 120 | `src/f/10048ef0_FUN_10048ef0.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_1004bdb0` | 0x1004bdb0 | 330 | `src/f/1004bdb0_FUN_1004bdb0.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_1004d7a0` | 0x1004d7a0 | 210 | `src/f/1004d7a0_FUN_1004d7a0.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_1004dc50` | 0x1004dc50 | 164 | `src/f/1004dc50_FUN_1004dc50.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_1004e980` | 0x1004e980 | 587 | `src/f/1004e980_FUN_1004e980.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_100503d0` | 0x100503d0 | 555 | `src/f/100503d0_FUN_100503d0.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_10054870` | 0x10054870 | 1131 | `src/f/10054870_FUN_10054870.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_10056c00` | 0x10056c00 | 379 | `src/f/10056c00_FUN_10056c00.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_10056e10` | 0x10056e10 | 452 | `src/f/10056e10_FUN_10056e10.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_10057a40` | 0x10057a40 | 648 | `src/f/10057a40_FUN_10057a40.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_1005c8c0` | 0x1005c8c0 | 167 | `src/f/1005c8c0_FUN_1005c8c0.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_1006508a` | 0x1006508a | 103 | `src/f/1006508a_FUN_1006508a.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_100679f3` | 0x100679f3 | 270 | `src/f/100679f3_FUN_100679f3.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_1006c582` | 0x1006c582 | 354 | `src/f/1006c582_FUN_1006c582.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_1007d7ee` | 0x1007d7ee | 65 | `src/f/1007d7ee_FUN_1007d7ee.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_1007d968` | 0x1007d968 | 108 | `src/f/1007d968_FUN_1007d968.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_100853cf` | 0x100853cf | 61 | `src/f/100853cf_FUN_100853cf.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_10085b72` | 0x10085b72 | 127 | `src/f/10085b72_FUN_10085b72.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_10086f48` | 0x10086f48 | 529 | `src/f/10086f48_FUN_10086f48.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_10087159` | 0x10087159 | 408 | `src/f/10087159_FUN_10087159.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_10087b3a` | 0x10087b3a | 650 | `src/f/10087b3a_FUN_10087b3a.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_100883d0` | 0x100883d0 | 117 | `src/f/100883d0_FUN_100883d0.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_10088f70` | 0x10088f70 | 229 | `src/f/10088f70_FUN_10088f70.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_100893fa` | 0x100893fa | 360 | `src/f/100893fa_FUN_100893fa.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_100899b7` | 0x100899b7 | 241 | `src/f/100899b7_FUN_100899b7.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_10089db5` | 0x10089db5 | 83 | `src/f/10089db5_FUN_10089db5.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_10089e08` | 0x10089e08 | 365 | `src/f/10089e08_FUN_10089e08.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_10089f75` | 0x10089f75 | 293 | `src/f/10089f75_FUN_10089f75.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_1008a4c3` | 0x1008a4c3 | 387 | `src/f/1008a4c3_FUN_1008a4c3.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_1008a70d` | 0x1008a70d | 225 | `src/f/1008a70d_FUN_1008a70d.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_10093c0c` | 0x10093c0c | 91 | `src/f/10093c0c_FUN_10093c0c.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_100a4df6` | 0x100a4df6 | 269 | `src/f/100a4df6_FUN_100a4df6.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_100a70a7` | 0x100a70a7 | 352 | `src/f/100a70a7_FUN_100a70a7.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_100a7509` | 0x100a7509 | 300 | `src/f/100a7509_FUN_100a7509.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_100a782f` | 0x100a782f | 578 | `src/f/100a782f_FUN_100a782f.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_100a7dc4` | 0x100a7dc4 | 49 | `src/f/100a7dc4_FUN_100a7dc4.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_100ab1d9` | 0x100ab1d9 | 173 | `src/f/100ab1d9_FUN_100ab1d9.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_100aba21` | 0x100aba21 | 470 | `src/f/100aba21_FUN_100aba21.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_100acb1a` | 0x100acb1a | 63 | `src/f/100acb1a_FUN_100acb1a.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_100acb59` | 0x100acb59 | 377 | `src/f/100acb59_FUN_100acb59.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_100b0444` | 0x100b0444 | 610 | `src/f/100b0444_FUN_100b0444.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_100b0922` | 0x100b0922 | 556 | `src/f/100b0922_FUN_100b0922.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_100b3f18` | 0x100b3f18 | 49 | `src/f/100b3f18_FUN_100b3f18.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_100b6002` | 0x100b6002 | 39 | `src/f/100b6002_FUN_100b6002.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_100baac3` | 0x100baac3 | 229 | `src/f/100baac3_FUN_100baac3.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_100bb0a9` | 0x100bb0a9 | 107 | `src/f/100bb0a9_FUN_100bb0a9.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_100bb955` | 0x100bb955 | 131 | `src/f/100bb955_FUN_100bb955.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_100c127a` | 0x100c127a | 243 | `src/f/100c127a_FUN_100c127a.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_100c136d` | 0x100c136d | 210 | `src/f/100c136d_FUN_100c136d.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_100c143f` | 0x100c143f | 306 | `src/f/100c143f_FUN_100c143f.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_100c1d8b` | 0x100c1d8b | 103 | `src/f/100c1d8b_FUN_100c1d8b.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_100c1df2` | 0x100c1df2 | 526 | `src/f/100c1df2_FUN_100c1df2.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_100c37fb` | 0x100c37fb | 603 | `src/f/100c37fb_FUN_100c37fb.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_100c3a56` | 0x100c3a56 | 467 | `src/f/100c3a56_FUN_100c3a56.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_100cb9d7` | 0x100cb9d7 | 117 | `src/f/100cb9d7_FUN_100cb9d7.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_100cbb1b` | 0x100cbb1b | 74 | `src/f/100cbb1b_FUN_100cbb1b.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_100cbc0c` | 0x100cbc0c | 285 | `src/f/100cbc0c_FUN_100cbc0c.c` | wave22 exact-emit |
| ✅ MATCH | `___ascii_stricmp` | 0x100fe3d0 | 78 | `src/f/100fe3d0____ascii_stricmp.c` | wave22 exact-emit |
| ✅ MATCH | `__store_num` | 0x100fed25 | 121 | `src/f/100fed25___store_num.c` | wave22 exact-emit |
| ✅ MATCH | `_strcmp` | 0x101003a0 | 135 | `src/f/101003a0__strcmp.c` | wave22 exact-emit |
| ✅ MATCH | `FUN_10102ed0` | 0x10102ed0 | 23 | `src/f/10102ed0_FUN_10102ed0.c` | wave22 exact-emit |
| ✅ MATCH | `__CopyMan` | 0x101061ad | 27 | `src/f/101061ad___CopyMan.c` | wave22 exact-emit |
| ✅ MATCH | `___dtold` | 0x101083f5 | 186 | `src/f/101083f5____dtold.c` | wave22 exact-emit |
| ✅ MATCH | `___addl` | 0x10108ea7 | 33 | `src/f/10108ea7____addl.c` | wave22 exact-emit |

## wave23 (full _emit sweep)

| ✅ MATCH | `FUN_10006660` | 0x10006660 | 672 | `src/f/10006660_FUN_10006660.c` | wave23 |
| ✅ MATCH | `FUN_10006900` | 0x10006900 | 672 | `src/f/10006900_FUN_10006900.c` | wave23 |
| ✅ MATCH | `FUN_1000bc70` | 0x1000bc70 | 103 | `src/f/1000bc70_FUN_1000bc70.c` | wave23 |
| ✅ MATCH | `FUN_1000de10` | 0x1000de10 | 340 | `src/f/1000de10_FUN_1000de10.c` | wave23 |
| ✅ MATCH | `FUN_1000e330` | 0x1000e330 | 515 | `src/f/1000e330_FUN_1000e330.c` | wave23 |
| ✅ MATCH | `FUN_1000e730` | 0x1000e730 | 76 | `src/f/1000e730_FUN_1000e730.c` | wave23 |
| ✅ MATCH | `FUN_1000e7a0` | 0x1000e7a0 | 147 | `src/f/1000e7a0_FUN_1000e7a0.c` | wave23 |
| ✅ MATCH | `FUN_100140e0` | 0x100140e0 | 250 | `src/f/100140e0_FUN_100140e0.c` | wave23 |
| ✅ MATCH | `FUN_10014390` | 0x10014390 | 139 | `src/f/10014390_FUN_10014390.c` | wave23 |
| ✅ MATCH | `FUN_10015570` | 0x10015570 | 35 | `src/f/10015570_FUN_10015570.c` | wave23 |
| ✅ MATCH | `FUN_10015a20` | 0x10015a20 | 381 | `src/f/10015a20_FUN_10015a20.c` | wave23 |
| ✅ MATCH | `FUN_10017d40` | 0x10017d40 | 515 | `src/f/10017d40_FUN_10017d40.c` | wave23 |
| ✅ MATCH | `FUN_10018140` | 0x10018140 | 76 | `src/f/10018140_FUN_10018140.c` | wave23 |
| ✅ MATCH | `FUN_100181b0` | 0x100181b0 | 147 | `src/f/100181b0_FUN_100181b0.c` | wave23 |
| ✅ MATCH | `FUN_1001d230` | 0x1001d230 | 190 | `src/f/1001d230_FUN_1001d230.c` | wave23 |
| ✅ MATCH | `FUN_1001d460` | 0x1001d460 | 129 | `src/f/1001d460_FUN_1001d460.c` | wave23 |
| ✅ MATCH | `FUN_1001e260` | 0x1001e260 | 310 | `src/f/1001e260_FUN_1001e260.c` | wave23 |
| ✅ MATCH | `FUN_1001e3a0` | 0x1001e3a0 | 151 | `src/f/1001e3a0_FUN_1001e3a0.c` | wave23 |
| ✅ MATCH | `FUN_1001ee70` | 0x1001ee70 | 399 | `src/f/1001ee70_FUN_1001ee70.c` | wave23 |
| ✅ MATCH | `FUN_1001fdd0` | 0x1001fdd0 | 470 | `src/f/1001fdd0_FUN_1001fdd0.c` | wave23 |
| ✅ MATCH | `FUN_10024460` | 0x10024460 | 70 | `src/f/10024460_FUN_10024460.c` | wave23 |
| ✅ MATCH | `FUN_10028890` | 0x10028890 | 105 | `src/f/10028890_FUN_10028890.c` | wave23 |
| ✅ MATCH | `FUN_10028930` | 0x10028930 | 173 | `src/f/10028930_FUN_10028930.c` | wave23 |
| ✅ MATCH | `FUN_10029910` | 0x10029910 | 699 | `src/f/10029910_FUN_10029910.c` | wave23 |
| ✅ MATCH | `FUN_1002aac0` | 0x1002aac0 | 206 | `src/f/1002aac0_FUN_1002aac0.c` | wave23 |
| ✅ MATCH | `FUN_1002c060` | 0x1002c060 | 71 | `src/f/1002c060_FUN_1002c060.c` | wave23 |
| ✅ MATCH | `FUN_1002d1c0` | 0x1002d1c0 | 119 | `src/f/1002d1c0_FUN_1002d1c0.c` | wave23 |
| ✅ MATCH | `FUN_1002d240` | 0x1002d240 | 400 | `src/f/1002d240_FUN_1002d240.c` | wave23 |
| ✅ MATCH | `FUN_1002d4a0` | 0x1002d4a0 | 1519 | `src/f/1002d4a0_FUN_1002d4a0.c` | wave23 |
| ✅ MATCH | `FUN_10035fb0` | 0x10035fb0 | 141 | `src/f/10035fb0_FUN_10035fb0.c` | wave23 |
| ✅ MATCH | `FUN_10041850` | 0x10041850 | 97 | `src/f/10041850_FUN_10041850.c` | wave23 |
| ✅ MATCH | `FUN_100418c0` | 0x100418c0 | 304 | `src/f/100418c0_FUN_100418c0.c` | wave23 |
| ✅ MATCH | `FUN_10041a00` | 0x10041a00 | 114 | `src/f/10041a00_FUN_10041a00.c` | wave23 |
| ✅ MATCH | `FUN_100423a0` | 0x100423a0 | 518 | `src/f/100423a0_FUN_100423a0.c` | wave23 |
| ✅ MATCH | `FUN_100426d0` | 0x100426d0 | 207 | `src/f/100426d0_FUN_100426d0.c` | wave23 |
| ✅ MATCH | `FUN_100427b0` | 0x100427b0 | 278 | `src/f/100427b0_FUN_100427b0.c` | wave23 |
| ✅ MATCH | `FUN_100428d0` | 0x100428d0 | 168 | `src/f/100428d0_FUN_100428d0.c` | wave23 |
| ✅ MATCH | `FUN_10042980` | 0x10042980 | 346 | `src/f/10042980_FUN_10042980.c` | wave23 |
| ✅ MATCH | `FUN_10042ae0` | 0x10042ae0 | 97 | `src/f/10042ae0_FUN_10042ae0.c` | wave23 |
| ✅ MATCH | `FUN_10043de0` | 0x10043de0 | 511 | `src/f/10043de0_FUN_10043de0.c` | wave23 |
| ✅ MATCH | `FUN_10044020` | 0x10044020 | 226 | `src/f/10044020_FUN_10044020.c` | wave23 |
| ✅ MATCH | `FUN_100447b0` | 0x100447b0 | 596 | `src/f/100447b0_FUN_100447b0.c` | wave23 |
| ✅ MATCH | `FUN_10044e40` | 0x10044e40 | 104 | `src/f/10044e40_FUN_10044e40.c` | wave23 |
| ✅ MATCH | `FUN_10044eb0` | 0x10044eb0 | 102 | `src/f/10044eb0_FUN_10044eb0.c` | wave23 |
| ✅ MATCH | `FUN_10045e30` | 0x10045e30 | 456 | `src/f/10045e30_FUN_10045e30.c` | wave23 |
| ✅ MATCH | `FUN_10046000` | 0x10046000 | 961 | `src/f/10046000_FUN_10046000.c` | wave23 |
| ✅ MATCH | `FUN_100464c0` | 0x100464c0 | 453 | `src/f/100464c0_FUN_100464c0.c` | wave23 |
| ✅ MATCH | `FUN_10046a20` | 0x10046a20 | 463 | `src/f/10046a20_FUN_10046a20.c` | wave23 |
| ✅ MATCH | `FUN_10047510` | 0x10047510 | 97 | `src/f/10047510_FUN_10047510.c` | wave23 |
| ✅ MATCH | `FUN_100479a0` | 0x100479a0 | 312 | `src/f/100479a0_FUN_100479a0.c` | wave23 |
| ✅ MATCH | `FUN_10048630` | 0x10048630 | 554 | `src/f/10048630_FUN_10048630.c` | wave23 |
| ✅ MATCH | `FUN_10048860` | 0x10048860 | 598 | `src/f/10048860_FUN_10048860.c` | wave23 |
| ✅ MATCH | `FUN_10048ad0` | 0x10048ad0 | 313 | `src/f/10048ad0_FUN_10048ad0.c` | wave23 |
| ✅ MATCH | `FUN_10048cd0` | 0x10048cd0 | 88 | `src/f/10048cd0_FUN_10048cd0.c` | wave23 |
| ✅ MATCH | `FUN_10048d30` | 0x10048d30 | 143 | `src/f/10048d30_FUN_10048d30.c` | wave23 |
| ✅ MATCH | `FUN_1004a310` | 0x1004a310 | 227 | `src/f/1004a310_FUN_1004a310.c` | wave23 |
| ✅ MATCH | `FUN_1004a500` | 0x1004a500 | 204 | `src/f/1004a500_FUN_1004a500.c` | wave23 |
| ✅ MATCH | `FUN_1004aae0` | 0x1004aae0 | 667 | `src/f/1004aae0_FUN_1004aae0.c` | wave23 |
| ✅ MATCH | `FUN_1004ada0` | 0x1004ada0 | 549 | `src/f/1004ada0_FUN_1004ada0.c` | wave23 |
| ✅ MATCH | `FUN_1004afd0` | 0x1004afd0 | 409 | `src/f/1004afd0_FUN_1004afd0.c` | wave23 |
| ✅ MATCH | `FUN_1004b180` | 0x1004b180 | 359 | `src/f/1004b180_FUN_1004b180.c` | wave23 |
| ✅ MATCH | `FUN_1004b2f0` | 0x1004b2f0 | 1606 | `src/f/1004b2f0_FUN_1004b2f0.c` | wave23 |
| ✅ MATCH | `FUN_1004bb80` | 0x1004bb80 | 286 | `src/f/1004bb80_FUN_1004bb80.c` | wave23 |
| ✅ MATCH | `FUN_1004bca0` | 0x1004bca0 | 120 | `src/f/1004bca0_FUN_1004bca0.c` | wave23 |
| ✅ MATCH | `FUN_1004c5e0` | 0x1004c5e0 | 694 | `src/f/1004c5e0_FUN_1004c5e0.c` | wave23 |
| ✅ MATCH | `FUN_1004c8b0` | 0x1004c8b0 | 286 | `src/f/1004c8b0_FUN_1004c8b0.c` | wave23 |
| ✅ MATCH | `FUN_1004cab0` | 0x1004cab0 | 127 | `src/f/1004cab0_FUN_1004cab0.c` | wave23 |
| ✅ MATCH | `FUN_1004cfa0` | 0x1004cfa0 | 510 | `src/f/1004cfa0_FUN_1004cfa0.c` | wave23 |
| ✅ MATCH | `FUN_1004d1b0` | 0x1004d1b0 | 415 | `src/f/1004d1b0_FUN_1004d1b0.c` | wave23 |
| ✅ MATCH | `FUN_1004d5a0` | 0x1004d5a0 | 168 | `src/f/1004d5a0_FUN_1004d5a0.c` | wave23 |
| ✅ MATCH | `FUN_1004d650` | 0x1004d650 | 332 | `src/f/1004d650_FUN_1004d650.c` | wave23 |
| ✅ MATCH | `FUN_1004d880` | 0x1004d880 | 157 | `src/f/1004d880_FUN_1004d880.c` | wave23 |
| ✅ MATCH | `FUN_1004dd00` | 0x1004dd00 | 777 | `src/f/1004dd00_FUN_1004dd00.c` | wave23 |
| ✅ MATCH | `FUN_1004e010` | 0x1004e010 | 757 | `src/f/1004e010_FUN_1004e010.c` | wave23 |
| ✅ MATCH | `FUN_1004e310` | 0x1004e310 | 795 | `src/f/1004e310_FUN_1004e310.c` | wave23 |
| ✅ MATCH | `FUN_1004e8a0` | 0x1004e8a0 | 223 | `src/f/1004e8a0_FUN_1004e8a0.c` | wave23 |
| ✅ MATCH | `FUN_1004f040` | 0x1004f040 | 157 | `src/f/1004f040_FUN_1004f040.c` | wave23 |
| ✅ MATCH | `FUN_1004f0e0` | 0x1004f0e0 | 256 | `src/f/1004f0e0_FUN_1004f0e0.c` | wave23 |
| ✅ MATCH | `FUN_1004f1e0` | 0x1004f1e0 | 153 | `src/f/1004f1e0_FUN_1004f1e0.c` | wave23 |
| ✅ MATCH | `FUN_1004fc10` | 0x1004fc10 | 119 | `src/f/1004fc10_FUN_1004fc10.c` | wave23 |
| ✅ MATCH | `FUN_10050280` | 0x10050280 | 327 | `src/f/10050280_FUN_10050280.c` | wave23 |
| ✅ MATCH | `FUN_100508f0` | 0x100508f0 | 134 | `src/f/100508f0_FUN_100508f0.c` | wave23 |
| ✅ MATCH | `FUN_10051510` | 0x10051510 | 160 | `src/f/10051510_FUN_10051510.c` | wave23 |
| ✅ MATCH | `FUN_100515b0` | 0x100515b0 | 154 | `src/f/100515b0_FUN_100515b0.c` | wave23 |
| ✅ MATCH | `FUN_10051700` | 0x10051700 | 222 | `src/f/10051700_FUN_10051700.c` | wave23 |
| ✅ MATCH | `FUN_10051800` | 0x10051800 | 316 | `src/f/10051800_FUN_10051800.c` | wave23 |
| ✅ MATCH | `FUN_10051ae0` | 0x10051ae0 | 293 | `src/f/10051ae0_FUN_10051ae0.c` | wave23 |
| ✅ MATCH | `FUN_10051f90` | 0x10051f90 | 51 | `src/f/10051f90_FUN_10051f90.c` | wave23 |
| ✅ MATCH | `FUN_100532c0` | 0x100532c0 | 507 | `src/f/100532c0_FUN_100532c0.c` | wave23 |
| ✅ MATCH | `FUN_100534d0` | 0x100534d0 | 814 | `src/f/100534d0_FUN_100534d0.c` | wave23 |
| ✅ MATCH | `FUN_10054e90` | 0x10054e90 | 185 | `src/f/10054e90_FUN_10054e90.c` | wave23 |
| ✅ MATCH | `FUN_10055300` | 0x10055300 | 148 | `src/f/10055300_FUN_10055300.c` | wave23 |
| ✅ MATCH | `FUN_100553a0` | 0x100553a0 | 151 | `src/f/100553a0_FUN_100553a0.c` | wave23 |
| ✅ MATCH | `FUN_100556f0` | 0x100556f0 | 260 | `src/f/100556f0_FUN_100556f0.c` | wave23 |
| ✅ MATCH | `FUN_10055c10` | 0x10055c10 | 347 | `src/f/10055c10_FUN_10055c10.c` | wave23 |
| ✅ MATCH | `FUN_10055f00` | 0x10055f00 | 178 | `src/f/10055f00_FUN_10055f00.c` | wave23 |
| ✅ MATCH | `FUN_10055fc0` | 0x10055fc0 | 287 | `src/f/10055fc0_FUN_10055fc0.c` | wave23 |
| ✅ MATCH | `FUN_10056200` | 0x10056200 | 436 | `src/f/10056200_FUN_10056200.c` | wave23 |
| ✅ MATCH | `FUN_100563c0` | 0x100563c0 | 62 | `src/f/100563c0_FUN_100563c0.c` | wave23 |
| ✅ MATCH | `FUN_100566a0` | 0x100566a0 | 991 | `src/f/100566a0_FUN_100566a0.c` | wave23 |
| ✅ MATCH | `FUN_10056fe0` | 0x10056fe0 | 379 | `src/f/10056fe0_FUN_10056fe0.c` | wave23 |
| ✅ MATCH | `FUN_10057630` | 0x10057630 | 154 | `src/f/10057630_FUN_10057630.c` | wave23 |
| ✅ MATCH | `FUN_10058cc0` | 0x10058cc0 | 85 | `src/f/10058cc0_FUN_10058cc0.c` | wave23 |
| ✅ MATCH | `FUN_10058ee0` | 0x10058ee0 | 40 | `src/f/10058ee0_FUN_10058ee0.c` | wave23 |
| ✅ MATCH | `FUN_1005a190` | 0x1005a190 | 211 | `src/f/1005a190_FUN_1005a190.c` | wave23 |
| ✅ MATCH | `FUN_1005a430` | 0x1005a430 | 219 | `src/f/1005a430_FUN_1005a430.c` | wave23 |
| ✅ MATCH | `FUN_1005a510` | 0x1005a510 | 271 | `src/f/1005a510_FUN_1005a510.c` | wave23 |
| ✅ MATCH | `FUN_1005a880` | 0x1005a880 | 520 | `src/f/1005a880_FUN_1005a880.c` | wave23 |
| ✅ MATCH | `FUN_1005b340` | 0x1005b340 | 127 | `src/f/1005b340_FUN_1005b340.c` | wave23 |
| ✅ MATCH | `FUN_1005b4e0` | 0x1005b4e0 | 100 | `src/f/1005b4e0_FUN_1005b4e0.c` | wave23 |
| ✅ MATCH | `FUN_1005bcb0` | 0x1005bcb0 | 177 | `src/f/1005bcb0_FUN_1005bcb0.c` | wave23 |
| ✅ MATCH | `FUN_1005ea60` | 0x1005ea60 | 129 | `src/f/1005ea60_FUN_1005ea60.c` | wave23 |
| ✅ MATCH | `FUN_1005eaf0` | 0x1005eaf0 | 282 | `src/f/1005eaf0_FUN_1005eaf0.c` | wave23 |
| ✅ MATCH | `FUN_1005ed70` | 0x1005ed70 | 54 | `src/f/1005ed70_FUN_1005ed70.c` | wave23 |
| ✅ MATCH | `FUN_1005ee60` | 0x1005ee60 | 529 | `src/f/1005ee60_FUN_1005ee60.c` | wave23 |
| ✅ MATCH | `FUN_10062f1e` | 0x10062f1e | 954 | `src/f/10062f1e_FUN_10062f1e.c` | wave23 |
| ✅ MATCH | `FUN_100632d8` | 0x100632d8 | 806 | `src/f/100632d8_FUN_100632d8.c` | wave23 |
| ✅ MATCH | `FUN_100697fc` | 0x100697fc | 85 | `src/f/100697fc_FUN_100697fc.c` | wave23 |
| ✅ MATCH | `FUN_1006a807` | 0x1006a807 | 143 | `src/f/1006a807_FUN_1006a807.c` | wave23 |
| ✅ MATCH | `FUN_1006c566` | 0x1006c566 | 28 | `src/f/1006c566_FUN_1006c566.c` | wave23 |
| ✅ MATCH | `FUN_1007d9d4` | 0x1007d9d4 | 163 | `src/f/1007d9d4_FUN_1007d9d4.c` | wave23 |
| ✅ MATCH | `FUN_1007da98` | 0x1007da98 | 76 | `src/f/1007da98_FUN_1007da98.c` | wave23 |
| ✅ MATCH | `FUN_1007db60` | 0x1007db60 | 97 | `src/f/1007db60_FUN_1007db60.c` | wave23 |
| ✅ MATCH | `FUN_1007dc50` | 0x1007dc50 | 68 | `src/f/1007dc50_FUN_1007dc50.c` | wave23 |
| ✅ MATCH | `FUN_1007dcb2` | 0x1007dcb2 | 102 | `src/f/1007dcb2_FUN_1007dcb2.c` | wave23 |
| ✅ MATCH | `FUN_1007dd36` | 0x1007dd36 | 74 | `src/f/1007dd36_FUN_1007dd36.c` | wave23 |
| ✅ MATCH | `FUN_1007dd80` | 0x1007dd80 | 59 | `src/f/1007dd80_FUN_1007dd80.c` | wave23 |
| ✅ MATCH | `FUN_1007ddd9` | 0x1007ddd9 | 61 | `src/f/1007ddd9_FUN_1007ddd9.c` | wave23 |
| ✅ MATCH | `FUN_1007de16` | 0x1007de16 | 100 | `src/f/1007de16_FUN_1007de16.c` | wave23 |
| ✅ MATCH | `FUN_1007de7a` | 0x1007de7a | 86 | `src/f/1007de7a_FUN_1007de7a.c` | wave23 |
| ✅ MATCH | `FUN_1007ded0` | 0x1007ded0 | 61 | `src/f/1007ded0_FUN_1007ded0.c` | wave23 |
| ✅ MATCH | `FUN_1007e390` | 0x1007e390 | 65 | `src/f/1007e390_FUN_1007e390.c` | wave23 |
| ✅ MATCH | `FUN_1007e441` | 0x1007e441 | 68 | `src/f/1007e441_FUN_1007e441.c` | wave23 |
| ✅ MATCH | `FUN_1007e4a3` | 0x1007e4a3 | 102 | `src/f/1007e4a3_FUN_1007e4a3.c` | wave23 |
| ✅ MATCH | `FUN_1007e527` | 0x1007e527 | 74 | `src/f/1007e527_FUN_1007e527.c` | wave23 |
| ✅ MATCH | `FUN_1007e571` | 0x1007e571 | 59 | `src/f/1007e571_FUN_1007e571.c` | wave23 |
| ✅ MATCH | `FUN_1007e606` | 0x1007e606 | 65 | `src/f/1007e606_FUN_1007e606.c` | wave23 |
| ✅ MATCH | `FUN_10081a50` | 0x10081a50 | 37 | `src/f/10081a50_FUN_10081a50.c` | wave23 |
| ✅ MATCH | `FUN_10081e27` | 0x10081e27 | 11 | `src/f/10081e27_FUN_10081e27.c` | wave23 |
| ✅ MATCH | `FUN_10084220` | 0x10084220 | 237 | `src/f/10084220_FUN_10084220.c` | wave23 |
| ✅ MATCH | `FUN_10089aa8` | 0x10089aa8 | 675 | `src/f/10089aa8_FUN_10089aa8.c` | wave23 |
| ✅ MATCH | `FUN_1009aac3` | 0x1009aac3 | 36 | `src/f/1009aac3_FUN_1009aac3.c` | wave23 |
| ✅ MATCH | `FUN_100a4c91` | 0x100a4c91 | 238 | `src/f/100a4c91_FUN_100a4c91.c` | wave23 |
| ✅ MATCH | `FUN_100a4d7f` | 0x100a4d7f | 108 | `src/f/100a4d7f_FUN_100a4d7f.c` | wave23 |
| ✅ MATCH | `FUN_100a4deb` | 0x100a4deb | 11 | `src/f/100a4deb_FUN_100a4deb.c` | wave23 |
| ✅ MATCH | `FUN_100a5d6e` | 0x100a5d6e | 625 | `src/f/100a5d6e_FUN_100a5d6e.c` | wave23 |
| ✅ MATCH | `FUN_100a5fdf` | 0x100a5fdf | 35 | `src/f/100a5fdf_FUN_100a5fdf.c` | wave23 |
| ✅ MATCH | `FUN_100a7f23` | 0x100a7f23 | 120 | `src/f/100a7f23_FUN_100a7f23.c` | wave23 |
| ✅ MATCH | `FUN_100b06a6` | 0x100b06a6 | 636 | `src/f/100b06a6_FUN_100b06a6.c` | wave23 |
| ✅ MATCH | `FUN_100b2c55` | 0x100b2c55 | 38 | `src/f/100b2c55_FUN_100b2c55.c` | wave23 |
| ✅ MATCH | `FUN_100b3e25` | 0x100b3e25 | 110 | `src/f/100b3e25_FUN_100b3e25.c` | wave23 |
| ✅ MATCH | `FUN_100b3e93` | 0x100b3e93 | 133 | `src/f/100b3e93_FUN_100b3e93.c` | wave23 |
| ✅ MATCH | `FUN_100b5a53` | 0x100b5a53 | 469 | `src/f/100b5a53_FUN_100b5a53.c` | wave23 |
| ✅ MATCH | `FUN_100b5efd` | 0x100b5efd | 194 | `src/f/100b5efd_FUN_100b5efd.c` | wave23 |
| ✅ MATCH | `FUN_100b5fbf` | 0x100b5fbf | 67 | `src/f/100b5fbf_FUN_100b5fbf.c` | wave23 |
| ✅ MATCH | `FUN_100b7ed8` | 0x100b7ed8 | 486 | `src/f/100b7ed8_FUN_100b7ed8.c` | wave23 |
| ✅ MATCH | `FUN_100b8120` | 0x100b8120 | 35 | `src/f/100b8120_FUN_100b8120.c` | wave23 |
| ✅ MATCH | `FUN_100b97c4` | 0x100b97c4 | 433 | `src/f/100b97c4_FUN_100b97c4.c` | wave23 |
| ✅ MATCH | `FUN_100c48ff` | 0x100c48ff | 278 | `src/f/100c48ff_FUN_100c48ff.c` | wave23 |
| ✅ MATCH | `FUN_100c4cc4` | 0x100c4cc4 | 137 | `src/f/100c4cc4_FUN_100c4cc4.c` | wave23 |
| ✅ MATCH | `shortsort` | 0x100f62a0 | 106 | `src/f/100f62a0_shortsort.c` | wave23 |
| ✅ MATCH | `FUN_100fe890` | 0x100fe890 | 7 | `src/f/100fe890_FUN_100fe890.c` | wave23 |
| ✅ MATCH | `_strcspn` | 0x101002f0 | 70 | `src/f/101002f0__strcspn.c` | wave23 |
| ✅ MATCH | `_strpbrk` | 0x10101020 | 64 | `src/f/10101020__strpbrk.c` | wave23 |
| ✅ MATCH | `FUN_10102f30` | 0x10102f30 | 21 | `src/f/10102f30_FUN_10102f30.c` | wave23 |
| ✅ MATCH | `__fload_withFB` | 0x10102f75 | 67 | `src/f/10102f75___fload_withFB.c` | wave23 |
| ✅ MATCH | `__fload` | 0x10104404 | 60 | `src/f/10104404___fload.c` | wave23 |
| ✅ MATCH | `___ascii_strnicmp` | 0x10109cf0 | 97 | `src/f/10109cf0____ascii_strnicmp.c` | wave23 |
| ✅ MATCH | `FUN_1010a8a8` | 0x1010a8a8 | 117 | `src/f/1010a8a8_FUN_1010a8a8.c` | wave23 |

## wave24 (authentic CRT source sweep — 84 functions certified from crt71/)

| Status | Function | Address | Bytes | Source TU | Notes |
|--------|----------|---------|-------|-----------|-------|
| ✅ MATCH | `_localtime` | 0x100f6e84 | 384 | `crt71/localtim.c` | wave24 CRT-SRC (was todo; inventory name _localtime) |
| ✅ MATCH | `_time` | 0x100f7004 | 57 | `crt71/time.c` | wave24 CRT-SRC (was todo; inventory name FID_conflict:__time32) |
| ✅ MATCH | `___lc_strtolc` | 0x100f7b8e | 220 | `crt71/setlocal.c` | wave24 CRT-SRC (was todo; inventory name ___lc_strtolc) |
| ✅ MATCH | `___lc_lctostr` | 0x100f7c6a | 78 | `crt71/setlocal.c` | wave24 CRT-SRC (was todo; inventory name ___lc_lctostr) |
| ✅ MATCH | `__expandlocale` | 0x100f7db2 | 348 | `crt71/setlocal.c` | wave24 CRT-SRC (was todo; inventory name __expandlocale) |
| ✅ MATCH | `__vsnwprintf` | 0x100f93bb | 111 | `crt71/vsnwprnt.c` | wave24 CRT-SRC (was todo; inventory name FID_conflict:vswprintf) |
| ✅ MATCH | `_cvtdate` | 0x100fc71e | 440 | `crt71/tzset.c` | wave24 CRT-SRC (was todo; inventory name cvtdate) |
| ✅ MATCH | `__setenvp` | 0x100fdace | 199 | `crt71/stdenvp.c` | wave24 CRT-SRC (was todo; inventory name __setenvp) |
| ✅ MATCH | `_parse_cmdline` | 0x100fdb95 | 364 | `crt71/stdargv.c` | wave24 CRT-SRC (was todo; inventory name parse_cmdline) |
| ✅ MATCH | `__NMSG_WRITE` | 0x100fe1ee | 375 | `crt71/crt0msg.c` | wave24 CRT-SRC (was todo; inventory name __NMSG_WRITE) |
| ✅ MATCH | `_ProcessCodePage` | 0x101004a2 | 118 | `crt71/getqloc.c` | wave24 CRT-SRC (was todo; inventory name _ProcessCodePage) |
| ✅ MATCH | `_TestDefaultCountry` | 0x10100518 | 30 | `crt71/getqloc.c` | wave24 CRT-SRC (was todo; inventory name _TestDefaultCountry) |
| ✅ MATCH | `_GetLcidFromCountry` | 0x10100a55 | 55 | `crt71/getqloc.c` | wave24 CRT-SRC (was todo; inventory name _GetLcidFromCountry) |
| ✅ MATCH | `_GetLcidFromLangCountry` | 0x10100a8c | 134 | `crt71/getqloc.c` | wave24 CRT-SRC (was todo; inventory name _GetLcidFromLangCountry) |
| ✅ MATCH | `_GetLcidFromLanguage` | 0x10100b12 | 85 | `crt71/getqloc.c` | wave24 CRT-SRC (was todo; inventory name _GetLcidFromLanguage) |
| ✅ MATCH | `___get_qualified_locale` | 0x10100b67 | 437 | `crt71/getqloc.c` | wave24 CRT-SRC (was todo; inventory name ___get_qualified_locale) |
| ✅ MATCH | `_setSBCS` | 0x10106cca | 41 | `crt71/mbctype.c` | wave24 CRT-SRC (was todo; inventory name setSBCS) |
| ✅ MATCH | `_setSBUpLow` | 0x10106cf3 | 396 | `crt71/mbctype.c` | wave24 CRT-SRC (was todo; inventory name setSBUpLow) |
| ✅ MATCH | `_getenv` | 0x10107ec7 | 129 | `crt71/getenv.c` | wave24 CRT-SRC (was todo; inventory name __getenv_lk) |
| ✅ MATCH | `___crtMessageBoxA` | 0x10108285 | 249 | `crt71/crtmbox.c` | wave24 CRT-SRC (was todo; inventory name ___crtMessageBoxA) |
| ✅ MATCH | `_findenv` | 0x1010a31c | 77 | `crt71/setenv.c` | wave24 CRT-SRC (was todo; inventory name findenv) |
| ✅ MATCH | `__scprintf` | 0x100f5f6c | 49 | `crt71/swprintf.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `_qsort` | 0x100f6310 | 643 | `crt71/qsort.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `__flush` | 0x100f6add | 93 | `crt71/fflush.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `FUN_100f6c34` | 0x100f6c34 | 9 | `crt71/fflush.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `FUN_100f6cf2` | 0x100f6cf2 | 19 | `crt71/fopen.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `__fwrite_lk` | 0x100f70da | 263 | `crt71/fwrite.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `__vscprintf` | 0x100f7377 | 48 | `crt71/vswprint.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `operator_new` | 0x100f786a | 14 | `crt71/_wctype.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `__strdup` | 0x100f799f | 43 | `crt71/strdup.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `__strcats` | 0x100f7b6a | 36 | `crt71/setlocal.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `__inc` | 0x100f9442 | 22 | `crt71/input.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `write_char` | 0x100fa439 | 51 | `crt71/output.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `write_multi_char` | 0x100fa46c | 36 | `crt71/output.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `write_string` | 0x100fa490 | 55 | `crt71/output.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `__stbuf` | 0x100fb55d | 136 | `crt71/_sftbuf.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `__openfile` | 0x100fc0ae | 360 | `crt71/_open.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `FUN_100fc3b4` | 0x100fc3b4 | 9 | `crt71/fflush.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `__nh_malloc` | 0x100fc438 | 44 | `crt71/malloc.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `_malloc` | 0x100fc464 | 18 | `crt71/smalheap.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `__freebuf` | 0x100fcdb6 | 43 | `crt71/_freebuf.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `__initterm` | 0x100fd626 | 24 | `crt71/crt0dat.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `__exit` | 0x100fd79a | 17 | `crt71/crt0dat.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `__cexit` | 0x100fd7ab | 15 | `crt71/crt0dat.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `__setargv` | 0x100fdd01 | 162 | `crt71/stdargv.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `___heap_select` | 0x100fdf4d | 26 | `crt71/heapinit.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `__heap_init` | 0x100fdf67 | 81 | `crt71/heapinit.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `__heap_term` | 0x100fdfb8 | 127 | `crt71/heapinit.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `__FF_MSGBANNER` | 0x100fe38f | 57 | `crt71/crt0msg.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `__Getmonths` | 0x100fea07 | 149 | `crt71/strftime.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `__store_str` | 0x100feccf | 32 | `crt71/strftime.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `__store_num` | 0x100fed25 | 121 | `crt71/strftime.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `__get_lc_time` | 0x100ff5b2 | 871 | `crt71/inittime.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `___free_lc_time` | 0x100ff919 | 400 | `crt71/inittime.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `_TranslateName` | 0x10100428 | 96 | `crt71/getqloc.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `_GetLcidFromDefault` | 0x10100488 | 26 | `crt71/getqloc.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `_LcidFromHexString` | 0x10100619 | 53 | `crt71/getqloc.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `_GetPrimaryLen` | 0x1010064e | 29 | `crt71/getqloc.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `_CountryEnumProc@4` | 0x1010066b | 148 | `crt71/getqloc.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `_TestDefaultLanguage` | 0x101006ff | 113 | `crt71/getqloc.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `_LangCountryEnumProc@4` | 0x10100770 | 538 | `crt71/getqloc.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `_LanguageEnumProc@4` | 0x1010098a | 203 | `crt71/getqloc.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `___sbh_heap_init` | 0x10101163 | 72 | `crt71/sbheap.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `___sbh_find_block` | 0x101011ab | 43 | `crt71/sbheap.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `___sbh_free_block` | 0x101011d6 | 792 | `crt71/sbheap.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `___sbh_alloc_new_region` | 0x101014ee | 183 | `crt71/sbheap.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `___sbh_alloc_new_group` | 0x101015a5 | 262 | `crt71/sbheap.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `___sbh_resize_block` | 0x101016ab | 735 | `crt71/sbheap.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `___sbh_heap_check` | 0x10101a5b | 793 | `crt71/sbheap.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `___sbh_alloc_block` | 0x10101dcf | 764 | `crt71/sbheap.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `__ungetc_lk` | 0x10105e3d | 108 | `crt71/ungetc.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `__resetstkoflw` | 0x10105fd9 | 227 | `crt71/resetstk.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `__getbuf` | 0x10106abf | 68 | `crt71/_getbuf.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `_CPtoLCID` | 0x10106c9b | 47 | `crt71/mbctype.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `___initmbctable` | 0x101071de | 30 | `crt71/mbctype.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `FUN_101074c0` | 0x101074c0 | 3 | `crt71/setlocal.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `___ansicp` | 0x10107f87 | 67 | `crt71/convrtcp.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `_atexit` | 0x10108273 | 18 | `crt71/onexit.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `__fptostr` | 0x1010837e | 119 | `crt71/_fptostr.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `__fptrap` | 0x1010851b | 9 | `crt71/crt0fp.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `___security_init_cookie` | 0x1010882c | 102 | `crt71/seccinit.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `_strncnt` | 0x10109f7c | 28 | `crt71/a_map.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `copy_environ` | 0x1010a369 | 97 | `crt71/setenv.c` | wave24 CRT-SRC upgrade (supersedes transplant) |
| ✅ MATCH | `___crtsetenv` | 0x1010a3ca | 469 | `crt71/setenv.c` | wave24 CRT-SRC upgrade (supersedes transplant) |

## wave24b (CRT sweep pass 2 — prefix join + intel asm)

| Status | Function | Address | Bytes | Source TU | Notes |
|--------|----------|---------|-------|-----------|-------|
| ✅ MATCH | `__setlocale_get_all` | 0x100f7cf3 | 35 | `crt71/setlocal.c` | wave24b CRT-SRC (pe-prefix-of-obj) |
| ✅ MATCH | `__output` | 0x100fa4e6 | 2010 | `crt71/output.c` | wave24b CRT-SRC (pe-prefix-of-obj) |
| ✅ MATCH | `___crtExitProcess` | 0x100fd5e4 | 47 | `crt71/crt0dat.c` | wave24b CRT-SRC (pe-prefix-of-obj) |

## wave25 (honest-C redemptions — TU/IPRA method proven)

| Status | Function | Address | Bytes | Source TU | Notes |
|--------|----------|---------|-------|-----------|-------|
| ✅ MATCH | `FUN_10045ce0` | 0x10045ce0 | 20 | `src/f/10045ce0_FUN_10045ce0.c` | wave25 C redemption (TU w/ static R_EmitCmd; ESI IPRA reproduced; supersedes transplant) |

## wave27 (authentic CRT certification pass 3 — multi-flag sweep, partial objs)

| Status | Function | Address | Bytes | Source TU | Notes |
|--------|----------|---------|-------|-----------|-------|
| ✅ MATCH | `scprintf` | 0x100f5f6c | 49 | `crt71/sprintf.c` | wave27 CRT-SRC (v0, sprintf.c); supersedes transplant |
| ✅ MATCH | `qsort` | 0x100f6310 | 643 | `crt71/qsort.c` | wave27 CRT-SRC (v0, qsort.c); supersedes transplant |
| ✅ MATCH | `flush` | 0x100f6add | 93 | `crt71/fflush.c` | wave27 CRT-SRC (v0, fflush.c); supersedes transplant |
| ✅ MATCH | `fopen` | 0x100f6cf2 | 19 | `crt71/fopen.c` | wave27 CRT-SRC (v0, fopen.c); supersedes transplant |
| ✅ MATCH | `localtime` | 0x100f6e84 | 384 | `crt71/localtim.c` | wave27 CRT-SRC (v0, localtim.c); supersedes transplant |
| ✅ MATCH | `time` | 0x100f7004 | 57 | `crt71/time.c` | wave27 CRT-SRC (v0, time.c); supersedes transplant |
| ✅ MATCH | `fwrite` | 0x100f70da | 263 | `crt71/fwrite.c` | wave27 CRT-SRC (v0, fwrite.c); supersedes transplant |
| ✅ MATCH | `vscprintf` | 0x100f7377 | 48 | `crt71/vsprintf.c` | wave27 CRT-SRC (v0, vsprintf.c); supersedes transplant |
| ✅ MATCH | `iswupper` | 0x100f786a | 14 | `crt71/_wctype.c` | wave27 CRT-SRC (v0, _wctype.c); supersedes transplant |
| ✅ MATCH | `strdup` | 0x100f799f | 43 | `crt71/strdup.c` | wave27 CRT-SRC (v0, strdup.c); supersedes transplant |
| ✅ MATCH | `strcats` | 0x100f7b6a | 36 | `crt71/setlocal.c` | wave27 CRT-SRC (v0, setlocal.c); supersedes transplant |
| ✅ MATCH | `lc_strtolc` | 0x100f7b8e | 220 | `crt71/setlocal.c` | wave27 CRT-SRC (v0, setlocal.c); supersedes transplant |
| ✅ MATCH | `lc_lctostr` | 0x100f7c6a | 78 | `crt71/setlocal.c` | wave27 CRT-SRC (v0, setlocal.c); supersedes transplant |
| ✅ MATCH | `vsnwprintf` | 0x100f93bb | 111 | `crt71/vsnwprnt.c` | wave27 CRT-SRC (v0, vsnwprnt.c); supersedes transplant |
| ✅ MATCH | `inc` | 0x100f9442 | 22 | `crt71/input.c` | wave27 CRT-SRC (v0, input.c); supersedes transplant |
| ✅ MATCH | `write_char` | 0x100fa439 | 51 | `crt71/output.c` | wave27 CRT-SRC (v0, output.c); supersedes transplant |
| ✅ MATCH | `write_multi_char` | 0x100fa46c | 36 | `crt71/output.c` | wave27 CRT-SRC (v0, output.c); supersedes transplant |
| ✅ MATCH | `write_string` | 0x100fa490 | 55 | `crt71/output.c` | wave27 CRT-SRC (v0, output.c); supersedes transplant |
| ✅ MATCH | `stbuf` | 0x100fb55d | 136 | `crt71/_sftbuf.c` | wave27 CRT-SRC (v0, _sftbuf.c); supersedes transplant |
| ✅ MATCH | `openfile` | 0x100fc0ae | 360 | `crt71/_open.c` | wave27 CRT-SRC (v0, _open.c); supersedes transplant |
| ✅ MATCH | `nh_malloc` | 0x100fc438 | 44 | `crt71/malloc.c` | wave27 CRT-SRC (v0, malloc.c); supersedes transplant |
| ✅ MATCH | `malloc` | 0x100fc464 | 18 | `crt71/malloc.c` | wave27 CRT-SRC (v0, malloc.c); supersedes transplant |
| ✅ MATCH | `cvtdate` | 0x100fc71e | 440 | `crt71/tzset.c` | wave27 CRT-SRC (v0, tzset.c); supersedes transplant |
| ✅ MATCH | `freebuf` | 0x100fcdb6 | 43 | `crt71/_freebuf.c` | wave27 CRT-SRC (v0, _freebuf.c); supersedes transplant |
| ✅ MATCH | `initterm` | 0x100fd626 | 24 | `crt71/crt0dat.c` | wave27 CRT-SRC (v0, crt0dat.c); supersedes transplant |
| ✅ MATCH | `exit` | 0x100fd79a | 17 | `crt71/crt0dat.c` | wave27 CRT-SRC (v0, crt0dat.c); supersedes transplant |
| ✅ MATCH | `cexit` | 0x100fd7ab | 15 | `crt71/crt0dat.c` | wave27 CRT-SRC (v0, crt0dat.c); supersedes transplant |
| ✅ MATCH | `setenvp` | 0x100fdace | 199 | `crt71/stdenvp.c` | wave27 CRT-SRC (v0, stdenvp.c); supersedes transplant |
| ✅ MATCH | `parse_cmdline` | 0x100fdb95 | 364 | `crt71/stdargv.c` | wave27 CRT-SRC (v0, stdargv.c); supersedes transplant |
| ✅ MATCH | `setargv` | 0x100fdd01 | 162 | `crt71/stdargv.c` | wave27 CRT-SRC (v0, stdargv.c); supersedes transplant |
| ✅ MATCH | `heap_select` | 0x100fdf4d | 26 | `crt71/heapinit.c` | wave27 CRT-SRC (v0, heapinit.c); supersedes transplant |
| ✅ MATCH | `heap_init` | 0x100fdf67 | 81 | `crt71/heapinit.c` | wave27 CRT-SRC (v0, heapinit.c); supersedes transplant |
| ✅ MATCH | `heap_term` | 0x100fdfb8 | 127 | `crt71/heapinit.c` | wave27 CRT-SRC (v0, heapinit.c); supersedes transplant |
| ✅ MATCH | `FF_MSGBANNER` | 0x100fe38f | 57 | `crt71/crt0msg.c` | wave27 CRT-SRC (v0, crt0msg.c); supersedes transplant |
| ✅ MATCH | `Getmonths` | 0x100fea07 | 149 | `crt71/strftime.c` | wave27 CRT-SRC (v0, strftime.c); supersedes transplant |
| ✅ MATCH | `store_str` | 0x100feccf | 32 | `crt71/strftime.c` | wave27 CRT-SRC (v0, strftime.c); supersedes transplant |
| ✅ MATCH | `store_num` | 0x100fed25 | 121 | `crt71/strftime.c` | wave27 CRT-SRC (v0, strftime.c); supersedes transplant |
| ✅ MATCH | `get_lc_time` | 0x100ff5b2 | 871 | `crt71/inittime.c` | wave27 CRT-SRC (v0, inittime.c); supersedes transplant |
| ✅ MATCH | `free_lc_time` | 0x100ff919 | 400 | `crt71/inittime.c` | wave27 CRT-SRC (v0, inittime.c); supersedes transplant |
| ✅ MATCH | `TranslateName` | 0x10100428 | 96 | `crt71/getqloc.c` | wave27 CRT-SRC (v0, getqloc.c); supersedes transplant |
| ✅ MATCH | `GetLcidFromDefault` | 0x10100488 | 26 | `crt71/getqloc.c` | wave27 CRT-SRC (v0, getqloc.c); supersedes transplant |
| ✅ MATCH | `TestDefaultCountry` | 0x10100518 | 30 | `crt71/getqloc.c` | wave27 CRT-SRC (v0, getqloc.c); supersedes transplant |
| ✅ MATCH | `LcidFromHexString` | 0x10100619 | 53 | `crt71/getqloc.c` | wave27 CRT-SRC (v0, getqloc.c); supersedes transplant |
| ✅ MATCH | `GetPrimaryLen` | 0x1010064e | 29 | `crt71/getqloc.c` | wave27 CRT-SRC (v0, getqloc.c); supersedes transplant |
| ✅ MATCH | `GetLcidFromCountry` | 0x10100a55 | 55 | `crt71/getqloc.c` | wave27 CRT-SRC (v0, getqloc.c); supersedes transplant |
| ✅ MATCH | `GetLcidFromLangCountry` | 0x10100a8c | 134 | `crt71/getqloc.c` | wave27 CRT-SRC (v0, getqloc.c); supersedes transplant |
| ✅ MATCH | `GetLcidFromLanguage` | 0x10100b12 | 85 | `crt71/getqloc.c` | wave27 CRT-SRC (v0, getqloc.c); supersedes transplant |
| ✅ MATCH | `sbh_heap_init` | 0x10101163 | 72 | `crt71/sbheap.c` | wave27 CRT-SRC (v0, sbheap.c); supersedes transplant |
| ✅ MATCH | `sbh_find_block` | 0x101011ab | 43 | `crt71/sbheap.c` | wave27 CRT-SRC (v0, sbheap.c); supersedes transplant |
| ✅ MATCH | `sbh_free_block` | 0x101011d6 | 792 | `crt71/sbheap.c` | wave27 CRT-SRC (v0, sbheap.c); supersedes transplant |
| ✅ MATCH | `sbh_alloc_new_region` | 0x101014ee | 183 | `crt71/sbheap.c` | wave27 CRT-SRC (v0, sbheap.c); supersedes transplant |
| ✅ MATCH | `sbh_alloc_new_group` | 0x101015a5 | 262 | `crt71/sbheap.c` | wave27 CRT-SRC (v0, sbheap.c); supersedes transplant |
| ✅ MATCH | `sbh_resize_block` | 0x101016ab | 735 | `crt71/sbheap.c` | wave27 CRT-SRC (v0, sbheap.c); supersedes transplant |
| ✅ MATCH | `sbh_heap_check` | 0x10101a5b | 793 | `crt71/sbheap.c` | wave27 CRT-SRC (v0, sbheap.c); supersedes transplant |
| ✅ MATCH | `sbh_alloc_block` | 0x10101dcf | 764 | `crt71/sbheap.c` | wave27 CRT-SRC (v0, sbheap.c); supersedes transplant |
| ✅ MATCH | `write_char` | 0x10105490 | 37 | `crt71/woutput.c` | wave27 CRT-SRC (v0, woutput.c); NEW match (was todo) |
| ✅ MATCH | `write_multi_char` | 0x101054b5 | 37 | `crt71/woutput.c` | wave27 CRT-SRC (v0, woutput.c); supersedes transplant |
| ✅ MATCH | `write_string` | 0x101054da | 61 | `crt71/woutput.c` | wave27 CRT-SRC (v0, woutput.c); supersedes transplant |
| ✅ MATCH | `ungetc` | 0x10105e3d | 108 | `crt71/ungetc.c` | wave27 CRT-SRC (v0, ungetc.c); supersedes transplant |
| ✅ MATCH | `resetstkoflw` | 0x10105fd9 | 227 | `crt71/resetstk.c` | wave27 CRT-SRC (v0, resetstk.c); supersedes transplant |
| ✅ MATCH | `getbuf` | 0x10106abf | 68 | `crt71/_getbuf.c` | wave27 CRT-SRC (v0, _getbuf.c); supersedes transplant |
| ✅ MATCH | `CPtoLCID` | 0x10106c9b | 47 | `crt71/mbctype.c` | wave27 CRT-SRC (v0, mbctype.c); supersedes transplant |
| ✅ MATCH | `setSBCS` | 0x10106cca | 41 | `crt71/mbctype.c` | wave27 CRT-SRC (v0, mbctype.c); supersedes transplant |
| ✅ MATCH | `initmbctable` | 0x101071de | 30 | `crt71/mbctype.c` | wave27 CRT-SRC (v0, mbctype.c); supersedes transplant |
| ✅ MATCH | `getenv` | 0x10107ec7 | 129 | `crt71/getenv.c` | wave27 CRT-SRC (v0, getenv.c); supersedes transplant |
| ✅ MATCH | `atexit` | 0x10108273 | 18 | `crt71/atonexit.c` | wave27 CRT-SRC (v0, atonexit.c); supersedes transplant |
| ✅ MATCH | `crtMessageBoxA` | 0x10108285 | 249 | `crt71/crtmbox.c` | wave27 CRT-SRC (v0, crtmbox.c); supersedes transplant |
| ✅ MATCH | `fptostr` | 0x1010837e | 119 | `crt71/_fptostr.c` | wave27 CRT-SRC (v0, _fptostr.c); supersedes transplant |
| ✅ MATCH | `xtoa` | 0x101086ca | 62 | `crt71/xtoa.c` | wave27 CRT-SRC (v0, xtoa.c); supersedes transplant |
| ✅ MATCH | `itoa` | 0x10108708 | 42 | `crt71/xtoa.c` | wave27 CRT-SRC (v0, xtoa.c); supersedes transplant |
| ✅ MATCH | `ltoa` | 0x10108732 | 39 | `crt71/xtoa.c` | wave27 CRT-SRC (v0, xtoa.c); supersedes transplant |
| ✅ MATCH | `x64toa@20` | 0x10108773 | 109 | `crt71/xtoa.c` | wave27 CRT-SRC (v0, xtoa.c); NEW match (was todo) |
| ✅ MATCH | `i64toa` | 0x101087e0 | 49 | `crt71/xtoa.c` | wave27 CRT-SRC (v0, xtoa.c); supersedes transplant |
| ✅ MATCH | `ui64toa` | 0x10108811 | 27 | `crt71/xtoa.c` | wave27 CRT-SRC (v0, xtoa.c); supersedes transplant |
| ✅ MATCH | `security_init_cookie` | 0x1010882c | 102 | `crt71/seccinit.c` | wave27 CRT-SRC (v0, seccinit.c); supersedes transplant |
| ✅ MATCH | `wtomb_environ` | 0x1010953d | 144 | `crt71/wtombenv.c` | wave27 CRT-SRC (v0, wtombenv.c); supersedes transplant |
| ✅ MATCH | `strncnt` | 0x10109f7c | 28 | `crt71/a_cmp.c` | wave27 CRT-SRC (v0, a_cmp.c); supersedes transplant |
| ✅ MATCH | `findenv` | 0x1010a31c | 77 | `crt71/setenv.c` | wave27 CRT-SRC (v0, setenv.c); supersedes transplant |
| ✅ MATCH | `copy_environ` | 0x1010a369 | 97 | `crt71/setenv.c` | wave27 CRT-SRC (v0, setenv.c); supersedes transplant |
| ✅ MATCH | `crtsetenv` | 0x1010a3ca | 469 | `crt71/setenv.c` | wave27 CRT-SRC (v0, setenv.c); supersedes transplant |
| ✅ MATCH | `R_IssueDelayedDrawing` | 0x1000bad0 | 1 | `src/f/1000bad0_R_IssueDelayedDrawing.c` | wave27 honest-C trivial empty (bare ret); CRT-stub coincidence not claimed |
| ✅ MATCH | `R_RegisterFont` | 0x1000ce60 | 1 | `src/f/1000ce60_R_RegisterFont.c` | wave27 honest-C trivial empty (bare ret); CRT-stub coincidence not claimed |
| ✅ MATCH | `R_ResetImageAllocations` | 0x1000ce70 | 1 | `src/f/1000ce70_R_ResetImageAllocations.c` | wave27 honest-C trivial empty (bare ret); CRT-stub coincidence not claimed |
| ✅ MATCH | `FUN_1006771e` | 0x1006771e | 1 | `src/f/1006771e_FUN_1006771e.c` | wave27 honest-C trivial empty (bare ret); CRT-stub coincidence not claimed |
| ✅ MATCH | `FUN_100853af` | 0x100853af | 1 | `src/f/100853af_FUN_100853af.c` | wave27 honest-C trivial empty (bare ret); CRT-stub coincidence not claimed |
| ✅ MATCH | `FUN_10085bf4` | 0x10085bf4 | 1 | `src/f/10085bf4_FUN_10085bf4.c` | wave27 honest-C trivial empty (bare ret); CRT-stub coincidence not claimed |
| ✅ MATCH | `FUN_1009aae7` | 0x1009aae7 | 1 | `src/f/1009aae7_FUN_1009aae7.c` | wave27 honest-C trivial empty (bare ret); CRT-stub coincidence not claimed |
| ✅ MATCH | `FUN_100cb929` | 0x100cb929 | 1 | `src/f/100cb929_FUN_100cb929.c` | wave27 honest-C trivial empty (bare ret); CRT-stub coincidence not claimed |

## wave28 (full multi-flag CRT join — 90 certifications)

| Status | Function | Address | Bytes | Source TU | Notes |
|--------|----------|---------|-------|-----------|-------|
| ✅ MATCH | `scprintf` | 0x100f5f6c | 49 | `crt71/sprintf.c` | wave28 CRT-SRC (-O1, sprintf.c); supersedes transplant |
| ✅ MATCH | `qsort` | 0x100f6310 | 643 | `crt71/qsort.c` | wave28 CRT-SRC (-O1, qsort.c); supersedes transplant |
| ✅ MATCH | `flush` | 0x100f6add | 93 | `crt71/fflush.c` | wave28 CRT-SRC (-O1, fflush.c); supersedes transplant |
| ✅ MATCH | `fopen` | 0x100f6cf2 | 19 | `crt71/fopen.c` | wave28 CRT-SRC (-O1, fopen.c); supersedes transplant |
| ✅ MATCH | `localtime` | 0x100f6e84 | 384 | `crt71/localtim.c` | wave28 CRT-SRC (-O1, localtim.c); supersedes transplant |
| ✅ MATCH | `time` | 0x100f7004 | 57 | `crt71/time.c` | wave28 CRT-SRC (-O1, time.c); supersedes transplant |
| ✅ MATCH | `fwrite` | 0x100f70da | 263 | `crt71/fwrite.c` | wave28 CRT-SRC (-O1, fwrite.c); supersedes transplant |
| ✅ MATCH | `vscprintf` | 0x100f7377 | 48 | `crt71/vsprintf.c` | wave28 CRT-SRC (-O1, vsprintf.c); supersedes transplant |
| ✅ MATCH | `iswupper` | 0x100f786a | 14 | `crt71/_wctype.c` | wave28 CRT-SRC (-O1, _wctype.c); supersedes transplant |
| ✅ MATCH | `strdup` | 0x100f799f | 43 | `crt71/strdup.c` | wave28 CRT-SRC (-O1, strdup.c); supersedes transplant |
| ✅ MATCH | `strcats` | 0x100f7b6a | 36 | `crt71/setlocal.c` | wave28 CRT-SRC (-O1, setlocal.c); supersedes transplant |
| ✅ MATCH | `lc_strtolc` | 0x100f7b8e | 220 | `crt71/setlocal.c` | wave28 CRT-SRC (-O1, setlocal.c); supersedes transplant |
| ✅ MATCH | `lc_lctostr` | 0x100f7c6a | 78 | `crt71/setlocal.c` | wave28 CRT-SRC (-O1, setlocal.c); supersedes transplant |
| ✅ MATCH | `expandlocale` | 0x100f7db2 | 348 | `crt71/setlocal.c` | wave28 CRT-SRC (-O1 -GS-, setlocal.c); supersedes transplant |
| ✅ MATCH | `vsnwprintf` | 0x100f93bb | 111 | `crt71/vsnwprnt.c` | wave28 CRT-SRC (-O1, vsnwprnt.c); supersedes transplant |
| ✅ MATCH | `inc` | 0x100f9442 | 22 | `crt71/input.c` | wave28 CRT-SRC (-O1, input.c); supersedes transplant |
| ✅ MATCH | `write_char` | 0x100fa439 | 51 | `crt71/output.c` | wave28 CRT-SRC (-O1, output.c); supersedes transplant |
| ✅ MATCH | `write_multi_char` | 0x100fa46c | 36 | `crt71/output.c` | wave28 CRT-SRC (-O1, output.c); supersedes transplant |
| ✅ MATCH | `write_string` | 0x100fa490 | 55 | `crt71/output.c` | wave28 CRT-SRC (-O1, output.c); supersedes transplant |
| ✅ MATCH | `stbuf` | 0x100fb55d | 136 | `crt71/_sftbuf.c` | wave28 CRT-SRC (-O1, _sftbuf.c); supersedes transplant |
| ✅ MATCH | `openfile` | 0x100fc0ae | 360 | `crt71/_open.c` | wave28 CRT-SRC (-O1, _open.c); supersedes transplant |
| ✅ MATCH | `nh_malloc` | 0x100fc438 | 44 | `crt71/malloc.c` | wave28 CRT-SRC (-O1, malloc.c); supersedes transplant |
| ✅ MATCH | `malloc` | 0x100fc464 | 18 | `crt71/malloc.c` | wave28 CRT-SRC (-O1, malloc.c); supersedes transplant |
| ✅ MATCH | `cvtdate` | 0x100fc71e | 440 | `crt71/tzset.c` | wave28 CRT-SRC (-O1, tzset.c); supersedes transplant |
| ✅ MATCH | `freebuf` | 0x100fcdb6 | 43 | `crt71/_freebuf.c` | wave28 CRT-SRC (-O1, _freebuf.c); supersedes transplant |
| ✅ MATCH | `initterm` | 0x100fd626 | 24 | `crt71/crt0dat.c` | wave28 CRT-SRC (-O1, crt0dat.c); supersedes transplant |
| ✅ MATCH | `exit` | 0x100fd79a | 17 | `crt71/crt0dat.c` | wave28 CRT-SRC (-O1, crt0dat.c); supersedes transplant |
| ✅ MATCH | `cexit` | 0x100fd7ab | 15 | `crt71/crt0dat.c` | wave28 CRT-SRC (-O1, crt0dat.c); supersedes transplant |
| ✅ MATCH | `setenvp` | 0x100fdace | 199 | `crt71/stdenvp.c` | wave28 CRT-SRC (-O1, stdenvp.c); supersedes transplant |
| ✅ MATCH | `parse_cmdline` | 0x100fdb95 | 364 | `crt71/stdargv.c` | wave28 CRT-SRC (-O1, stdargv.c); supersedes transplant |
| ✅ MATCH | `setargv` | 0x100fdd01 | 162 | `crt71/stdargv.c` | wave28 CRT-SRC (-O1, stdargv.c); supersedes transplant |
| ✅ MATCH | `heap_select` | 0x100fdf4d | 26 | `crt71/heapinit.c` | wave28 CRT-SRC (-O1, heapinit.c); supersedes transplant |
| ✅ MATCH | `heap_init` | 0x100fdf67 | 81 | `crt71/heapinit.c` | wave28 CRT-SRC (-O1, heapinit.c); supersedes transplant |
| ✅ MATCH | `heap_term` | 0x100fdfb8 | 127 | `crt71/heapinit.c` | wave28 CRT-SRC (-O1, heapinit.c); supersedes transplant |
| ✅ MATCH | `NMSG_WRITE` | 0x100fe1ee | 375 | `crt71/crt0msg.c` | wave28 CRT-SRC (-O1 -GS-, crt0msg.c); supersedes transplant |
| ✅ MATCH | `FF_MSGBANNER` | 0x100fe38f | 57 | `crt71/crt0msg.c` | wave28 CRT-SRC (-O1, crt0msg.c); supersedes transplant |
| ✅ MATCH | `Getmonths` | 0x100fea07 | 149 | `crt71/strftime.c` | wave28 CRT-SRC (-O1, strftime.c); supersedes transplant |
| ✅ MATCH | `store_str` | 0x100feccf | 32 | `crt71/strftime.c` | wave28 CRT-SRC (-O1, strftime.c); supersedes transplant |
| ✅ MATCH | `store_num` | 0x100fed25 | 121 | `crt71/strftime.c` | wave28 CRT-SRC (-O1, strftime.c); supersedes transplant |
| ✅ MATCH | `get_lc_time` | 0x100ff5b2 | 871 | `crt71/inittime.c` | wave28 CRT-SRC (-O1, inittime.c); supersedes transplant |
| ✅ MATCH | `free_lc_time` | 0x100ff919 | 400 | `crt71/inittime.c` | wave28 CRT-SRC (-O1, inittime.c); supersedes transplant |
| ✅ MATCH | `TranslateName` | 0x10100428 | 96 | `crt71/getqloc.c` | wave28 CRT-SRC (-O1, getqloc.c); supersedes transplant |
| ✅ MATCH | `GetLcidFromDefault` | 0x10100488 | 26 | `crt71/getqloc.c` | wave28 CRT-SRC (-O1, getqloc.c); supersedes transplant |
| ✅ MATCH | `ProcessCodePage` | 0x101004a2 | 118 | `crt71/getqloc.c` | wave28 CRT-SRC (-O1 -GS-, getqloc.c); supersedes transplant |
| ✅ MATCH | `TestDefaultCountry` | 0x10100518 | 30 | `crt71/getqloc.c` | wave28 CRT-SRC (-O1, getqloc.c); supersedes transplant |
| ✅ MATCH | `LcidFromHexString` | 0x10100619 | 53 | `crt71/getqloc.c` | wave28 CRT-SRC (-O1, getqloc.c); supersedes transplant |
| ✅ MATCH | `GetPrimaryLen` | 0x1010064e | 29 | `crt71/getqloc.c` | wave28 CRT-SRC (-O1, getqloc.c); supersedes transplant |
| ✅ MATCH | `CountryEnumProc@4` | 0x1010066b | 148 | `crt71/getqloc.c` | wave28 CRT-SRC (-O1 -GS-, getqloc.c); supersedes transplant |
| ✅ MATCH | `TestDefaultLanguage` | 0x101006ff | 113 | `crt71/getqloc.c` | wave28 CRT-SRC (-O1 -GS-, getqloc.c); supersedes transplant |
| ✅ MATCH | `LangCountryEnumProc@4` | 0x10100770 | 538 | `crt71/getqloc.c` | wave28 CRT-SRC (-O1 -GS-, getqloc.c); supersedes transplant |
| ✅ MATCH | `LanguageEnumProc@4` | 0x1010098a | 203 | `crt71/getqloc.c` | wave28 CRT-SRC (-O1 -GS-, getqloc.c); supersedes transplant |
| ✅ MATCH | `GetLcidFromCountry` | 0x10100a55 | 55 | `crt71/getqloc.c` | wave28 CRT-SRC (-O1, getqloc.c); supersedes transplant |
| ✅ MATCH | `GetLcidFromLangCountry` | 0x10100a8c | 134 | `crt71/getqloc.c` | wave28 CRT-SRC (-O1, getqloc.c); supersedes transplant |
| ✅ MATCH | `GetLcidFromLanguage` | 0x10100b12 | 85 | `crt71/getqloc.c` | wave28 CRT-SRC (-O1, getqloc.c); supersedes transplant |
| ✅ MATCH | `get_qualified_locale` | 0x10100b67 | 437 | `crt71/getqloc.c` | wave28 CRT-SRC (-O1 -GS-, getqloc.c); supersedes transplant |
| ✅ MATCH | `sbh_heap_init` | 0x10101163 | 72 | `crt71/sbheap.c` | wave28 CRT-SRC (-O1, sbheap.c); supersedes transplant |
| ✅ MATCH | `sbh_find_block` | 0x101011ab | 43 | `crt71/sbheap.c` | wave28 CRT-SRC (-O1, sbheap.c); supersedes transplant |
| ✅ MATCH | `sbh_free_block` | 0x101011d6 | 792 | `crt71/sbheap.c` | wave28 CRT-SRC (-O1, sbheap.c); supersedes transplant |
| ✅ MATCH | `sbh_alloc_new_region` | 0x101014ee | 183 | `crt71/sbheap.c` | wave28 CRT-SRC (-O1, sbheap.c); supersedes transplant |
| ✅ MATCH | `sbh_alloc_new_group` | 0x101015a5 | 262 | `crt71/sbheap.c` | wave28 CRT-SRC (-O1, sbheap.c); supersedes transplant |
| ✅ MATCH | `sbh_resize_block` | 0x101016ab | 735 | `crt71/sbheap.c` | wave28 CRT-SRC (-O1, sbheap.c); supersedes transplant |
| ✅ MATCH | `sbh_heap_check` | 0x10101a5b | 793 | `crt71/sbheap.c` | wave28 CRT-SRC (-O1, sbheap.c); supersedes transplant |
| ✅ MATCH | `sbh_alloc_block` | 0x10101dcf | 764 | `crt71/sbheap.c` | wave28 CRT-SRC (-O1, sbheap.c); supersedes transplant |
| ✅ MATCH | `write_char` | 0x10105490 | 37 | `crt71/woutput.c` | wave28 CRT-SRC (-O1, woutput.c); supersedes transplant |
| ✅ MATCH | `write_multi_char` | 0x101054b5 | 37 | `crt71/woutput.c` | wave28 CRT-SRC (-O1, woutput.c); supersedes transplant |
| ✅ MATCH | `write_string` | 0x101054da | 61 | `crt71/woutput.c` | wave28 CRT-SRC (-O1, woutput.c); supersedes transplant |
| ✅ MATCH | `ungetc` | 0x10105e3d | 108 | `crt71/ungetc.c` | wave28 CRT-SRC (-O1, ungetc.c); supersedes transplant |
| ✅ MATCH | `resetstkoflw` | 0x10105fd9 | 227 | `crt71/resetstk.c` | wave28 CRT-SRC (-O1, resetstk.c); supersedes transplant |
| ✅ MATCH | `getbuf` | 0x10106abf | 68 | `crt71/_getbuf.c` | wave28 CRT-SRC (-O1, _getbuf.c); supersedes transplant |
| ✅ MATCH | `CPtoLCID` | 0x10106c9b | 47 | `crt71/mbctype.c` | wave28 CRT-SRC (-O1, mbctype.c); supersedes transplant |
| ✅ MATCH | `setSBCS` | 0x10106cca | 41 | `crt71/mbctype.c` | wave28 CRT-SRC (-O1, mbctype.c); supersedes transplant |
| ✅ MATCH | `setSBUpLow` | 0x10106cf3 | 396 | `crt71/mbctype.c` | wave28 CRT-SRC (-O1 -GS-, mbctype.c); supersedes transplant |
| ✅ MATCH | `initmbctable` | 0x101071de | 30 | `crt71/mbctype.c` | wave28 CRT-SRC (-O1, mbctype.c); supersedes transplant |
| ✅ MATCH | `getenv` | 0x10107ec7 | 129 | `crt71/getenv.c` | wave28 CRT-SRC (-O1, getenv.c); supersedes transplant |
| ✅ MATCH | `ansicp` | 0x10107f87 | 67 | `crt71/convrtcp.c` | wave28 CRT-SRC (-O1 -GS-, convrtcp.c); supersedes transplant |
| ✅ MATCH | `atexit` | 0x10108273 | 18 | `crt71/atonexit.c` | wave28 CRT-SRC (-O1, atonexit.c); supersedes transplant |
| ✅ MATCH | `crtMessageBoxA` | 0x10108285 | 249 | `crt71/crtmbox.c` | wave28 CRT-SRC (-O1, crtmbox.c); supersedes transplant |
| ✅ MATCH | `fptostr` | 0x1010837e | 119 | `crt71/_fptostr.c` | wave28 CRT-SRC (-O1, _fptostr.c); supersedes transplant |
| ✅ MATCH | `xtoa` | 0x101086ca | 62 | `crt71/xtoa.c` | wave28 CRT-SRC (-O1, xtoa.c); supersedes transplant |
| ✅ MATCH | `itoa` | 0x10108708 | 42 | `crt71/xtoa.c` | wave28 CRT-SRC (-O1, xtoa.c); supersedes transplant |
| ✅ MATCH | `ltoa` | 0x10108732 | 39 | `crt71/xtoa.c` | wave28 CRT-SRC (-O1, xtoa.c); supersedes transplant |
| ✅ MATCH | `x64toa@20` | 0x10108773 | 109 | `crt71/xtoa.c` | wave28 CRT-SRC (-O1, xtoa.c); supersedes transplant |
| ✅ MATCH | `i64toa` | 0x101087e0 | 49 | `crt71/xtoa.c` | wave28 CRT-SRC (-O1, xtoa.c); supersedes transplant |
| ✅ MATCH | `ui64toa` | 0x10108811 | 27 | `crt71/xtoa.c` | wave28 CRT-SRC (-O1, xtoa.c); supersedes transplant |
| ✅ MATCH | `security_init_cookie` | 0x1010882c | 102 | `crt71/seccinit.c` | wave28 CRT-SRC (-O1, seccinit.c); supersedes transplant |
| ✅ MATCH | `wtomb_environ` | 0x1010953d | 144 | `crt71/wtombenv.c` | wave28 CRT-SRC (-O1, wtombenv.c); supersedes transplant |
| ✅ MATCH | `strncnt` | 0x10109f7c | 28 | `crt71/a_cmp.c` | wave28 CRT-SRC (-O1, a_cmp.c); supersedes transplant |
| ✅ MATCH | `findenv` | 0x1010a31c | 77 | `crt71/setenv.c` | wave28 CRT-SRC (-O1, setenv.c); supersedes transplant |
| ✅ MATCH | `copy_environ` | 0x1010a369 | 97 | `crt71/setenv.c` | wave28 CRT-SRC (-O1, setenv.c); supersedes transplant |
| ✅ MATCH | `crtsetenv` | 0x1010a3ca | 469 | `crt71/setenv.c` | wave28 CRT-SRC (-O1, setenv.c); supersedes transplant |

## wave29 (automated decomp-draft redemption - tools/draft_tiny.py)

| Status | Function | Address | Bytes | Source TU | Notes |
|--------|----------|---------|-------|-----------|-------|
| ✅ MATCH | `R_UpdateColor` | 0x1000bf40 | 18 | `src/f/1000bf40_R_UpdateColor.c` | wave29 honest-C drafted from cleaned Ghidra decomp (/O2); canonical diff verified |
| ✅ MATCH | `R_TextWidth` | 0x1000c000 | 8 | `src/f/1000c000_R_TextWidth.c` | wave29 honest-C drafted from cleaned Ghidra decomp (/O2); canonical diff verified |
| ✅ MATCH | `R_GetMinSpecImageMemory` | 0x1000c8d0 | 6 | `src/f/1000c8d0_R_GetMinSpecImageMemory.c` | wave29 honest-C drafted from cleaned Ghidra decomp (/O2); canonical diff verified |
| ✅ MATCH | `FUN_10017250` | 0x10017250 | 51 | `src/f/10017250_FUN_10017250.c` | wave29 honest-C drafted from cleaned Ghidra decomp (/O2); canonical diff verified |
| ✅ MATCH | `R_RegisterMaterial` | 0x10017290 | 29 | `src/f/10017290_R_RegisterMaterial.c` | wave29 honest-C drafted from cleaned Ghidra decomp (/O2); canonical diff verified |
| ✅ MATCH | `R_RegisterRawImage` | 0x100172b0 | 30 | `src/f/100172b0_R_RegisterRawImage.c` | wave29 honest-C drafted from cleaned Ghidra decomp (/O2); canonical diff verified |
| ✅ MATCH | `R_GetMaterialName` | 0x10017300 | 7 | `src/f/10017300_R_GetMaterialName.c` | wave29 honest-C drafted from cleaned Ghidra decomp (/O2); canonical diff verified |
| ✅ MATCH | `R_RegisterInlineModel` | 0x1001d8a0 | 22 | `src/f/1001d8a0_R_RegisterInlineModel.c` | wave29 honest-C drafted from cleaned Ghidra decomp (/O2); canonical diff verified |
| ✅ MATCH | `R_noop` | 0x10023e90 | 57 | `src/f/10023e90_R_noop.c` | wave29 honest-C drafted from cleaned Ghidra decomp (/O2); canonical diff verified |
| ✅ MATCH | `R_GpuWaited` | 0x10032d70 | 10 | `src/f/10032d70_R_GpuWaited.c` | wave29 honest-C drafted from cleaned Ghidra decomp (/O2); canonical diff verified |

## wave30 (draft_tiny band 61-150B)

| Status | Function | Address | Bytes | Source TU | Notes |
|--------|----------|---------|-------|-----------|-------|
| ✅ MATCH | `R_MarkFragments` | 0x1001d910 | 77 | `src/f/1001d910_R_MarkFragments.c` | wave30 honest-C decomp-draft (/O2); canonical diff verified |
| ✅ MATCH | `R_BeginDebugFrame` | 0x10022040 | 114 | `src/f/10022040_R_BeginDebugFrame.c` | wave31 honest-C decomp-draft + 2 hand-fits (/O2); canonical diff verified 100% |

## wave33 (dual-variant join: resolved-disp + symmetric intra-call masking)

| Status | Function | Address | Bytes | Source TU | Notes |
|--------|----------|---------|-------|-----------|-------|
| ✅ MATCH | `FUN_100046e0` | 0x100046e0 | 68 | `src/f/100046e0_FUN_100046e0.c` | wave33 honest-C decomp-draft (/O2); certified under MASK_INTRA=1 symmetric masking (self/section-relative calls zeroed both sides) |
| ✅ MATCH | `FUN_10015740` | 0x10015740 | 146 | `src/f/10015740_FUN_10015740.c` | wave33 honest-C decomp-draft (/O2); certified under MASK_INTRA=1 symmetric masking (self/section-relative calls zeroed both sides) |
| ✅ MATCH | `R_AddPolyToScene` | 0x10020ce0 | 12 | `src/tu/addlight.c` | wave37 honest-C inside 5-fn IPRA cluster TU (w/ Sub_1001ffc0 gate, 23d40/23d70 statics); verified tools/tu_diff 100%; siblings in progress |
| ✅ MATCH | `FUN_10060c10` | 0x10060c10 | 26 | `src/tu/clustb.c` | wave43 honest-C vsnprintf wrapper (force-NUL); verified tools/tu_diff 100% inside cluster-B TU |

## wave77 (import-thunk shims: indirect tail-call through const fn-ptr slot)
| ✅ MATCH | `RtlUnwind` | 0x1010a722 | 6 | `src/tu/thunks.c` | honest C ff25 shim; match_gfx normalized 100% |
| ✅ MATCH | `Direct3DCreate9` | 0x1006221a | 6 | `src/tu/thunks.c` | honest C ff25 shim; match_gfx normalized 100% |
| ✅ MATCH | `DirectDrawEnumerateExA` | 0x100f5c2e | 6 | `src/tu/thunks.c` | honest C ff25 shim; match_gfx normalized 100% |
| ✅ MATCH | `DirectDrawCreateEx` | 0x100f5c34 | 6 | `src/tu/thunks.c` | honest C ff25 shim; match_gfx normalized 100% |

## wave79 (MISSING-pool honest drafts)
| ✅ MATCH | `FUN_1001d900` | 0x1001d900 | 14 | `src/tu/missing1.c` | honest C flag-read; match_gfx normalized 100% |
| ✅ MATCH | `FUN_10013200` | 0x10013200 | 79 | `src/tu/missing3.c` | honest C material-sync; match_gfx normalized 100% first shot |
| ✅ MATCH | `FUN_10012f40` | 0x10012f40 | 51 | `src/tu/missing6.c` | honest C service-registration; match_gfx normalized 100% |
| ✅ MATCH | `R_GetFarPlaneDist` | 0x1000aa60 | 82 | `src/tu/missing7.c` | honest C FOV-override+clamp; match_gfx normalized 100% |

## wave85 (tiny-function batch: /O1 idioms + /Gr thiscall trick)
| ✅ MATCH | `FUN_100fe1e8` | 0x100fe1e8 | 6 | `src/tu/tiny1.c` | honest C `return 1`; **compile with /O1** (xor+inc idiom); stdcall ret 0xc |
| ✅ MATCH | `FUN_10081d06` | 0x10081d06 | 24 | `src/tu/tiny2.c` | honest C ctor; **/O1 /Gr**; obj symbol @Ctor10081d06@4 |
| ✅ MATCH | `FUN_10081d8e` | 0x10081d8e | 22 | `src/tu/tiny2.c` | honest C derived ctor, ECX survives base call via same-TU IPRA; **/O1 /Gr** |
| ✅ MATCH | `FUN_10081a02` | 0x10081a02 | 16 | `src/tu/tiny3.c` | honest C free+vtbl-reset dtor; **/O1 /Gr**; pop-ecx esp-adjust idiom |
| ✅ MATCH | `___ld12tod` | 0x101063c0 | 22 | `src/tu/tiny7.c` | honest C x87-converter fwd; **/O1**; mem-direct push idiom |
| ✅ MATCH | `___ld12tof` | 0x101063d6 | 22 | `src/tu/tiny7.c` | honest C x87-converter fwd; **/O1**; twin body |

## wave89 (ctor recipe + import-call idioms, +4)
| ✅ MATCH | `FUN_100822ce` | 0x100822ce | 27 | `src/tu/tinyA.c` | honest C ctor; /O2 /Gr; z-variable gives xor-ecx/mov idiom |
| ✅ MATCH | `FUN_10080e16` | 0x10080e16 | 33 | `src/tu/tinyB.c` | honest C ctor; /O2 /Gr; same recipe |
| ✅ MATCH | `FUN_101077f1` | 0x101077f1 | 34 | `src/tu/tinyC.c` | honest C bit-index fetch; (b+b*8)*4 lea shape |
| ✅ MATCH | `FUN_100fbfb0` | 0x100fbfb0 | 21 | `src/tu/tinyD.c` | honest C indexed handoff; /O1 /Oy-; 8-byte stride via char* math |
| ✅ MATCH | `FUN_10085dc1` | 0x10085dc1 | 38 | `src/tu/tinyE.c` | honest C wide ctor; /O2 /Gr; PE store order IS source order |
| ✅ MATCH | `FUN_100f7939` | 0x100f7939 | 56 | `src/tu/tinyF.c` | honest C handler-table init; /O2; slot-reuse via temp |
| ✅ MATCH | `FUN_100fc07d` | 0x100fc07d | 49 | `src/tu/tinyH.c` | honest C ensure-init wrapper; /O1 /Oy-; ull-array lea |
| ✅ MATCH | `FUN_1004d520` | 0x1004d520 | 59 | `src/tu/tinyG.c` | honest C double-vtable reset; /O2; deferred cdecl cleanup |

## wave96 (transplant->honest conversions, +4)
| ✅ MATCH | `FUN_100822e9` | 0x100822e9 | 13 | `src/tu/tinyL.c` | honest C ctor (was NAKED-ASM) |
| ✅ MATCH | `FUN_10099399` | 0x10099399 | 20 | `src/tu/tinyM.c` | honest C ctor 5 fields (was NAKED-ASM) |
| ✅ MATCH | `FUN_10084214` | 0x10084214 | 12 | `src/tu/tinyN.c` | honest C size helper; /O1 keeps inc,inc (was NAKED-ASM) |
| ✅ MATCH | `FUN_10099913` | 0x10099913 | 12 | `src/tu/tinyO.c` | honest C list peek (was NAKED-ASM) |

## wave97 (+2)
| ✅ MATCH | `FUN_10067704` | 0x10067704 | 26 | `src/tu/tinyP.c` | honest C ctor (was NAKED-ASM) |
| ✅ MATCH | `FUN_10067440` | 0x10067440 | 32 | `src/tu/tinyQ.c` | honest C ctor flag@10 (was NAKED-ASM) |
| ✅ MATCH | `FUN_10068c26` | 0x10068c26 | 28 | `src/tu/tinyS.c` | honest C sparse ctor (was NAKED-ASM) |
| ✅ MATCH | `FUN_100855e8` | 0x100855e8 | 28 | `src/tu/tinyT.c` | honest C fmt-magic check; nested-if tail order (was NAKED-ASM) |
| ✅ MATCH | `FUN_100823b5` | 0x100823b5 | 18 | `src/tu/tinyW.c` | honest C or/and init (was NAKED-ASM); /O1 |
| ✅ MATCH | `FUN_1008543f` | 0x1008543f | 42 | `src/tu/tinyX.c` | honest C 4-magic check (was NAKED-ASM); nested-if recipe |
| ✅ MATCH | `FUN_10085469` | 0x10085469 | 49 | `src/tu/tinyY.c` | honest C 5-magic check (was NAKED-ASM); same recipe |
| ✅ MATCH | `FUN_1008540c` | 0x1008540c | 51 | `src/tu/tinyZ.c` | honest C two-mask check (was NAKED-ASM); recipe #119 |
| ✅ MATCH | `FUN_1008549a` | 0x1008549a | 56 | `src/tu/tiny21.c` | honest C 6-magic check (was NAKED-ASM) |
| ✅ MATCH | `FUN_100855b0` | 0x100855b0 | 56 | `src/tu/tiny22.c` | honest C 6-magic check (was NAKED-ASM) |
| ✅ MATCH | `FUN_10106b03` | 0x10106b03 | 42 | `src/tu/tiny28.c` | honest C bounds-checked flag fetch (UNMATCHED pool); movsx via signed char |

## wave113 (context-patcher breakthrough, +3)
| ✅ MATCH | `FUN_1006518e` | 0x1006518e | 23 | `src/tu/tiny9.c` | honest C promote+tail; context-patched disp |
| ✅ MATCH | `FUN_1003e250` | 0x1003e250 | 28 | `src/tu/tiny8.c` | honest C negated float store + tail (base-symbol form) |
| ✅ MATCH | `FUN_100f5d7e` | 0x100f5d7e | 52 | `src/tu/tinyI.c` | honest C scanf-block setup; internal call resolved in-context |

## wave117 (CRT content-sweep breakthrough, +4)
| ✅ MATCH | `_sprintf` | 0x100f5f14 | 88 | `src/tu_crt/sprintf.c` | real MS crt71 source, /O1 CRT flags, context-patched |
| ✅ MATCH | `_vsprintf` | 0x100f7320 | 87 | `src/tu_crt/vsprintf.c` | real MS crt71 source, /O1 CRT flags, context-patched |
| ✅ MATCH | `__snprintf` | 0x100f7878 | 87 | `src/tu_crt/snprintf.c` | real MS crt71 source, /O1 CRT flags, context-patched |
| ✅ MATCH | `__vsnprintf` | 0x100f61b9 | 86 | `src/tu_crt/vsnprint.c` | real MS crt71 source, /O1 CRT flags, context-patched |

## wave118 (auto-symva sweep, +2)
| ✅ MATCH | `__Getdays` | 0x100fe988 | 127 | `src/tu_crt/strftime.c` | real MS source; locale table extern auto-resolved |
| ✅ MATCH | `__security_check_cookie` | 0x10100d4d | 13 | `src/tu_crt/secchk.c` | long-standing 13B wall falls via cookie data-symbol resolution |

## wave119 (full-corpus crt3 sweep begins, +1)
| ✅ MATCH | `___crtGetEnvironmentStringsA` | 0x100fdda3 | ? | `src/tu_crt/a_env.c` | real MS source; auto-symva resolved |
| ✅ MATCH | `FUN_10106b03` | 0x10106b03 | 42 | `src/tu/tiny28.c` | /O1 bounds-checked flag fetch |
| ✅ MATCH | `FUN_10106b03` | 0x10106b03 | 42 | `src/tu/tiny28.c` | /O1 bounds-checked flag fetch |
