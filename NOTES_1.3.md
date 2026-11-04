# 1.3 notes (agents append here)

## Areas in progress
- opencode (linker/layout): libwww TU set + link order work. Started 2026-11-03.

- w7: libwww remainders (HTEvtLst, HTHost, HTAABrow digest, HTTP, HTDir...). Started 2026-11-04, worktree lab13/w7. Done 11-04 (see "w7 libwww" below).

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

## w7 libwww (11-04): retail libwww == libwww-git text minus the Id line (+ IW edits)
- PINNED (tools/oom7.py = retail HT_OUTOFMEM call-site lines, tools/oomcmp7.py compares with a source dir): for ~65 of 75
  files the retail __LINE__s equal the refrences/libwww-git file with the "@(#) $" line (line 6) removed. So retail is a
  libwww-git snapshot AFTER 2001-03 (HTTimer, HTAnchor_delete, HTCache JK moves, HTNet, HTAABrow nonce_is_stale) and 2003-04 (HTHost).
  Files now taken verbatim from git (Id dropped): HTMethod (hasEntity/setExtensionMethod/deleteExtensionMethod are real fns, no HT_DAV/HT_EXT),
  HTAABrow (typedef HTBasic removed = lives in .h, + PUBLIC HTBasic_new/basic_credentials), HTTimer, HTCache, HTAnchor, HTDir, HTNDir, HTHost.
- PINNED: retail does NOT have the later "else X_delete(...) /* Ensure not listed twice */" lines (HTNet, HTAlert, HTInit, HTProt, HTHeader, HTTrans):
  git minus Id is 1-2 lines too long there. HTTPReq (HTACEfromUTF8 block) and HTBound/HTDNS/HTMIME/HTFTP also differ from git: keep ours.
- PAID: +4802 (git text) +3553 (stale objs: libwww objs did not depend on libwww headers, so the HTMethod.h change only reached 6 TUs after touch;
  Makefile now depends on Library/src/*.h).
- STILL OFF: HTEvtLst pump/init/loop. Retail pump uses GetMessage(&msg,0,0,0) (4 args, not PeekMessage), on exit calls HTTrace(fmt, HTEndLoop)
  unconditionally (0x54e5f0 is HTTrace itself) and stores HTEndLoop into a 2nd static (0x5ddfa8) that init + two other fns zero and a getter (0x54ec80)
  returns. The 2nd static has no evidence for a name: DEFER. HTDirNode_print: only the order of the two reg reloads before the shared join
  differs (ebp=dir then edi=node in retail); source equals git. HTCache_isFresh: init order of max_age/max_stale/min_fresh slots (see tried below).
- TRIED (no change, +0): HTCache_isFresh declaring min_fresh,max_stale,max_age (reverse order). Slot order differs: retail inits [esp+34],[esp+18],[esp+14] vs ours 14,18,34.
- w7 follow-up 11-04: HTDirNode_print MATCHED by declaring HTStructured *target before char *tp (+1291). HTCache_isFresh: moving cc decl into if(cache) gave +16 (other fn) but not isFresh;
  chained/one-line init of max_age/max_stale/min_fresh = REJECT -16. isFresh parked (2 builds used). HTEvtLst: no name for the 0x5ddfa8 static in libwww-git history, coduomp or KisakCOD (only the prototypes): DEFER. HTProfile/HTBlackHole* not attempted.
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

## w7 libwww status (11-04, after d7857bd)
- Unmatched libwww fns (tools/lw7.py good13.json): 61 fns, 1016 B of 193,726 B libwww. Real code: HTCache_isFresh 402, HTEvtLst stopLoop/init/pump/loop/newLoop 215,
  HTProfile_newPreemptiveClient 29, HTBlackHole/HTErrorStream/HTBlackHoleConverter 48, HTNetInit 10, HTHost enable/disable_PendingReqLaunch 22, HTNet_increase*Socket 14.
  The other ~45 are 6-7 B getters (mov eax,[static]; ret): cmp13 only credits short call-free shapes when retail twin count == ours, so these are measurement
  artifacts of identical shapes, not source differences (HYPOTHESIS; same bytes as ours, e.g. HTNet_before = a1 <bss> c3).
- Files where ours differs from git (HTNet, HTAlert, HTInit, HTProt, HTHeader, HTTrans, HTTPReq, HTBound, HTDNS, HTMIME, HTFTP) have no unmatched fns left; nothing to gain.
- HTEvtLst static at 0x5ddfa8: no name in Mac decompile (no libwww there), libwww-git history, coduomp or KisakCOD. DEFER (no invented names).
- HTCache_isFresh: permuting max_age/max_stale/min_fresh declaration order has no effect on the object (3 permutations, +0). Slot order is not declaration-driven. PARKED.

## w7-core (11-04)
- PAID +2653 (6ce3885): SV_DirectConnect = lnxded-1.3 server text (memset of PBguid/clientPBguid, challenge/ping blocks, guid test) with ONE client-side change:
  "cl->state >= CS_CONNECTED" in the reconnect branch (server text has "> CS_ZOMBIE"; retail cmp eax,2/jl). tools/swapfn7.py + sw7.sh copy a fn from the server source.
- SV_ConnectionlessPacket (1179 B): our text equals the server text, but retail has an extra tail for "pb_" packets: when msg->data[7] is not one of S 2 G I Y B L (and a pbsv
  pointer test) it calls a 5-arg pointer (pbsv, 13, len-4, data+4, 0) = an AddPbEvent variant without clientIndex. Unknown fn/semantics: needs PB reversal, PARKED.
- VM_Notify with server text: no gain (still different; 1 build) and the build lost the 752 B tie, REJECT; our 1.0-tuned spelling kept.
- Com_PrintMessage (454): only diff is the usercall register of PbCaptureConsoleOutput msglen (retail eax, ours ecx) = LTCG callee choice. CG_FireWeapon: lea ebp,[ebx+0xf0] scheduled before push esi/edi.
- CG_EntityEvent (4328 B): regalloc/spill differences throughout (cl vs al for the bool at [esp+0x13], etc.), not attempted.
- w7-core sweep (tools/sweep7.py lists unmatched fns whose text differs from lnxded-1.3/src): batch of 5 server-text edits in one build (CM_BoxSightTrace 0.0, IntersectPlanes 1.0,
  CM_ClearWorld <= AREA_NODES-2, G_GetPlayerViewOrigin parens, Scr_ParseGameTypeList memset(buffer)) = no gain, -16 (REJECT, reverted). Other DIFFs are client/server variants
  (DEDICATED ifdefs, CL_* calls, FxRange_GetVal) or 1.0-tuned spellings; not copied. cg_main_mp sound/message fns and CG_PlayViewWeaponNotetrackSounds are blocked by the
  1.3 CL_ConsolePrint_AddLine/subtitle rewrite (retail adds a subtitle call after the sound call), no Mac names available.
- w8 11-04 (after merge 613a8a3): CL_ConsolePrint_AddLine retail 0x404690 first look, NOT started. Mac STABS gives only the 1.3 signature
  (type, duration, linewidth, color; text is NOT a parameter: retail gets it in eax), no body. Retail adds a path for types 1/2/3 gated on a pointer
  at 0x11972f8 that calls 0x532410 with a float (0x5c3e78 * 0x5c40a4) and a 0/4 flag; linewidth cap 0x4e kept. Needs a full disasm-driven rewrite (~2 KB),
  not attempted. Next agent: start from `python3 w8dis-style capstone dump 404690..404cd3`; our 1.0-shaped body (cl_console_mp.cpp:684) takes txt as arg 2.
- w8 11-04 CL_ConsolePrint_AddLine (retail 0x404690, 2132 B): rewritten, WIP on branch w8-consoleprint-wip (not merged). PINNED from retail:
  0x11972f8 = g_currentAsian (Language_IsAsian), 0x11972ec = loc_language dvar, 0x68a314/0x68a310 = re.TextWidth / re.NormalizedTextScale,
  0x166bb88 = cg_subtitleCharHeight. New path only when Language_IsAsian() && type in {SUBTITLE, GAME, BOLDGAME}: font = UI_GetFontHandle(type==BOLDGAME?4:0,
  (type==SUBTITLE ? charHeight : 12.0f) * (1/48)), pixel-width word wrap (limit linewidth*6.5 vs width*normScale), SEH_ReadCharFromString inlined 3x,
  two-byte chars stored as hi byte then lo byte. Non-Asian path = old 1.0 body, with the targetLineWidth/PrintStrlen block moved INTO the else branch.
  Result: 6 diff hunks, all register choice (retail keeps charWidth in ebp and a zero in edi; ours spills charWidth and uses ebp as zero). Cause of the
  build rejection: not the fn itself (still unmatched) but SV_ArchiveSnapshot (2783, tie) + _$E2 (752) flipped; CL_SubtitlePrint +217. 4 builds, switch vs if
  and shared charWidth variable made no difference. Next: vary where the NULL isTrailingPunctuation temp and curWidth=0 live (retail uses literal 0 for the
  default-case linefeeds, register zero for \n and \r).
- w8 sweep 1 (+4153 matched-fn): UI_RegisterDvars (ui_browserShowPunkBuster registered after ui_browserKillcam), CL_Vid_Restart_f (loc_language max 13 -> 14),
  UI_StartServerRefresh (protocol 115 -> 118 in "globalservers"; also CL_ServerInfoPacket expectedProt and CL_CheckForResend protocol), CL_PlayLogo_f via
  SCR_StopCinematic now gated on the skippable flag (retail 0x4035d0). PINNED. Not done: CL_DownloadsComplete / CL_Disconnect / CL_InitDownloads share a new
  inlined "clear download state + DL_Shutdown (0x4b59c0)" block; needs the 1.3 clientConnection_t download layout (966dac int, 966db0 char[256], 966eb0 char[256],
  966fb0 char[64]?, 966ff0/966ff4/966ff8 ints), no Mac evidence (Mac has no libwww path).
- w8 sweep 2 (+1868): LAN_GetServerInfo adds Info key "pb" (serverInfo_t.pb), CL_ServerInfoPacket zeroes new localServers[].pb. PINNED.
- TRIED, REJECTED (w8): making LargeLocal ctor/dtor/GetBuf __forceinline in com_memory.h (retail 1.3 expands them in e.g. CL_WriteVoicePacket,
  CL_ConfigstringModified, CL_WritePacket). It lost 19 fns / 12.7 KB (server fns and CL_ParseSnapshot etc. keep the call in retail). Per-caller inline
  choice, not a header change. CL_WriteVoicePacket/CL_WritePacket/CL_ConfigstringModified/CL_KeyEvent differ mainly by this.
- SCR_DrawScreenField: 1.3 adds `if (<int at 0x966ff8, clc download field>) { 0x532540(); UI_DrawConnectScreen(); }` in the connecting branch; blocked on the
  1.3 clientConnection_t download layout (same blocker as CL_DownloadsComplete/Disconnect/InitDownloads).
- w8 download layout (PINNED, retail offsets): 1.3 moved ALL client download state out of clientConnection_t into clientStatic_t (the existing 1.3 cls fields
  were right: 966dac wwwDlDisconnected, 966db0 downloadName, 966eb0 downloadTempName, 966fb0 originalDownloadName, 966ff0 downloadRestart, 966ff4 downloadFlags,
  966ff8 wwwDlInProgress, 966ffc download, 967000 downloadBlock, 967004 downloadSize, 967008 downloadList). clc loses download..downloadRestart (1,560 B):
  sizeof(clc) = 0x801fc = retail CL_Disconnect memset (0x2007f dwords); netchan at 0x401b8. The macro CL_ClearDownloadState (7 stores + DL_Shutdown()) is expanded
  in CL_Disconnect, CL_DownloadsComplete, CL_InitDownloads; DL_Shutdown must be noinline and is the real shutdown (HTEventList_unregisterAll, HTDNS_setTimeout(-1),
  HTRequest_kill/delete on dl_request; retail 0x4b59c0). CL_ParseDownload (UDP) uses cls.* and legacyHacks->cl_downloadCount += size.
  SCR_DrawScreenField main-thread disconnected case: if (cls.wwwDlInProgress) { UI_Refresh(); UI_DrawConnectScreen(); } else UI_SetActiveMenu(1).
  PINNED: the 128 KB (MAX_MSGLEN) msg buffers in CL_WritePacket, CL_WriteVoicePacket, CL_Record_f, CL_ReadDemoMessage are LargeLocal in retail (stack arrays gave
  __chkstk + 4 KB of frame): +3,200 B. Open: CL_ParseDownload takes msg in esi in retail (ours eax).
- Tie flips (SV_DirectConnect 2733, CG_DrawPlayerStance 1607: argument-load swap, Com_ShutdownDObj 20) added to ties13.txt; _yylex flips too with other spellings of the
  same change (static forceinline helper instead of the macro).
- w8 (cont, +4415): CL_KeyEvent +1476 (ESC in the default state: if (DL_InProgress()) { cls.wwwDlDisconnected = 0; CL_ClearDownloadState(); } before UI_SetActiveMenu(1);
  CL_ClearDownloadState is a real noinline fn at retail 0x40cc70 (between CL_ResetSkeletonCache and CL_ClearState) AND expanded inline in Disconnect/DownloadsComplete/
  InitDownloads: `static __forceinline ...Inl` + noinline wrapper). CORRECTION: retail 0x4b59c0 is DL_CancelDownload (not DL_Shutdown; DL_Shutdown = 0x4b5ab0 stub),
  so the reset calls DL_CancelDownload (noinline). CL_GetServerCommand +1089: 'w' (server disconnect) with argc>=3 and Cmd_Argv(2) == "PB" (via _stricmp, CRT call) uses the
  untranslated Cmd_Argv(1) as the reason and wraps it as va("\x15%s", ...). CL_ConfigstringModified +445: oldGs is a LargeLocal and the limit is MAX_GAMESTATE_CHARS.
  Tie flips: with this set SV_ArchiveSnapshot(2783)/_$E2(192) lost, SV_DirectConnect/CG_DrawPlayerStance/Com_ShutdownDObj back.
- SUPPORTED (lead, 11-04): `make release` runs each build in its own `docker run --rm` container (target/Makefile:33),
  so `wineserver -k` (Makefile:132) only kills that container's wineserver. Agents do NOT need to serialize builds;
  the limit is CPU (each build is make -j$(nproc)). Not yet confirmed by two concurrent builds.

## w7-hard (11-04)
- PAID +1346 (8699482): SV_ConnectionlessPacket. The pb_ block does not return after PbSvAddEvent: retail then runs the client PunkBuster feed
  PbClAddEvent(13, cursize-4, data+4) when data[7] is not one of S 2 G I Y B L and com_dedicated is null/0 (pbcl struct 0x5dd6c8, AddPbEvent inlined: enable flag 0x5dd840).
  Kept the file line count unchanged (asserts later in sv_main_mp.cpp carry __LINE__).
- Com_Init_Try_Block_Function (retail 0x434460, 1351 B): differs by a new multi-core block: retail fn 0x434420 inlined = GetProcessAffinityMask(GetCurrentProcess(),&proc,&sys);
  (proc & (proc-1)) != 0 (more than one CPU), then a string/Com_Printf-like call with 0x1010 flags (LocalAlloc-like 0x1010 arg) and a following dvar. Stack frame 0x20 vs 0x18.
  Not written (out of time); starting point: tools/rdis7.py 434420 / 4345a0.

## w7-pb (11-04)
- PAID +3 commits (45bace4 +3645 incl. a tie flip, 41f5068 +1449): (1) compat/msvc71.h defines chmod(p,m) as 0, so every pb chmod was compiled out; retail calls CRT _chmod(path, 0x180) (declared extern "C" in pbsv/pbcl, io.h clashes with compat).
  (2) pbsv.cpp had a private itoa; retail calls CRT _itoa(val, buf, 10) (PbSvGameQuery 182 B, own itoa 132 B gone). (3) stPbSv::getHomePath uses backslashes in 1.3 (cmp 0x5c, "\\", "pb\\").
  (4) stPbCl::LoadClientDll: no UnloadClientDll() call, the five fn-pointer zeroes inline and no m_ClInstance=0 (-> ebp as zero); stPbCl ctor: explicit stores after memset (AgInstance, ClInstance, uninitialize(), Md5, 7 fn pointers, reload=1).
- Tie flip seen: CG_DrawPlayerStance (reload order of ebp/esi) <-> Pickup_Weapon flips with unrelated edits (global ordering effect); first pb run showed it, the final one did not.
- Still unmatched in pb (4367 B incl. _ labels 3967): stPbCl::~stPbCl 69 (retail stores m_ClInstance=0 right after FreeLibrary, ours schedules it later), PbSvEvent71 83 (branch layout of inlined AddPbEvent with constant 0x71),
  PbCaptureConsoleOutput 94 (usercall eax vs ecx), PbSvGameMsg 76: retail calls the CLIENT PbMsgToScreen at 0x405080 (usercall edx=prefix, ecx=msg; real fn with 0x100c-byte frame, writes a console buffer at 0x19a1b78) - ours inlines the server Com_Printf stub;
  needs the 1.3 console rewrite (w8). PbServerProcessEvents/ForceProcess 13 B each = twin shapes.

## TOP40 11-04 (unmatched fns by bytes, main 071fc0d 90.89%; ties13 and _ excluded; 118 fns / 68,937 B >= 40 B; tools/top7.py, tools/class7.py; class = automatic guess, retail addr from the previous matched neighbour)
ui_main UI_RunMenuScript 5027 regalloc | cg_event CG_EntityEvent 4328 regalloc/sched | nb_celp nb_decode 3239 operand order only ([eax+ecx-4] vs [ecx+eax-4], 3 sites, comb_filter new_exc/exc ptr diff) |
sv_net_chan SV_Netchan_PrintProfileStats 2316 structural (server vs client draw version) | cl_main CL_ConnectionlessPacket 2267 structural | ui_shared Item_ListBox_Paint 2081 regalloc |
cg_consolecmds CG_InitConsoleCommands 2005 missing-call (100 vs 96 calls) | xanim XAnimCalc 1715 sched (586 B, 5 insn off) | cl_main CL_InitRef 1699 structural | ui_shared_obj UI_ParseAssetGlobalDef 1626 structural |
scr_vm VM_Notify 1584 structural | FxUtil FX_CalcOriginAndAxis 1463 regalloc (348/402 exact) | cm_trace CM_Trace 1427 regalloc | common Com_Init_Try_Block_Function 1351 regalloc (ebp=1 hoist, smp block written, see w7-hard) |
ui_main UI_BuildServerDisplayList 1292 missing-call | ui_shared Window_Paint 1268 regalloc | cm_trace CM_BoxSightTrace 1162 regalloc | cl_net_chan CL_Netchan_PrintProfileStats 1089 structural |
cg_predict CG_ClipMoveToEntities 1003 regalloc | ui_main UI_FeederItemText 996 missing-call | ui_main UI_Init 976 structural | cinematics ROQ_PlayCinematic 890 missing-call (16 vs 20) |
ui_main UI_DrawConnectScreen 879 | libcmt memmove/memcpy 829 each (CRT version differs: 1.3 links a different libcmt build) | cg_draw CG_DrawAdsOverlay 825 | ui_shared Item_Text_AutoWrapped_Paint 797 |
cg_scoreboard CG_DrawScoreboard_Objective 790 structural | dl_main DL_BeginDownload 769 structural | cg_newDraw CG_DrawCursorhint 749 | cl_parse CL_ParseDownload 712 structural |
g_client G_GetPlayerViewOrigin 700 sched (one push moved) | cl_main CL_CheckForResend 599 | cl_parse CL_ParseWWWDownload 568 | cg_weapons CG_FireWeapon 550 sched | cl_cgame CL_SetExpectedHunkUsage 527 missing-call |
cl_console CL_DeathMessagePrint 527 / CL_ConsolePrint_AddLine 526 | cl_parse CL_ParseServerMessage 496 | FxUtil FX_AddPrimitive 485 | cl_main CL_RequestAuthorization 468 | cl_keys CompleteCommand 466 | common Com_PrintMessage 454 (PbCaptureConsoleOutput eax/ecx) | win_main WinMain 449 structural.
- w7-top tried: Cmd_ExecuteString needs PbTrapPreExecCmd(text) first (retail inlines pbcl.m_TrapPreExecCmd call before Cmd_TokenizeString; written, builds, but the PB tail also differs: retail inlines PbSvAddEvent(14,-1,len+1,text) with a second strlen copy) -> not matched, reverted (and the ratchet showed the _yylex/SV_ArchiveSnapshot tie flip again).
- w8 (11-04 pm, +4953 incl. lucky tie roll): LAN_CompareServers +388 (1.3 adds sort key 9 = serverInfo_t.pb, ping moves to key 10; case order 0,1,9,8,6,7,2,3,4,5;
  key 3 compares UI_GetMapDisplayName(mapName) of both); CL_RefPrintf +166 (_vsnprintf(msg, 4096, ...)). The 5 cinematic-byte readers already match through the gated
  SCR_StopCinematic (CL_Disconnect_f 0x40d5b0, CL_StopLogoOrCinematic 0x410740 diff clean).
- fn_40d310 (retail 0x40d310, the 300 s re-auth): `if (clc.state == CA_ACTIVE && cls.realtime - lastUpdateKeyAuthTime > 300000 && (net_lanauthorize->enabled || !Sys_IsLANAddress(
  clc.serverAddress))) CL_RequestAuthorization();` PINNED (matches 104 B, and CL_Frame matches +141 when it calls it as its LAST statement), but adding the call flips
  PC_EvaluateTokens (2587) and GScr_CloseFile (173) in this tie pool, so the call is NOT committed (net would be -1.9K). The function itself is in cl_main_mp.cpp
  (static, currently unreferenced, so dropped by the compiler). Re-add `fn_40d310();` after CL_SendCmd() in CL_Frame when the pool can be re-rolled by another gain.
- w8: CompleteCommand 1.3 (+656, PbClientCompleteCommand 0x4bc100 +87) is on branch w8-complete-wip (not merged): if (cmd after optional '/' or '\\' starts with "pb_") { copy to a
  272-byte local (retail frame 0x228: 16 extra bytes), "pb_sv_" -> PbServerCompleteCommand(arg,255) else PbClientCompleteCommand(arg,255) = pbcl.AddPbEvent(0x33,len,buf,0);
  sprintf "\\%s" into the console field, cursor=strlen, Field_AdjustScroll; return }. It re-rolls the tie pool (Pickup_Weapon, SP_worldspawn, GScr_CloseFile lost, net -1.5K):
  merge when another +1.5K is bundled. Also open: CL_Netchan_PrintProfileStats (retail helper 0x4129f0 takes (n, &pos) and add esp 8), UI_DrawConnectScreen (+17 insns),
  CL_ParseDownload msg-in-esi (param copy conflicts with the LargeLocal eax load at entry; no lever found).

## INVENTORY 11-04 (s1-inventory; tools/inv13.py, run from claude_client13: `python3 tools/inv13.py target/build`)
Method: anchors = our fns with exactly one retail hit (cmp13.json), longest increasing run in link order. Between two anchors:
k = our unhit fns >= 16 B, m = retail fn starts >= 16 B nobody hit (starts = E8 targets + 16-aligned starts after cc/ret; starts that fall
inside a matched fn's body are dropped, they are false splits). Rows below only where k != m AND |bytes differ| > max(24, 3%).
A row is a CANDIDATE, not proof: a retail start can still be a false split inside an unmatched fn, and tie/mismatch fns cancel (k = m).
PINNED: the raw version (no false-split filter) listed 626 missing fns / 157 KB, almost all false splits inside matched fns (CL_KeyEvent
split at 40b8c0 etc.); with the filter: 40 missing fns / ~5.4 KB net (12 of the rows are libwww/CRT), 18 extra fns / ~1.2 KB net.
So our function SET is already close to retail; the large LAYOUT_1.3 gaps (record_dsound, libwww, CRT objs) are whole missing TUs, not extras.
Order: TUs/fns out of retail order are in LAYOUT_1.3.md (tools/layout13.py): only 1 fn moved inside a TU (scr_compiler EmitExpression), so no per-fn order work found.

| our addr | obj | retail range | ours k/B | retail m/B | verdict | ours fns | retail fns (addr:size) |
|---|---|---|---|---|---|---|---|
| 4046c0| cl_console_mp.obj| 4044a0-405290| 3/2678| 4/3043| MISSING 1| CL_ConsolePrint_AddLine CL_ConsolePrint CL_ConsoleFixPosition| 404690:2132 404ef0:396 405080:365 4051f0:150|
| 40cdf0| cl_main_mp.obj| 40cef0-40d380| 1/686| 5/1057| MISSING 4| CL_RequestAuthorization| 40cf40:117 40cfc0:367 40d130:128 40d1b0:341 40d310:104|
| 40de20| cl_main_mp.obj| 40df10-40e520| 1/599| 5/1026| MISSING 4| CL_CheckForResend| 40e100:128 40e180:684 40e430:93 40e490:63 40e4e0:58|
| 40e260| cl_main_mp.obj| 40e5d0-40f1c0| 1/2267| 2/2657| MISSING 1| CL_ConnectionlessPacket| 40e750:1215 40ec10:1442|
| 411f30| cl_main_mp.obj| 4125a0-4126f0| 0/0| 1/73| MISSING 1|| 412670:73|
| 433ca0| common.obj| 4343a0-434a40| 1/1351| 4/1543| MISSING 3| Com_Init_Try_Block_Function| 434420:54 434460:528 434670:111 4346e0:850|
| 49e9b0| FxUtil.obj| 49f340-49f40c| 0/0| 1/33| MISSING 1|| 49f400:33|
| 4b1990| cinematics.obj| 4b2290-4b2490| 1/283| 3/309| MISSING 2| RoQShutdown| 4b2350:55 4b2390:95 4b23f0:159|
| 4b46c0| cl_main_pc_mp.obj| 4b50c0-4b52f0| 2/538| 3/490| MISSING 1| CL_ReadMotd CL_WWWDownload| 4b50f0:104 4b5160:224 4b5240:162|
| 4baa00| record_dsound.obj| 4bb3c0-4bb560| 0/0| 1/263| MISSING 1|| 4bb450:263|
| 4babb0| pbcl.obj| 4bb690-4bb730| 1/52| 2/113| MISSING 1| UnloadClientDll@stPbCl| 4bb6b0:61 4bb6f0:52|
| 4bae00|| 4bb8d0-4bb9b0| 0/0| 1/97| MISSING 1|| 4bb940:97|
| 4baea0| pbcl.obj| 4bb9b0-4bbfb0| 1/69| 4/1308| MISSING 3| ?1stPbCl| 4bba50:69 4bbaa0:223 4bbb80:947 4bbf40:69|
| 4baf20| pbcl.obj| 4bbfc0-4bc100| 0/0| 2/206| MISSING 2|| 4bc000:179 4bc0e0:27|
| 4bafa0|| 4bc100-4bc2f0| 0/0| 3/371| MISSING 3|| 4bc160:99 4bc1d0:186 4bc290:86|
| 4be2e0| cg_main_mp.obj| 4bf5e0-4bf890| 3/580| 2/550| EXTRA 1| CG_CrosshairPlayer CG_GameMessage CG_BoldGameMessage| 4bf650:275 4bf770:275|
| 4c00a0| cg_main_mp.obj,cg_consolecmds_mp.obj| 4c1340-4c1410| 1/108| 0/0| EXTRA 1| CG_TargetCommand_f||
| 4c03a0| cg_consolecmds_mp.obj| 4c1630-4c1680| 1/119| 0/0| EXTRA 1| CG_TellTarget_f||
| 501660| g_cmds_mp.obj| 502b10-502b50| 2/525| 0/0| EXTRA 2| Cmd_Tell_f Cmd_GameCommand_f||
| 544410| ui_shared_obj.obj| 545680-545e80| 1/1626| 3/1844| MISSING 2| UI_ParseAssetGlobalDef| 545740:204 545810:1281 545d16:359|
| 54d1f0| HTEvtLst.obj| 54eb00-54eb40| 2/180| 0/0| EXTRA 2| _HTEventList_pump _HTEventList_loop||
| 54d410|| 54ec50-54ed20| 0/0| 1/99| MISSING 1|| 54eca0:99|
| 557b20| HTStream.obj,HTFormat.obj| 5593a0-5594a0| 3/48| 1/16| EXTRA 2| _HTBlackHole _HTErrorStream _HTBlackHoleConverter| 559440:16|
| 5701a0|| 571a40-571b50| 0/0| 2/32| MISSING 2|| 571ad0:16 571b40:16|
| 579459|| 57a6c9-57a756| 0/0| 1/172| MISSING 1|| 57a751:172|
| 57bf5d| libcmt:_file.obj| 57d18f-57d1f3| 0/0| 1/192| MISSING 1|| 57d1f0:192|
| 57c3e8| libcmt:stdexcpt.obj| 57d66b-57d747| 0/0| 2/213| MISSING 2|| 57d6e5:59 57d720:154|
| 57c825| libcmt:xtoa.obj,libcmt:vsprintf.obj,libcmt:fpinit.obj| 57daa3-57dd90| 5/237| 1/102| EXTRA 4| _vsprintf __vscprintf __cfltcvt_init ___setfflag __fpmath| 57dd2a:102|
| 57ced0| libcmt:mktime.obj| 57e02b-57e205| 0/0| 1/26| MISSING 1|| 57e1eb:26|
| 5806c8| libcmt:winsig.obj| 581698-5816d8| 0/0| 1/417| MISSING 1|| 5816cf:417|
| 586d71| libcmt:initctyp.obj| 587ee5-588130| 3/75| 0/0| EXTRA 3| ____lc_codepage_func ____lc_collate_cp_func ____lc_handle_func||
| 58a673| libcmt:secfail.obj,libcmt:_fptostr.obj,libcmt:cfout.obj,libc| 58b6cb-58b83f| 2/32| 0/0| EXTRA 2| __set_security_error_handler ___set_buffer_overrun_handler||

Reading the early rows (game code, link order):
- cl_console_mp 4046c0: retail has 4 fns / 3043 B, ours 3 / 2678 B: 365 B (405080:365) missing, not yet identified.
- cl_main_mp 40cdf0 CL_RequestAuthorization: ours 468 (+211 merged helper) vs retail 5 fns / 1057 B; CL_CheckForResend ours 599 vs retail 1026; CL_ConnectionlessPacket 2267 vs 2657: 1.3 PB/auth code missing (code work, not set work).
- cl_main_mp 411e60: retail 412670 (73 B) is an rdtsc spin-wait (calls two fn pointers at 0x68a38c/0x68a390, Sleep(1) loop) called from 40f782 (CL_Frame region) and 409329. No ours counterpart. DEFERRED: the pointers' names are not known (not in refexport_t at 0x689280; Mac RB_AdaptiveGpuSyncWait is the renderer-side relative, not this fn).
- sv_ccmds 452370: ours PbMsgToScreen (16 B, Mac 1.3 name) + SV_AddDedicatedCommands (34 B, unhit); retail has only the 34 B one at 452bc0. PbMsgToScreen has no retail fn >= 16 B in the gap: likely inlined/absent in retail (DEFER, no evidence either way).
- cg_main/cg_consolecmds/g_cmds EXTRA rows (CG_TargetCommand_f, CG_TellTarget_f, Cmd_Tell_f, Cmd_GameCommand_f, CG_*Message): these fns are command-table targets so they exist in retail; the retail copies sit in a different gap = TU-internal order difference (they are outside the anchor LIS). Needs fnorder.py per TU, not removal.
- pbcl 4bab80..4bafb0: 8 retail fns / ~2.2 KB with no ours (PB client stubs: UnloadClientDll@stPbCl, ~stPbCl ...), plus record_dsound 4bb450 (263 B).
- libwww/CRT rows: HTEventList_pump/_loop (2 extra, 180 B), HTBlackHole/HTErrorStream (extra 2), CRT 16-24 B helpers (__set_purecall_handler, ___endstdio, __getmbcp, ...): retail has no separate fn >= 16 B (probably folded into neighbouring CRT members by the retail lib version); not touched.

FIXES (branch s1-inventory, worktree lab13/s1; builds are ~1.5 min):
- Baseline of this worktree (718b8e9) measured 1,499,618 matched-fn B (the 1,505,247 in ratchet13.best came from a lucky tie roll not reproduced by a clean build).
- c0ea8bd: CL_ClearStaticDownload (standalone 48 B body, no retail fn) and the static __forceinline CL_ClearDownloadStateInl (also emitted standalone) -> one macro (headers/dl_reset.h) used in cl_main_mp.cpp and cl_main_pc_mp.cpp. Fn count 9118 -> 9116. matched 1,499,618 -> 1,500,813 (+1195). Tie roll: LOST CG_DrawPlayerStance 1607; RESTORED PC_EvaluateTokens 2587 + GScr_CloseFile 173; GAIN CL_ClearDownloadState +42. SV_DirectConnect, Pickup_Weapon lost both before and after.
- a4eb3b5: CL_BuildMd5StrFromCDKey (static, one caller) merged into CL_RequestAuthorization. 9116 -> 9115 fns. matched 1,500,813 -> 1,498,226 (-2587 = PC_EvaluateTokens tie flipped back); same-offset +208. Kept (fn set = retail), lead decides.
- PINNED: `static __forceinline` / plain `__forceinline` helpers still get a standalone body in the map (flag `i`) because the link uses /OPT:NOREF; only a macro or a hand-merged body removes it.
- Tie behaviour: every fn-count change re-rolled PC_EvaluateTokens (2587) / GScr_CloseFile (173) / CG_DrawPlayerStance (1607) / SV_DirectConnect (2733) / Pickup_Weapon (1616); each change moves 1-3 of them in or out. Count-before-fn is confirmed as the lever: -2 fns restored PC_EvaluateTokens, -3 fns lost it again.
## s2 layout agent (11-04, branch s2-layout): helper copies + .rdata order
- Part A (one copy per shared helper), PINNED by scan of build/release map + src: no duplicated static helper
  bodies exist in the 1.3 tree. Statics defined in several TUs: none (434 static/inline defs scanned outside libwww/speex/zlib/lib/oc
  headers). Unused statics (`I_strnicmpInline`) are NOT emitted (absent from the map), `FloatFromBits` (q_shared.h, static inline)
  has one copy in cm_load_obj with one retail hit. Same name twice in cmp13 only for libwww/CRT file statics (real, retail has them
  too) and `Hunk_AllocXAnimPrecache` (xanim.cpp static, 16 B twin of the other Hunk_Alloc* wrappers, 4 retail hits).
  Result: 0 copies removed; nothing to convert.
- Part B tools (new, in tools/): `rdr13.py` (string-pool alignment ours vs retail, shows each drift break),
  `rdiff13.py lo hi` (word-level .rdata diff, pointers masked: DEL = retail-only, INS = ours-only), `rview.py`, `rwords.py`,
  `rxref.py <rdata off>` (which retail fn references a string).
- PINNED, +22.7 KB .rdata same-offset (a0198f8): libwww `HTStream.c` was placed after HTEvent.c from the BlackHoleConverter
  fns at 0x5593e0, but those belong to HTFormat.c (BlackHoleConverter vtable lives in our HTFormat.c). Retail's HTStream.c
  (BlackHole class 0x571a70.., HTBlackHole accessor 0x571ad0, ErrorStream 0x571ae0..) sits between HTArray.c and HTDir.c.
  tus.txt now has HTStream.c after HTArray.c. HTBlackHole/HTErrorStream still show 0 hits (bodies differ: retail
  BlackHole put_char/put_string/write/flush/free return 0, abort -1; check HT_OK/HT_ERROR constants there: next lead).
  Also `HTEventList_pump` calls `HTTrace("Exiting pump loop: %d\n", HTEndLoop)` directly (retail 0x54ece1 -> HTTrace 0x54e5f0,
  string at .rdata 0x1000 present in retail), not the compiled-out HTTRACE macro.
- PINNED: retail 1.3 has no `tcmd` / `tell_target` console commands (commandsList at .rdata 0x2aff0 lists 19 entries without them)
  and none of the strings `GAME_GC_*`, `gc %i %i`, `tell %i "..."`. Removed CG_TargetCommand_f, CG_TellTarget_f and the table
  entries. SUPPORTED: lnxded-1.3 server source has no Cmd_Tell_f / Cmd_GameCommand_f / GAME_GC (our g_cmds_mp.cpp still has them,
  dead code, 232 B of ours-only .rdata). Removing them is faithful but flips SP_worldspawn (-464 B, SL_AddRefToString regalloc,
  LTCG count tie): sweep of the 4 combos {g_cmds removal, cg removal} x {fonts}: SP_worldspawn survives only with cg removed +
  g_cmds kept. Left g_cmds as is (do this when the function set before g_spawn is complete).
- PINNED build strings: retail .rdata has `pc_1.3_1_1` (BUILD_NUMBER), `Mon May 01 2006 05:05:43PM` (BUILD_TIME) and a single
  pooled `May  1 2006` (common.cpp BUILD_DATE equals game's g_main_mp.cpp BUILD_DATE, one literal). Ours had 1.0 values.
- PINNED sv_net_chan_mp.cpp (copied from lnxded-1.3 source, retail strings agree): header line
  `| Sent To                         |` (wider) and `frag%%|drop%%|ak|   bps|` in the second header. The server source also has
  `szClientName[17]` (ours 32) and a different local order; not changed (frame layout unmeasured).
- Fonts, NOT shipped (tie flip): retail `CL_InitRenderer` (0x40fa10) picks the console font by loc_language: dvar +8 minus 6, cases
  6..12 = russian polish korean taiwanese japanese chinese thai (`fonts/<lang>/consoleFont`, pushed with `push 3`), default
  `fonts/consoleFont`; with `extern dvar_t *loc_language; switch (loc_language->current.integer) { case 12: ... }` in oc/client_mp/
  cl_main_mp.cpp CL_InitRenderer (pool order thai first, written case 12 down to 6 then default) the fn matches
  (+324 B, strings 0x104b0 aligned) BUT DSound_UpdateSample (500 B) flips (stack slot of two locals, `lea edx,[esp+0xc]` vs
  `[esp+8]`) in every spelling tried (switch with 7 calls, ascending order, single call through a const char* local). Net
  -176 B, so reverted. Candidate for the ties list if the owner accepts the swap.
- Open .rdata leads, all need code (ordered by file position; each is a retail fn that references the string):
  * ui_shared (retail 0x545740): localized UI font loader `fonts/<lang>/%s` x8 + `normalFont`; ~165 B fn, missing in ours.
  * CL_CheckForResend `getchallenge 0 "%s"` (retail 0x40e3e1, string from fn 0x40cfc0), ParseGamestate string
    `bad command byte (GameState may exceed MAX_GAMESTATE_CHARS, or packet m...` (retail 0x11299), `%02x` x16 hex string (CL_ForwardCommandToServer 0x40d119, PbTrapPreExecCmd),
    `r_smp_backend_allowed` (Com_ExecStartupConfigs 0x434918), `get_pb_cdkey` / `set_cl_punkbuster` (stPbCl ctor), `@MPUI_PUNKBUSTER`.
  * `%s: %s\n` / `%s: %s` live in retail cl_console (a console print fn after Con_OneTimeInit at 0x405090, missing in ours).
  * CRT: retail wincrt0 has one extra SEH scopetable entry (16 B at rdata 0x6468) and a longer runtime-error block; not source.
- Numbers (start -> end): matched-fn 1,505,247 -> 1,505,247 (91.47%, unchanged, 0 lost); same-offset whole 146,831 -> 169,356
  (7.45% -> 8.60%); .rdata same-offset 31,242 (13.62%) -> 53,042 (23.12%).

## s2b: .rdata ownership + .text drift (11-04, branch s2b from eda49af)
- PINNED .rdata ownership fixes (no new code):
  * `objectiveFields` (msg_mp.cpp) was non-const; retail has the 72 B table in .rdata (0x9990, origin[0..2], icon, entNum, teamNum).
    Now `static const`. Commit 8f86115: same-offset 169,076 -> 180,154, matched-fn unchanged (1,505,397), SP_worldspawn tie as before.
  * `getKeyAuthorize %i %s PB %s` was a `static const char[]` (cl_main_mp.cpp), which put 32 B into the per-obj const block (.rdata 0x8d24)
    and shifted 0x8d44..0x10c04 by 32. Retail has it as a pooled literal at 0x10c04. Commit ef0b86c uses the literal inline:
    same-offset 180,154 -> 196,876 (whole 9.99%, .rdata 30.74%, .data 81.12%) BUT flips `_yylex` (4,236 B, in ties13 as tie/label):
    matched-fn 1,505,397 -> 1,501,161 (91.48% -> 91.22%). Spellings tried: file-scope `static const char *const`
    (loses SV_DirectConnect 2,733, worse), parenthesised literal (same yylex flip). Coordinator decides: take 8f86115 (ratchet-clean)
    or ef0b86c (+16.7K bytes whole-file, -4.2K matched via the yylex tie).
- Not done (need code or pool-order work): pbsv.cpp string order (retail pool: GetProc Failure, sb, sa, pbsvold, pbsvnew, Load Failure,
  pbag.dll, pbsv.dll; ours puts pbag.dll first: LTCG pool order inside a class-method TU, not a simple reverse of source);
  `pb_sv_`/`%s: %s`/`cl_punkbuster` first-reference TU differences (retail first ref is cl_keys / cl_console / cl_main fns we lack).
- .text drift (tools/drift13.py [n] [m]; delta = retail addr - our addr at each uniquely matched fn, 6,899 of 8,955 anchors).
  Drift is zero at 0x401000 (assertive.obj, 4 fns), then every break is the size difference of the unmatched fns just before it:

| ours addr | TU | step | cause (unmatched fns before the break, ours size) |
|---|---|---|---|
| 401d70 | cl_cgame_mp | -64 | FIRST break: CL_SetExpectedHunkUsage 527 B ours, retail 463 B (no hit) |
| 402120 | cl_cgame_mp | -16 | CL_SubtitlePrint 226 B (pad) |
| 402370/402380 | cl_cgame_mp | -192/+192 | CL_SaveScreen 6 B (retail has a 192 B different fn here, re-syncs next fn) |
| 404b20 | cl_console_mp | +1968 | CL_ConsolePrint_AddLine 526, CL_ConsolePrint 400, CL_ConsoleFixPosition 162 vs retail: + a `%s: %s` print fn (0x405090) and other missing fns (layout13: 2,041 B missing) |
| 40a220 | cl_keys_mp | +176 | CompleteCommand 466 B |
| 40c9c0..40e4b0 | cl_main_mp | +400,+448,+400 | CL_RequestAuthorization 686, CL_CheckForResend 599, CL_ConnectionlessPacket 2,267 (1.3 connect code, w8) |
| 40edf0..40f550 | cl_main_mp | +128,+128,+96 | CL_InitRenderer 203 (fonts, see s2 notes), CL_InitRef 1,699 |
| 4207f0 | cmd | +144 | Cmd_ExecuteString 383 |
| 433a80 | common | +208 | Com_Init_Try_Block_Function 1,351 |
| 45c4e0 | sv_snapshot | -64 | SV_Netchan_PrintProfileStats 2,316 (frame/locals vs server source) |
| 465620/465690 | win_main/win_net | -9088/+9344 | retail orders win_main after win_net's block; our link order differs (TU out of order list in LAYOUT_1.3.md) |
| 4ba780..4bc310 | pbcl/pbsv/pbmd5 | +1712,+752,+2912,-6784,+3904 | PunkBuster TUs: our pbcl/pbsv are stubs (retail pbcl ~ 0x4bb9b0.., pbsv 0x4bd..); order and size both off |
| 4d7e70 | cg_scoreboard | +752 | CG_DrawBackdropServerInfo region (742 B missing) |
| 545d30 | libwww start | +1408 | whole UI tail: ui_shared_obj fns before HTReqMan (~1.4 KB: localized font loader 0x545740 etc.) |
  Net: retail is +8,688 at libwww start, i.e. ~8.7 KB of retail code ahead of libwww that we do not have in place
  (cl_console 2.0 K, cl_main connect 1.3 K+, PunkBuster ~4 K, cl_keys/common/cmd ~0.6 K, ui ~1.4 K, cl_cgame -64).
  The first TU to go out of position is cl_cgame_mp.obj, by 64 B (CL_SetExpectedHunkUsage); everything before it (assertive.obj) is in place.

## s3: cl_console_mp positions (11-04, from d5d19dc)
- PINNED: retail 0x405080 (365 B) is `PbMsgToScreen(prefix, msg)`, not a console fn we lacked: callers are stPbCl ctor (0x4bbf11) and
  PbSvGameQuery (0x4bddc1). Body = `if (com_dedicated && com_dedicated->current.integer) Com_Printf("%s: %s\n", ...)` else
  `sprintf(LargeLocal(0x10000) buf, "%s: %s", prefix, msg); CL_ConsolePrint(PMSG_GAME, buf, 0, 0)` with CL_ConsolePrint inlined.
  Moved from sv_ccmds_mp.cpp (server one-liner, no retail copy) into cl_console_mp.cpp after CL_ConsolePrint: matches (365 B).
- PINNED +residual: `color = ColorIndex(0x37)` must come BEFORE `Sys_EnterCriticalSection(0)` in CL_ConsolePrint (retail `mov ebx,7`
  sits between `push cs` and `call Enter`). Matches CL_ConsolePrint (396), PbMsgToScreen (365), CG_GameMessage/CG_BoldGameMessage (275 each).
- w8 wip2 AddLine (1.3 asian path, 2,132 B = retail size exactly) applied from branch w8-consoleprint-wip2: still 6 reg hunks (not matched) but puts
  the whole cl_console_mp TU in position (step +1,968 -> +16). Costs two ordinal ties (SV_DirectConnect, PC_EvaluateTokens), now in ties13.txt
  as tie/label (SV_DirectConnect: esi/edi load pair order; PC_EvaluateTokens: edx/ecx load order). Without the AddLine rewrite only SV_DirectConnect flips.
- NOT shipped: CL_SetExpectedHunkUsage (527 vs retail 463 B, the first drift break). Body matches except the default tail: retail calls
  Dvar_SetIntFromSource (0x438650, ebx=dvar eax=0 push 0) un-inlined, ours inlines it for the constant 0 (type switch + sprintf inline, +64 B).
  `Dvar_SetIntFromSource(dvar, 0, DVAR_SOURCE_INTERNAL)` directly is worse (533 B, -3K same-offset). Lead: find what stops the inliner on
  the const-0 site (callee body/size differs from retail 0x438650?) or a non-constant value routed into the tail.
- Numbers: same-offset 196,876 -> 201,198 (10.21%); .rdata 31.37%, .data 81.19%, .text 3.02%; matched-fn 1,501,161 -> 1,501,605 (91.25%,
  start 91.22 at d5d19dc; coordinator baseline had _yylex tie out). Drift now: first break cl_cgame_mp -64 (HunkUsage), cl_console_mp only +16 pad
  steps (was +1,968), next real steps: cl_keys +176 (CompleteCommand 466 B), cl_main_mp (w8).
