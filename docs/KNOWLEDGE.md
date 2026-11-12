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
- PINNED (r-addl2 oracle + 2 diagnostic labs, 11-12): the outer CL_ConsolePrint_AddLine charWidth (TextWidth result before the switch,
  used once by `curWidth += charWidth`) is never a colouring node: with a separate inner `cw` it has no P/C line, and it stays
  spilled even with linewidth dead in the Asian loop or with no call between its def and use. Node 53 (n3 -106, split) is the
  parent of the inner piece only. The zero temp (id5 -> ebp) is a consequence: retail zero edi dies at `line` (mov edi,edx), and
  the >0xff `curWidth = 0` store uses an immediate in retail because edi no longer holds 0. Lever must make the outer value a
  candidate (find what excludes a 2-ref call-result web in c2 before colouring), not change its free set.
- `tools/c2opwalk13.sh NAME` (w17, 11-13): code cave in a copy of c2.dll (hooks F 0x107724f6, T 0x107825e5, U 0x10782600, D 0x107826e4,
  K 0x10782626, E 0x10782713, N 0x1078266b) that logs, only for the function whose mangled name starts with NAME, every tuple, every
  use/def operand of the colour-candidate walk (op, kind [op+8], type [op+0xa], class via 0x10869140, sym [op+0x18], node [op+0x1c]) and
  the node stage (node [[op+0x1c]+8]: [n+4], [n+5], [n+0x10], [n+0x18], 0x1078006c result) -> `build/ra/ow.txt`. Link output identical
  to ox.exe except timestamp. Needs a release build + one ra13.sh. Source names: `[opsym+0]` = the source symbol (the P-line `|` word 0),
  so dump `x /8x opsym` at compile start with c2dbg13.sh and match against P-line names.
- PINNED (w17 c2opwalk13, baseline + separate-`cw` variant): the outer AddLine charWidth web (sym 0634f2f4 -> `_charWidth`, node
  06853458) PASSES the operand walk and the node checks in walk 1 ([n+5] 0x0d, 0x1078006c = 1). c2 runs the walk 4 times for this
  function; in walk 2 every node's [n+5] bit0 is clear (mask loop 0x10780cd4 `and [n+5],dl` over all nodes), so the walk skips it at
  0x10782645, and the inner node's [n+0x18] points at the outer node. By walk 3 the outer web is already spilled (def + 0x26b store,
  0x26a reload; the reload piece 068535c0 is the split P line n16 0). It never gets its own P line. So the w9 "fails the operand walk"
  reading is wrong; the exclusion happens between walk 1 and walk 2 (see the GAIN line below).
- PINNED (w17 `GAIN=1 tools/c2opwalk13.sh`: I 0x10784bf4 sorted insert, P 0x10782a5e pop, G 0x10784b8f id lookup): the walk node is
  the colour node (node+8 = self); [n+0x18] is the worklist prev link. G is a lookup during neighbour updates, not the insert (an
  earlier "the webs merge" reading is withdrawn). Round 1: outer charWidth is inserted (n3 -192, n16 8, free ebx/ebp/esi/edi: live
  across SEH_ReadCharFromString) beside the inner piece (n3 -256, n16 16). Pops run in n3 order down to `_targetLineWidth` (n3 -157,
  takes ebx); then 0x107831f7 returns nonzero and the round ends at 0x1078aff9 before the outer node's turn. After the rebuild the
  outer def is a split piece with n16 0 and is spilled. Retail keeps charWidth in ebp.
- Round end, read (w17): 0x107831f7 clears the chosen reg bit in every neighbour's free set (0x107832bd); a set that becomes empty
  goes to 0x107a90da (marks the node) and the function returns nonzero. 0x1078aff9 then unlinks every list node with [n+5] bit 2,
  0x1078b2aa spills/splits them and 0x107afac0 rebuilds the round. So round 1 ends because a neighbour OF targetLineWidth ran out of
  registers. targetLineWidth's refs (2 defs, 1 use) all come after the outer charWidth's last use in IL order, so "targetLineWidth
  overlaps the Asian branch" is NOT supported. Scoping it to the else block: byte-identical (TRIED). Next: log the node marked at
  0x107a90da (the one that empties) and why the round-2 outer piece gets n16 0.
- PINNED (w19 `GAIN=1 tools/c2opwalk13.sh`, new X hook 0x107832c9: neighbour whose free set the chosen reg just emptied, before
  the mark path 0x107a90e6; names from walk K/E syms + P-line syms). 0x107a90da only unlinks the empty bitset chunk; the mark is
  0x107a90e6. Round 1 ends when `_targetLineWidth` (n3 -157, n16 8) takes reg bit 4: 17 neighbours had bit 4 as their only free
  reg and all empty at once: `_p` (n3 -247, n16 142), `_type` (n16 54), temps 0634fcfc (n16 32) / 0634fedc (n16 30), a second
  targetLineWidth piece (n16 -16), curWidth / charWidth pieces and ~10 n16 -1/-2 temps. Outer charWidth (n3 -192) is not among
  them; it is simply next in line. Round 2 ends the same way: `_p` (n3 -185, n16 112) takes bit 4 and empties 25 nodes
  (incl. a charWidth piece, `_type`, `_linewidth`); the outer charWidth is G-gated (free bits 0x40 only) but never inserted.
  Round 3 has only the split piece 068545c8 (n3 -106, n16 0). n3 is dynamic: pieces drop to about -1000..-1082 once one reg
  is left. Lever stays "outer charWidth before targetLineWidth in round 1" (n3 > -157) or "no bit-4-only neighbours of
  targetLineWidth". Hoisting `targetLineWidth = linewidth` before the Asian branch or giving it if/else defs leaves its
  n3 at -157 / -146 (TRIED w19), so n3 is not set by source def position. n3 formula not decoded yet (insert code
  0x10782b26.., nodes with [n+0x24]==2 go through 0x107820b7).
- SUPPORTED (w19, c2 disasm 0x107828c2..0x10783a80, not yet cave-confirmed): n3 is accumulated per walk point over the list of
  live nodes (+0x14 links): edx = (number of live nodes) * weight [esp+0x24]; a node referenced there (flag [n+6]&0x10, cleared
  after) gets n3 += [n+0x18] * edx, every other live node gets n3 -= edx (esi==2 case: -= weight only). So n3 ~ weighted refs
  minus weighted (live length x pressure): charWidth (-192) loses to targetLineWidth (-157) on live points under pressure, not
  on n16. Lever: fewer simultaneously-live values over charWidth's range (TextWidth -> curWidth +=) in the Asian loop.
- PINNED (w19 `GAIN=2 tools/c2opwalk13.sh`: hooks A 0x10783a45 / B 0x10783a7b log edx, node, n3 per live node per point).
  Round-1 sums: targetLineWidth A +22, B -179 = -157 (exact); outer charWidth A +28, B -244 (41 live points, edx 10..18 vs
  8..12, ~40 co-live nodes incl. ~25 n16 -1 temps). So charWidth loses on live length x edx, as read above.
- PINNED (w19 lab): moving `curWidth += charWidth` to the top of the default arm (overflow then `curWidth = charWidth`, the
  end-of-arm add dropped) lifts the outer charWidth to n3 -122 / n16 12. It pops before targetLineWidth in round 1 and takes
  ebp: retail's `mov ebp,eax` / `xor edi,edi` core hunk appears, 676 insns = retail, fdiff 26 -> 21 lines. Residue: the add
  sits before the store (retail: after `lineOffset++`) and the overflow stores ebp, not imm 0. Gate: same-offset -191, rejected.
  So the core hunk IS reachable from source by shortening charWidth's IL range; retail does it while keeping the add at the end.
- PINNED (w19 GAIN=2, per point; edx = refs at the point x weight, not co-live count): of the outer charWidth's 41 points,
  ~28 (groups 105..132, edx 4..12) are the inlined SEH_ReadCharFromString body (lead-byte tests, `_lead`, `p` updates) between
  the second TextWidth and the switch; the two heaviest (edx 18, 14) are the `curWidth +=` / line store tuples at the arm end.
  So co-live values do not matter; the cost is charWidth held across the inlined ReadChar. Retail has the same call order, so
  the open question is why retail's range there is cheaper (fewer IL points in its inline body, or a lower block weight).
  esi==2 path (0x107c21ce, -= weight only) not hooked yet; it is the likely 24-point gap.

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
- Remaining 4 header bytes: Rich entries (25,9466) and (28,9466) in the other order. Both come from build/lib/mss32.lib (the import members
  are prodid 25, mss_auto.obj from VS .NET 2002 is prodid 28). Putting mss_auto.obj first in the archive does NOT change the Rich orde
  (lab relink); the order follows which member the link pulls first. FIXED (w18, 11-12, clean gate 1973317 = +4): the w8-b recipe
  (commit 51641ac1, never merged to 1.3 main) builds mss32.lib in two plain VC7.0 lib.exe passes (`lib /out:mss32_1.lib imp.lib
  mss_auto.obj`, then `lib /out:mss32.lib mss32_1.lib`); the second pass puts mss_auto.obj before the descriptor. Now in the Makefile.
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
  SUPERSEDED: fixed by the two-pass lib.exe build (w18 entry above); RAD's original lib is not needed.
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
- CG_CalcCrosshairPosition (PINNED, r-xh2 labs): the yaw ecx copy is the /Op spread from com_math AngleVectors. With the caller's gunAng stores outside /Op, yaw forwards and pitch is eax-copied as in retail; with the caller under /Op (spread or own pragma) yaw goes through ecx. Removing /Op from AngleVectors costs 423 matched fns, and a caller `optimize("p", off)` does not stop the spread. Retail has /Op traits in the same function (`call tan`, forward fstp/fld), so retail mixes both.
  directly (store forwarded, then dead). That ecx copy is one extra LOCAL pick, which is exactly why every later lea pair is one step
  rotated (ours edx/eax, retail ecx/edx). Tried (lab, no change): assignment order of gunAng[0..2] (4 orders), no roll assignment, roll = 0.
- FX_CalcOriginAndAxis: pure stack-slot order (the first float temps 0x28/0x2c/0x30 shifted by 4), no register or code difference. Not attempted.
- PINNED (n2, clean ratchet 1967119 -> 1967333): FxPrimitives.cpp vtable order follows the forward class declarations as reverse(decl[0..6]) then reverse(decl[7..8]). Decl order OrientedParticle, Line, Effect, Emitter, Tail, Particle, Cloud, Light, Cylinder gives retail 1.3's Cloud, Particle, Tail, Emitter, Effect, Line, OrientedParticle, Cylinder, Light (FX_Restore vtable stores now match).
- PINNED (n2, clean ratchet 1967333 -> 1967367, matched-fn +222): `$E2` / `~stPbCl` match when UnloadClientDll/UnloadAgentDll clear the instance inside the `if (m_xxInstance)` branch (same behaviour).
- Proven unreferenced retail gaps (tools/gapref13.py, every byte offset in .text/.data/.rdata): 0xb013f8..0xb013ff (0 refs), 0xd529a4..0xd529af (0), 0xd52a40..0xd52a4b (only Sys_InitializeCriticalSections/WinMain end bound of s_criticalSections[6]), 0xd52a50..53 (0), 0xd52a58..5b (0), 0xd76aec..0xd76af7 (0). Not yet landed: adding any TU flips CG_DrawPlayerStance (see TRIED).
- DL_BeginDownload(local, url) MATCHED (r-dl, PINNED by clean ratchet +781 matched-fn, +381 same-offset): use `hostSeparator + 1` in the malloc/sprintf instead of `hostSeparator++` (KisakCOD decompile shape). Result: no esi re-zero in the arms, HTSACopy cross-jumps like retail, edi/ebx swap gone too. Why the increment kept the zero web alive: HYPOTHESIS.
- PINNED (r-misc2 gate, RATCHET OK +150): CL_ConsolePrint starts with `if (!noPrint || noPrint->current.enabled) return;` (one test, `||`). With two separate `return`s, the inlined copy in CL_ConsoleFixPosition lays out its duplicated tail blocks in the wrong order. CL_ConsolePrint and PbMsgToScreen stay matched.
- PINNED: Cbuf_Init (0x420ab0) and SV_AddDedicatedCommands (0x452bc0) are byte-identical in place, but the referee doesn't credit them. Their bodies are too short to search, so cmp13.py falls back to name pairing via tools/ghidra/names_*.tsv, and those tables hold 1.0 addresses.
- FX_AddFxToScene residue (r-fx, 11-11, PINNED on bytes, fdiff vs retail 0x494360): 74 vs 74 insns, the only diff is the &ent temp at the
  end. Retail: `mov edx,[edx+0xb4]; push 0; push edx; lea edx,[esp+8]; push edx; call [0x68a238]` (edx reused after the model push);
  ours uses eax for the lea. Callee is a cdecl fn pointer with 3 args (ent, model, 0), `add esp,0x80`. No source variant tried yet.
- PINNED (Mac 1.3 STABS, r-ui, `N_LSYM/N_RSYM` scopes): Window_Paint locals are `color` (vec4_t), `const vec_t *foreColor`, `int flags` (no fillRect
  stab); Item_ListBox_MouseEnter has `listPtr` and, per branch block, `rectDef_t compareRect` + floats `compareX`/`compareY`; Menu_SetNextCursorItem
  has `wrapped`, `oldCursor`, `const rectDef_t *rect` and no item local. None of these shapes moved the PC residue in lab (TRIED r-ui rows).
- PINNED (r-math, 11-11): `__cfltcvt_init` (libcmt fpinit, 56 B) is already byte-identical at the same address (ours = retail 0x57dd2a, every byte incl. relocated values). cmp13 cannot count it: all imm32 are masked, the longest literal run is under 4 bytes, the scan path needs a 16-aligned start and libcmt bodies are unpadded, and the name-pair path needs a 0xcc or aligned end. names_loc.tsv `4317f0 cfltcvt_init similar` is not this function. Counting it needs a referee change (owner decision), not source.
- PINNED (r-math, 11-11): nb_decode's only residue is 3 operands in the vocoder loop (innov[i]): ours `[ecx+eax-4]`, retail `[eax+ecx-4]`, same registers (eax = exc walker, ecx = innov - exc). Not a register rotation. Retail calls signal_mul (the Mac/1.0-style `innov[i]*=ener` loop is wrong for 1.3).
- PINNED (r-autowrap, 11-12, clean ratchets 1972174 -> 1972278 -> accept below): com_files bss. The startup config-name pointer is `g_cfgName` (placeholder; real name unknown), retail 0xb1a5ac between fs_ignoreLocalized and fs_restrict. Retail 0xb1a5c8 is an unreferenced int (0 operands in the exe) before fs_serverReferencedIwdNames (8-aligned, 0xb1a5d0): placeholder `int fsUnused12`. That puts fs_basepath 0xb1b6d0, fs_loadStack d4, fs_serverIwds d8 = retail (FS_ResetFiles, FS_LoadStack match). Method: declare 40-200 candidate globals in one lab relink (tools/lab13.sh), read their map slots, keep one; /GL bss order is a name hash, not alphabetical.
- PINNED (r-autowrap, 11-12, clean ratchet 1972331 -> 1972615, IN_ClearStates matches): owner approved layout placeholders for proven-unreferenced retail gaps (11-12). Landed uiComponentUnreferenced[0xc] (gap 0xd529a4..af) + winCommonUnreferenced[0xc] in win_common (gap 0xd52a40..4b), the n2 pair from KNOWLEDGE above.
- PINNED (r-autowrap, 11-12, clean ratchet 1972615 -> 1972679): win_threads statics made globals with placeholder names (wt_eventA15 .. wt_eventD8) picked from a 300-name rank probe so /GL hash order gives retail 0xd528a4..f4 exactly. Dropping `static` changed no code. Rank probe: declare N candidate globals per role, read map order, pick greedily in retail order.
- PINNED (r-autowrap, 11-12, clean ratchet 1972679 -> 1972713): HTEvtLst pump static renamed HTPumpRunning (n2 finding, now allowed as placeholder); win_splash g_splashWnd is ALIGNED(8) (retail 0xd76ae8, not 16) followed by placeholder int winSplashUnreferenced[2] (retail 0xd76aec..f3 unreferenced).
- FX_CalcOriginAndAxis slot map (r-fxslot, PINNED by c2slots13 on our build + fdiff): ours esp+X = frame X-0x64. Entries
  bottom-up: sin/cos x4 (-0x50..-0x44), w20 height/len (-0x40), w13 (-0x3c), w31 (-0x38), w29 (-0x34), pos (-0x30, unchanged
  vs retail). Retail puts our w20 items' slot (yaw/value temp) at -0x40 -> retail -0x40, our w31 GetVal temps at -0x3c,
  w29 at -0x38: our 4-byte entries above sin/cos look rotated by one in retail (one entry moved to just below pos).
  HYPOTHESIS: retail creates the height/len entry after the GetVal-temp entries (seed later in the item list). Removing
  the yaw/pitch locals does not change the entry list (it only renumbers items).
- PINNED (r-solid, retail disasm + cpick on our build, 11-12): CG_BuildSolidList (0x4de0b0) diff has no address-only bytes (no cm/cme operand); all 89 B are code. Retail keeps `lea ecx,[snap+0x26b4]` as its own temp (spilled [esp+4], reloaded once after the inlined CM_ContentsOfModel TlsGetValue call), with TlsGetValue in ebx and i in ebp. Ours: snap node id16 (n3 5) -> ecx/spill, TlsGetValue -> ebp (ebx cost 100), i -> ebx. Any source that names `&snap->numEntities` is canonicalised back to snap+0x26b4 (5 variants), so the lever is whatever makes c2 hoist the address, not the C spelling.
- PINNED (data1, 11-12, retail operands + ra13 F order of 126fd552): the Com_ErrorCleanup residue is an adjacent swap, not an
  unreferenced slot. Retail: UI_BuildFindPlayerList statics ..d28/d2c, errorCount 0x19a8d30, lastErrorTime 0x19a8d34,
  com_subtitleReference[1024] (Com_GetSubtitleStringEdReference) 0x19a8d38, ChopWindingInPlace 0x19a9138. Ours puts the 1 KB array
  first, so the two ints land at 0x19a9130. The function-static block and the __real pool both follow FORWARD F (compile) order:
  ours UI_BuildFindPlayerList 5781, Com_GetSubtitleStringEdReference 5853, Com_ErrorCleanup 6005 (common.obj root turn, right after
  Com_Error_f / Debug_EventLoop), ChopWindingInPlace 6010. Retail therefore compiles Com_ErrorCleanup between 5781 and 5853, i.e.
  near Com_Error (5851, reached as a child there). Its late callee SEH_UpdateLanguageInfo is 5930 in ours. Retail has only one
  caller (Com_Frame 0x4352ae, compiled 6687), so no evidence yet for what pulls it earlier.
- PINNED (data1, same method): __real pool users are identical in both exes (1000.0 double: CL_DemoCompleted, CG_FxTest,
  HTNumToStr x2; 720.0f: fire_grenade only). Retail 1000.0 sits after Pickup_Health's -0.01 (ours F 5602) and before
  Die@Particle's constant (5634); ours is pinned by CL_DemoCompleted at F 5435. Retail 720.0f sits after Mantle_CreateAnims's
  constants (F 6040) and before player_die's 160.0 (6166); ours fire_grenade is F 6034. Both need compile-order moves.
- PINNED (data1, retail refs): PB LoadServerDll pool: pbsv.dll 0x5b3a30 (first used earlier, makefn/getHomePath), LoadFailure
  0x5b3a00, pbsvnew 0x5b39f4, pbsvold 0x5b39e8, GetProc 0x5b39b4; each LoadServerDll literal has one ref. SUPPORTED (CoD4 Mac pbsv,
  gcc, cod4_dasm _pbsv.asm): its string order is pbsvnew, rb, pbsvold, pbsv, sa, sb, GetProc, LoadFailure, i.e. "Get Procedure"
  before "Load Failure", unlike our source; the retail MSVC order (LoadFailure first) is still unexplained.
- PINNED (code1, retail disasm 0x4c85c0): retail crosshair calls `__CItan` (0x58f880) twice; its only other __CItan callers are 0x429820 (com_math) and 0x5219c0. The same TU has inline fptan elsewhere (0x4c916e), so retail crosshair is a /Op function whose head still forwards yaw (`fld [cg->gunYaw]`). The inlined AngleVectors body in retail matches the standalone com_math AngleVectors (0x4279c0) shape (angle*k, fstp, FastSinCos asm); no evidence of a second AngleVectors copy.
- PINNED (code1, full build): the /Op state of a header inline comes with the COMDAT copy the linker keeps (DotProduct's kept copy is cm_mesh.obj). Putting DotProduct under /Op in com_math.h makes every inliner /Op (crosshair included, 528 fns lost). In our compiler ANY /Op inlinee makes the whole caller /Op and the yaw is then copied via ecx; non-AV /Op sources do not avoid the copy. So the pragma route is closed: retail is /Op with yaw forwarded, the difference must be source shape.
- PINNED (w3, 11-12, ra13 F order of data1 + peel13 passes() model): the three compile-order targets are pass (sweep) moves, not
  in-pass moves. fire_grenade's latest callee is G_Spawn (F 5915, previous pass); retail needs fire_grenade one pass later, which
  also pushes its callers weapon_grenadelauncher_fire (6162) and player_die (6167) a pass. Retail body has the same calls as ours,
  CoD2rev and Mac 1.3 (G_Spawn, BG_GetWeaponDef, Scr_SetString, vectoangles, AngleNormalize360, flrand x2): no extra callee found.
  CL_DemoCompleted waits on CL_NextDemo (F 5435), retail wants it ~1 pass later; Mac file has no body. Com_ErrorCleanup is blocked by
  SEH_UpdateLanguageInfo (5931) <- SEH_StringEd_SetLanguageStrings (5930) <- Com_Error (5852); retail wants ErrorCleanup before
  5853, so in retail that chain must be cut (cycle) or SetLanguageStrings must not depend on Com_Error. HYPOTHESIS, untested.
- PINNED (w4 labs, 11-12): CG_CalcCrosshairPosition yaw forwarding is a scalar-vs-array effect under /Op. A by-value float formal
  (scalar) forwards (`fld [cg->gunYaw]`, pitch eax-copied before the asm, as retail); an array element read through `angles[]`
  does not, whether AV is inlined at compile time or by LTCG (ecx copy). Our baseline frame/slots (0x30, gunAng[0] at 0x24,
  ptr temps 0x1c/0x20) equal retail's, the by-value frame does not (0x2c), so retail still has the gunAng array: retail
  forwards an array element store under /Op where ours does not. Next: oracle/IL dump of the store->load forward pass, not spelling.

## 24. Why a 2-ref call-result web is not a colour candidate (w9, 11-12)
- PINNED (c2 disasm): node benefit n16 (node +0x40) is summed per tuple in 0x10782473..0x10782978 with weight `1 << block[+0xa6]`
  (0x1078244d). A referencing tuple adds `cost * w` (0x10782692; cost from 0x107801c0 = 0 or 2, opcode table 0x10870dc0);
  a tuple of op 0x26a subtracts `(1 or 2) * w` (0x1078281c; 0x1078002f returns 1 for kind 0x0d, else 2). Only n16 > 0 pops.
- PINNED (lab d): the outer AddLine charWidth (call result, one `curWidth += charWidth` use, same block depth) nets 0 and
  gets no P line even with the inner loop removed. Retail colours it (ebp), so retail's outer web must have an extra
  positive ref or a use in a heavier block than the def. HYPOTHESIS: 0x26a = the call-result assignment. Next: winedbg
  break at 0x10782692 / 0x1078281c for this node (tools/c2dbg13.sh) to list each tuple's op, cost and weight.
- PINNED (w6, 11-12, clean ratchet 1972713 -> 1972783): stPbSv::LoadServerDll literal order. Naming the load-failure string in a local at the top (`char *loadFailure = "...Load Failure";`, returned later) makes it the first-used literal; .rdata pool becomes retail GetProc, sb, sa, pbsvold, pbsvnew, LoadFailure. Code unchanged. Real SDK spelling unknown (shape is HYPOTHESIS, bytes PINNED).
- PINNED (w6, 11-12, clean ratchet 1972783 -> 1972877): HTEvtLst function order. Defining the static Timer_setWindowsTimer/deleteWindowsTimer after HTEventList_loop (prototypes kept at the old place) gives retail loop, Timer_set, Timer_delete, fn_54ed70, HTEventInit. HT_CALLOC passes __LINE__: the w5/w6 SockEvents_get loss (push 0x101 vs 0x10e) was only the line shift, so the prototype block keeps the original line count.
- PINNED (w8 labs, 11-12, fdiff 0 lines): CG_CalcCrosshairPosition is byte-identical when (1) AngleVectors is a full copy whose
  yaw comes in as a by-value float formal (angles ptr still passed for pitch/roll, right/up NULL; gunAng stores kept; this gives
  retail's 0x30 frame and the unused slot at esp+0x14) and (2) both tan args go through a by-value float formal, with the dot
  products inline in the `*x`/`*y` expressions (no horiz/vert/halfFov vars: a named float is spilled across `call __CItan`, retail
  keeps the dot on the x87 stack). Both effects are "inline formal forwards, named var/array element does not" under /Op.
  Blocker: in this build every inline function keeps one out-of-line COMDAT copy (same as FastSinCos, DotProduct), so the two
  helpers add bodies retail does not have (+0x180 B, gate reject). Next: find a construct with formal semantics and no kept
  body (an existing retail-kept inline, a header inline already present in the retail map, or why some inlines are not kept).
- PINNED (w9 winedbg, breaks 0x10782692 / 0x1078281c, baseline objs): AddLine charWidth parent id 53 n16 trace
  -1 (op 0x26a, w1), +0 (op 1 = assignment from the TextWidth result, cost 0), -3 (op 0x26a, w2), +4 (op 0x2d, the
  `curWidth +=` use, cost 2 * w2) = 0. Every local of the fn gets one op 0x26a at w1 (entry/home boundary), so 0x26a is a
  memory-boundary tuple, not the call-result assignment (that HYPOTHESIS is void). The extra in-loop 0x26a (w2) is what
  zeroes charWidth; retail must lack it. Weights: outer while 2, inner do 4. The breakpoints stay armed after the fn, so
  only the first ~150 hits are AddLine (ids repeat in later fns). Refs (opencod2, Mac 1.3, coduo, Kisak) have no Asian branch.
- PINNED (w9 winedbg, 11-12; source operand corrected by w10 c2 disasm): op 0x26a tuples come from 0x1077c20c(var = edi):
  the source operand is 0x24b `imm` only when [var+4]==0x0d and its first operand has kind 7 (constant-valued symbol:
  rematerialize), else 0x250 (var kind 3..6) or 0x251 (other kinds) memory home; the dest is a 0x24f var-ref (+0x18 = var).
  So 0x26a = reload of var into its register (from memory or as an immediate).
- PINNED (w10 winedbg, `cond 1 $eax == <sym>` at 0x1078bb3a works; winedbg has no pointer casts, so deref conds fail):
  in this build charWidth's symbol is 0x066c3a54 (op001 `sym = eax` right after both TextWidth calls). 0x1078bb3a fires
  twice for it in AddLine, both for node 0x0648ade0 (id 0x58, parent 0x0648a648) and both inserted at an op 0x10 (call)
  tuple (insertion point from 0x1078a9fe): the split reloads charged to charWidth sit at call crossings between def and
  use. The loop is over a node-id bitset (0x107b3786) of an edge-list entry whose [+0xc] list is empty and +0x18 bit
  0x1000000 is clear. Retail fdiff: `call TextWidth; mov ebp,eax; ...; xor edi,edi` vs ours `mov [esp+0x28],eax; ...;
  xor ebp,ebp`: the zero constant takes the callee-saved reg charWidth needs.
- PINNED (w10 forced colour + map, 11-12): colour 0x108a9924 = ebx, 0x108a9aa4 = esi. The edi web in the inner wrap scan
  is the inlined Language_IsAsian load (`mov edi,[loc_translate+4]` at 0x4048fe, retested at 0x404a4c), and retail holds
  it in edi at the same addresses too, so it is not the competitor. After the scan edi is free in both builds; the residue
  is only which of zero-constant / charWidth is coloured first (ours: zero picks ebp, charWidth never pops, n16 = 0).
- PINNED (w15 winedbg 0x1078bb3a, 11-12): our AddLine zero-constant web (sym 0x06810278, kind 0x0d) is already split three times (reload nodes 06853188/06853140/068478a0), so the HYPOTHESIS below (retail splits at Con_Linefeed, ours does not) is void as stated. The imm-0 vs ebp store and ours' `mov ebp,[con.lineOffset]` cache in the overflow block follow from which of zero/charWidth pops first; no statement order in that block moves it (TRIED w15).
- PINNED (w15 part 2, breaks 0x1078bb36 + 0x107834bd, scratch /home/nawaf/w15v/dbg2.out): split reloads are inserted at op 0x10 (call) tuples; the zero sym gets its 3 reloads at three different call tuples (068b8f0c, 0689914c, 065ad9ec). Colour stores, first round: node priority at node+0xc, descending (0x1d6 ... 0, then negatives). Last round (after splitting): node 0634eff4 (0x1c), then the ZERO piece 06847960 (flags 0x12c02, split bit 0x10000, priority -152, id 5) -> ebp (0x108a99e4), then the inner charWidth piece 06848020 (priority +40, id 0x17) -> eax. The outer charWidth has no colour store in either round, so it is never offered ebp: the order zero-before-charWidth is not a priority contest, the outer piece is missing. Source lever must make the outer charWidth a candidate (KNOWLEDGE 24), not lower the zero piece.
- STATE (w10 end, 11-12): zero-constant uses in the outer loop (same in both builds): IsAsian `cmp eax,0` after the outer
  TextWidth, `!con.lineOffset`, `lineBroken` test, and `curWidth = 0` in the `letter > 0xff` Con_Linefeed branch. Only the
  last differs: retail stores imm 0 there (zero web does not reach it), ours stores the zero reg (ebp). Lab moving that
  `curWidth = 0` before Con_Linefeed: 26 vs 28 diff lines, store still sunk after `lineBroken = 1`, core hunk unchanged.
  Open: what ends retail's zero web before that branch (HYPOTHESIS: a split at the Con_Linefeed call that ours lacks). Callers: 0x1074909c, 0x1077e8e7, 0x1077ee6b, 0x1078adcf, 0x1078bb3a,
  0x1079226b. charWidth's in-loop 0x26a (w2) comes from 0x1078bb3a, in the web-split code: it is the reload charged to the
  parent when the inner piece splits off (-3, cancels the +4 use). With a separate inner `cw` (no split) the outer
  charWidth gets NO n16 contribution at all in the first 170 hits: it is filtered out before benefit counting
  (site 0x10782626.. checks object kind 2, [obj+0x10]==0, [obj+5]&1, op != 0x26b, 0x1078006c(tuple)). Next: find what
  clears [obj+5] bit 0 (or fails 0x1078006c) for the outer charWidth.
- PINNED (w9 winedbg breaks 0x1078262c/0x1078266b, cw variant, 600 hits): the outer charWidth node never reaches the
  benefit site, so none of the five node checks is the filter. The tuple walk before it (0x107825e5..0x10782620) only
  passes tuples with [t+9] bit 0 and operands with [op+8] == 1 whose type class ([op+0xa] >> 12 via table 0x10869140)
  equals the current class. The outer charWidth has no such operand. HYPOTHESIS: its def/use were rewritten to a
  compiler temp (call result propagated into the add), so the value lives in a temp, which ours spills to [esp+0x28].
  Next: break at 0x10782600 and log the operand kinds of the TextWidth-result tuple.
- PINNED (w5, 11-12, c2slots13 + tools/c2slotmap13.py / c2slotnames13.py, FX_CalcOriginAndAxis): 4-byte stack entries get frame
  offsets in ENTRY CREATION order, bottom-up (first-created entry lowest), not by weight/size. Items sort weight desc, then id.
  Ours: sinPitch/cosPitch/cosYaw/sinYaw (w6, alone) -0x50..-0x44, then E4 {height w6, len w6, t256, t267} -0x40, E6 {t265 w5, t257,
  yaw, pitch} -0x3c, E7 {t264 w5, t258, GetVal result t259/t263, width, ...} -0x38, E8 {scale w3, radius, ...} -0x34. Retail (fdiff):
  yaw store 0x28->0x24, E7 0x2c->0x28, E8 0x30->0x2c, so retail order is E6, E7, E8, E4: the height/len entry is created LAST (its
  seed sorts after scale, weight <= 3). Splitting height or len into per-branch locals keeps the code (1463 B) but merges to 7
  entries; inlining branch-1 height changes code (1455 B). Lever: lower height/len weight without splitting them (HYPOTHESIS).
- PINNED (w5, 11-12, slot dumps): the slot packer's item ids follow first reference in the function (moving `scale = ...` before the
  height GetVal swaps ids 20/21), and the packer walks items by weight desc, then id. FX height/len (w6 each) therefore always seed
  the first non-sin/cos entry; retail's late height/len entry needs a different weight, not a different statement order.
- PINNED (w5, 11-12, lab): CG_BuildSolidList hoists `snap+0x26b4` as its own spilled temp (retail shape) only when snap has NO other
  use in the loop IL (body reading `cg->nextSnap->entities[i]`); strength reduction of `snap->entities[i]` happens after that
  decision, so retail's pre-loop `lea edi,[snap+0x26bc]` walker must come from an IL value other than snap (HYPOTHESIS).
- PINNED (w20 winedbg, 11-13, baseline vs bound-hoist lab): the address temp for `snap+0x26b4` (op 0x278, temp made by 0x10761623 ->
  0x10761516 -> 0x107615bc, called from the early-IL pass at 0x1076369d) is created and CSEd (guard + bound share sym 0676cd5c) in BOTH
  builds with identical writer sequences. The difference is later: in the baseline the temp is gone from the regalloc IL (folded back
  into `[snap+0x26b4]`), in the lab it survives. So the early CSE pass is not the decision; the fold pass was not located.
- PINNED (w20 lab): walker spelled `cg->nextSnap->entities` (not `snap->entities`, TRIED 204) before the loop with `snapEnt++` gives
  both retail hoists (bound address and walker from one load). Remaining BSL residue is a colouring choice (bound temp ebx vs retail
  spill + TlsGetValue in ebx) and the loop rotation (jmp into the test); 217 B vs retail 241.
- PINNED (w8 lab, 11-12): the crosshair tail source is `*x = DotProduct(gunDir, viewaxis[1]) / (forward * tan(fov_x * 0.0087266462f)) * -320.0f`
  (same for y): C++ `float tan(float)` from math.h (retail keeps `?tan@@YAMM@Z`, so no new body), no horiz/vert vars. Only the
  yaw head remains; it needs AV with yaw as a by-value formal without a new kept inline body (retail map has none for it).
- PINNED (w8 gate, 11-12): CG_CalcCrosshairPosition now differs from retail only in the dot-product term order (ours does [2] then [1];
  retail does [1] then [2]; same size). Source: caller `optimize("p", on)`, AV open-coded with `angle = cg->gunYaw * k` (yaw read
  from cg, not through the array), pitch from `angles[0]`, gunDir written through a `float *dir` local, dead right/up NULL
  locals (they give the 0x30 frame), dots inline and `tan(float)`. A named float yaw local is copied via ecx under /Op;
  an expression fed straight into the FastSinCos formal forwards. The by-value helper version (lab, 0 diff) differs only in that the
  writes go through a pointer formal, so the term order comes from formal vs local pointer.
- PINNED (w7, 11-12, peel13 passes() on w8-a ord.txt + retail disasm): Com_ErrorCleanup slot. Symbol-list idx: SetLS 2742,
  UpdLI 2746, Com_Error 5554, ErrorCleanup 5555, subtitle fn 5572; UI_SetActiveMenu (pass 56) pins Com_Error and the subtitle fn
  (retail calls Com_Error from it) to pass 56. SetLS (retail calls Com_Error, 0x4ab50f) sits before Com_Error in the list so it
  emits pass 57 and ErrorCleanup with it. Under this model retail's UIBF < ErrorCleanup < subtitle order needs a DFS cut on
  SetLS->Com_Error, and no retail direct call makes SetLS reachable from Com_Error. So either the symbol list order of these fns
  differs in retail or the model misses a rule. Retail Com_Error inlines UI_SetActiveMenu (calls Menus_OpenByName directly).
- PINNED (w8 part 3): in the crosshair, the dot-product term order ([1] before [2], retail) appears only when yaw enters as a by-value
  formal of an inlinee (0-diff lab). The same code with pointer formals, or with a /Op tan helper, and yaw read from cg keeps [2] first.
  HYPOTHESIS: the extra formal object shifts object numbers, and the x87 operand-role rule picks by object number. Next: c2dbg13 on the term
  scheduling for b9 vs the 0-diff lab.
- PINNED (w14 labs, 11-12): in the crosshair dots the gunDir element objects are numbered by DIRECT `gunDir[k]` references only (writes through the `dir` pointer do not count; first direct ref is the forward DotProduct). The early-referenced element takes the memory-operand role (`fld [axis]; fmul [d]`) and goes last; the other two are emitted higher number first. Retail needs [0] memory, then [1], [2] with [2] on the fld side; dead `gunDir[0] = 0; gunDir[2] = 0` gives the order but puts [2] on the memory side. Moving `forward` early (object 19 -> 3, as in the 0-diff lab) changes nothing. Open lead: the yaw formal changes the count of late temps (lab 2 objects between temps where ours has 5, 424 vs 448 total); needs a c2 site for the commutative operand pick to go further.
- PINNED (w11, 11-12, peel13 on w7 ord.txt): the model already reproduces our F order: LIS 6681/6727, every fn shifted by a
  constant 12 because the per-TU `_$E*` initializer names collide (one node per name; the oracle compiles them last, F 6711+).
  The other ~30 out-of-order fns are map-less soft nodes placed in-pass and real one pass later; none touches the three targets.
  fire_grenade (sim 6046 = real 6034+12), Com_ErrorCleanup, CL_DemoCompleted are in order, so their gap to retail is not a model error.
  Retail bodies of fire_grenade, G_Spawn, Com_Error, SEH_*LanguageInfo/Strings, CL_NextDemo, CL_DemoCompleted equal ours (fdiff 0).

## 25. Small-residue classes (w13, 11-12, baseline 1973256, fdiff + c2slots13 + c2pickmap13)
- PINNED (fdiff vs retail at the same address): (a) local-pick rotation: VM_Notify 6, EvalPrimitiveExpression 14. (b) slot permutation:
  CG_DrawScoreboard_Objective 26, Item_Text_AutoWrapped_Paint 10. (d) x87 role: CG_DrawCursorhint 30. Pure scheduling, same regs:
  CG_DrawAdsOverlay 29, CG_DrawGrenadePointer 16, G_GetPlayerViewOrigin 16, XAnimCalc 15, Item_ListBox_MouseEnter 11, CG_FireWeapon 7,
  IntersectPlanes 6, StartWeaponAnim 4, Window_Paint 4. Address-only: Player_GetUseList 8 and all fns <= 5 B except the KNOWLEDGE 21/23 three.
- PINNED (c2pickmap13 on baseline VM_Notify, 0x481190): pick 35 = 0x48163e `mov edx,[esp+0x18]` (bNoStack arm), pick 36 changes no
  instruction (deleted code), pick 37 = the `lea edx,[eax+eax*4]` len temp. The size movzx and the loop load are colour nodes, not picks.
  Retail's `lea eax` = one more local pick before pick 37. A `type = (currentValue--)[-1].type` store gives retail's loop schedule but
  turns size/load into the wrong colours (ecx/eax), so that variant is not the retail source.
- PINNED (lab): EvalPrimitiveExpression's retail tail (ecx = sourcePos, eax = constValue, fstp first) is what a direct
  `EvalFloat(-expr.node[1].floatValue, ...)` produces; any `value` local gives ours (eax/ecx, sourcePos stored first).
- PINNED (c2slots13): Objective entries bottom-up are {textEnd, whiteSpace} 16, next 12, font 12, {len, t18} 9, textStart 7, c 4;
  retail fits whiteSpace sharing len's entry, so in retail len is placed before whiteSpace (len heavier).
- Cursorhint: an early dead `textHeight = rect->h` (DIAG) does not change the fadd operand roles, so rect->h's first reference is not the lever.
- PINNED (w13 clean gate 1973256 -> 1973284, matched-fn +813): Item_Text_AutoWrapped_Paint matches with the line step as
  `if (height < 16) y += (float)(height + 1); else y += (float)(height + 4);`: two separate y stores raise y's slot weight above the
  int group (the ternary is one store). CG_DrawScoreboard_Objective slots now equal retail when each `goto resetLen` site is written as
  `len = 0; continue;` (separate len stores raise len's weight, whiteSpace joins len's entry); one store-order swap left
  (`mov ebp,edi` vs `len = 0` store, newline site); writing `len = 0` before `textEnd = textStart` there brings the old slots back.
- PINNED (w12, 11-12, winedbg watch on the packer item +0x38 + c2 disasm, FX_CalcOriginAndAxis baseline): the slot-packer item
  weight is a plain IL reference count, not loop/benefit weighted. 0x10788642 (edx = item, ebx = increment) sets weight = ebx on
  first sight (0x107886a4) and adds ebx on every later call (0x10789a99). Callers: the tuple walk at 0x10785c7c (0x10788635, one
  call per operand whose symbol kind [sym+4] is 3/4/5), 0x107e25c4 (operand list walk), 0x107e2671/78 (two items per op 0xf/0x12
  tuple), 0x107e26a2. In FX every call had ebx = 1 (loop weighting, if any, untested). Items are the kind-5 list at 0x108a78a4
  (+0x30 next, +0x1c id, +0x38 weight); the packer copies +0x38 to entry +0xc at 0x10790c12. Watch the ITEM node (packer bp eax),
  not the symbol: sym+0x38 is a different field. Per-item trace: sinPitch 1..6, scale 1..3, height 1..6, len 1..6.
  Reading: len 6 = def + `!= 0` + `1/len` in each of the two branches; height 6 = branch-1 def + use, branch-4 def + 3 (the
  inlined VectorMA uses its scale formal 3 times). So retail's late height/len entry needs fewer IL refs to each, not a
  statement reorder. HYPOTHESIS: retail's branch-4 height reaches VectorMA in a shape that leaves 1 ref after inlining.
- Tool (w12): watch recipe = c2slots13 -> packer node addresses (bp 0x10790cba eax, deterministic across runs with the same cave),
  then winedbg `watch *node+0x38` armed at the fn-start int3 plus `break *0x10790cba` to stop; only the last writes before the
  first packer hit belong to the fn (the address is reused by earlier objects).
- PINNED (w13 clean gate 1973284 -> 1973313, +825): CG_DrawAdsOverlay matches with the big-overlay x as `crosshairPos[0] - (drawSize[0] * 0.5f)` (product parens) and no parens on y; 6-variant sweep, only parens on the x product give 0. Redundant parens are a real lever on non-/Op x87 scheduling too.
- State of the small residues after w13 (11-12, same-offset 1973313; every lever tried is in TRIED):
  CG_DrawCursorhint 30 (x87 role, fadd scale vs rect->h; first-reference and decl levers tried; next: c2 object-number trace of the two fadd operands).
  CG_DrawScoreboard_Objective ~2 (slots fixed; one store-order swap `mov ebp,edi` vs `len = 0` at the newline site; next: that arm's statement shape with the slot weights kept).
  CG_DrawGrenadePointer 16 (fchs/-yaw push scheduling; 17 paren labs; next: -yaw as its own local or call-arg order).
  G_GetPlayerViewOrigin 16 (one early push before fstp; 11 labs; next: AddLeanToPosition call shape).
  XAnimCalc 15, Window_Paint 4 (spill reload order after a call), CG_FireWeapon 7 (`lea ebp,&cent->nextState` hoist; ent-> forms worse): not labbed / no lever yet.
  Item_ListBox_MouseEnter 11 (horzAlign load before the dynamicFlags store; 6 labs), IntersectPlanes 6 (early `pop esi`; 9 labs), StartWeaponAnim 4 (inc order; 3 labs).
  VM_Notify 6 (local-pick rotation; retail has one more pick before pick 37, KNOWLEDGE 25). EvalPrimitiveExpression 14 (retail tail = direct-formal EvalFloat in the minus arm, float arm jumps in; no source shape found).
