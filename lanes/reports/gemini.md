# Cheap Agent Report: gemini

## Target File 1: `src/universal/com_files.cpp` (Handed off TU completion)
- **Functions in TU**: 97
- **Matched count in ledger**: 42 (all verified inside linked executable)
- **New match in this branch**:
  - `0x0047f700` (`FS_Printf`, 105 B): MATCH 100% at `0x00403ca0`
- **Remaining 55 functions deferred / blocked by whole-program link graph**:
  1. `FS_Remove` (`0x0047e160`) and `FS_Delete` (`0x0047f3d0`): Blocked by owner library mapping (`lib_funcs.tsv` names `0x4dad56` as `__rmdir`, but retail binary calls `DeleteFileA` via IAT `0x5283ac`).
  2. Read Graph Cluster (`FS_FOpenFileRead_Internal` 1396 B, `FS_SanitizeFilename` 643 B, `FS_FilesAreLoadedGlobally` 161 B, `FS_IsBackupSubStr` 27 B, `FS_IsPathSepChar` 17 B, `FS_ReadFile` 181 B, `FS_TouchFile` 60 B): Verified matching bodies ready in `scratch/test_cluster.py` and `scratch/codex_1028_read_graph/`. Blocked from canonical emission because `FS_FOpenFileRead_Internal` is called across TUs by `TexWnd.cpp` (`0x440d01`). Without `TexWnd.cpp` compiled, LTCG passes `filename` in register `edx` instead of stack, shifting stack offsets.
  3. `FS_ShutdownSearchPaths` (`0x00481910`, 126 B) & `FS_Shutdown` (`0x00481990`, 68 B): `FS_Shutdown` matches 100%. `FS_ShutdownSearchPaths` is blocked because calling `unzClose` inlines `unzCloseCurrentFile` from `/GL` compiled `unzip.c`, swelling size from 126 B to 194 B.
  4. Directory-loading graph (`FS_ListFilteredFiles`, `FS_AddIwdFilesForGameDirectory`, `FS_InitFilesystem`, etc.): Interdependent graph deferred after 8 bounded trials.

## Target File 2: `src/xanim/xmodel_utils.cpp`
- **Total functions in TU**: 11 (1090 bytes)
- **Matched count**: 10 (all verified 100% inside linked executable)
- **Deferred count**: 1

### Verified Matches
- `0x004acb50` (`XModelGetName`, 14 B): MATCH 100% at `0x0040db90`
- `0x004acb60` (`XModelGetFlags`, 14 B): MATCH 100% at `0x0040dba0`
- `0x004acc30` (`XModelGetSurfaces`, 298 B): MATCH 100% at `0x0040dc80`
- `0x004acd60` (`XModelGetNumLods`, 12 B): MATCH 100% at `0x0040ddb0`
- `0x004acd70` (`XModelNumBones`, 13 B): MATCH 100% at `0x0040ddc0`
- `0x004acd80` (`XModelGetBasePose`, 13 B): MATCH 100% at `0x0040ddd0`
- `0x004acd90` (`XModelGetBasePoseOffset`, 262 B): MATCH 100% at `0x0040dde0`
- `0x004acea0` (`XModelGetLodOutDist`, 52 B): MATCH 100% at `0x0040def0`
- `0x004acee0` (`XModelGetLodForDist`, 95 B): MATCH 100% at `0x0040df30`
- `0x004acf40` (`XModelSetLodOverride`, 126 B): MATCH 100% at `0x0040df90`

### Deferrals
- `0x004acb70` (`XModelGetSurfaceName`, 191 B):
  Best 93% (sizes 193/191, first difference at +0xa2).
  Reason: Callee `SL_GetString` (`0x004a87b0` in `src/script/scr_stringlist.cpp`) takes argument `stringValue` in register `EAX`. Because `scr_stringlist.cpp` is currently an uncompiled placeholder, MSVC defaults to standard `__cdecl` emitting `push eax` and `add esp, 4` (+2 bytes). Will match automatically once `scr_stringlist.cpp` is compiled with `/GL`.

## Verification
- `verify.py --all`: **413 / 413 rows match, 0 failures**
- Compiler rows: **2 / 2 match**
- Unverified in src: strictly **50** (0 growth)
