# Cheap Agent Report: gemini

## Target File: `src/universal/com_memory.cpp` (Recovery Checkpoint)
- **Total functions in TU**: 49 (4,768 bytes)
- **Baseline matched**: 19 functions
- **New verified matches in this checkpoint**: 12 functions (+1,950 bytes)
- **Total matched in TU**: 31 / 49 functions
- **Candidate leftover**: 1 function (`0x0048a560`, 19 B), deferred in `ledger/defer.tsv` from 2026-10-24; excluded from source to keep unverified count strictly at 50.

### Newly Verified Matches (12 Functions / 1,950 Bytes)
- `0x00489c70` (`FUN_00489c70`, 17 B): MATCH 100% at `0x00407790`
- `0x00489c90` (`Z_VirtualAllocInternal`, 131 B): MATCH 100% at `0x004077b0`
- `0x00489d40` (`Z_VirtualCommitInternal`, 138 B): MATCH 100% at `0x00407840`
- `0x00489fc0` (`Hunk_Shutdown`, 218 B): MATCH 100% at `0x004078c0`
- `0x0048a0a0` (`Hunk_FindDataForFileInternal`, 56 B): MATCH 100% at `0x004079a0`
- `0x0048a0e0` (`Hunk_FindDataForFile`, 23 B): MATCH 100% at `0x004079e0`
- `0x0048a100` (`Hunk_DataOnHunk`, 97 B): MATCH 100% at `0x00407a00`
- `0x0048a270` (`Hunk_AddData`, 124 B): MATCH 100% at `0x00407a70`
- `0x0048a580` (`Hunk_AllocAlignInternal`, 435 B): MATCH 100% at `0x00407c40`
- `0x0048a740` (`Hunk_AllocateTempMemoryHighInternal`, 266 B): MATCH 100% at `0x00407e10`
- `0x0048a860` (`Hunk_AllocLowInternal`, 15 B): MATCH 100% at `0x00407f30`
- `0x0048a870` (`Hunk_AllocLowAlignInternal`, 430 B): MATCH 100% at `0x00407f40`

### Candidate Leftover
- `0x0048a560` (`Hunk_AllocInternal`, 19 B): Excluded from canonical source. Retail uses standard `__cdecl` stack arguments; when compiled alone without external callers, LTCG passes argument in `EAX` (14 vs 19 B). Preserved in `research/gemini_seeds/com_memory/candidate.cpp` and already deferred in `ledger/defer.tsv` (Claude, 2026-10-24).

## Verification
- `verify.py --all`: **441 / 441 rows match, 0 failures**
- Compiler rows: **2 / 2 match**
- Unverified in src: strictly **50** (0 growth)
- Game code bytes: **54,838 / 699,591 bytes (7.84%)** (+1,950 bytes gained)
