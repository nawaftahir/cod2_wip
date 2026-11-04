# Region F: 0x4ad790 - 0x52720e (end of .text)

Work files (scripts, match output) in `workspace/research/filemap/work/`: `objmatch.py`, `libmatch.py` (prefix
library matcher), `classify.py`, `textx.py` (EH funclet owners), `initwalk.py`, `gaps.py`, `disr.py`.

## 1. zlib per-file ranges

Plain zlib 1.1.4 (+ IW unzip) in alphabetical file order, functions in 1.1.4 definition order, CC padding
(VC7.1). The block starts BEFORE region F: adler32.c is 0x4acfc0.

| file | range | first fn / evidence |
|---|---|---|
| adler32.c | 0x4acfc0-0x4ad0e9 | adler32 (called by read_buf 0x4add30 and deflateSetDictionary 0x4ad3b0). Outside F |
| compress.c | 0x4ad0f0-0x4ad19b | compress2 0x4ad0f0 (deflateInit_ inlined: pushes "1.1.4" to deflateInit2_ 0x4ad1c0, then deflate, deflateEnd), compress 0x4ad190 (= compress2(...,-1)). Outside F. **RULES.md "compress.c absent" is wrong** |
| deflate.c | 0x4ad1a0-0x4ae95e | deflateInit_ 0x4ad1a0, deflateInit2_ 0x4ad1c0, SetDictionary 0x4ad3b0, Reset 0x4ad4a0, Params 0x4ad510 (gap) ... deflate_slow 0x4ae580. Ledger PINNED rows inside |
| infblock.c | 0x4ae960-0x4af64b | inflate_blocks_reset 0x4ae960 |
| infcodes.c | 0x4af650-0x4afd9c | inflate_codes_new 0x4af650 |
| inffast.c | 0x4afda0-0x4b0135 | inflate_fast |
| inflate.c | 0x4b0140-0x4b0845 | inflateReset 0x4b0140 |
| inftrees.c | 0x4b0850-0x4b0f8a | huft_build 0x4b0850 |
| infutil.c | 0x4b0f90-0x4b10c6 | inflate_flush |
| trees.c | 0x4b10d0-0x4b2b72 | 1-byte `ret` 0x4b10d0 (tr_static_init, HYPOTHESIS), _tr_init 0x4b10e0 |
| uncompr.c | 0x4b2b80-0x4b2c0b | uncompress. **RULES.md "uncompr.c absent" is wrong** |
| unzip.c | 0x4b2c10-0x4b3c6f | unzlocal_getShort (ledger) |
| zutil.c | 0x4b3c70-0x4b3cf1 | zlibVersion 0x4b3c70, zError 0x4b3c80, zcalloc 0x4b3ca0, zcfree 0x4b3ce0 (ledger) |

Notes
- crc32.c is not in the game zlib. A VC6-built crc32 (get_crc_table 0x4d0b00, crc32 0x4d0b10, table
  0x52c6c0) closes the Perforce block; P4's gzip code calls it.
- Many unreferenced zlib functions are absent from the Ghidra inventory but present in the bytes
  (deflateParams 0x4ad510, deflateCopy 0x4adb80, deflate_stored 0x4ae0c0, inflateInit_ 0x4b02d0,
  inflateSetDictionary/Sync/SyncPoint in 0x4b0694.., inflate_trees_fixed 0x4b0f60, _tr_tally 0x4b2490,
  bi_reverse 0x4b29e0, zlibVersion, zError). So nothing was dropped by the linker: no /OPT:REF, as RULES says.
- Exported (non-static) zlib functions take register arguments: zError 0x4b3c80 (code in EAX),
  compress2 0x4ad0f0 (EAX/ECX/EDX/EDI), and deflateInit_ is inlined into compress2 across files.
  Plain /O2 cannot do either (RULES: only statics). So zlib was built `/GL` and linked `/LTCG`
  (SUPPORTED; fits the 104 `/GL` C objects). Entry points the VC6 P4 code calls (deflateInit2_,
  deflate, inflateInit2_ ...) stay cdecl, as LTCG must keep them.
- My /O2 /Oy- /Op compile of src/zlib matches 14 rows exactly (the ledger ones); the rest score 0.5-0.99
  on a byte-similarity check, which is source drift, not wrong placement.

## 2. Perforce block 0x4b3d00 - 0x4d0c34 (pad to 0x4d0c40)

- Verdict: one external library, the Perforce C++ client API (`extlib/p4api`), built with **VC6**: all 1,051
  inter-function pads are 0x90, none are 0xCC. No VC7.1 game code sits inside.
- Evidence: strings P4PORT/P4CLIENT/P4USER/P4PASSWD/P4CONFIG/P4TICKETS, Rpc dispatch, NetBuffer,
  NetTcpTransport, WSAStartup failure text, AppleSingle/AppleDouble, diff output formats. Starts with StrPtr
  inlines 0x4b3d00/0x4b3d10/0x4b3d20; ClientUser methods 0x4b3f20/0x4b42e0/0x4b4360. Uses the WS2_32 import
  thunks 0x4f3276-0x4f330c.
- Ends with zlib crc32.c bundled with P4 (VC6): get_crc_table 0x4d0b00, crc32 0x4d0b10, table 0x52c6c0.
- The "own zlib at 0x4cef20" is P4's gzip stream code (0x4cef20, 0x4cf170). It calls the GAME zlib
  (deflateInit2_ 0x4ad1c0, inflateInit2_ 0x4b01d0) plus the P4 crc32. NetBuffer 0x4bbf00/0x4bc130 also
  call game zlib. So P4 was linked against our zlib, not its own copy.
- The 17 `data/lib_funcs.tsv` LIB rows inside the P4 block are false positives (tiny getters/ret stubs that
  also occur in MFC). Treat the block as one EXTLIB range.
- Game Perforce code is NOT here. It is in the game unit (other region): StdClientUser
  (RTTI `.?AVStdClientUser@@`) 0x425150/0x425180/0x4251a0/0x4253b0 with "Perforce Error/Info/Text"
  strings; p4 edit/add/submit/sync commands 0x425260/0x4253d0/0x425500/0x425630 (called from MainFrm);
  ClientUser header inlines 0x425120/0x425130.

## 3. MFC/CRT area 0x4d0c40 - 0x522b60

Library code (nafxcw.lib, libcmt.lib, atls.lib, delayimp.lib, import libs). The MFC lib starts at
0x4d0c40 unaligned (`xor eax,eax; ret 4`, vcall thunks `??_9@$BBEM@AE`). `data/lib_funcs.tsv` covers
2,125 of 2,499 inventory functions. The other 374 are classified in `work/fmfc.tsv` and written to F.tsv
as 173 ranges (adjacent same-library items merged when no LIB row lies between):

| class | count | meaning |
|---|---|---|
| libhit-split | 115 | prefix byte-match to one lib function, Ghidra size shorter (often trailing code after a noreturn call). Range end = lib fn end |
| section | 75 | inside a whole-section match of a non-COMDAT / MASM libcmt object (asin, sqrt, sin, cos, tan, acos, pow/log/floor_pentium4 (floor 0x4d7630), 87cdisp, ehvecctr/ehvecdtr __finally blocks 0x4d8f8a/0x4d905a ...) |
| fragment | 45 | Ghidra-split piece inside a matched lib fn (e.g. catch block 0x4d6197 of olevar.obj operator>>(CArchive&,COleVariant&) 0x4d5f92, 639 B) |
| libhit-ambig | 43 | byte-identical to several lib functions (same library); library is sure, member is not |
| libhit-exact | 34 | exact match missed by the sweep: 9 atls.lib atlbase.obj (CAtlBaseModule ...), delayimp.lib delayhlp.obj 0x4f334d-0x4f3821 (__delayLoadHelper2 0x4f3451), others |
| import | 34 | import thunks: ws2_32 25, winspool 4, user32 2, comctl32 2, kernel32 RtlUnwind 1 |
| jmp5 | 15 | 5-byte `jmp` incremental/ILT-style stubs resolved to their target: 0x4da216 _atoi, 0x4f3821 _WinMain@16, 0x4ff433 AfxNewHandler, 0x4ff450 operator new, 0x4ff47b operator delete, 0x4ff480 new[], 0x4ff485 delete[], 0x4f4be7/0x4f4e6e/0x521a3e ~CCommonDialog family, 0x4f9b29 ~CAssoc, 0x501fa5 ProcessWndProcException, 0x515417 ~CReBar, 0x51c264 ~CThreadLocal, 0x51c587 ~_AFX_BASE_MODULE_STATE; 0x5000fe target HYPOTHESIS |
| delaythunk | 4 | linker-generated OLEACC delay-load code: __tailMerge 0x4f3316, `jmp [delay IAT]` 0x4f3327/37/47 |
| UNKNOWN | 9 | 1-byte `ret` 0x4d36eb, 0x4de86e, 0x4f3a6e, 0x51f06f, 0x521e18 (empty fn or tail, HYPOTHESIS); 0x4d3873 (38 B; same 80-B shape as 19 atls/nafxcw fns, between objcore.obj members, written as nafxcw); jmp stubs 0x4dad80 (-> __rmdir), 0x4dd137 (-> _iswalpha), 0x4dd217 (-> __wrmdir), called only from P4, no lib twin (HYPOTHESIS) |

Why the existing sweep missed them: Ghidra size != lib size; atls.lib and delayimp.lib were not swept;
MASM / non-COMDAT objects are one section, not per-function; Ghidra splits catch/finally blocks; linker
thunks (import, delay-load, jmp stubs) have no lib bytes.

`data/lib_funcs.tsv` false positives: 0x4f330c, 0x4f332d, 0x4f333d are labelled `__ehhandler$CreateObject`
but are `__imp_load_` delay thunks; the 17 rows in the P4 block (section 2).

Other facts
- Big import-thunk block 0x4f2152-0x4f2f26, mostly missing from the inventory (added in F_funcs.tsv).
- 0x4f3b9e = AfxThrowMemoryException (except.obj). __CxxFrameHandler = 0x4dddf7. _atexit = 0x4d81a9.

## 4. Tail 0x522b60 - 0x52720e

| range | content |
|---|---|
| 0x522b60-0x5244b0 | MFC .text$x funclets and __ehhandler stubs (416 fns), owners all nafxcw members |
| 0x5244b0-0x526930 | game .text$x funclets (495 fns, 202 EH groups), owners all game code < 0x4acfc0, CC pads |
| 0x526930-0x526df0 | game dynamic initializers (11 fns), globals in bss 0x123xxxx-0x1248xxx |
| 0x526df0-0x526e80 | P4 initializers (0x90 pads): signal(2,0x4c04c0), CreateMutex |
| 0x526e80-0x526ee0 | MFC/ATL initializers (0x4d3fea, CAtlBaseModule ctor 0x4f318f, 0x4f3826) |
| 0x526ee0-0x5271a0 | game atexit destructors |
| 0x5271a0-0x5271f0 | P4 atexit destructors (0x4c0d50, 0x4be650) |
| 0x5271f0-0x52720e | MFC/ATL atexit destructors |

- This is game code outside the main unit. It is compiler-emitted per TU (.text$x, .text$yc/.text$yd
  style), so it gives no file boundaries; the `linker/text_*_game` tu names in F.tsv are placeholders,
  not file names. Each funclet belongs to the TU of its owner (owners in `work/textx.py` output).
- Game funclet owner order is not address order (21 ascending steps, descending runs), and the game
  funclets come AFTER MFC's. HYPOTHESIS: the game C++ came out of the LTCG code generator as one object,
  linked after nafxcw.lib's .text$x.

## 5. Corrections to RULES.md / known facts

- compress.c and uncompr.c ARE in the binary (0x4ad0f0, 0x4b2b80).
- crc32.c is not in game zlib; the only crc32 is P4's VC6 copy at 0x4d0b10.
- zlib uses register args + cross-file inlining, so it was /GL + /LTCG (SUPPORTED).
- The P4 block has no own zlib; it calls game zlib.

## 6. F_funcs.tsv / F_funcs_drop.tsv

- `proposals/F_funcs.tsv` (`addr size`, 2,629 rows): real function starts missing from
  `data/functions_cod2radiant.json` or with a wrong size. By source: carved new 664, lib new 636,
  import thunk new 582, EH funclet new 486, lib resize 113, dynamic init/dtor new 75, carved resize 65,
  EH resize 8. Includes the starts merge.py rejected: 0x4b10d0 (1), 0x4b3c70 (6), 0x4b3c80 (17),
  0x4b3cf2 (6), 0x4b3d00 (4), 0x4d0b00 (6). Reason per row: `work/F_funcs_why.tsv`.
- `proposals/F_funcs_drop.tsv` (`addr size inside why`, 96 rows): inventory starts that are Ghidra-split
  pieces inside a real function.
- Inventory overlaps left after applying both (pre-existing, inventory vs inventory, not mine to fix):
  0x4d9090/0x4d914e, 0x4db9fd/0x4dbaab, 0x4e5939/0x4e59c0, 0x4e5bb2/0x4e5c39, 0x4e5f1b/0x4e5fa2,
  0x4f099a/0x4f0a15.
- Note: `data/functions_cod2radiant.json` and `data/lib_funcs.tsv` changed during this session
  (7,587 fns / 2,142 LIB rows when last read); rerun the merge against the current files.
