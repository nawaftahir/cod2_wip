# CoD2MP_s.exe 1.3: verified knowledge

Facts with evidence only (LAW 12). Same compiler as 1.0: the decoded compiler rules (inline cost model,
compile sweeps, one body per helper, slot packer, RA, x87, alignment, data layout) are in
`client-1.0/docs/KNOWLEDGE.md` and hold here. This file holds what is specific to 1.3.
Raw source: `archive/NOTES_1.3.md` (agent log, 11-03..11-04). Failed attempts: `TRIED.md`.

## 0. Binary and build
- Retail built 2006-05-02, PDB `c:\builds\pc_1.3_1_1\pc\cod2\pc\CoD2MP_s.pdb`, .text vsize 1,645,581.
  Build strings: `pc_1.3_1_1`, `Mon May 01 2006 05:05:43PM`, one pooled `May  1 2006`. PINNED.
- Release link is `/FIXED` (no .reloc): the referee `tools/cmp13` rebuilds the reloc mask from in-image dwords
  and masks jump tables. Plain `cmp.py` on this exe hid ~860 KB of matching code. PINNED.
- cmp13 credits short call-free shapes only when the retail twin count equals ours: ~45 6-7 B libwww getters
  show unmatched for that reason (HYPOTHESIS: measurement artifact, bytes look identical).
- Each `make release` runs in its own docker container: builds do not block each other (SUPPORTED, used 11-04).
- The 1.0 `unknown/empty_N.cpp` TUs and the mixerGetRecordLevel post-link patch are NOT used in 1.3.

## 1. libwww (PINNED)
- Compiled WITHOUT /GL (plain cdecl prologues): +22 KB same-offset when /GL was dropped.
- Text = libwww-git snapshot (after 2001-03 and 2003-04 commits) with the `@(#) $Id$` header line removed, plus IW
  edits; retail lacks the later "Ensure not listed twice" lines. HT_OUTOFMEM call sites push `__LINE__`, so line
  numbers decide matching (tools/oom7.py, oomcmp7.py). Files where ours still differs from git (HTNet, HTAlert,
  HTInit, HTProt, HTHeader, HTTrans, HTTPReq, HTBound, HTDNS, HTMIME, HTFTP) have no unmatched fns left.
- `__FILE__` = `\builds\pc_1.3_1_1\pc\cod2src\libwww\Library\src\HTxxx.c` (drive-relative; the Makefile mounts the
  tree there). 75 path strings sit before the CRT chunk in .rdata, in link order.
- All 95 libwww TUs placed in retail order (`tus.txt`); HTStream.c belongs after HTArray.c; HTMulti.c (no
  HAVE_READDIR) after HTLog.c. config.h: no HT_EXPAT, no HT_ZLIB. libwww objs depend on config.h and headers.
- IW additions: HTFTP_setRawBytesCount / HTFTP_getDNetRawBytesCount, HTEventList_init / HTEventList_pump
  (GetMessage loop, calls HTTrace directly), PUBLIC HTBasic_new / basic_credentials.

## 2. Client code changes vs 1.0 (PINNED from retail 1.3)
- Protocol 118 (globalservers, CL_ServerInfoPacket, CL_CheckForResend). loc_language max 14.
- Download state moved from clc to cls (966dac..967008: wwwDlDisconnected, downloadName, downloadTempName,
  originalDownloadName, downloadRestart, downloadFlags, wwwDlInProgress, download, downloadBlock, downloadSize,
  downloadList); sizeof(clc) = 0x801fc. CL_ClearDownloadState: real noinline fn at 0x40cc70 AND expanded
  inline in CL_Disconnect/DownloadsComplete/InitDownloads; it calls DL_CancelDownload (0x4b59c0).
- dl_main.cpp: 13 fns (Mac STABS + KisakCOD/coduomp shapes). LAN_GetMotdFilename 0x4b50c0, CL_ReadMotd 0x4b50f0,
  CL_WWWDownload 0x4b5160 live in cl_main_pc_mp after CL_ClearMutedList.
- 128 KB MAX_MSGLEN msg buffers are LargeLocal in CL_WritePacket, CL_WriteVoicePacket, CL_Record_f,
  CL_ReadDemoMessage, CL_ConfigstringModified (oldGs). LargeLocal stays a call elsewhere (per-caller choice).
- serverInfo_t: +byte `pb` after voice (Mac offset 200), size 0x94, ping +0x28; LAN_GetServerInfo key "pb";
  LAN_CompareServers sort key 9 = pb, ping key 10.
- CL_InitOnceForAllClients: cl_maxpackets min 10, cl_profileTextHeight, cl_punkbuster (result not stored),
  motd dvar, `unskippablecinematic` (flag byte 0x5cdd10; SCR_StopCinematic gated on it).
- CD-key auth: 0x40cf40 trim, 0x40cfc0 CL_BuildMd5StrFromCDKey (PbMD5 seed 0xb684a3), CL_RequestAuthorization
  0x40d130 sends `getKeyAuthorize %i %s PB %s`. CL_CheckForResend: 2000 ms, CA_CHALLENGING first,
  PbClientConnecting calls, `getchallenge 0 "%s"`.
- fn 0x40d310 = 300 s re-auth (body PINNED, 104 B), called last in CL_Frame; no Mac name.
- CL_InitRenderer picks the console font by loc_language (cases 6..12, each its own RegisterFont call).
- CL_ConsolePrint: `color = ColorIndex(0x37)` before Sys_EnterCriticalSection(0). PbMsgToScreen = 0x405080 in
  cl_console_mp (365 B). CL_ConsolePrint_AddLine 0x404690 (2,132 B) gained an Asian word-wrap path
  (g_currentAsian 0x11972f8, cg_subtitleCharHeight 0x166bb88).
- CL_GetServerCommand: 'w' with argc>=3 and Cmd_Argv(2) == "PB" (`_stricmp`) wraps Cmd_Argv(1) as va("\x15%s").
- No `tcmd`/`tell_target` commands in 1.3 cgame (19-entry commandsList).
- Client SVC_Status: retail caps the player list at MAX_MSGLEN (`cmp esi, 0x20000`), PINNED w1 11-07 (the old 0x4000 note was wrong; fn matches now).

## 3. Shared code (qcommon/server/script)
- The client already carries every lnxded-1.0 -> 1.3 server change (dvar critical sections, PB oob, 32-bit
  fragments, voice size checks, vsnprintf, language-aware com_files).
- win_threads rewrite: Sys_GetValue/SetValue through TlsGetValue(tlsIndex); 20 small fns 0x462360-0x462660
  (names unknown); TLS inlines into ~29 sites.
- Critical sections base 0xd529b0 stride 0x18: Com_Frame/Com_Error/Sys_Quit/StatMon_Warning use section 2/3.
- Scr_GetFunction bound 145; Com_InitHunkMemory line 847; SEH_IsChineseLeadTrail = GBK ranges.
- SV_DirectConnect = lnxded-1.3 text with `cl->state >= CS_CONNECTED` in the reconnect branch.
- SV_ConnectionlessPacket: after PbSvAddEvent the pb_ block feeds PbClAddEvent(13, ...) when data[7] is not
  one of S 2 G I Y B L and com_dedicated is 0.
- Com_ExecStartupConfigs picks default_localize_mp.cfg / default_mp.cfg in Com_Init (g_cfgName 0xb1a5ac).

## 4. PunkBuster glue (PINNED)
- Link order: pbcl, pbsv, pbmd5 right after record_dsound (0x4bb570..), before cg_main_mp.
- stPbCl layout from Mac STABS (size 424); getHomePath/makefn use `\\` and `pb\\`. CRT `_chmod(path, 0x180)`
  and `_itoa` are real calls (compat chmod macro removed).
- Mac names: PBget_cl_cdkey 0x40e430, CL_SendPbPacket 0x40e490, PB_Q_Serverinfo 0x40e4d0, PB_Q_Serveraddr
  0x40e4e0, PbClSendToServer 0x4bbf40, PbClSendToAddrPort 0x4bbf90, PbClGameCommand 0x4bbaa0,
  LAN_GetServerPunkBuster 0x4153a0, EnablePbCl 0x4bc2f0, DisablePbCl 0x4bc350.
- CL_ConnectionlessPacket is ONE fn at 0x40e750 (2,658 B; 0x40ec10 is only an inner label). PINNED (matched 11-05): the PB_ check
  is `_strnicmp(msg->data + 4, "PB_", 3)` (CRT call) on the raw packet BEFORE Cmd_TokenizeString; data[7] in S/2/I ->
  PbSvAddEvent(13, -1, cursize-4, data+4) else PbClAddEvent(13, cursize-4, data+4) (both inline). The `print` branch uses
  Com_sprintf(printBuf, MAX_MSGLEN, "%s", text), not 0x4000.
- PbClGameQuery 0x4bbb80 (PINNED, matched): Data[255]=0; match = word after the first space; switch 103..115: 103 Dvar_GetVariantString,
  104 Info_ValueForKey(PB_Q_Serverinfo(), Data), 105 PB_Q_Serveraddr, 106 key search by binding (Key_GetBinding + fn_4bb450 on match),
  107 Key_GetBinding(atoi), 108 Key_KeynumToString(atoi, 1), 109 dvar search (PbDvarWalk loop, needle = whole Data),
  115 PbDvarValidate(Data), 110 next dvar name + flags in Data, 111 name + quoted reset value if changed, 112 returns the
  PbClientInitialize param (global 0x19a1c5c), default clears Data. Source order of cases must be 109,115,110,111,112 (block
  layout follows it). The failing PbDvarWalk in 110/111 returns without clearing Data. PbDvarWalk's out `name` lands in the
  param slot of Data (frame stays 0xc) with a plain `char *name` local.
- fn_4bb450 (0x4bb450, 263 B, no Mac name): case-insensitive strstr; `if (!hay || !needle || !*needle) return hay;` then
  strstr for tolower(first char), then toupper(first char) (locals lo="x", up="X"), earliest hit wins. Loop must be
  do { strstr; break if null; strnicmp -> first; p++ } while (!first); match tail written as `if (!first) return p; if (p < first) return p; return first;`.
- PbClientInitialize 0x4bc000: pbInitParam (0x19a1c5c) = param; pbcl.pbsvptr = &pbsv; pbcl.initialize() (fills the 5 callbacks, m_GlQuery = 0);
  pbcl.AddPbEvent(16, 0, "", 0); if (!pbcl.m_ClInstance) set_cl_punkbuster("0"). PbClGameCommand/PbClSendToAddrPort/GameMsg
  match once their address is taken by initialize().

## 5. Layout
- Our function set is close to retail (inventory: ~40 missing fns / 5.4 KB, 18 extra / 1.2 KB); the big gaps
  are code we lack, not extras. `.text` drift now starts at CL_BlendSavedScreen
  (-192 B, ours is 9 B and hits retail 0x402260; the real fn sits there), then cl_cin/console 16 B steps, cl_keys
  (+176), cl_main_mp (see `tools/drift13.py`).
- CL_SetExpectedHunkUsage (PINNED, retail 0x401b60 = 464 B, ours matches): the constant-0 default call after the
  loop is a real call to Dvar_SetIntFromSource in retail. Ours inlined it because the loop-exit `break` leaves the
  default site at entry count. Spelling the loop with a nested `if (stricmp == 0) { token = Com_Parse; if (token &&
  *token) {... return;} }` and no `continue` makes the post-loop site cold (cost-model site count, SKILL 1.1)
  -> call, +161 B same-offset by itself, +4.7 KB with the drift behind it. Locals for the 0 (`int zero = 0`,
  `hunk = atoi(); ... hunk`) did NOT help. Retail 0x458580 is the server twin (no default set), which a no-default CL
  version also matches: check which of the two you are diffing.
- CompleteCommand 1.3 (pb_ branch + PbClientCompleteCommand = AddPbEvent(0x33)) matches and only flips listed ties
  (SP_worldspawn lost, SV_SetConfigstring gained) once the hunk fix is in.
- .rdata ownership: `objectiveFields` is static const; `getKeyAuthorize ...` is a pooled literal, not a
  static array.
- Tie pool (re-rolls on any fn add/remove before them): yylex, PC_EvaluateTokens, Pickup_Weapon,
  SV_ArchiveSnapshot, SV_DirectConnect, SV_SetConfigstring, Menu_HandleKey, Scr_ParseGameTypeList,
  SP_worldspawn, DSound_UpdateSample, Netchan_Process, GScr_CloseFile, CG_DrawPlayerStance. They settle when the
  fn set before them is retail's.
- Tools: `tools/drift13.py`, `layout13.py` (-> `LAYOUT_1.3.md`), `inv13.py`, `classify13.py` (-> `WORKLIST_1.3.md`),
  `why13.py`, `rdr13.py`, `rdiff13.py`, `rxref.py`. LAYOUT "out of order TUs" and record_dsound "NEW 49 fns" are
  classifier artifacts.

## 6. Region cg_* .. libwww size work (sz3, 11-05; all PINNED on retail bytes)
- libwww is linked as an ARCHIVE after the import libs: retail has the import thunks (winmm..shell32, 0x547996-0x547f12) BEFORE
  HTReqMan (0x547f20), ours had them after libwww. The Makefile now builds `build/lib/libwww.lib` from the libwww objs in tus
  order and links it between shell32.lib and libcmt.lib (EXEOBJS = objs without libwww). Removes a 1.4 KB step and its mirror.
- Retail 1.3 has no `tell` cgame command (23 CL_AddCgameCommand literals after the table loop) and no "enemy crosshair colour"
  branch in CG_CalcCrosshairColor (friendly green / white only). CG_CrosshairPlayer, DSOUNDRecord_Stub_* do not exist in 1.3.
- UI_DrawRecordLevel: `fillW = voiceLevel * w - 4; if (fillW > 0) UI_FillRect(...)`. Menu_CheckOnKey: items need
  `Window_HasFocus || staticFlags & 0x100000` after Window_IsVisible. Item_Text_AutoWrapped_Paint: line step is
  `height < 16 ? height + 1 : height + 4`.
- Retail 0x545740 (204 B, static, ecx = key name): `switch (loc_language)` 6 russian, 7 polish, 8 korean, 9 taiwanese, 10 japanese,
  11 chinese, 12 thai, 14 czech -> Com_sprintf(buf, 256, "fonts/<lang>/%s", key); default Com_sprintf(buf, 256, fontName);
  then RegisterFont(buf, imageTrack). UI_ParseAssetGlobalDef calls it 6x (key = "normalFont" for `font`, else token.string).
- libwww HTEvtLst: retail order is lookup, stopLoop, ..., Terminate, init, pump, loop, Timer_*. init and loop are both
  `static2 = 0; return 0` (static2 = 0x5ddfa8, pump stores HTEndLoop in it before the trace); newLoop does not exist.
  HTProfile_newPreemptiveClient calls HTEventInit() AND sets preemptive = YES. HTDigest.c sits after HTWWWStr.c
  (retail 0x55e3c0), not after HTDir.c. HT_OUTOFMEM sites push __LINE__: adding a line above SockEvents_get loses it (0x10e vs 0x10f).
- pbcl: retail has out-of-line ProcessPbEvents (0x4bb940, 97 B), ProcessPbEvents(0) 0x4bc0c0, (-1) 0x4bc0d0,
  m_ClientConnect forwarder 0x4bc0e0 (this, a, edx b, ecx c), event 0x71 wrapper 0x4bc290. Initialize sits right after TrapConsole.
- Tool: `tools/sizereg13.py [build_dir] [from_hex]` lists every gap between anchored fns whose retail span differs from ours (step),
  with our unmatched fns and retail starts inside, plus region drift start/end. Read the build/ of the tree you are in
  (a different tree's build/ can be stale: it sent me to wrong addresses once).
- Link-only/incremental builds carry stale objs when a source mtime is older than the obj: use a clean build before reading sizes.
## 6. Offset-first front (sz1, 11-05)
- `tools/sizediff13.py` (per-fn and per-obj size diff vs retail) and `tools/drift13.py` (now reads `build/`; anchors
  only fns >= 16 B). The old "first break CL_BlendSavedScreen" was a false anchor: 9 B `push eax; call [slot]`
  stubs match many retail stubs. PINNED: before this work the first real break was cl_cin 0x4035c0 (+16).
- refexport_t (retail 1.3, 108 slots, base 0x68a1e8; CL_ShutdownRef clears 0x6c dwords): one extra slot after
  UpdateEffectsNonBolt (wrapper 0x4034a0, `jmp [slot]`, name unknown); `unknown86_95` is 11 slots, `unknown98_101` is 3,
  no `unknown103`; `SyncGpu` and `unknown106` return int. Retail wrappers 0x412660 / 0x4126c0 (`jmp [SyncGpu slot]`,
  `jmp [unknown106 slot]`) are unreferenced; the real CL_SyncGpu (0x412670, 73 B) is a Sleep(1) loop on those two
  slots with an inline rdtsc time limit, called from CL_Input and CL_RunOncePerClientFrame. No AbortRenderCommands stub.
- refimport_t (1.3): `Dvar_FindVar` at slot 25 (wrapper 0x437400), and the Sys thread block is 13 slots
  (IsMainThread, IsSecondThread, ResumeThread, CreateThread, Handshake, SetEventA, SignalB, WaitEventD, SignalCWaitA,
  ClearFlag, EventAPending, WaitEventB, SetEventD) instead of IsMainThread + ReturnFalse. 12 more stores in CL_InitRef.
- Sys_Rdtsc is ONE shared copy at 0x40bdf0 (between Key_Stub and Key_Zero, in cl_keys_mp), called by scr_vm.
  A second `rdtsc; ret` copy loses the referee's twin-count credit.
- cl_keys_mp: fn 0x40b100 `return 256` (unreferenced) sits between Key_GetBinding and Key_GetKey.
- cl_ui_mp: fn 0x4157b0 `if (x) EnablePbCl(); else DisablePbCl();` (unreferenced) between LAN_GetServerStatus and
  Key_KeynumToStringBuf.
- cl_main_mp order: fn_40d310 sits right after CL_RequestAuthorization (and CL_Frame calls it last);
  set_cl_punkbuster (96 B) sits between CL_startSingleplayer_f and CL_DrawLogo.
- CL_CheckForResend 1.3 (812 B): CHALLENGING copies `data` into `pbBuf[1020]` and calls PbClientConnecting(2, pbBuf, &len)
  (m_ClientConnect hook, standalone fn at 0x4bc0e0) before sending `data`; CONNECTING builds "getchallenge" in pbBuf and
  calls PbClientConnecting(1, ...) before the md5 getchallenge.
- CL_DeathMessagePrint: `int linewidth = con.linewidth;` is read at function entry (ebp), duration spills.

## 6. Region sz2 (qcommon/server/win_*): sizes found 11-05 (PINNED = matched or byte-checked on retail)
- Cmd_ExecuteString 1.3 (retail 0x4214c0, 520 B, matched): first `PbTrapPreExecCmd(text)` (pbcl m_TrapPreExecCmd, non-null = done),
  then tokenize; a `pb_` command that is not `pb_sv_` goes to PbClAddEvent(14, strlen+1, text) (inline), `pb_sv_` to PbSvAddEvent(14,-1,..).
- Com_Init_Try_Block_Function (matched, 1490 B): after Com_AddStartupCommands, `if (!com_dedicated)`: r_smp_backend_allowed =
  Dvar_RegisterBool(name, Com_HasMultipleCores(), DVAR_INIT|CHANGEABLE_RESET); if true call re slot 0x48 (index 18, name unknown) BEFORE
  cls.rendererStarted/CL_InitRenderer. Com_HasMultipleCores = retail 0x434420 (54 B, no callers, kept as a static body):
  GetProcessAffinityMask, `(m & (m-1)) != 0`.
- win_threads: IsSecondThread/IsMainThread/EventAPending return `int` (sub/neg/sbb/inc form); a Bool return gives cmp/sete. Inline users
  (Con_DrawInput, CL_AllLocalClientsDisconnected) need the plain `==` int form; SCR_DrawScreenField tests `al`, so it casts
  `(unsigned char)Sys_IsMainThread()`.
- Sys_ResumeThread_462460 (retail 19 B, stack arg) stays 15 B in ours: retail references it, IsSecondThread, CreateThread, Handshake and
  SetEventA only through the refimport table built in CL_InitRenderer (0x410210..0x410252: GetValue, IsMainThread, IsSecondThread,
  ResumeThread, CreateThread, Handshake, SetEventA). Ours lacks those entries, so LTCG gives the fns a register convention. Owner: cl_main_mp.
- Critical section fns (InitializeCriticalSections 0x4642b0, Enter 0x4642e0, Leave 0x464300) live in win_common right after
  Sys_StreamSeek, before Sys_RoundUp; WinMain runs the init (inlined loop) right after the two _controlfp calls, before Sys_InitMainThread.
- Sys_PBSendUdpPacket = retail 0x467090, right after Sys_SendPacket in win_net.
- SV/CL_Netchan_DrawProfileLine = CL_DrawString(32, y, line, 0, cl_profileTextHeight->current.integer) (dvar at 0x96b63c), 111 B.
- Conbuf_AppendText starts with `if (!Sys_IsMainThread()) return;` (frame 0x8004).
- WinMain: startup calls PbClientInitialize(hInstance) (not dedicated) and PbServerInitialize() before SetFocus; loop is Sleep check,
  Com_Frame, `if (!com_dedicated || !integer) PbClientProcessEvents()`, PbServerProcessEvents(). Retail inlines the ProcessPbEvents bodies
  there (+112 B vs ours, open: ours calls the out-of-line copy).
- FX_EffectLimitReached (retail 0x49f400, 33 B) checks `com_statmon->current.boolean` first.
- Retail 0x4b2350 = small helper "run nextmap": Cbuf_AddText(va("%s\n", nextmap)); Dvar_SetString(nextmap, ""); UI_SetActiveMenu(1); used by
  RoQShutdown and by the ROQSize<=0 branch of ROQ_PlayCinematic (state == 0 && nextmap[0]).
- CG_DrawScoreboard_Objective: Asian branch added (Language_IsAsian -> SEH_ReadCharFromString loop, len counter in chars); 1608 B vs retail 1540, bytes not matched (68 B over, 2 builds used). CG_EntityEvent still +32 short.
  RoQShutdown and by the ROQSize<=0 branch of ROQ_PlayCinematic (state == 0 && nextmap[0]).
- CG_DrawScoreboard_Objective: Asian branch added (Language_IsAsian -> SEH_ReadCharFromString loop, len counter in chars); 1608 B vs retail 1540, bytes not matched (68 B over, 2 builds used). CG_EntityEvent still +32 short.

## 7. Region scr_/bg_/g_/xanim sizes (sz4, 11-05)
- Cmd_Tell_f and Cmd_GameCommand_f do not exist in retail 1.3 (g_cmds_mp 11104 B = retail once removed; nothing referenced them).
  Removing them: same-offset 330,557 -> 518,413, matched-fn +2,310 B; only tie-pool fns flipped (Menu_HandleKey, Scr_ParseGameTypeList gained).
  The earlier TRIED row (SP_worldspawn flip) was an acceptable tie flip under the offset-first policy.
- scr_*, bg_*, g_* (except g_spawn) have no per-obj size step left. Last one: g_spawn SP_worldspawn is 5 B over (retail 464): the
  inlined Scr_SetString leaves a dead `lea` (see TRIED).

## 8. st session (11-06)
- Item_ListBox_Paint selected-row fill is two `UI_FillRect` calls in `if (noScrollBars) .. else ..` (w-4 / w-16-4); MSVC tail-merges them
  into the shared `fsub 4.0` tail. A ternary or a local `rectW` gives 2091 B. Matches at 2104 B (PINNED, referee).
- Drift is cumulative: a size fix only raises same-offset when the sum of fixed steps before a region reaches 0 for it. Fixing one step
  inside a balanced stretch (RoQShutdown -32) costs the whole tail (-175 KB). Fix a stretch whole or fix the last step before a zero region.
- HTEvtLst has two unreferenced fns: 0x54ec80 returns HTPumpState, 0x54ed70 sets HTPumpState=0 and returns 0 (names unknown, `fn_XXXXXX`).
  Emission order: PUBLIC unreferenced fns follow source order; Timer_* and HTEventInit come last (PINNED on our map).
- Where drift is 0 (401000-41d6c0, 4b52f0-4b5f90, 511850-57a640) a function whose size stays inside its 16 B slot can be fixed with no side effect:
  UI_RunMenuScript (JoinServer re-reads `sharedUiInfo.serverStatus.currentServer`, no cached local, 5035 B), PC_SourceError (`_vsnprintf(string, 4096, ..)`),
  HTAlertCallback_progress (`request->net` read twice, no HTRequest_net call). Find them with the unmatched-fn scan: same address, same slot, bytes differ.
- 1.3 vs 1.0 constants found by byte diff in zero-drift fns: `GetRefAPI(0x3c)` (renderer API 60; 1.0 passes 0x3b), server-list default sort key 10 (not 9).
  `strncpy(buf, f(x), N-1); buf[N-1] = 0` written as `I_strncpyz(buf, f(x), N)` matches when retail pushes the nested call before the length (args evaluated into the inlined body).

## 9. .rdata string pool (nd, PINNED 11-06)
- Literal pool order in .rdata = REVERSE source order (last function of a TU first, last literal of a function first), so a function-order or case-order swap in source shows up as a pool shift. Find it with a rdata resync scan (first diff vs retail, then shift): `Dvar_SetString(cl_updateoldversion, "1.3")` (was "1.0"), CL_CheckForResend case CA_CONNECTING before CA_CHALLENGING in source, CL_ParseWWWDownload defined before CL_ParseDownload, the long "bad command byte (GameState may exceed ...)" text.
- Single-char strings: the first compiled user owns the pooled copy. Retail set_cl_punkbuster is `Dvar_SetBoolByName("cl_punkbuster", I_stricmp(value, "0") != 0)` (dvar.cpp inlines the FindVar/SetBool/RegisterString body), so "1" is owned by dvar.cpp (0x5a85f8), not by cl_main_mp.
- Result: same-offset 1,326,964 -> 1,393,657 (+66,693), no function lost.
- SP_worldspawn (464 B, PINNED): write Scr_SetString out at the site (`if (from) GetRefString(from)->refCount++; if (*to) SL_RemoveRefToString(*to); *to = from;`); the global Scr_SetString/SL_AddRefToString keep the refStr-local shape. DL_BeginDownload(const char*) (242 B, PINNED): `char *requestUrl = NULL` and `requestUrl = NULL` after the success-path HTMemory_free. Both land the DL#2 +16 / SP -16 steps: same-offset 1,393,657 -> 1,604,300.

## 10. libcmt member order (lc, PINNED 11-06)
- CRT calls must be spelled as retail's callers do: `stricmp` / `strnicmp` / `itoa` (OLDNAMES aliases, resolved after libcmt is scanned) pull stricmp.obj, strnicmp.obj, _stricmp.obj, _strnicm.obj, xtoa.obj and ulldvrm.obj late, where retail has them. The underscore spellings (`_stricmp`, `_strnicmp`, `_itoa`) pull them first. Changed in pbsv, pbcl, cl_cgame_mp, cl_main_mp, cl_keys_mp: same-offset 1,604,300 -> 1,692,882 (.text 88.6%).
- Left: tolower/toupper/ieee87/strncpy order (retail strncpy before toupper, ieee87 after; ~1.6 KB).

## 11. rdata/data completion (rd, PINNED 11-06)
- getUpdateInfo2 sends version "1.3" (0x5a1d44), not "1.0": the stray "1.0" took the pooled slot that belongs to dl_main's HTProfile_newNoCacheClient string and shifted 99 KB of .rdata.
- serverStatusDvars has 24 rows: `{ "sv_punkbuster", "@MPUI_PUNKBUSTER", 1 }` follows sv_voice (retail table at 0x5dcc58).
- Result: .rdata 99.86%, .data 99.92% same-offset; same-offset 1,692,882 -> 1,790,588. .text (89.1%) is what is left: the PbSv stubs / CG_DrawScoreboard_Objective / CG_EntityEvent trio (146 KB) and the tolower/toupper/strncpy/ieee87 member order (1.6 KB).

## 12. Trio landed (to, PINNED 11-06)
- pbsv: two empty functions after PbSvSendToAddrPort (retail 0x4bde30/0x4bde40 are a lone `ret`).
- CG_DrawScoreboard_Objective (1552 B, slot fits): Asian loop `while (textEnd && textStart && *textStart)`, one `next` var reused for the peek read, shared `resetLen` label, wrap tails written out at their two sites.
- CG_EntityEvent (4364 B, slot fits): `goto setLandChange` from the 93..115 block into the 116..138 block, and `break` (inside `do if (..) {..} while (0);`) at the end of every if-block 1..23, 24..46, 47..69, 70..92, 116..138; this keeps MSVC from cross-jumping the per-branch isFirstPerson re-tests.
- Result: same-offset 1,790,588 -> 1,911,541 (97.0%).
- CAVEAT for section 12: the CG_EntityEvent `break` blocks are a size shim (fall through to the switch default). With the correct else-if chain the function is 4284 B and CheckEvents/CheckPlayerstateEvents stay matched. Do not copy the shim pattern to other functions.

## 13. CG_EntityEvent exact size, correct control flow (fx, PINNED 11-06)
- Retail 4360 B reached with the plain else-if chain over the six event ranges: `goto setLandChange` from the 93..115 arm into the 116..138 arm, `if (CG_IsLocalEntity(es))` guards in cases 0xa5 (CG_PrepOffHand) and 0xa6 (CG_UseOffHand) (retail recomputes the check inline, 21 B each), and an explicit `return;` at the end of the 70..92 arm (cross-jump survivor: keeps that arm's own epilogue, +8 B). The switch part is then byte-count identical (3625 B of case bodies).
- Method: jump-table entry sizes (`jmp [reg*4+table]`) retail vs ours, per case, finds which case bodies differ in size.
- same-offset 1,225,854 -> 1,912,606 (97.08%), CG_CheckEvents / CG_CheckPlayerstateEvents matched again.

## 14. CM_Trace exact size and convention (cr, PINNED 11-06)
- Keep the original order (cmod first, tw.contents second) and write CM_ClipHandleToModel out with the BOX branch first: `if (model >= cm.numSubModels) { CM_GetBox(&bb, &bm); cmod = bm; } else cmod = &cm.cmodels[model];`. MSVC then spills cmod once after the join (retail shape): 1424 B slot, callers keep their match (the 8 labelled losses are back). The reorder (tw.contents first) is no longer needed.
- Method: lab copies of the function as `template <int V>` with different spellings of the one suspicious statement; lab sizes track the real function when the callee has no register-convention change.
- Line endings: the repo blobs of pbsv.cpp / cg_scoreboard_mp.cpp are LF; nothing to restore (the earlier whole-file diffs were working-tree CRLF vs LF blobs).
- same-offset 1,912,606 -> 1,914,090 (97.15%), matched-fn 1,535,777 -> 1,538,998 B.

## 15. Wave 1 tail (w1, 11-07, PINNED on retail bytes)
- SEH_IsChinesePunctuation range is 0x8140 < c < 0x814e (GBK punctuation row), matched.
- DL_BeginDownload(local, url): `HTLoadToFile(..) != 1` (retail `cmp eax,1`), and `requestUrl = NULL` after the success-path HTMemory_free. Left: scheme/hostSeparator swap edi<->ebx and a `mov ecx,edi; push ecx` copy of localName for HTLoadToFile.
- CL_ParseWWWDownload: retail stores `legacyHacks->cl_downloadSize` after the `downloadFlags & 2` branch (not before it); retail also drops the `downloadTempName[0]` guard before `[strlen-1] = 0`, but dropping it alone makes the fn 554 B (slot 576 -> -16 drift, same-offset 468K): needs the esi (msg + constant 1) regalloc too.
- CL_CheckForResend retail frame 0xc34: low to high len@0x10, md5Str@0x14, data@0x38, info@0x438, pbBuf@0x838 (ours: data, pbBuf, info, 8 B smaller).
- CG_SubtitlePrint: pointer ternary `d = wide ? A : B; subtitleWidth = d->current.integer` gives retail's select-then-deref shape (121 B vs 119); retail takes `msec` in ecx, ours eax.

## 16. Xbox 360 linker map (xn, 11-08, SUPPORTED: names, signatures, obj only)
- `D:\cod2_stuff\crc7_v2\CoD2MP.map` (Oct 2005, PowerPC, MSVC-style mangling). `tools/xenonnames.py MAP data/xenon_names.tsv` parses publics and static symbols
  (21,826 rows, 15,062 with a demangled signature). Layout, addresses, link order do not transfer (different CPU and link).
- The 66 tail functions: every Xenon signature that exists agrees with ours in param count, order and return type (CL_ConsolePrint_AddLine
  `int(print_msg_type_t,const char*,int,int,int)`, CL_ParseServerMessage `(msg_t*)`, SVC_Status `(netadr_t)`, CM_Trace/BoxSightTrace/LinkEntity/PointContents/TempBoxModel,
  XAnimCalc, VM_Notify, CG_ClipMoveToEntities, CG_DrawAdsOverlay, CG_DrawCursorhint, CG_FireWeapon, Menu_SetNextCursorItem, Window_Paint (windowDef_t*) ...).
  Differences are only type spelling, none changes PC codegen: `snd_alias_t*` non-const (CG_SubtitlePrint), `const gentity_s*` (G_GetPlayerViewOrigin),
  `refEntityType_t` enum (FX_AddFxToScene), `windowDef_t*` where we write `float (*)[4][32]` (Window_Paint). So the LTCG register-convention diffs are callee regalloc, not signatures.
- Not in the Xenon map (PC-only or inlined there): DL_*, CL_ParseDownload, CL_ParseWWWDownload, CL_SyncGpu, CL_ReadMotd, CL_TrimWhitespace, SEH_IsChinesePunctuation,
  PbSv*, CG_DrawScoreboard_Objective (Xenon has the other CG_DrawScoreboard_* parts, Objective is inlined into its caller), HTCache/HTEvtLst, Com_ErrorAbort, PC_EvaluateTokens.
- fn_XXXXXX renames: none tied. fn_403580 (`unskippablecinematic`) has no Xenon twin (Xenon cl_cin_mp has CL_PlayCinematic_f, CIN_PlayAttractModeMovie, XenonPlayCinematicCallback);
  fn_4034a0, fn_4157b0, fn_40b100, fn_412660, fn_4126c0 have no string or callee match in the Xenon names. Do not rename on a guess.
