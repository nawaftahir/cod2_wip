# Cheap Agent Report: gemini

## Target File: `src/universal/com_shared.cpp`
- **Total functions in TU**: 14 (2,064 bytes)
- **Matched count**: 3 (all verified 100% inside linked executable)
- **Status**: Checkpoint 1 delivered (3 pre-verified seeds recovered and verified against current main)

### Verified Matches
- `0x0048af50` (`Com_StringContains`, 88 B): MATCH 100% at `0x004078d0`
- `0x0048b2a0` (`Com_HashKey`, 67 B): MATCH 100% at `0x00407930`
- `0x0048b2f0` (`Com_RealTime`, 96 B): MATCH 100% at `0x00407980`

### Remaining Functions in Progress (Batch 2)
- `0x0048afb0` (`Com_Filter`, 587 B)
- `0x0048b200` (`Com_FilterPath`, 153 B)
- `0x0048b350` (`_copyDWord` / `Com_Memset4`, 138 B)
- `0x0048b3e0` (`Com_Memcpy`, 439 B)
- `0x0048b5a0` (`Com_Memset`, 170 B)
- `0x0048b650` (`Com_Memcmp`, 153 B)
- `0x0048b6f0` (`Com_Prefetch`, 59 B)
- `0x0048b730` (`FUN_0048b730` / float min/max, 44 B)
- `0x0048b760` (`VectorCompare2`, 37 B)
- `0x0048b790` (`VectorCopy4`, 23 B)
- `0x0048b7b0` (`FUN_0048b7b0` / scalar compare, 10 B)

## Verification
- `verify.py --all`: **419 / 419 rows match, 0 failures**
- Compiler rows: **2 / 2 match**
- Unverified in src: strictly **50** (0 growth)
