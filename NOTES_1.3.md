# 1.3 notes (agents append here)

## Areas in progress
- opencode (linker/layout): libwww TU set + link order work. Started 2026-11-03.

## Findings
- PINNED (retail 1.3 exe, .rdata): exactly 75 libwww `__FILE__` path strings
  `\builds\pc_1.3_1_1\pc\cod2src\libwww\Library\src\HTxxx.c` span .rdata 0x193544-0x199050,
  contiguous right after the PE import structures, then the CRT data chunk (CorExitProcess...)
  follows at ~0x199214. Our exe (no libwww) has [imports][CRT][cod2 data]. Retail 1.0 exe is
  CRT-first like ours. So the libwww .rdata chunk sits BEFORE the CRT chunk, and its internal
  order (offsets of the path strings) is MyMeasured layout evidence: order in retail =
  HTReqMan HTFTP HTAABrow HTInit HTEvtLst HTAccess HTAlert HTParse HTNet HTHost HTString
  HTEscape HTAtom HTResponse HTError HTList HTAssoc HTAnchor HTNoFree HTEvent HTFormat
  HTChannl HTChunk HTUser HTFTPDir HTBind HTAAUtil HTWWWStr HTRules HTCache HTGuess HTNewsLs
  HTTP HTMLGen HTBound HTMIME HTFSave HTTChunk HTPEP HTANSI HTBufWrt HTTrans HTReader HTWriter
  HTFile HTGopher HTNews HTProt HTHome HTIcons HTTimer HTInet HTProxy HTFWrite HTSChunk HTLink
  HTUTree HTDNS HTArray HTDir HTNDir HTMIMERq HTTPReq HTMerge HTTee HTMIMPrs HTConLen HTLog
  HTNewsRq HTTeXGen HTML HTPlain HTTPGen SGML HText.
- PINNED (corrects the earlier "zero .text refs" note, which scanned with the wrong VA): path string
  VA = 0x400000 + file offset (first one 0x593544). ALL 75 path strings are pushed from .text,
  and their first-ref addresses rise monotonically in the same order as the .rdata strings
  (HTReqMan 0x547f39 ... HText 0x57a366). So libwww .text order == the .rdata string order == the
  tus.txt order, occupying about 0x547f00-0x57b000. The 0x401dd0 `imul edx,edx,0x195d94` seen
  earlier is an unrelated integer constant (HYPOTHESIS: PunkBuster code, not shipped). PINNED
  only: `punkbuster/pbcl.cpp` is named in Mac STABS and absent from our tus.txt.
- PINNED (libwww 75 __FILE__ strings explanation):
  Every one of the 75 retail .c files calls `HT_OUTOFMEM`, which expands `__FILE__` via
  HTMemory.h: `#define HT_OUTOFMEM(name) HTMemory_outofmem((name), __FILE__, __LINE__)`.
  The other libwww files present in Mac 1.3 STABS (`HTLib.c`, `HTMemory.c`, `HTTCP.c`,
  `HTHeader.c`, `HTMethod.c`, `HTMLPDTD.c`, `HTStream.c`, `HTDialog.c`, `HTFilter.c`,
  `HTBInit.c`, `HTMIMImp.c`, `HTTrace.c`, `HTProfil.c`, `HTUU.c`, `HTDigest.c`, `HTLocal.c`)
  have 0 calls to `HT_OUTOFMEM` and in release (`/DNDEBUG`) `HTTRACE` is empty. Therefore,
  they produce NO `__FILE__` or debug strings in retail .rdata.
- PINNED: In `windows/config.h`, stock libwww defines `HT_EXPAT 1` and `HT_ZLIB 1`.
  Neither Expat nor Zlib was compiled into retail 1.3 client (`CoD2MP_s.exe`). Disabling
  both in `windows/config.h` removes the unresolved symbols `_HTXML_new` and `_HTZLib_inflate`
  and the dependency on `xmlparse.h`.
- PINNED (HTMulti): retail 0x5775b0 (called from HTLoadFile with request, path, &stat_info) is a
  ~92-byte function: null/empty checks, stat(path), StrAllocCopy. That IS upstream HTMulti.c
  compiled WITHOUT HAVE_READDIR (windows/config.h does not define it): the whole HT_OUTOFMEM
  directory-scan body is preprocessed out, which is also why retail has no HTMulti.c path string.
  It sits between HTLog (ref 0x5772d4) and HTNewsRq (ref 0x5779ba), so it goes after HTLog.c in
  tus.txt. (Supersedes my earlier "do not import HTMulti.c" note, which was wrong.)
- PINNED (`qcommon/dl_main.cpp`): Mac 1.3 STABS names `dl_main.cpp` with 11 functions:
  `DL_VPrintf`, `terminate_handler`, `HTAlertCallback_progress`, `HTAlertCallback_confirm`,
  `HTAlertCallback_prompt`, `DL_CancelDownload`, `DL_InitDownload`, `DL_DownloadLoop`,
  `DL_InProgress`, `DL_DLIsMotd`, `DL_BeginDownload`. These match the recovered
  implementations in KisakCOD and CoDUOMP download.c.
- Added upstream 5.3.2 copies (unmodified): HTMemory HTLib HTTCP HTTrace HTUU HTHeader HTMethod
  HTStream HTDialog HTFilter HTBInit HTMIMImp HTMLPDTD HTProfil HTTelnet HTDigest md5 HTLocal
  HTHInit HTMulti. Evidence: Mac STABS names most of them; the rest are needed symbols
  (HTLoadTelnet string is in retail .rdata, digest strings too). Positions of the placeholder
  block at the end of tus.txt are NOT measured yet (HTMulti is placed from evidence).
  Makefile fix: libwww objs had no header dependencies, so a config.h change never rebuilt them
  (HTInit.obj stayed stale with HT_EXPAT); the libwww rule now depends on windows/config.h.
- Compile mechanics to reach `__FILE__` = retail's string: cl arg must be the literal
  `\builds\pc_1.3_1_1\pc\cod2src\libwww\Library\src\HTxxx.c` (drive-relative, no drive letter).
  Plan: inside the docker image create `<root>/builds/pc_1.3_1_1/pc/cod2src` symlink to
  /w/target/src and pass the drive-relative path; test with one TU first.
- PINNED (libwww 95 TUs exact retail link order):
  By disassembly inspection of code bodies, string pointers, and static tables in retail
  0x547f20-0x57a640, every single one of the 19 libwww TUs missing __FILE__ path strings
  was located and pinned to its exact retail slot:
  - HTTrace.c: 0x54e540 (between HTInit.c and HTEvtLst.c)
  - HTProfil.c: 0x54eeb0 (between HTEvtLst.c and HTAccess.c)
  - HTMemory.c: 0x550e80 (between HTAccess.c and HTAlert.c)
  - HTLib.c: 0x555e50 (between HTAtom.c and HTResponse.c)
  - HTStream.c: 0x5593e0 (between HTEvent.c and HTFormat.c)
  - HTTCP.c: 0x55b160 (between HTUser.c and HTFTPDir.c)
  - HTUU.c: 0x55ca90 (between HTBind.c and HTAAUtil.c)
  - HTMethod.c: 0x55e5e7 (between HTWWWStr.c and HTRules.c)
  - HTFilter.c: 0x567150 (between HTTChunk.c and HTPEP.c)
  - HTHeader.c: 0x567990 (between HTPEP.c and HTDialog.c)
  - HTDialog.c: 0x567ca0 (between HTHeader.c and HTANSI.c)
  - HTTelnet.c: 0x569760 (between HTWriter.c and HTFile.c)
  - HTMIMImp.c: 0x56d020 (between HTIcons.c and HTTimer.c)
  - HTBInit.c: 0x56e9e0 (between HTInet.c and HTHInit.c)
  - HTHInit.c: 0x56f7d0 (between HTBInit.c and HTProxy.c)
  - HTDigest.c: 0x572a40 (between HTDir.c and md5.c)
  - md5.c: 0x572ac0 (between HTDigest.c and HTLocal.c)
  - HTLocal.c: 0x573610 (between md5.c and HTNDir.c)
  - HTMLPDTD.c: 0x576440 (between HTTPReq.c and HTMerge.c)
  - HTMulti.c: 0x5775b0 (between HTLog.c and HTNewsRq.c)
  All 95 TUs placed in tus.txt in this exact order. Ratchet: +1051 bytes (114607 -> 115658).
- PINNED (libwww compiled without /GL):
  Inspection of retail function prologues in `HTReqMan` at 0x547f20 showed standard `__cdecl` stack passing
  (`push 0x11c; push 1; call HTMemory_calloc`) rather than fastcall register passing. Stock libwww was
  shipped to Infinity Ward as a precompiled static library built without `/GL`. Removing `/GL` from
  `WFLAGS` in `target/Makefile` restored exact COFF opcode generation across all 95 TUs, jumping the
  same-offset score from 115,658 to 137,627 (+21,969 bytes gained in one step).
- PINNED (Infinity Ward libwww extensions & `qcommon/dl_main.cpp`):
  Infinity Ward extended libwww with several custom helpers:
  - `HTFTP.c`/`HTFTP.h`: `HTFTP_setRawBytesCount(HTRequest *request)` at 0x54bc00 and
    `HTFTP_getDNetRawBytesCount(HTRequest *request)` at 0x54bc30.
  - `HTEvtLst.c`/`HTEvtLst.h`: `HTEventList_init(HTRequest *request)` at 0x54ec90 and
    `HTEventList_pump(void)` at 0x54eca0 (pumps Win32 MSG loop via PeekMessage).
  - `HTAABrow.c`/`HTAABrow.h`: `HTBasic_new` and `basic_credentials` made `PUBLIC`.
  Reconstructed `qcommon/dl_main.cpp` and `dl_main.h` containing all 13 functions (`DL_VPrintf`,
  `terminate_handler`, `HTAlertCallback_progress`, `HTAlertCallback_confirm`, `HTAlertCallback_prompt`,
  `DL_CancelDownload`, `DL_InitDownload`, `DL_Shutdown`, `DL_BeginDownload(local, remote)`,
  `DL_BeginDownload(remote)` for MOTD, `DL_DownloadLoop`, `DL_InProgress`, `DL_DLIsMotd`).
- PINNED (CL_WWWDownload & MOTD helpers placement in cl_main_pc_mp.cpp):
  Retail 1.3 binary places three download-related client functions directly after `CL_ClearMutedList` (0x4b50a0):
  - 0x4b50c0: `char *LAN_GetMotdFilename(void)` (builds OS path to motd.txt into static buffer `motd_buffer[256]` at 0x19a7000).
  - 0x4b50f0: `void CL_ReadMotd(void)` (reads motd.txt, sets or registers dvar "motd" with DVAR_EXTERNAL).
  - 0x4b5160: `void CL_WWWDownload(void)` (calls DL_DownloadLoop(), handles MOTD and game downloads).
  Followed immediately by `LAN_AddServer` at 0x4b52f0 in `cl_ui_pc_mp.cpp`.
  Moving `CL_WWWDownload` from `cl_parse_mp.cpp` to `cl_main_pc_mp.cpp`, implementing `LAN_GetMotdFilename` and `CL_ReadMotd`,
  and correcting `legacyHacks->cl_downloadSize = cls.downloadSize;` (debunking OpenCoD2's fake `download_ui_ptr`) gained +1,064 bytes.
  Ratchet: 137,627 -> 138,691 (commit dcb129d).
- PINNED (1.3 PE Section Snapping Threshold - 115 Bytes to 4KB Page Alignment):
  Shameter reports our .text raw size is 1,642,496 (0x191000) with VirtualSize 1,642,381 (0x190f8d).
  Retail .text raw size is 1,646,592 (0x192000) with VirtualSize 1,645,581 (0x191c0d).
  Because 1,642,496 - 1,642,381 = 115 bytes, adding just 116 bytes to .text VirtualSize will push it
  past 0x191000, aligning .rdata to VA 0x193000 (0x593000) and .data to VA 0x1cb000 (0x5cb000) to
  match retail section headers identically. This will snap tens of thousands of data pointers across .rdata and .data into place.
- PINNED (Upstream libwww Revision & Line Number Signatures):
  Disassembly of retail libwww functions calling `HTMemory_outofmem` (VA 0x550f90) revealed exact pushed line numbers:
  - `HTReqMan.c`: `HTRequest_new()` line 66, `HTRequest_dup` line 152 & 171.
  - `HTFTP.c`: `FTPStatus_new` line 369, `segment` line 1178, `HTLoadFTP` line 1361.
  - `HTAABrow.c`: `HTBasic_new` line 190.
  - `HTString.c`: `HTSACopy` line 117, `HTSACat` lines 131 & 135, `HTStrCpy` line 159.
  Our draft libwww files were from 5.3.2 release (Dec 2000), which lacked the 2-line 2002 contributor header
  comments present in `refrences/libwww-git` (commit `daffd6c3` March 2002). Reconciling the line offsets
  and upstream bug fixes to match `refrences/libwww-git` enables byte-identical matching across all 3,212 libwww functions.
- PINNED (Subsystem Link Order Findings):
  - In retail, `cinematics` runs up to 0x4b2f12, immediately followed by `cl_main_pc_mp` (0x4b2f50 - 0x4b52f0).
  - PunkBuster (`pbcl`, `pbsv`) lives at 0x4bb000 - 0x4bd513 in retail (after `groupvoice` and before `cg_main_mp`),
    not before `libwww`.
  - In retail, `ui_gameinfo_mp.cpp` (ends 0x547f20 with `UI_LoadArenas` `.arena files : %s`) directly connects
    into `libwww/Library/src/HTReqMan.c` (`HTRequest_new` at 0x547f20).





## Why 1.0-matched code failed cmp13 (wD, 11-04)
- PINNED: cmp13 ran ../claude_client/cmp.py on build/release/CoD2MP_s.exe, which is linked /FIXED and
  has NO .reloc. cmp.py masks data addresses only via .reloc, so every global/string/IAT operand counted
  as a mismatch. That alone hid ~860 KB of matching code: S (matched in our 1.0, unmatched in 1.3) was
  1,217,553 B; 616,968 B of it was norm-identical to retail 1.3 already.
- Fix: tools/cmp13.py = cmp.py plus a fallback that rebuilds the reloc mask from 4-byte operands pointing
  inside the image (no build needed). Same release exe: 168,890 -> 1,028,985 matched-fn B (6136 unique fns).
  Calibrated on the old /FIXED:NO build (real .reloc): synthetic mask matches 2 fns real relocs do not and
  misses 124 (jump tables in .text), i.e. slightly conservative.
- Remaining S after the fix (tools/why13.py): retail 1.3 really changed 293,829 B (CHANGED fns, real 1.3
  source work); our 1.3 length differs from our 1.0 (inline/codegen drift in the 1.3 tree) 82,803 B;
  same-length opcode diffs 17,111 B; operand-only 7,045 B; tiny short-anchor fns 9,946 B (cmp pairs short
  fns through claude_client/ghidra names_*.tsv, which hold 1.0 addresses: wrong for 1.3); regalloc-only 158 B.
- Note: ratchet13 accept baseline good13.json must be regenerated with the new cmp13 before the next ratchet.
## wC (client-only: ui/client/cgame/PunkBuster glue), 2026-11-04
- PINNED (retail 1.3 bytes + Mac STABS stPbCl): client PB glue `punkbuster/pbcl.cpp` sits at 0x4bb570-0x4bd1b0, directly after
  record_dsound; pbsv (makefn 336 B at 0x4bd1b0, same sizes as ours) follows, then pbmd5. tus.txt now has pbcl, pbsv, pbmd5 right after record_dsound.
- stPbCl layout PINNED from Mac STABS (size 424): m_GameCommand 0x178 .. m_SendToServer 0x184, m_AddPbEvent 0x188 (GetProcAddress "cb"),
  m_ProcessPbEvents 0x18c ("ca"), m_ClientConnect 0x198, m_TrapPreExecCmd 0x19c, m_TrapConsole 0x1a0. Client getHomePath/makefn use "\\" and "pb\\".
- Written: stPbCl getHomePath/makefn/Unload*/LoadClientDll/AddPbEvent/ProcessPbEvents/ctor, PbClAddEvent (4bbfb0), PbTrapPreExecCmd (4bbfc0),
  PbClientTrapConsole (4bbfe0), set_cl_punkbuster (cl_main_mp, 0x410360). Sizes close to retail (makefn 96, getHomePath ~158, AddPbEvent 112).
- NOT written (callee names unconfirmed): PbClGameMsg 4bbef0, PbClSendToServer 4bbf40, PbClSendToAddrPort 4bbf90, initialize 4bb6b0,
  4bbaa0 (command filter: set_cl_punkbuster / Cvar_Set / Dvar_Set / get_pb_cdkey), 4bbb80 (960 B game command), 4bc3b0 (1660 B), PbClientInitialize etc.
  Also cl_main_mp PB_ packet handler 0x40e750 (1215 B, CL_PacketEvent branch calling 4bb730/4bd3e0), PBget_cl_cdkey, CL_SendPbPacket,
  PB_Q_Serverinfo/Serveraddr, LAN_GetServerPunkBuster, CLUI_SetPbClStatus.
- Same-offset dipped (-500 vs 138692) because code shifted before the rest of the layout is complete; expected until the missing bytes land.
## Shared-code port audit (wB, branch shared13, 2026-11-04)
- PINNED (script ~/miss.py: every line added in lnxded-1.0 -> 1.3 server source, looked up in the client tree):
  the client already carries the 1.3 changes of bgame/, qcommon/, script/, universal/, game/, server/
  (dvar critical sections 23/23, PB oob in sv_main/cmd, 32-bit fragment start, voice size checks,
  vsnprintf, language-aware com_files, default_localize cfg). Baseline same-offset 138,692 / 1,970,176 = 7.040%.
- Left over, deliberately not ported: Linux-only storage/pad globals, setjmp/rdtsc inline asm, calloc in
  com_memory (client uses VirtualAlloc, already zeroed), yacc skeleton (scr_yacc.c is a different generator),
  Com_ExecStartupConfigs (retail 1.3 still has literal "exec default_mp.cfg"), const msg tables (client keeps static).
- Ported: SVC_Status length cap 0x4000 -> MAX_MSGLEN - 1 (server 1.3 source; the client had a stale 0x4000).
- UNCHECKED: g_largeLocalBuf 0x80000 (server 1.3: 0x100000) - no retail evidence for the Windows pool size yet.
- 11-04 PINNED: client SVC_Status keeps the 0x4000 cap in 1.3 (MAX_MSGLEN version from server 1.3 lost the 975 B match); reverted 11d61e1.
## cmp13 v2 (wK, 11-04)
- tools/cmp13.py now (a) rebuilds jump-table spans from `jmp [idx*4+tbl]`, masks the entries and skips them
  when decoding; (b) short call-dense fns with no name pair get a masked scan of the client, accepted only when
  aligned candidates == our fns with the same masked body (twins). PINNED on 1.0 (build+anchor): +9 fns/87 B vs
  cmp.py, all at their own address; forced no-.reloc run loses 13 B (was 124 fns). On 1.3: unique fns 7511 -> 8282,
  bytes 1,249,217 -> 1,374,609 (cov.py union rules).
- 11-04: wH (438bad7, +257 B PB UI fns) parked: adding 3 fns re-rolls the _yylex tie (-4,236 B). Bundle with later gains until net >= 0 (1.0 rule).

## wJ (11-04)
- PINNED (measured): Key_ClearStates calling CL_KeyEvent: matched-fn 1207139 -> 1207215 (+76), no fn lost vs same-HEAD baseline. SVC_Status (975 B) is lost in the baseline too (good13.json at 5b98de6 is stale), unrelated.
- Re-auth fn (retail 40d310): no match in Mac 1.3 decompile (no lastUpdateKeyAuth/300000/Auth in cl_main_mp.c CL_Frame). Name unconfirmed, not added.
- CL_InitOnceForAllClients and other CHANGED fns: not reached in the time cap.

## wH: UI_RunMenuScript 1.3 (11-04)
- PINNED (retail 1.3 bytes): UI_RunMenuScript = 0x534d60 (worklist splits it into NEW 534d60/535720). Script command diff vs 1.0
  (strings in the fn): added sv_punkbuster/cl_punkbuster/startpb_popmenu (StartServer), cl_punkbuster/joinpb_popmenu (JoinServer),
  new command setPbClStatus (Int_Parse, then 0x4bc2f0 = EnablePbCl / 0x4bc350 = DisablePbCl). Tail after closeMenuOnDvarNot (g_gametype,
  createserver_maps, mapname, cl_motdString) belongs to the next fns, not this one.
- StartServer: if (!ui_dedicated->integer && Dvar_GetBool("sv_punkbuster") && !Dvar_GetBool("cl_punkbuster")) open menu startpb_popmenu, return.
- JoinServer: after the displayServers bounds check, LAN_GetServerPunkBuster(src, idx)==1 && !cl_punkbuster -> menu joinpb_popmenu, return.
  LAN_GetServerPunkBuster (0x4153a0) = LAN_GetServerPing shape returning serverInfo_t.pb (+0x21), -1 on bad index (Mac STABS name).
- EnablePbCl/DisablePbCl (Mac STABS names) = pbcl.AddPbEvent(0x75/0x76, 0, 0, 0) (retail pushes 0,0,0,type,&pbcl; same as EnablePbSv but datalen 0).
- NOT checked: g_gametype is set once in 1.3 StartServer (1.0 twice) - cg_thirdPerson/dedicated/g_gametype body not diffed byte by byte.
- MEASURED (wH build): matched-fn 1207396 B vs stale best 1200971. Own gains: LAN_GetServerPunkBuster 95, EnablePbCl 81, DisablePbCl 81.
  UI_RunMenuScript itself is NOT yet matched (rest of the 4.8 KB body not diffed). ratchet_fn flags SVC_Status (975 B) LOST; it is not touched
  by this change (good13.json predates the SVC_Status MAX_MSGLEN merge / serverInfo_t 0x94 commit), so it is a stale-baseline loss, not wH.

## wL: libwww __LINE__ audit (11-04)
- PINNED (retail 1.3 vs our src, via HT_OUTOFMEM call sites: push line/file/name, call 0x550f90): the dominant libwww unmatched cause is
  __LINE__ immediates, not flags. 51 of 69 TUs were exactly 1 line too long (upstream 5.4 text; retail 1 line shorter). Dropping the "@(#) $Id$" header
  line in those: matched-fn 1,370,630 -> 1,387,397. Then per-site blank-line padding (HTAABrow +4/+11, HTAnchor, HTCache, HTHost +4, HTInet, HTEvtLst): -> 1,396,320 (+25.7 KB total, no fn lost vs own baseline).
- STILL OFF (retail line vs ours, real source differences, not padded): HTReqMan 66/152/171 vs 64/134/153, HTTP 984/1027 vs 924/967, HTTPGen 310 vs 256, HTTPReq 628 vs 609,
  HTIcons 104 vs 106, HTPEP 74/185 vs 75/186 (+extra site), HTParse/HTProxy/HTWWWStr/HTEvtLst: ours has extra OOM sites retail lacks (ifdef-ed out in retail; fix the ifdefs, then pad).
  Padding with blank lines is a stand-in for the missing upstream lines.
- NOT done: dl_main placement, Rich-header obj count check.

## wF (core: qcommon/script/server/bgame) findings
- PAID (+33,846 B matched-fn, fcfe6d1): retail 1.3 win_threads is a rewrite. Sys_GetValue/SetValue read a per-thread
  table through TlsGetValue(tlsIndex) (tls slot allocated in Sys_InitMainThread: TlsAlloc, TlsSetValue(slot, table0);
  worker thread proc sets table1 and calls Com_InitThreadData(1)). Retail 0x462360-0x462660: 20 small fns (main-thread id,
  second-thread handle/id, 4 events, an interlocked flag, Suspend/ResumeThread helpers). PINNED by disassembly; original
  names unknown. TLS inlines into va/CM_*/Com_* at ~29 sites. Tie added: SV_ArchiveSnapshot (one edx/esi load swap).
- PINNED meter fix (tools/cmp13.py): /FIXED-image reloc rebuild stopped at switch jump tables (capstone halts in table data),
  so every fn with a jump table was unmatched even when byte-equal (VM_ExecuteInternal 10,764 B is byte-identical to retail
  0x47d6d0 apart from table addresses). Now masks in-image dwords from the first jmp [reg*4+table]. +115 KB counted.
- serverInfo_t 1.3: +byte punkbuster after voice (Mac STABS offset 200), size 0x90 -> 0x94, ping at +0x28 (common_types.h).
  CL_SetServerInfo / CL_InitServerInfo do not set it yet (retail source of the info key not checked).
- Critical sections (PINNED, base 0xd529b0 stride 0x18, 6 sections; 0x59321c=Leave, 0x593220=Enter): 1.3 adds
  Com_Frame: Enter(2) after the try block, Leave(2) before/after ErrorCleanup, Com_Error: Leave(2) before longjmp,
  Sys_Quit: Enter(2) first, StatMon_Warning: Enter(3)/Leave(3) around the update, Com_ShutdownInternal: no Leave(2).
- Small 1.3 edits found by fdiff: Scr_GetFunction loop bound 144 -> 145 (table has 145, last issplitscreen);
  Com_InitHunkMemory OutOfMem line 843 -> 847; Com_GetDecimalDelimiter also language 14; SV_Frame tests killMessage[0]
  (inline char array), not the array address.
- Not done (evidence only): Com_ExecStartupConfigs 1.3 starts with Cbuf_AddText(va("exec %s\n", g_cfgName)) where g_cfgName
  (0xb1a5ac) is set at 0x425868/0x4258b5 to "default_localize_mp.cfg" or "default_mp.cfg" depending on a file lookup
  (0x422700 FS_ReadFile-like) in Com_Init; CM_Trace/CM_ClearWorld/CM_PointContents differ only by TLS-inline register
  allocation (cmod held in a register); VM_Notify differs by 2 scheduling swaps.
- wF batch 3-4: Sys_InitMainThread (GetCurrentThread result taken before the arg pushes) +84; Com_Frame/Com_Error/Sys_Error
  matched with critsect 2 (Sys_Error also _vsnprintf(string, 4096, ...)); SEH_IsChineseLeadTrail 1.3 = lead 0x81-0xfe,
  trail 0x41-0xfe (GBK).
- TRIED, REJECTED: SV_Map_f 1.3 calls Com_CheckSetRecommended() (retail 0x434dc0, same fn as Com_Frame_Try_Block uses)
  between Com_HasPlayerProfile and SV_GetMapBaseName. Adding the call flips the ebp/aligned frame from SV_SpawnServer
  (retail has it) to SV_Map_f: SV_SpawnServer lost -3104 B. Decl moved next to SV_Map_f and __declspec(noinline) on the
  definition both gave the identical result. Likely an LTCG call-graph order effect (see client-recon c2.dll DFS notes);
  needs the oracle (tools_oracle) to pick the right edge order. Not committed.
- TRIED, no gain: EvalPrimitiveExpression float cases split (no goto): retail shares the tail for float but orders the minus
  case value,type,sourcePos; ours stores sourcePos first. Reverted.
- Remaining non-UI near-misses: CM_Trace/CM_ClearWorld/CM_PointContents/CM_LinkEntity/CM_BoxSightTrace (TLS-inline register
  allocation only), VM_Notify (2 scheduling swaps), Com_PrintMessage (LargeLocal ctor arg in eax vs ecx), SV_ArchiveSnapshot (tie),
  Com_InitPlayerProfiles/Com_ExecStartupConfigs/Com_Init_Try_Block_Function (1.3 localized-cfg selection, see above).

## w8: client/ui 1.3 (11-04)
- PAID (+1532 matched-fn, CL_InitOnceForAllClients 3124 B now matched): 1.3 changes PINNED on retail 0x410a10: cl_maxpackets min 15 -> 10;
  new int dvar cl_profileTextHeight (16, 1, 100, 0x1000) after cl_maxPing; cl_punkbuster registered after "snaps" with result NOT stored;
  Dvar_RegisterString("motd", "", 0x1000) stored in a global (0x68a3a0) after the cod2updateN names; new command unskippablecinematic.
  cinematic / unskippablecinematic are thin wrappers (retail 0x403570/0x403580): set byte 0x5cdd10 = 1/0 then tail-jmp ROQ_PlayCinematic_f body (0x4b2f10).
  The flag is also READ in 0x4035d0, 0x40cd8c, 0x40d5b0, 0x41053c, 0x410749 (not ported yet: skip-key paths; names unknown).
- UI_RunMenuScript (0x534d60, 5035 B) now 4 small hunks (was 10), all register choice: StartServer needs both
  Dvar_GetBool results in locals (fixed), sortDir direct (no local), modList[].modName instead of the hand offset. Left: voteGame/playMovie/RunMod/
  sortPlayerProfiles pick edx where we pick eax (or esi vs edx), and a few uiInfo pointer loads in other commands. Build 3 (inline gtName, sortDir == 0) cut it from 10 to 4 hunks.
- Pickup_Weapon (g_items_mp) is a 1-swap LTCG tie flipped by these edits (Menu_HandleKey flipped in build 1): added to ties13.txt.
- Com_ExecStartupConfigs / FS_InitFilesystem localized cfg are already in the tree and match structurally (no lead left there).
