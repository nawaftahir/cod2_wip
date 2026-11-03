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

