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


