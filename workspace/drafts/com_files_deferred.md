# Deferred functions in `src/universal/com_files.cpp`

Summary of remaining unmatched `src/universal/com_files.cpp` functions after adding 14 matched functions (+2,715 bytes) in `workspace/src/universal/com_files.cpp`.

## 0. Matched in `com_files.cpp` but deferred from `ledger/matches.tsv` due to cross-TU caller signature
- `0x00481990` `FS_Shutdown` (68 B): `void FS_Shutdown(int closemfp)` (`?FS_Shutdown@@YAXH@Z`) matches 100% (`0x0040fe10`), but `workspace/src/radiant/UNKNOWN_00408f20.cpp` (`front`-owned, `0x00408fd0` `FUN_00408fd0`) forward-declares `void FS_Shutdown();` (0 args) instead of `void FS_Shutdown(int);` / `#include "../universal/com_files.h"`. Adding `0x00481990` causes `0x00408fd0` to fail `CALLEE` (`$L186945` stub vs `?FS_Shutdown@@YAXH@Z`). Kept `FS_Shutdown(int closemfp)` in `workspace/src/universal/com_files.cpp` and deferred `0x00481990` from `ledger/matches.tsv` until `UNKNOWN_00408f20.cpp` updates its call to `FS_Shutdown(1)` (or `FS_Shutdown(0)`).

## 1. Unmatched functions kept as draft source in `workspace/src/universal/com_files.cpp`

### External / `/GL` dependency blocked (attempt 1/3)
These match the retail structure/control flow in `workspace/src/universal/com_files.cpp`, but fail byte-identity due to cross-TU `/GL` calling conventions or inlining dependencies on functions not yet matched/linked at retail calling conventions:

- `0x0047e3c0` `FS_GetHandleAndOpenFile` (103 B, 54%): calls `I_strncpyz` (`0x00496430`, `q_shared.cpp` uses `/GL` custom regs `ebx/edi/esi` in retail, stack args when stubbed/unmatched).
- `0x0047e430` `FS_FOpenFileWrite` (173 B, 87%): blocked by `I_strncpyz` + `FS_GetHandleAndOpenFile` + missing external callers.
- `0x0047e4e0` `FS_FOpenTextFileWrite` (269 B): blocked by `I_strncpyz`.
- `0x0047e5f0` `FS_FOpenFileAppend` (258 B, 56%): blocked by `I_strncpyz`.
- `0x0047ed20` `FS_FOpenFileRead_Internal` (1396 B, PINNED): blocked by `I_strncpyz` / external callers.
- `0x0047fa40` `FS_ReadFile` (181 B): blocked by `FS_FOpenFileRead_Internal` / `Hunk_AllocateTempMemory` `/GL` regs.
- `0x0047fb90` `FS_WriteFile` (245 B, 65%): blocked by `FS_FOpenFileWrite` (`/GL` `esi` arg vs stack) + external callers.
- `0x0047fdc0` `FS_OpenFileForWrite` (259 B, 65%): blocked by `FS_GetHandleAndOpenFile` + external callers.
- `0x004803e0` `FS_AddFileToList` (81 B, 23%): `/GL` inlines `CopyStringInternal` (`152` B vs `81` B) while too few TUs call `CopyStringInternal`.
- `0x00480440` `FS_ListFilteredFiles` (1267 B, 37%, PINNED): blocked by `Com_FilterPath` + `Sys_ListFiles` (`0x00498230` custom `ecx` CC) + `FS_AddFileToList` inlining.
- `0x00480940` `FS_ListFiles` (36 B, 41%): cascades from `FS_ListFilteredFiles` + external callers.
- `0x00481210` `FS_AddIwdFilesForGameDirectory` (963 B, 37%): blocked by `Sys_ListFiles` (`0x00498230`, `win_common.cpp` `/GL` `ecx` reg) + `FS_LoadZipFile` not yet implemented.
- `0x004815e0` `FS_AddGameDirectoryInternal` (773 B, 31%, PINNED): blocked by `I_strncpyz` (`0x00496430`, 4 calls).
- `0x004818f0` `FS_AddGameDirectory` (28 B, 57%): cascades from `FS_AddGameDirectoryInternal` (`dir` reg `ecx` -> stack).
- `0x004819e0` `FS_RegisterDvars` (273 B, 68%): calls `Dvar_RegisterVariant` (`0x0048f7c0`) and `Dvar_RegisterString` (`0x0048fa50`); waits on `dvar.cpp` callers in full exe so `/GL` picks `eax` vs `edi` for `dvarName`.
- `0x00481b00` `FS_Startup` (1184 B, 56%): cascades from `FS_AddGameDirectoryInternal` + `FS_RegisterDvars`.
- `0x004820a0` `FS_InitFilesystem` (92 B, 72%): matches through `Com_Error`, then differs on `I_strncpyz` (`0x00496430`, 2 calls).
- `0x00482100` `FS_Restart` (368 B, 67%, PINNED): matches through `assert(default_config)` (`#line 3901`), then differs on `Dvar_SetString` (`0x00490650`) and `I_strncpyz` (`0x00496430`).
- `0x004822a0` `FS_FOpenFileByMode` (268 B, 36%): blocked by `FS_FOpenFileWrite` (`esi` reg) + `FS_FOpenFileAppend` (`ecx` reg); note retail span `0x004822a0..0x004823ac` also covers `FS_FTell` (`0x00482370..0x004823ab`, 60 B).

### Deferred after max 3 attempts
- `0x0047f770` `FS_SeekInternal` (719 B, PINNED — **3/3 attempts, 93%, 710/719 B**): matches `+0x0..+0x228`; differs at `+0x229` and tail `FileWrapper_Seek` (`0x0047f9fd..0x0047fa3b` loads `0/2/1` into `ecx` before `push ecx` in retail, whereas our build pushes immediates directly). Draft kept in `workspace/src/universal/com_files.cpp`.

## 2. Not yet implemented in `workspace/src/universal/com_files.cpp`
- `0x0047fed0` `FS_LoadZipFile` (1194 B): Radiant omits IWD checksums (`iwd_t` has no `checksum`/`pure_checksum`, `fs_headerLongs` passes `LittleLong(file_info.crc)` via `_LittleLong` pointer at `0x0117346c` then frees it); also blocked on `I_strncpyz` (`0x00496430`, 2 calls).

## 3. Header / CRT inline slots attributed to `com_files.cpp` (`0x00482440..0x00482910`)
`data/tu_map.tsv` maps 16 small entries after `GetBspExtension` (`0x004823c0`) to `src/universal/com_files.cpp`:
`0x00482440` (27), `0x00482460` (27), `0x00482480` (27), `0x004824a0` (27), `0x004824c0` (41), `0x004824f0` (44), `0x00482520` (66), `0x00482570` (3), `0x00482580` (24), `0x004825a0` (61), `0x004825e0` (25), `0x00482600` (105), `0x00482670` (39), `0x004826a0` (63), `0x004826e0` (548), `0x00482910` (105).
Disassembly confirms `0x004826e0` asserts in `../xanim/xanim_public.h` lines 332–334 (`0x00482910` calls `0x004826e0`), and the rest are header math/CRT conversion inlines (`_ftol2` / `_fabs` / vector helpers) emitted by MSVC `/LTCG` in the TU boundary, not functions written inside `com_files.cpp`.
