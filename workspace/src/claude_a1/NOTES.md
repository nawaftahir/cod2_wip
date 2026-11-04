# claude_a1 — renderer 0x10001000–0x10015000

Build/verify: `make -f closed.mk SRCDIR=src/claude_a1 B=build/a1 verify`

## Verified (bindcheck OK)
| addr | function | bytes | file |
|---|---|---|---|
| 0x10005820 | R_ShutdownDebugEntry | 143 | r_debug.cpp |
| 0x10005980 | R_LocateDebugStrings | 93 | r_debug.cpp |
| 0x100059e0 | R_LocateDebugLines | 93 | r_debug.cpp |
| 0x10005a40 | R_AddPlume | 199 | r_debug.cpp |
| 0x1000bbc0 | R_SwitchFog | 116 | r_fog.cpp |
| 0x10001010 | VectorCopy | 17 | r_bsp_load_obj.cpp |
| 0x10004dc0 | R_InterpretSunLightParseParamsIntoLights | 371 | r_bsp_load_obj.cpp |
| 0x1000bdc0 | R_DuplicateFont | 340 | r_font.cpp |
| 0x1000bc70 | R_GetCharacterGlyph | 103 | r_font.cpp |
| 0x1000bf60 | R_TextWidth | 153 | r_font.cpp |

## Deferred / open
- 0x1000bb30 R_SetFog (143 B): same size, store scheduling differs (0xff store, fogEnd/fogStart reg order). ~5 variants tried.
- 0x10003430 R_ParseSunLight: depends on whole-program inlining of I_strnicmp (retail inlines only first compare) and Com_ParseExt register convention (allowLineBreaks in EAX). Needs full link.
- 0x10001350-ish R_GetWorldBounds: retail reloads rgp.world (needs &rgp taken somewhere in link).
- 0x10005970 R_ShutdownDebug (13 B): matches, placement non-unique.
- 0x100058b0 R_TransferDebugGlobals: not yet matching.

- 0x10001390 R_InterpretSunLightParseParams (62 B, r_bsp.cpp): same size; needs rgp.world reload (&rgp taken only in 0x10012e70).
- 0x100131b0 R_EndRegistration: byte-identical but duplicate at 0x100226c0 -> non-unique placement.
- 0x10012e70 R_InitGlobalStructs-like: needs PC backEnd layout (sizeof 0x36b60, not Mac 0x36c94); caller 0x10012f80 codex-taken.
- Text cluster (0x1000bce0 R_RegisterFont, 0x1000c0f0, 0x1000c250, 0x1000c010): blocked by codex-taken 0x10017100 / 0x1002c0b0.
- DRAFT (not in tus.txt): r_caps.cpp R_RespondToMissingCaps 0x10005150 + R_CheckDxCaps 0x100051e0; a1_d3d.h. Next: R_PreCreateWindow 0x10012820 cluster.

## Facts
- PINNED: DxGlobals Mac 1.3 layout holds through hasTransparencyMsaa (maxAnisotropy 0x101d4960 .. 0x101d496e); r_local.h here extends DxGlobals.
- PINNED: vidConfig 0x101d4c6c (opencod2 vidConfig_t layout, maxTextureSize +0x18). Dvar ptrs: r_fullscreen 0x101ce60c, r_monitor 0x101ce610,
  vid_xpos 0x101ce6cc, vid_ypos 0x101ce66c, r_aaSamples 0x101ce6dc, r_displayRefresh 0x101ce7fc, r_mode 0x101ce688, r_rendererPreference 0x101ce7f8, r_rendererInUse 0x101ce708.
- PINNED: caps tables s_capsCheckBits[36] 0x101825d8 {offset,setBits,clearBits,response,msg} (clearBits tested first) + s_capsCheckInt[8] 0x101828a8; R_CheckDxCaps caps in EDI, allowed=6.
- PINNED: registeredFontCount 0x1076a82c, registeredFont[16] 0x101ce840; refexport 0x1076a894 slot 276 R_TextWidth, 320 R_DuplicateFont.
- PINNED: s_cmdList 0x1042e778 (usedTotal +0x30000, usedCritical +0x30004, lastCmd +0x30008); ids <=0xe critical, >=0x15 non-critical (0x2000 reserve).
- PINNED (offset probe vs retail): GfxBackEndData.debugGlobals=0x249d18; r_globals_t.fogSettings=0x146c (rg=0x101d4d00);
  GfxWorld.mins=0x13c, sunParse=0x34, sunLight=0xb4, sunColorFromBsp=0xe0; DxGlobals sizeof 11736, inScene 0x2d3d, dx=0x101d1bf0;
  r_global_permanent_t.world=4252 (rgp=0x101d0b00); scene=0x10678500; debugGlobals=0x101ae4b8; frontEndDataOut=0x101da9c8.
- PINNED names (GLM mislabels): 0x10005980 R_LocateDebugStrings (not R_LightingFromCubemapShots); 0x10003430 R_ParseSunLight
  (not R_DObjReplaceMaterial); 0x10005970 R_ShutdownDebug; 0x100058b0 R_TransferDebugGlobals; 0x1000bb30 R_SetFog;
  0x10001390 R_InterpretSunLightParseParams; 0x10004dc0 R_InterpretSunLightParseParamsIntoLights; 0x100013d0 R_UpdateLightsFromDvars
  (calls 0x100012c0 dvar->sunParse fill); 0x100138c0 R_Error; 0x10061c80 Com_Printf; 0x10061cd0 Com_Error; 0x10060c70 va;
  0x1005df00 Vec3ScaleToUnitMax; 0x10060950 I_strnicmp; 0x1005f690 Com_ParseExt; 0x10012040 init (inlines R_ClearFogs+R_InitDebug);
  0x10005710/0x10005680 R_AddDebugString wrapper/core.
- ri slot 111 = Sys_GetValue, 112 = Sys_IsMainThread (applied in src/claude/ri.h by lead).
- LTCG alias: a global whose address is never taken is not reloaded; retail reloads imply &global taken somewhere (R_ShutdownDebug(&debugGlobals) fixed R_AddPlume).
- functions_gfx10.json is missing 0x10013930 (20 B std::sort wrapper -> 0x10013950); breaks R_Error extent.
