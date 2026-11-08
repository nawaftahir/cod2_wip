# Xbox 360 reference for the 1.3 client tail (control-flow hints only)

Tag: **SUPPORTED** for everything below (a second build of the same engine agrees or differs). It is a different platform and
build (`cod2mp_xenon_r`, Oct 2005, a pre-release Xbox 360 client, not 1.3 PC): use it for control flow, callee order and guards only.
Never for bytes, addresses, struct layout or constants. Where Xbox and PC differ by platform (Live, rumble, no PunkBuster, no
cd-key, no WWW download) that is not a bug in our source. Nothing here is PINNED on the retail PC binary.

## Input and tool
- `CoD2MP.exe` is **not a plain PE**: it is an `XEX2` container (header `XEX2`, data at 0x6000, load address 0x82000000,
  entry 0x82544070). File format info = AES-CBC encrypted + "basic" compression (list of data/zero blocks). The file key
  decrypts with the **devkit zero key**, after which the image starts with `MZ` (PE, machine PowerPC big-endian). The
  link map's `Rva+Base` column minus 0x400000 is the image RVA; Xbox VA = 0x82000000 + RVA. Map symbols are MSVC-mangled
  (`?CG_EntityEvent@@YAXPAUcentity_s@@H@Z`: the mangled string is the signature).
- `tools/xenon_dis.py EXE MAP find|calls|dis NAME...` reads the XEX in memory (no files written, nothing executed), strips
  mangling for lookup, and prints the ordered `bl` callees, string refs (lis+addi pairs) and branch counts, or a full listing
  (local use only, do not commit listings). Capstone PPC decodes everything in these functions; VMX128 words were not met (1
  trailing pad word per function is reported as undecodable). `bctrl` shows as `<indirect>`. Function end = next map symbol.
  Run python with `-I` from a script dir outside the download dir.
- `__savegprlr_N` / `__restgprlr_N` / `__savefpr_N` are prologue/epilogue helpers (the Xbox has no `blr` at the end of most
  functions: the epilogue is `b __restgprlr`). Asserts are compiled in (`MyAssertHandler > DebugBreak` pairs): drop them when
  reading call order.

## Coverage
Present in the Xbox map and read: CG_EntityEvent, SCR_DrawScreenField, CG_SubtitlePrint, SVC_Status, CL_CheckForResend,
CM_ClearWorld, SV_Map_f, CL_ConsolePrint_AddLine, CL_ConsolePrint, CL_ParseServerMessage, CM_PointContents, CM_TempBoxModel,
CM_LinkEntity, CM_Trace, CM_BoxSightTrace, Window_Paint, Menu_SetNextCursorItem, Item_Text_AutoWrapped_Paint,
CG_DrawAdsOverlay, CG_DrawCursorhint, CG_FireWeapon, CG_ClipMoveToEntities, G_GetPlayerViewOrigin, CG_CalcCrosshairPosition,
CG_DrawScoreboard (+ Objective is a different function here), FX_AddFxToScene, FX_CalcOriginAndAxis, IntersectPlanes,
R_UpdateEffectsNonBolt, CL_Netchan_PrintProfileStats, XAnimCalc, VM_Notify (callee lists only for the last eight).

**Not in the Xbox map** (PC-only or renamed, nothing to compare): CL_ParseDownload, DL_BeginDownload, CL_ParseWWWDownload,
CL_ReadMotd, CL_SyncGpu, CL_TrimWhitespace_40cf40, nb_decode, PC_EvaluateTokens, Com_ErrorAbort, SEH_IsChinesePunctuation,
PbSv*, CL_Netchan_DrawProfileLine, FX_CalcOriginAndAxis lab copies, libwww and libcmt members.

## Per function

### CG_SubtitlePrint(int msec, snd_alias_t *alias)
Callees: 5 asserts, `floor`, `CL_SubtitlePrint`. Structure: debug asserts (cgs, alias, the three subtitle dvars + min-time dvar)
only when the dvar pointers are null; then `if (msec && alias->pszSubtitle)`; width = `viewAspect > 1.3333334f ? widescreen :
standard` dvar `->integer`; `minMsec = floor(minTimeDvar.value * 1000 + 0.5)`; `if (minMsec - msec >= 0) msec = minMsec` (i.e.
`max(msec, minMsec)` as ours); `CL_SubtitlePrint(alias->pszSubtitle, msec, width)`. Dvars: `cg_subtitleWidthStandard`,
`cg_subtitleWidthWidescreen`, `cg_subtitleMinTime`. Ours matches the flow. Name only: our `cg_tracerScaleDistRange_0` is the
`cg_subtitleMinTime` dvar (our registration already says so, line 643 of cg_main_mp.cpp); a rename would be cosmetic.
Retail PC extra 126 B are asserts (assert strings above), not control flow.

### SCR_DrawScreenField
Order: `!uiStarted` -> ClearScreen(indirect, 1, black) + return; `state != ACTIVE(8) && != CINEMATIC(1)` -> ClearScreen;
`UI_UpdateTime`; `UI_IsFullscreen`. Not fullscreen, switch(state): CINEMATIC `SCR_DrawCinematic`; LOGO `CL_DrawLogo`, return if
state changed from LOGO; DISCONNECTED `SND_StopSounds(0)`, `Sys_IsMainThread`: **not main thread** -> `CL_AnyLocalClientChallenging`,
if true `UI_Refresh + UI_DrawConnectScreen`, else nothing; **main thread** -> `assert(CL_AllLocalClientsDisconnected())` then a
five-way cascade on four flags: flagA `UI_SetActiveMenu(10)`, else flagB `(13)`, else flagC `(12)`, else flagD `(11)`, else `(1)`;
states 3..7 `UI_Refresh + UI_DrawConnectScreen`; ACTIVE `CL_SetView`, `CG_DrawActiveFrame(localClient,0,0,0,1)` (our
`CL_CGameRendering(1)`), if it returns 0 `CL_SendCmdInternal`, then `SCR_DrawDemoRecording`; default `Com_Error(0, ...)`.
Fullscreen: only ACTIVE does work (`CG_DrawActiveFrame(...,0)`, `CL_SendCmdInternal` if 0, no demo-recording call); all other
states fall to the common tail. Tail: `if (keyCatchers & 8 && state != CINEMATIC) UI_Refresh`; `if (net_showprofile) Net_DisplayProfile`;
`re.EndView(0)` (indirect).
Differences vs ours: (1) the Xbox main-thread DISCONNECTED path has the 4-flag menu cascade, ours has a 1-flag
`wwwDlInProgress` test (UI_Refresh+DrawConnectScreen vs `UI_SetActiveMenu(1)`); the flags are Live-specific on Xbox, the PC
retail 465 B gap suggests PC has a similar cascade with different flags (look for menu ids around 10..13 in the retail
`UI_SetActiveMenu` call sites). (2) `CL_AllLocalClientsDisconnected` assert in that path (ours has none).
(3) Non-main-thread DISCONNECTED breaks out when nobody is challenging: ours falls into the connect-screen case only when
`CL_AnyLocalClientChallenging()`; same.

### SVC_Status(netadr_t from)
Callees: `LargeLocal(0x4000)`, `Dvar_InfoString(0x404)`, `SV_Cmd_Argv(1)` -> `Info_SetValueForKey("challenge")`,
`Dvar_GetBool("fs_restrict")` -> `Com_sprintf("demo %s", Info_ValueForKey("sv_keywords"))` + set, client loop
(`state >= 2`): `SV_GameClientNum`, `gameInitialized ? G_GetClientScore : 0`, `Com_sprintf("%i %i \"%s\"\n")`, length check
`>= 0x4000` break, copy; `Dvar_GetString("g_password")` -> `pswrd` "1"/"0"; final `Com_sprintf(msg, 0x2000, "statusResponse\n%s\n%s")`
and `NET_OutOfBandPrint(NS_SERVER=4, ...)`.
Difference: **no `fs_game` / `sv_pure` / `sv_referencedIwdNames` serverModded block at all** (PC 1.3 has it; ours has it). That
block is PC-only; nothing missing in ours. Keyword and demo logic same. Constant to check on retail: `Dvar_InfoString` bits 0x404
here vs our `DVAR_SERVERINFO | DVAR_SERVERINFO_NOUPDATE`.

### CL_CheckForResend
Order: `demoplaying` return; `state` must be 3 (CONNECTING) or 4 (CHALLENGING); `realtime - connectTime < 3000` return (our source
uses 2000; platform difference unless retail disagrees); `connectTime = realtime; connectPacketCount++`. CHALLENGING: `Dvar_InfoString(2)`,
`I_strncpyz`, `Info_SetValueForKey("protocol", va("%i", 115))`, `"challenge"`, **no "qport" key** (ours sets qport), build
`connect "<info>"` in a loop, `NET_OutOfBandData`, error if `!demoplaying-like flags`, `dvar_modifiedFlags &= ~2`.
CONNECTING: `Sys_IsLANAddress` guard (`net_lanauthorize || !IsLAN` there; no CL_RequestAuthorization, no PunkBuster, no
cd-key md5), `NET_OutOfBandPrint("getchallenge")`, error path. Default: `Com_Error(0, "bad state")`. The loop copies `info`
byte by byte with strlen re-evaluated each iteration (matches the strlen-in-condition shape in ours). Nothing to import for PC.

### SV_Map_f
Callees in order: `SV_Cmd_Argv(1)` (empty -> return), `Live_CheckPlayerIsSignedIn` (ours: `Com_HasPlayerProfile`), `stricmp(map,
"random")` -> `Live_GetRandomMap` (Xbox only), `FS_GetMapBaseName`, `I_strncpyz`, `I_strlwr`, `va("maps/mp/%s.%s", name,
GetBspExtension())`, `SV_Cmd_Argv(0)`, `I_stricmp(.., "devmap")`, `FS_ConvertPath`, `SV_SpawnServer`, `Dvar_SetBool(sv_cheats)`. Our PC
version adds the `FS_ReadFile(expanded) == -1 -> "Can't find map"` check, which the Xbox lacks (PC retail inlines or lacks;
the TAIL diff of 310 B "call vs inline" is more likely `SV_GetMapBaseName` / `GetBspExtension` inlining than a missing call).

### CM_ClearWorld
`memset(&cm_world, 0, ..)`, `CM_ModelBounds(0, mins, maxs)`, `freeHead = 2`, free-list loop, bounds, axis/dist, then only the
two `!sectors[SECTOR_HEAD].tree.child[0|1]` asserts (cm_world.cpp). Matches ours exactly.

### CL_ConsolePrint_AddLine / CL_ConsolePrint
AddLine callees (asserts removed): `ColorIndex` x2, `va`(assert msg), `SEH_PrintStrlen`, `ceil`, `Con_Linefeed`, `ColorIndex` x3,
`va` x2, `Con_Linefeed`, ..., `Con_Linefeed` x3 at the tail, `Con_UpdateNotifyLine`. **No indirect call**: the Xbox
measures with `SEH_PrintStrlen`+`ceil`, never `re.TextWidth`, so it cannot confirm retail's two-TextWidth-per-char fact in either
direction. Asserts present: `CON_TEXTSIZE > y*linewidth+lineOffset` with the "invalid console buffer position" message,
`linewidth > lineOffset`, `c in 0..0xff`, color range. `CL_ConsolePrint`: `Con_OneTimeInit`, `strchr`, `memcpy`, AddLine x2 (a
mid-string flush then the remainder), asserts `txt != NULL`, `con.initialized`, "unhandled case" for `print_msg_type_t`.

### CL_ParseServerMessage
`LargeLocal`, shownet prints, `MSG_Init`, `MSG_ReadBitsCompress`, loop: `MSG_ReadByte`, `7` ends ("END OF MESSAGE"), shownet
"BAD CMD" print, `CL_ParseCommandString` (4), `CL_ParseGamestate` (1), `CL_ParseSnapshot` (6), **no download case**; the default case
writes `badpacket.dat` (`FS_FOpenFileWrite`, `FS_Write`, `FS_FCloseFile`) before `Com_Error`. Ours has no badpacket write: PC
size is exact so it is probably absent on PC too (Xbox debugging aid).

### CG_EntityEvent
Present Xbox-only: 4x `CG_EquipmentSound`, `CL_SetADS`, `CG_PlayRumble/PlayLoopRumble/StopRumble/StopAllRumbles`, and many
asserts (`es->surfType` range x3, `cent->currentState.number == cent->nextState.number`, `event > 0`, `event < EV_MAX_EVENTS`).
Same as ours: `CG_EntityEvent:ZERO EVENT`, four "Event %s just for client %i was sent to other clients" `Com_DPrintf`,
`CG_Obituary`, `CG_PlayFx/CG_PlayFxOnTag`, 6 `CG_FireWeapon` sites, `CG_CompassAddWeaponPingInfo`, `CG_EjectWeaponBrass`,
`CG_PrepOffHand/UseOffHand/SetEquippedOffHand`, `CG_BulletHitEvent/ClientEvent` (ours 5 refs), `FX_WarpTime`. No concrete missing
guard found; the 4360 B PC gap is layout (arm tail sharing), as TAIL says.

### Callee sequences only (no source gaps visible)
- CM_PointContents: assert `cm.numNodes`, `CM_ClipHandleToModel`, `CM_PointLeafnum_r`, `CM_PointContentsLeafBrushNode_r`.
- CM_TempBoxModel: `CM_GetBox` only (40 insns). CM_LinkEntity: `CM_ClipHandleToModel`, `CM_UnlinkEntity` x2 (once per
  early-out and once before relink), `CM_AddEntityToNode`, `CM_SortNode`.
- CM_Trace: `Profile_Begin`, `CM_ClipHandleToModel`, `CM_CalcTraceEntents`, `CM_GetTrackThreadInfo`, `CM_TestCapsuleInCapsule`,
  `CM_TestInLeafBrushNode`, `CM_MeshTestInLeaf`, `CM_PositionTest`, `CM_TraceCapsuleThroughCapsule`, `CM_TraceThroughLeaf`,
  `CM_TraceThroughTree`; `Profile_End` on every exit (the PC build has no Profile_*). CM_BoxSightTrace analog with `CM_SightTrace*`.
- Window_Paint: `Window_GetRect`, `UI_DrawRect`, `Window_SetDynamicFlags` x2, `UI_FillRect`, `UI_DrawLoadBar`, `CIN_PlayCinematic`,
  `CIN_RunCinematic`, `CIN_SetExtents`, `CIN_DrawCinematic`, `UI_DrawHandlePic`, `UI_DrawTopBottom`, `UI_DrawSides`.
- Menu_SetNextCursorItem: `Menu_SetCursorItem` x4 and `Item_SetFocus` once (the focus call sits between cursor calls).
- Item_Text_AutoWrapped_Paint: `UI_GetFontHandle`, `UI_TextHeight`, `UI_TextWidth`, `Window_GetRect`, `ceil`, `Item_GetTextRect`,
  `Item_SetTextRect`, `UI_DrawText`.
- CG_ClipMoveToEntities: `Trace_CalcBounds`, `CM_ContentsOfModel`, `CM_RadiusOfModel`, `CM_TempBoxModel`,
  `CM_TransformedBoxTraceExternal`, `Trace_CalcBounds` (second time near the end).
- G_GetPlayerViewOrigin: `G_DObjGetWorldTagPos` (error if no tag), `BG_GetBobCycle`, `BG_GetSpeed`, `BG_GetVerticalBobFactor`,
  `BG_GetHorizontalBobFactor`, `G_GetPlayerViewDirection`, `AddLeanToPosition`.
- CG_DrawScoreboard (small wrapper): `UI_GetActiveMenu`, `CL_AddReliableCommand`, `CG_DrawScoreboard_Backdrop`, `ScoresList`.
- R_UpdateEffectsNonBolt: `Sys_ResetUpdateEffectsEventNonBolt` then `R_AddFrontendCmd` (the Bolt twin is identical in shape).
- CG_CalcCrosshairPosition: `AngleVectors`, `tan` x2. FX_AddFxToScene: `AxisCopy`, `AddFxToScene`.
- CG_FireWeapon: `BG_GetNumWeapons` bounds check -> `Com_Error`, `BG_GetWeaponDef`, `BG_WeaponFireRecoil`, `CG_WeaponFlash`,
  `CG_DObjGetViewModelTagPos`, `Com_GetClientDObj`, `CG_DObjGetWorldTagPos`, `BG_EvaluateTrajectory`, `CG_PlaySoundAlias`,
  `CG_CompassAddWeaponPingInfo`, `CG_EjectWeaponBrass`, `CG_PlayRumbleOnClient` (Xbox only).
- XAnimCalc: `XAnimClearData`, `XAnimSetModel` x2, `SL_RemoveRefToStringOfLen`, `XAnimCalcParts`(x2), `XAnimCalcNonLoopEnd`, recursion
  `XAnimCalc` x2, `I_rsqrt` x2 (normalisation).
- VM_Notify: `FindVariable/FindObject`, `VM_CancelNotifyInternal`, `Scr_KillEndonThread`, `Scr_TerminateThread`,
  `Scr_SetThreadWaitTime`, `MT_Realloc/MT_Alloc/MT_Free` + `memcpy` (the endon array grow path), `Scr_EvalEquality`.

## What to try on PC (ranked)
1. SCR_DrawScreenField: model the DISCONNECTED/main-thread arm as a cascade of flag tests ending in `UI_SetActiveMenu(1)`; PC
   flags and menu ids must come from the retail binary, only the cascade shape is suggested here.
2. SV_Map_f: check whether `SV_GetMapBaseName` / `GetBspExtension` are forced inline in retail (Xbox calls both out of line).
3. CL_ParseServerMessage: no download-write block is needed; skip.
4. Everything else: no concrete missing call, guard or ordering difference was found; the Xbox build confirms our call order.
