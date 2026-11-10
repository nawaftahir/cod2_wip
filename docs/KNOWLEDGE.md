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

## 17. Wave 2 (w2, 11-08): register oracle on 1.3, jump-table targets (PINNED on retail bytes)
- The 1.0 colour oracle (`client-1.0/tools/oracle`, REGALLOC.md) works on 1.3 unchanged: same c2.dll bytes (hook sites 0x724f6 etc. match). `tools/ra13.sh`
  relinks `build/objs.rsp` with the logging c2 in ~20 s (no recompile) and writes `build/ra/ox.exe` + map (code identical to the release link) and the
  F/P/C log of EVERY function. In this image wine does not hand `RA_FN` to the cave's `getenv` (F fired, name compare never matched), so the cave is
  patched to arm for all functions when RA_FN is unset (`cave_all`). Then `split_all.py` + `cpick.py` per function as in REGALLOC.md round 5.
- `tools/lab13.sh OBJ...` recompiles only the named objs and relinks (~25 s total) so a source variant is judged on the REAL function in the real
  link (not an uncalled lab copy); `tools/fdiff.py build/ra/ox.exe build/ra/ox.map <anchor> <name> <retail addr>` diffs it. Only the clean
  `tools/ratchet13.sh` accepts. Do not run it while a release build runs (both move `build/obj`).
- The referee masks jump-table words, so a function can be "matched" with other table targets. `tools/jtdiff13.py EXE MAP` lists differing code-pointer
  dwords in .text per function (before w2: CG_EntityEvent 60, SCR_DrawScreenField 5, CL_ConsolePrint_AddLine 4, CG_DrawScoreboard_Objective 1).
- SCR_DrawScreenField (PINNED, retail 0x414900, 465 B): the code already matched; only the case table pointed the CONNECTING..PRIMED labels at the second
  copy of `UI_Refresh(); UI_DrawConnectScreen();` (the wwwDlInProgress branch, 0x4149ce) instead of the first (0x4149b9). Lever: no fall-through from
  the non-main-thread DISCONNECTED path into the case labels; write the `if (CL_AnyLocalClientChallenging()) { UI_Refresh(); UI_DrawConnectScreen(); }`
  copy inside the branch, `break;` after the if/else, and keep the case group as its own block. The labels then own the first copy. The fullscreen switch
  must keep separate `case X: break;` blocks (DISCONNECTED / CINEMATIC / LOGO / CONNECTING group): one merged group becomes a compare chain, no
  table. XENON_REF's 4-flag cascade is NOT in retail PC (the PC code is the 1-flag wwwDlInProgress test; menu id 1); no PC flag/menu id was added.
- CL_ConsolePrint_AddLine oracle log (pop order, node, n3/n16/n17, free regs with cost): `charWidth` (n3 -256, n16 16) has free {eax, edi, ebp}; ebp costs 3200
  (neighbours with a single free reg, `off` 20 refs-units + 12) so the allocator takes the eax piece (-3 affinity from the call result) and the rest
  spills to [esp+0x28]; the zero constant lands in ebp as the last leftover. Retail has charWidth ebp, zero edi (zero pops before `line`/charWidth, or
  charWidth has no neighbour that is forced to ebp). Decl order of charWidth/curWidth, a separate inner `cw`: no output change (real function).

## 1.3 .bss layout (w4, 11-08)
- PINNED: g_largeLocalBuf spans 0xb22f00..0xc22f00 in retail 1.3 (next symbol com_dedicated at 0xc22f00, ours was 0xba2f00). Size set to 0x100000 (opencod2 lists 524288, likely 1.0). One array vs two symbols is not distinguishable from code: SUPPORTED. Clean ratchet same-offset 1914105 -> 1933443, matched-fn unchanged.
- Most of the ".text outside functions" residue is not outside functions: 43,985 B at abeca8c1 were address operands in functions equal modulo relocation, mostly .bss drift.
- PINNED (retail operand + clean ratchet): motd_buffer is a function-local static of LAN_GetMotdFilename (retail 0x19a7000, in the function-static block). HTEventList_pump calls GetMessageA(&msg,0,0,0), IAT 0x593278 (+99 matched).
- PINNED (clean ratchet, 1938165 -> 1950864): explicit `= 0` on dl_initialized/dl_running/dl_forceRawBytesCount/dl_request, pbInitParam, g_ConsoleCaptureBuf/Len moves them to retail's late bss block; .bss vsize now equals retail. Explicit zero init decides bss placement.
- PINNED (retail operands, clean ratchet 1951269): `re` has no 128-byte alignment (retail 0x68a1e8).
- PINNED (byte search): retail libcmt order is tolower, strncpy (0x57b5e0), toupper (0x57b704), ieee87; ours has strncpy after ieee87. Cause not fixed: needs the LTCG compile-order oracle for the first strncpy user versus the first toupper/_controlfp user.
- Next: .bss -8 run 0xd52a80..0xd7882c (1843 refs) starts in the sv_init / ui_component region and is absorbed by scrMemTreeGlob's 128 alignment; try explicit `= 0` on sv_init vars. uiComponentUnreferenced, winInputUnreferenced, wiFill_21, clFill_248 are placeholders, do not tune their sizes to fit offsets. -8 run from clientConnections to 0xb013fc starts at the cl_punkbuster/autoupdateStarted order.
- PINNED (retail operands, clean ratchet 1951269 -> 1953976): autoupdateStarted is at 0x609fcc and clientConnections at 0x609fe0 in retail. The cl_punkbuster global had no reference in our source (the dvar is registered with its result discarded and read by name), so it was removed; that closes the -8 run clientConnections..0xb013fc. Whether retail keeps an unreferenced slot for it elsewhere is not known.
- PINNED (retail operands, clean ratchet 1953976 -> 1955623): s_wcd (win_syscon) has no 16-byte alignment, retail 0xd76af8.
- HYPOTHESIS: UI_Component::g uses ALIGNED(8) only because retail places it at 0xd528f8; the struct has no 8-byte member. Retail has an unreferenced 4-byte hole at 0xd528e0 in the win_threads block, which may be the true cause.
- Open: g_splashWnd (src/win32/win_splash.cpp, ALIGNED(16)) is ours 0xd76af0, retail 0xd76ae8, 17 refs. Retail leaves 0xd76aec..0xd76af8 unreferenced before s_wcd, so moving it needs that gap explained first. Remaining non -8 residue: 0xd529c0.. -16 and 0xd52a50.. -4 in the win_input block.
- SUPPORTED (retail operands, clean ratchet 1955623): win_threads statics in retail run eventA a4, eventB a8, flag ac, values0 b0, values1 c4, threadId d8, handle e4, eventC ec, tls f0, eventD f4. threadId spans 12 B (hole 0xd528e0 is its unreferenced [2]), so UI_Component::g lands at 0xd528f8 with natural alignment; no ALIGNED needed. Size 12 is inferred from the next object, the true bound is unknown. Ours still orders these statics differently.
- PINNED (retail operands + renderer table, 11-09): the referee masks addresses, so wrong table slots stay "matched". Private refexport_t copies carried 1.0 slots; all now equal retail (Com_Init calls slot 24, not 18; slot 18 ClearScene before renderer init crashed gfx at 0x2591e). common.cpp clientConnection_t demo fields are 0x618 lower. Audit: compare data operands at equal .text offsets.
- Runtime (owner, 11-10): rebuilt exe sha256 74ed742d... booted on Windows with the stock renderer, connected to a server, wwwdl completed, player could shoot; no issues reported. Local smoke only, not full V5 or byte identity.
- PINNED (retail frame + clean ratchet 1959900 -> 1959917, matched-fn +812): CL_CheckForResend matches with pbBuf larger than 1024. 1028 and 1032 give identical code, so the true size is only bounded to that range (SUPPORTED); source uses 1032. HYPOTHESIS (one function): array slots sort by size, the larger array after the two 1024 arrays.
- PINNED (n1, 11-10, link /VERBOSE + lab): link /LTCG pulls libcmt members in the order of its undefined-symbol list, grouped by the
  LTCG output module in objs.rsp order (Found lines: buildnumber, cl_cgame, cl_console, cl_keys, cl_main, ...). A module only carries an
  extern its OWN source calls directly: calls that come from cross-module inlining (I_strncpyz from q_shared) do not count, so
  strncpy was attributed to cl_main (direct strncpy in a cl_main function) although cl_cgame/cl_keys code calls it first. Not the
  libcmt archive order, not first-X / first-F order. Within a module the observed order fits reverse compile order of the first direct
  user (cl_keys: memmove 4118, strstr 3319, tolower 2698, toupper 1711): SUPPORTED on one module, cl_main does not fit cleanly.
- Fix (SUPPORTED by CoD1 opencod1 and CoDUO cl_keys FindMatches, both direct
  `strncpy(shortestMatch, s, N - 1); shortestMatch[N - 1] = 0;`): FindMatches calls strncpy directly. Gives retail order tolower,
  strncpy 0x57b5e0, toupper 0x57b704, ieee87. Same code bytes as the inlined I_strncpyz, so retail cannot show which cl_keys function
  was the direct caller; any one compiled between toupper's and tolower's first direct users would do (Mac 1.3 shows I_strncpyz, but
  that file is a decompile). Tool: relink with /VERBOSE (Found / Referenced in / Loaded lines) to see which module pulls a member.
- PINNED (n1, retail bytes + clean gate 1962208 -> 1963501): CG_DrawScoreboard_Objective Asian wrap draws `len` chars when too wide
  (retail pushes the len slot), not the UI_TextWidth result: ours drew `width` chars, a behaviour bug. With that fix len lives in a
  stack slot like retail. Loop is `while (textStart && *textStart && textEnd)` (retail tests *textStart, textEnd at the top, textStart at
  the bottom). Too-wide and newline tails both written `textStart = textEnd; y += ...; goto resetLen;` so MSVC cross-jumps them: 1552 B
  exact. Left: slot permutation only (ours textEnd/len/textStart at 0x10/0x1c/0x20, retail len/textStart/textEnd) + one mov order at 0x4f2.
- PINNED (n1, clean gate 1963501 -> 1963602): Item_Text_AutoWrapped_Paint line step is
  `y += (height < 16) ? (float)(height + 1) : (float)(height + 4);` (retail does fild in each arm, one fadd): 816 B exact. Left: y and one
  int swap slots 0x24/0x28.
- PINNED (n1, clean gate matched-fn 1548509 -> 1549931, CM_Trace matched): CM_ClipHandleToModel in CM_Trace is written with the
  submodel arm first, `if (model < cm.numSubModels) cmod = &cm.cmodels[model]; else { CM_GetBox; cmod = box_model; }` (retail `jge` to
  the box arm). Section 14's box-first order was a size fix from before; the callers keep their match with this order.
- PINNED (n1, retail operands): CM_SaveLump / CM_LoadStaticModels / CMod_* residues are only .bss operands. Retail leaves 0xb013f8..0xb013ff
  unreferenced after scr_initialized (0xb013f4) and puts `cm` at 0xb01400; ours has cm at 0xb013f8, and the -8 runs on through cme and
  cmFill_* (retail 0xb0150c.. vs ours 0xb01504..). Plus a separate -4 at com_fileAccessed (ours 0xb1a5b8, retail 0xb1a5bc). Whether the gap
  is 16-byte alignment of cm or an unreferenced 8-byte object is unknown (HYPOTHESIS either way); deferred, not changed.
- Note: the lab link (tools/lab13.sh -> build/ra/ox.exe) carries +0x10 .rdata constants versus retail in many fns; read data operands on
  build/release, not on the lab exe.
- Tool (n1): `tools/diffclass13.py EXE MAP ANCHOR [N]` splits every byte differing at the same FILE offset into code / addr (dword that is
  an image address in both files, grouped into runs by our target symbol and delta) / pad / data / header, and ranks the address runs.
  At b4c0e627: 6760 B differ = .text code 4900, .text addr 1230, header 343, .rdata addr 163, .rdata data 121, .data addr 3.
  (The meter's same-offset gap is computed differently, 6537 B at e63eca98; both numbers are labelled by their method.)
- PINNED (n1, retail operands + clean gate 1963639 -> 1963759): the PbDvarWalk cursor (`static dvar_t *var` inside the fn) needs an explicit
  `= NULL`: it then sits in the function-static block at retail 0x19a1dbc (between the Com_PrintMessage and Info_ValueForKey statics) instead
  of the last slot 0x19a6ffc (retail leaves that slot unreferenced). Closes the cg_freeLocalEntities +4 run. Explicit zero applies to
  function-local statics too.
- DEFERRED (n1, retail operands): com_files bss. Retail has the startup config-name pointer (ours `fs_defaultConfigName`, KNOWLEDGE 3
  `g_cfgName`) at 0xb1a5ac between fs_ignoreLocalized and fs_restrict, ours at 0xb1b6c8, so fs_restrict..fs_fakeChkSum run +4 and late
  slots +8. TU bss order follows names and the real name is unknown (no Mac counterpart: the Mac Com_ExecStartupConfigs differs), so it is
  not renamed to fit.
- DEFERRED: win_threads statics are defined in retail order but land in name order (names unknown): +44/+12/-56 operands at 0xd528a4..f4.
## n2 (11-10)
- Already matched in the clean baseline (referee hits at retail address, fdiff 0 hunks): CL_ParseWWWDownload 0x413e70, CL_ParseDownload 0x4140b0, CL_TrimWhitespace_40cf40, CL_ReadMotd 0x4b50f0, CL_SubtitlePrint 0x401ff0, CG_SubtitlePrint 0x4c0530. The w1 notes on them above are history. (PINNED, build/cmp13.json)
- DL_BeginDownload(local, url) 0x4b5ad0: retail has ONE `call HTSACopy` at 0x4b5c86; the no-'@' arm (0x4b5c78) and the non-http arm (0x4b5c80) each do `push ebp; lea edx,[esp+0x14]; push edx` and jump to it; both later `requestUrl = NULL` stores are `mov [esp+0x10],0` (immediate), so retail does not keep 0 in esi after the http block. Ours keeps esi=0 (two `mov [esp+..],esi`) and re-zeroes it in each arm, which duplicates the call. Source control-flow shape (nested vs combined condition, early return vs wrapped body) does not change c2 output here. (PINNED on retail bytes; cause HYPOTHESIS)
- HTEvtLst.c (libwww, plain C, not /GL): .bss order inside the TU is name order. The pump-state static must be uninitialized (not `= 0`) and named so it sorts after HTSocketWin/HTinstance and before HashTable; `HTPumpRunning` gives retail's 0x5ddfa0 SocketWin, a4 instance, a8 pump, b0 HashTable (PINNED: retail operands + clean ratchet 1960277 -> 1960460). A name probe compiling only the TU and reading `objdump -t` .bss offsets takes seconds (build/bsst/real.sh in n2). HTEventList_pump prints with HTPrint (0x54e5f0), PINNED (1960462).
- The "motd" dvar global (registered as `Dvar_RegisterString("motd", "", 0x1000)`) sits at 0x68a3a0 in retail, first in its group in cl_main_mp; name `motd` puts it there (PINNED layout, clean ratchet 1960475). The real name is unknown (not cl_motdString, which is a separate dvar).
- s_criticalSections has 6 entries: Sys_InitializeCriticalSections and WinMain use 0xd52a40 (= base 0xd529b0 + 6 * 0x18) as the loop end (PINNED). Retail gaps: 12 B unreferenced 0xd529a4..0xd529b0 after UI_Component::g, and 12 B 0xd52a40..0xd52a4c before the win_input block. uiComponentUnreferenced[0xc] + winCommonUnreferenced[0xc] map 0xd529a0..0xd52b00 1:1 and the rest of the run to 0xd7a000 at offset 0 (1779 refs) (PINNED, clean ratchet 1960475 -> 1960759).
- Open: cm (cm_load) is ours 0xb013f8, retail 0xb01400, so cm and cme are +8 until cmd_texts absorbs it. Everything up to scr_initialized 0xb013f4 already matches. Whether retail has 16-byte alignment or an 8-byte unreferenced object there cannot be told from the bytes (HYPOTHESIS either way). It affects CM_InitBoxHull, CG_BuildSolidList and SV_SpawnServer operands.
- Open: SV_SpawnServer, UI_RunMenuScript and CL_InitOnceForAllClients residue includes `call 0x57b5e0` vs ours 0x57b8c0, the known libcmt strncpy order.
- ratchet13 only rejects matched-fn loss: a same-offset DROP still prints RATCHET OK and gets accepted. Check the same-offset delta in build/gate.out before keeping an accept.
## 18. CG_EntityEvent 116..138 rotation is not a colour pick (n3, 11-10)
- PINNED (ra13 log ee.txt + cpick, with the w3 93..115 patch): every kind03 temp of the land arms (n17 459..578) pops with no competing cost and gets eax;
  the w5 HYPOTHESIS row ("colouring looks retail, output rotated") holds. The emitted regs come from a later pass (local code generator), as REGALLOC round 12 "D-local".
- PINNED (ours and retail disasm): the scratch regs of each `mov reg,[table]; mov reg,[ebp]; push; push` pair follow the order eax, ecx, edx, continuing from the
  last scratch regs used in the code just before it in layout. Arm 47's tail ends with ecx then edx, so arm 70 starts with eax; arm 1 ends with eax, so arm 24 starts with ecx.
- Arm 93 ends `mov ecx,[esp+0x1c]; mov eax,[clientNum]; cmp` the same way in ours and retail, so the layout rule predicts edx for arm 116 (ours: edx). Retail starts arm 116
  with eax. So the order is not taken from layout alone. HYPOTHESIS: it is taken from IL or block-generation order, and retail generates some other block just before arm 116.
- (n3, later) The rotated part of arm 116 ends at its `jne` (clientNum compare): the next block (bg_fallDamage loads, eax/ecx) is identical in ours and retail. PINNED on disasm.
- The local code generator's register pick is NOT found in c2.dll yet. 0x108a97a4 (register object base, id*0x60) is used at ~60 sites (`tools/c2xref.py`);
  no hook was written because no site is confirmed. Tools: `tools/c2dis.py C2 ADDR N` (disasm one range), `tools/c2xref.py C2 DWORD...` (byte search + covering instruction).
## 19. winedbg on the 1.3 LTCG link (n3, 11-10)
- `tools/c2dbg13.sh MANGLED CMDFILE` relinks build/objs.rsp under winedbg (wine 5.0.3 in cod2-msvc71-vs2003, ~15 s) with a c2.dll whose F hook
  (0x107724f6) hits int3 when c2 starts MANGLED; CMDFILE starts with `cont` to reach it. Output build/ra/dx.exe equals ox.exe apart from the PE timestamp (2 bytes). PINNED.
- Heap addresses are the same as in the ra13 run, and P-line dword 2 is the node (colour store 0x107834bd `mov [eax+0x10],ecx`, eax = node). PINNED.
- CG_EntityEvent with the w3 93..115 patch: nodes 75..78 (kind03, n17 543/554/567/578) get eax (0x108a9804) at the colour store. The operand pass 0x10785eea..0x10785f12
  copies node+0x10 to operand+0x1c (picks the width variant of the reg object). For node 78's operand 0x06c1b74c every later writer (0x10770266 and ~20 others)
  keeps eax until the slot is freed (0x107bae7f). PINNED.
- So at the IL/operand level nothing renames the reg. The edx/eax output of arm 116 is decided after lowering, in the instruction structure SCHED.md describes,
  or these four nodes are not the arm-116 temps (the node-to-instruction map is not done). HYPOTHESIS.
- Next: find the encoder that emits the arm-116 `mov r32,[edi*4+disp]` (watch the emitted code buffer, or break on the lowered instruction alloc 0x107afd98) and map nodes to instructions.
- (n3, later) CORRECTION to the node 75..78 lines above: forcing a colour pick in winedbg (`set $ecx` at the 0x107834bd store, then diff dx.exe) shows that nodes 4..41
  of the pick log (kind03, incl. 75..78) are temps of the weapon cases near 0x4e0f84. No forced node changes the footstep/land arms. So the arm temps
  (`mov r,[edi*4+disp]; mov r,[ebp]`) are NOT colour nodes: they get their regs from the local allocator below. PINNED.
- Local allocator (PINNED by watchpoint chain): `tools/c2memscan13.sh` found arm 116's bytes `8b14bd..` in c2's code buffer (0x06fac309, CheckEvents spin).
  A watch on the ModRM byte catches the byte copier 0x107baf61 (staging buffer on the stack). It is called from 0x107bb0c8 with instruction object 0x06be7840
  (+4 opcode 1, +0x2c dest operand 0x06f81390, kind 0x24f, +0x1c = edx 0x108a98c4).
  The only write of edx into that field is 0x10775ac4, after 0x107759c0 (looks up which reg holds the temp in 0x108a74f0[reg]) returned none and 0x10775acc picked one.
  0x10775acc takes the candidate list from 0x1077542e(type), class ids < 4 (eax, ecx, edx). It skips regs whose 0x108a74f0 slot is taken, tests the bitsets
  0x108a73c8[reg], then calls 0x1077687e. The rule that makes it pick (oldest use? bitset?) is NOT read yet.
- Next: break at 0x10775acc for the arm-116 temp (the operand 0x06f81390 is in [esp+0x14]->+0x1c path) and dump 0x108a74f0[1..3], 0x108a73c8[1..3], and 0x1077687e's result,
  in ours and in a variant, to find the state that makes edx win.
## 20. c2 local allocator is round robin; CG_EntityEvent matched (n3, 11-10, PINNED)
- Short temps that are not colour nodes (e.g. `mov r,[tbl]; mov r,[ebp]; push; push`) get their reg in 0x10775acc. The candidates come from a start pointer
  (0x1077542e: [0x108a7d0c] for GPRs) into the list at 0x108a9738 (eax, ecx, edx, ...). It takes the first reg that is free (0x108a74f0[reg] == 0)
  and not blocked (bitset lists 0x108a73c8[reg], keyed by temp id), then 0x1077687e stores the pointer just past the chosen reg back into 0x108a7d0c.
  So each pick starts one register after the previous pick: eax, ecx, edx, eax, ... in code-generation order over the whole function.
  Evidence: winedbg at the 40th call (arm 116 temp 0x763): start = 0x108a9740 (edx) -> edx at once; next call starts at 0x108a9738 (eax).
- Consequence: a register rotation residue = a different NUMBER of local-temp picks earlier in the function, mod 3. Picks made for code that a later pass
  removes (cross-jumped duplicates) still count. Retail's arm 116 starts at eax because retail generated a second copy of the landChange tail
  (`mov edx,[cg->time]` = one more pick) in the 93..115 arm, which cross-jumping later merged into arm 116's copy (`jne exit; jmp land`).
- Fix (gated, matched 4360 B, all 60 table dwords right): 93..115 arm `if (clientNum != pred) return; cg->landChange = -(float)eventParm; cg->landTime = cg->time; return;`
  and `return;` after arm 116's `cg->landTime = cg->time;` (no goto/label). Without the arm-116 `return` the merge keeps the 93 copy instead (4364 B).
- Tools: `tools/c2dbg13.sh` (winedbg), `tools/c2memscan13.sh` (find emitted bytes in c2 memory, needs --cap-add SYS_PTRACE), `tools/c2dis.py`, `tools/c2xref.py`.
  Forcing a colour pick in winedbg (`set $ecx` at 0x107834bd, diff dx.exe) maps colour nodes to instructions.

## Unknown storage (owner + lead decision, 11-10)
Goal stays 100% reconstructed source AND identical bytes, readable for future readers. Rules, copied from cod2engine lnxded/mp-1.0 `src/unknown/`:
- A storage-only object is allowed only where retail bytes prove an unreferenced region (no code or data reference anywhere), sized exactly from retail's neighbouring symbols.
- It lives under `unknown/`, is named after its retail address (e.g. `unknown_b013f8`), and carries one comment line with the evidence and "real identity unknown".
- Never rename, resize or realign a real variable to fit an offset; names only from evidence (Mac symbols, retail strings, reference source). A variable with an unknown name keeps its placeholder name and stays listed.
- Existing placeholders (uiComponentUnreferenced, winInputUnreferenced, wiFill_21, clFill_248, the six Rich-header empty TUs) follow the same rule: each must be backed by a proven unreferenced retail gap and documented; README and KNOWLEDGE keep the full list.
- The mixerGetRecordLevel post-link patch is NOT used in 1.3. The six `unknown/empty_N.cpp` TUs are (owner decision, see the Rich entry below).
- OWNER DECISION + clean gate (n1, 11-10, same-offset 1963931 -> 1967115, matched-fn 1549931 -> 1552684): the six 1.0
  `unknown/empty_N.cpp` /GL TUs are linked in 1.3 too, all six at the end of the /GL list after gfx_v60_threads (the 1.0
  positions, empty_1 after devgui_input, flipped the CG_DrawPlayerStance tie; at the end it stays matched, e59606e1). They are PLACEHOLDERS for retail's six unknown /GL C++ objects (Rich prodid 100: 275 = retail); their real names and
  positions are unknown. Effect: Rich count, checksum and the 24-byte padding now equal retail, e_lfanew 0x120, the PE header differs in
  4 bytes only. The earlier 343 B header residue was 100% this.
- RESOLVED (w6-n6): Rich (28,9466) before (25,9466) needs mss_auto.obj BEFORE the import descriptor members in mss32.lib (S,A,T,N,D; tested all 24 orders of A,T,N,D: it is exactly 'A before D'). lib.exe appends objects after the /def members, so workspace/lib/libreorder.pl moves the last member in front of the last three (T,N,D) and rewrites the linker members; the Makefile runs it after the lib step. PE header now 0 B different from retail. Superseded text below kept for history.
- Remaining 4 header bytes: Rich entries (25,9466) and (28,9466) in the other order. Both come from build/lib/mss32.lib (the import members
  are prodid 25, mss_auto.obj from VS .NET 2002 is prodid 28). Putting mss_auto.obj first in the archive does NOT change the Rich orde
  (lab relink); the order follows which member the link pulls first. Open.
- stPbSv::LoadServerDll (0x4bd3e0): code is byte-identical to retail except the six string addresses, so no code-matching shape exists to
  move the literals; the literal-pool order stays deferred.
- __real pool (0x5c4460..0x5c44f8, 64 B): only two constants are misplaced. Double 1000.0 (users CL_DemoCompleted, CG_FxTest, HTNumToStr;
  same users in retail) sits at ours 0x5c4460, retail 0x5c44a0: retail compiles its first user between CG_PlayerFloatSprite (F#5581) and
  Particle::Die (F#5635), ours compiles CL_DemoCompleted at F#5436. Float 720.0 (fire_grenade) ours 0x5c44c4, retail 0x5c44e8: retail
  compiles fire_grenade after Mantle_CreateAnims (F#6041), ours at F#6035. Call-graph DFS order shifts, no source lever with evidence.
- METRIC CHANGE (n1, 11-10, 26a2aaaf): same-offset (tools/shameter.py, read by ratchet13.sh and meter.py) now counts the PE heade
  (SizeOfHeaders, 4096 B) as well as every section; it was sections only, so header fixes showed +0. On the same build the number moved
  1967119 -> 1971211 (+4092 = header bytes already equal) with no source change. meter-1.3.json gains `sections.header`. Self-test
  tools/test_shameter.py (anchor vs itself = full total; one flipped header byte = total - 1) runs in ratchet13.sh.
- Rich (25,9466)/(28,9466) order: the original Miles mss32.lib is not in dev/sdk or the reference trees (opencod1 and KisakCOD ship othe
  Miles versions with no 9466 objects). In the link, mss_auto.obj (28) loads BEFORE the mss32 import descriptor objects (25), yet the Rich
  lists 25 first, and our archive already has mss_auto.obj as its first member, so neither link load order nor member order explains it.
  Open; no lib rebuild tried beyond the two variants in TRIED.
## 21. Rotation sweep (n3, 11-10, after merging w5-bss; baseline same-offset 1967119, matched-fn 1554291)
- `tools/regonly13.py EXE MAP ANCHOR` lists equal-address functions whose code is equal once GPR names and image addresses are masked.
  Only 3 have a real register permutation: Menu_SetNextCursorItem (ecx>eax, edx>ecx, eax>edx, a one-step rotation),
  FX_AddFxToScene (eax>edx x2, REGALLOC "D-local lea temp") and nb_decode (eax<->ecx, "C-num"). The other ~400 rows differ only in data addresses.
  CG_FireWeapon / CG_DrawCursorhint / XAnimCalc / CL_ConsolePrint_AddLine / DL_BeginDownload are not pure renames (order or code differs), so they are not this class.
- Tools: `tools/c2picks13.sh MANGLED [N]` logs the local picks of one function in order. `tools/c2pickmap13.sh MANGLED ADDR SIZE K...` shifts the round-robin
  pointer after pick K and prints the first instruction that changes, so pick K+1 maps to code. (K=0 is meaningless: the first stop is the int3.)
- Menu_SetNextCursorItem (PINNED, ours): 8 picks eax, ecx, edx, ... Pick 1 = the while guard `mov eax,[esi+0x220]` (0x53e2fa). Picks 2..4 = the
  Item_SetFocus argument block (ecx, edx, ...) that retail has as eax, ecx, edx. So retail makes one pick fewer (or two more) before that block, and the
  guard load is the candidate. Tried (no change, lab): oldCursor read directly; `if (oldCursor == -1)`; `++` in the compare; `x = x + 1`;
  `for (;cond;)`; a wrapped `break`. HYPOTHESIS: retail's guard is not a local pick (a colour node, or the guard folded with the `cursor = 0` store).
- (n3) `tools/addrruns13.py EXE MAP ANCHOR`: 376 .text fns differ ONLY in image-address operands (972 B). Grouped by the data symbol hit (ours) and delta:
  ui statics (uiComponentUnreferenced -16, wiFill_21 -4, winInputUnreferenced -4) ~111 fns 287 B; clip map (cm, cme, cmFill_* all +8) ~113 fns 255 B;
  fs/common statics +4 (com_fileAccessed, fs_basepath, fs_debug, fs_checksumFeed, fs_loadStack, fs_gameDirVar, fs_restrict, fs_serverReferencedIwdNames, fs_fakeChkSum; fs_defaultConfigName -4380) ~70 fns 150 B;
  sv_punkbuster region (+44/+12/-56) 43 fns 50 B; FX vtables (Effect +132, Particle/Emitter -176, Cylinder +220, ...) ~40 fns 55 B; sys_timeBase -8 8 fns 15 B;
  WWW_TraceFlag (n2) 11 fns 15 B; __real@ constants (.rdata order) ~20 B; dvar pointers cl_* +4 ~13 B. A fn hit by two runs counts once.
- Menu_SetNextCursorItem do-while with an explicit guard (`if (c < n) do {...} while (c < n);`): worse (240 B, oldCursor spilled); not the lever.

## 22. Vtable order and bss order follow names/declarations, not code (n3, 11-10, PINNED by lab + clean gate)
- FxPrimitives vtables (.rdata 0x5b1028..0x5b11b0): contents always matched, only the order differed. Lab probes show
  vtable order = reverse of the forward class declaration order, rotated so the LAST TWO declared go to the end
  (4 probes fit). Retail order Cloud, Particle, Tail, Emitter, Effect, Line, OrientedParticle, Cylinder, Light comes from
  `class OrientedParticle; Line; Effect; Emitter; Tail; Particle; Cloud; Light; Cylinder;`. Gate 1967119 -> 1967333.
  Not the compile order of ctors/dtors (ra13 F lines: Effect, Light, Particle, Emitter, Tail, Line, Cloud, OP, Cylinder).
- cl_main .bss dvar pointers: slot order does not follow definition order (moving the definition changed nothing) nor
  registration order (retail and ours register in the same order). It follows the symbol NAME: renaming `dvar_68a3a0` to
  `motd` (KisakCOD cl_main_mp.cpp registers "motd" into `motd`, SUPPORTED) puts it at retail 0x68a3a0 and shifts
  cl_connectTimeout..m_pitch +4 like retail. Gate 1967333 -> 1967346. Placeholder names like dvar_XXXXXX can misplace .bss.

## 23. Classification of three residues (n3, 11-10)
- DL_BeginDownload (PINNED on bytes): ours keeps BOTH `HTSACopy(&requestUrl, remoteUrl)` arms whole, each ending with `xor esi,esi`
  (the zero constant is put back into esi for the later `requestUrl = NULL` stores). Retail has no xor: the arms keep only their pushes
  and jump to one shared call (cross-jump), and the later NULL stores use imm 0. So the class is the constant-zero web (colour), not a local pick:
  the extra xor blocks the cross-jump. No source spelling found yet that ends the zero web early (TRIED w5 + n3 rows).
- CG_CalcCrosshairPosition (PINNED on bytes): ours copies gunAng[1] (yaw) through ecx to [esp+0x28] and flds it; retail flds cg->gunYaw
  directly (store forwarded, then dead). That ecx copy is one extra LOCAL pick, which is exactly why every later lea pair is one step
  rotated (ours edx/eax, retail ecx/edx). Tried (lab, no change): assignment order of gunAng[0..2] (4 orders), no roll assignment, roll = 0.
- FX_CalcOriginAndAxis: pure stack-slot order (the first float temps 0x28/0x2c/0x30 shifted by 4), no register or code difference. Not attempted.
- PINNED (n2, clean ratchet 1967119 -> 1967333): FxPrimitives.cpp vtable order follows the forward class declarations as reverse(decl[0..6]) then reverse(decl[7..8]). Decl order OrientedParticle, Line, Effect, Emitter, Tail, Particle, Cloud, Light, Cylinder gives retail 1.3's Cloud, Particle, Tail, Emitter, Effect, Line, OrientedParticle, Cylinder, Light (FX_Restore vtable stores now match).
- PINNED (n2, clean ratchet 1967333 -> 1967367, matched-fn +222): `$E2` / `~stPbCl` match when UnloadClientDll/UnloadAgentDll clear the instance inside the `if (m_xxInstance)` branch (same behaviour).
- Proven unreferenced retail gaps (tools/gapref13.py, every byte offset in .text/.data/.rdata): 0xb013f8..0xb013ff (0 refs), 0xd529a4..0xd529af (0), 0xd52a40..0xd52a4b (only Sys_InitializeCriticalSections/WinMain end bound of s_criticalSections[6]), 0xd52a50..53 (0), 0xd52a58..5b (0), 0xd76aec..0xd76af7 (0). Not yet landed: adding any TU flips CG_DrawPlayerStance (see TRIED).
- (w6-n4, PINNED retail gapref13 + dworddrift13) 0xd76ae4..0xd76ae7 is also unreferenced in retail; g_splashWnd sits at 0xd76ae8 (not 16-aligned). With 4 B before and 12 B after win_splash, and the four new unknown TUs taking the places of empty_1..4, all six listed regions plus 0xd76ae4 map 1:1 to retail.

## 24. Stack-slot packer read on the 1.3 link (w6-n5, 11-10, PINNED by winedbg on our build)
Tool: `tools/c2slots13.sh MANGLED` (winedbg on the LTCG link, needs `tools/ra13.sh` once). Phase 1 breaks at 0x10790cba
(once per non-param item, list order): obj +0x1c id, +0x20 size, +0x38 weight, obj[0] = symbol (name ptr at sym+4).
Phase 2 breaks at 0x10790e62 (entry gets its offset: EBX = frame offset, entry +8 size, +0xc summed weight) and
0x10790eb5 (`[sym+0x18] = ecx`: each member symbol of that entry). Front-end sym+0x18 before the packer is the
declaration layout and means nothing for the final frame.
- Item list order = size ascending, weight descending; ties are NOT declaration order (FX: sinPitch 12, cosPitch 11,
  cosYaw e, sinYaw f, height 14, len 17, all w6). Item id = first IL reference (args right to left: FastSinCos(yaw,
  &sinYaw, &cosYaw) gives cosYaw e before sinYaw f). Tie key still open.
- Items merge into an existing entry (entry weight = sum). Merges seen in ours: scoreboard whiteSpace into textEnd's
  entry (16), len + temp id12 (9); FX height + len + temps 100/10b (20).
- Entry table index 0 gets the LOWEST esp offset, the last entry the highest (assignment loop runs last to first).
- Two orders, chosen by frame size: FX_CalcOriginAndAxis (80 B of locals) keeps entry CREATION order (= item list order:
  sinPitch, cosPitch, cosYaw, sinYaw, then the 4-byte temp entries, then pos, dir, point, up), its entry weights
  6,6,6,6,20,13,31,29 are unsorted. CG_DrawScoreboard_Objective (296 B, hudElemString[256]) has its entries sorted by
  size ascending then summed weight descending: textEnd+whiteSpace 16, next 12, font 12, len 9, textStart 7, c 4,
  lineColor, hudElemString. The packer compares a byte count with 0x80 at 0x10790da8/0x10790dd9 (SUPPORTED: fits
  both fns, threshold not probed with a lab fn). So in a big frame, slot order = summed-weight order; in a small frame,
  it is item list order.
- Correction to the w6-n2 TRIED row: scoreboard slots at the 0xb8 store block are ours textEnd 0x10, next 0x14,
  font 0x18, len 0x1c, textStart 0x20; retail len 0x10, next 0x14, font 0x18, textStart 0x1c, textEnd 0x20 (matched by
  the edi/ebp/esi stores and `mov [esp+0x1c],0` = len = 0). Retail therefore needs entry weights
  len-entry > 12 >= font, textStart > textEnd: whiteSpace must join len's entry (5+4+8 = 17, no interference: len is
  Asian-only, whiteSpace non-Asian-only), which needs whiteSpace processed after len (weight <= 5 in retail, ours 8),
  and textEnd alone below textStart (ours 8 vs 7). HYPOTHESIS for the source: retail's non-Asian loop references
  whiteSpace and textEnd less (fewer weighted uses), not a declaration change.
- FX_CalcOriginAndAxis: retail has cosPitch at the lower slot (item before sinPitch in the list) and one 4-byte entry
  fewer below the temp entries (ours temps 109/108/scale entries sit +4). Needs the list tie key and one fewer
  non-mergeable 4-byte item; not derived yet.
- (w6-n5, PINNED by winedbg + 5 labs) Item weight (obj+0x38) = 1 at creation (0x107886a4) plus 1 per counted reference
  (0x10789a99, always +1 here; no loop-depth factor). The item list is kept sorted on each increment: an item moves ahead
  only past items with a strictly LOWER weight, so among equal weights the item that reached the weight first stays first.
  Each separate source STORE counts, even when cross-jumping later merges the copies into identical code. Scoreboard labs,
  all with byte-identical code apart from slots: dropping 3 duplicate `whiteSpace = NULL; textEnd = textStart;` tails
  (fall through to the shared loop tail) took whiteSpace 8 -> 5 and left textEnd/textStart unchanged; `len = 0; continue;`
  in each of the 4 branches instead of one `goto resetLen` label took len 5 -> 8. Dropping the `textStart &&` loop tests
  changes the code (not a lever).
- (w6-n5, PINNED by simulation) The >0x80 sort is c2 0x107ae0c4, a K&R quicksort over entries [param count, n-1]: pivot =
  middle entry swapped to lo, an entry moves left only if its w*1000/size is strictly greater, then recurse on both
  sides. lab/qs.py reproduces our scoreboard post-sort table exactly from the pre-sort one.
- Merge rule seen in every dump: an item joins the NEWEST existing entry it does not interfere with.
- CG_DrawScoreboard_Objective state (gate 241af860, +4 same-offset): len+whiteSpace slot now matches retail. Still open:
  retail keeps the y temp (id12) in the textStart entry and that slot below the textEnd slot. Under the rules above that
  needs textStart processed after whiteSpace (textStart weight <= 5, ours 7); which two textStart references retail
  lacks is not found.
- FX_CalcOriginAndAxis tie key: the list order among weight-6 items is the order in which each reached 6 (rule above).
  Retail needs cosPitch to reach its final weight before sinPitch. Not probed further.
- Other six victims (c2slots13 + esp diff): CG_DrawAdsOverlay, CG_DrawGrenadePointer, XAnimCalc differ in instruction
  ORDER only (scheduler class, not slots); CG_FireWeapon, G_GetPlayerViewOrigin have no esp-slot difference (not this
  class); Item_Text_AutoWrapped_Paint (1024 B buff, sorted) swaps two weight-5 single-item entries: ours newLineWidth
  0x24, y 0x28; retail y 0x24, newLineWidth 0x28 (quicksort tie outcome follows creation order: needs y and newLineWidth
  to reach 5 in the other order, or a one-unit weight change). Not attempted.
- (w6-n5, MATCH, gate 4634d548, matched-fn +813) Item_Text_AutoWrapped_Paint: `if (height < 16) y += ...; else y += ...;`
  instead of one `y += cond ? a : b;` gives y one more counted store (5 -> 6) with identical code. The >0x80 quicksort then
  puts y below newLineWidth like retail. lab/pre.sh (break at the sort call 0x107ae0b0 / return 0x107ae0bf) and lab/qs.py
  (lo = 0 here: no param entries) reproduce the table; lab/qaw.py found the lever (y +1 or creation order nLW, nL, y).
  Lever class: a ternary vs if/else on an assignment changes the store count, not the code.
- (w6-n5) Scoreboard textStart: winedbg on 0x10789a99 with `cond 1 $eax == obj` logs 6 increments (weight 7), all from
  0x1078863a <- 0x107855c1; the stack flag at [esp+0x24] is 1 for the first 3 and 0 for the last 3. Turning the two
  non-Asian `if/else textStart = ...` pairs into ternaries does not change its weight (non-Asian stores of textStart
  are not counted). Retail needs either textStart <= 5 (2 fewer counted refs) or whiteSpace 7 plus textEnd 9..10
  (lab/qa.py model); no identical-code spelling found yet. DEFER.
- FX_CalcOriginAndAxis: the tie fix alone (cosPitch before sinPitch) is not enough; retail also has one 4-byte entry
  fewer below the temp entries. DEFER.

## 25. CL_ConsolePrint_AddLine colour dump (w7-c, 11-11, ra13 + cpick on a clean 45711a14 build)
Tooling: tools/ra13.sh TAG, then lab/al.sh TAG (split_all + cpick for this fn). PINNED on our build, HYPOTHESIS where marked.
- c2 runs two colouring passes for this fn. Pass 1 (picks 1..53) has NO charWidth node: its web was not a candidate there
  (n16 <= 0, spilled before colouring). In pass 1 ebp goes to _linewidth (id 31, n3 -84, n16 30, cost 0) and ebx to
  _targetLineWidth (id 50, n3 -157, cost 28200); edi to _line / _txt / _c.
- Pass 2 (picks 54..71) colours the re-split pieces: charWidth id 47 n3 -256 n16 16 n17 255, free {eax -3, edi 0, ebp 3200}
  -> eax piece (call-result affinity -3), the rest stays in [esp+0x28]. Then g_currentAsian id 62 n3 -276 n16 8 -> edi
  (free {edi 0, ebp 3200}), off id 46 n3 -288 n16 20 -> ebp (only ebp, 9600), the zero temp id 5 n3 -152 -> ebp.
  ebp 3200 for charWidth = 100 * n16 of single-free-register neighbours (off alone gives 2000).
- Retail (fdiff): off is ebp in the wrap loop on both sides (`inc ebp; cmp ebp,eax`), and retail ALSO keeps charWidth in ebp
  (`mov ebp,eax` after re.TextWidth, `add edx,ebp` for curWidth += charWidth), zero in edi, curWidth = 0 as an immediate
  store, and textBuffer as a memory operand (`add eax,[con.textBuffer]`) where ours loads it into ebp/edi first.
  So in retail charWidth and off do NOT interfere and charWidth is a pass-1 candidate kept whole.
- Flip condition (derived): charWidth must survive pass 1 as a candidate (n16 > 0) with a live range that does not
  overlap off/g_currentAsian; with eax excluded (call-spanning) and edi taken by g_currentAsian, ebp is then its cheapest
  free reg. HYPOTHESIS: ours makes the line-746 (wrap loop) and line-762 defs one web or keeps it live across the
  wrap loop; earlier tries with a separate inner `cw` were byte-identical (TRIED w2), so the merge happens below the
  source variable level (IL copy propagation). No source form found this session; DEFER.

## 26. CG_CalcCrosshairPosition / DL_BeginDownload colour dump (w7-b, 11-11, ra13 + lab/ra.sh on a clean 59ab7544 build)
Tooling: tools/ra13.sh TAG, then lab/ra.sh TAG MANGLED (split_all + cpick for one fn), lab/b.sh FN (fdiff), lab/mk.sh FN (incremental build + fdiff). PINNED on our build unless marked.
- CG_CalcCrosshairPosition: only 2 colour nodes (y id 2 n3 10 -> esi, x id 3 n3 10 -> edi). The yaw copy (`mov ecx,[cg->gunYaw]; mov [esp+0x28],ecx; fld [esp+0x28]`)
  is NOT a colour decision: ecx is a local pick and the residue is that the gunAng[1] store survives. Retail has no yaw store at all (fld [cg->gunYaw]),
  keeps the pitch copy [esp+0x24] (live across the FastSinCos call) and ours drops the roll store too. So retail forwarded the yaw load from its store and
  killed the store; ours kept both. HYPOTHESIS: our float copy is turned into an integer move early, so the inlined `angles[YAW]` float load is not
  forwarded from it. The explicit-products (Mac) dot product form is byte-identical to base (lab, 11-11). Next: a lab fn in one TU with a vec3 filled
  from a global and read by an inlined callee, to find which spelling forwards element 1 but not element 0.
- DL_BeginDownload pass picks (22): host id 18 n3 84 -> esi; remoteUrl id 7 -> ebp; hostSeparator id 15 n3 66 free {edi 1, ebx 400} -> edi;
  basic id 21 -> ebx (3800); scheme (first, id 39 n3 6) -> ebx (400); zero temp id 38 n3 3 n16 1 -> esi (cost 0, only esi free); localName id 27 -> edi.
- Retail: scheme edi, hostSeparator and basic ebx (edi/ebx swapped vs ours), no zero temp after the copy arms (both `requestUrl = NULL` are
  `mov [esp+..],0` immediates), and localName loaded to edi then `mov ecx,edi; push ecx` at HTLoadToFile. Implied (derived): in retail the
  post-join zero piece is spilled (no free callee-saved reg, or the piece is never made), and hostSeparator sees ebx cheaper than edi
  (ours edi 1 vs ebx 400, ebx cost = 100 * n16 of single-free-reg neighbours, section 25). Both point at different web shapes around the
  copy arms, not at a colour tie. CoD4 (KisakCOD dl_main.cpp, Hex-Rays) has the same body with HT_FREE-style `x = 0` after every free and
  one merged if/else for the copy; the merged form is already TRIED (765 B). No source form derived; DEFER.
- (w7-b, 11-11, PINNED by probe lab/cp) The crosshair yaw copy is NOT a crosshair spelling: our exact CG_CalcCrosshairPosition source compiled in a
  standalone probe (/O2, and /GL + link /LTCG with AngleVectors in a second TU, real AngleVectors body, inline-asm FastSinCos, `cg_t * const cg`,
  align(128) cgArray) gives retail's start byte for byte (`fld [gunYaw]; mov eax,[gunPitch]; fmul; lea ecx,[esp+4]; lea edx,[esp+8];
  mov [esp+0x24],eax`). Linking the same probe against our REAL build/obj/universal/com_math.obj reproduces our yaw copy (lab/cp/r.sh), and
  adding `#pragma optimize("p", on)` to the probe's AngleVectors TU does too (lab/cp/l.sh). Cause: com_math.cpp's file-wide /Op pragma rides
  along with the LTCG-inlined AngleVectors and blocks the yaw store-to-load forward.
- Toggling "p" off around AngleVectors only (in-tree lab): crosshair now starts `fld [cg->gunYaw]` like retail, but the fn shrinks 440 -> 406 B
  (retail 448) and standalone AngleVectors loses retail's `fstp [esp+0x18]` / reload pairs (108 vs 106 insns). So retail's AngleVectors is /Op
  standalone but its inlined copy in the crosshair is not, or retail's /Op region in com_math is shaped differently (e.g. ends before some
  fns, or comes from a per-function pragma). Next: find which com_math fns really need "p" (fdiff each with it off) and the retail region shape.
- (w7-b, 11-11, PINNED: cmp13.json + lab/cp/calls.sh) AngleVectors standalone (0x4279c0, 347 B) is MATCHED with com_math's "p" on, and its
  /Op-inlined forward-only copy (two fsincos) is in MATCHED callers: Scr_AnglesToForward, Scr_AnglesToRight, infront, turret_behind,
  Player_GetUseList, Player_UpdateLookAtEntity, CG_DrawCompassFriendlies, G_BounceCorpse, G_OrientItemToGround, Drop_Item,
  FinishSpawningItem, TeamplayInfoMessage, CG_DamageFeedback, CG_DrawGrenadeIcon, CG_OffsetFirstPersonView, CalculateWeaponPosition,
  gunrandom, CG_RandomPerturbation, Item_Paint. So retail's "p" region does cover AngleVectors, at the standalone copy and at the inlined sites;
  moving the pragma is not the lever. The p-off test (crosshair 406 B, retail 448) agrees: retail's crosshair copy is /Op-sized.
- Probe with "p" on in the AngleVectors TU (and also in the caller TU, no change): gunAng orders, `float *` to the field, roll = 0, a dead
  `gunAng[1] = gunAng[1]` after the call, memcpy of pitch+yaw: all keep the yaw copy. `AngleVectors(&cg->gunPitch, ...)` reads yaw direct but
  pitch from cg after the asm. Retail = yaw direct AND pitch copied before the asm; no array spelling tried gives both. Open: which caller
  form gives that under /Op (the matched sites above all fill angles from calls or computed values, none from plain global copies).
- (w7-b, 11-11, PINNED by probe lab/cp/cmp.sh: mnemonic diff of the probe against retail 0x4c85c0) Any /Op inlinee blocks the yaw forward,
  not just AngleVectors: AngleVectors without "p" but DotProduct from a "p" TU still gives the yaw copy. With NO "p" anywhere the probe matches
  retail's first 54 insns exactly (yaw direct, pitch int-copied to [esp+0x24], both sincos blocks), then differs at `forward`
  (probe `fst [esp+0x18]`, retail `fstp; fld`) and in the tan part (retail stores fov*k to [esp+0x20] before the dot product and calls the
  st0-arg tan helper; a no-"p" probe inlines fptan). So retail's host shows /Op traits after the sincos blocks and no-/Op traits before:
  HYPOTHESIS: the /Op traits there come from something other than an /Op inlinee (the n2 halfFov local gives the [esp+0x20] store), or
  the forward reload has another cause. Probe with `AngleVectors(&cg->gunPitch, ...)` under "p": yaw direct, pitch re-read from cg after
  the asm (retail copies it before). Cg_t has gunPitch, gunYaw, gunXOfs, gunYOfs (no gun roll, not a vec3).
