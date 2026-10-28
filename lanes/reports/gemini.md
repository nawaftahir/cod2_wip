# Cheap Agent Report: gemini

## Target File: `src/xanim/xmodel_utils.cpp`
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
