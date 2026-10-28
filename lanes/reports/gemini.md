# Cheap Agent Report: gemini

## Target File: `src/universal/com_shared.cpp`
- **Total functions in TU**: 14 (2,064 bytes)
- **Matched count**: 5 (441 bytes, all verified 100% byte-identical inside linked executable)
- **Deferred count**: 9 (1,623 bytes, all backed by 8 recorded tries and documented reasons)

### Verified Matches
- `0x0048af50` (`Com_StringContains`, 88 B): MATCH 100% at `0x004078d0`
- `0x0048b2a0` (`Com_HashKey`, 67 B): MATCH 100% at `0x00407930`
- `0x0048b2f0` (`Com_RealTime`, 96 B): MATCH 100% at `0x00407980`
- `0x0048b650` (`Com_Memcmp`, 153 B): MATCH 100% at `0x004079e0`
- `0x0048b760` (`VectorCompare2`, 37 B): MATCH 100% at `0x00407a80`

### Deferrals (8 Recorded Tries Each)
- `0x0048afb0` (`Com_Filter`, 587 B):
  Best 31% (sizes 645/587, first difference at +0x5). LTCG inlines `Com_StringContains` (0x48af50); comparator `I_strcmp` (0x496680 in `q_shared.cpp`) is currently unwritten.
- `0x0048b200` (`Com_FilterPath`, 153 B):
  Best 87% (sizes 154/153, first difference at +0x79) when compiled without internal `Com_Filter`. Matches 100% when `Com_Filter` is in the same TU, but deferred along with `Com_Filter` to prevent unverified count from growing.
- `0x0048b350` (`_copyDWord`, 138 B):
  Best 0%. Q3 inline assembly block with `test [edx+ecx*4+28], ebx`; clean check bans `__asm` in `src/`.
- `0x0048b3e0` (`Com_Memcpy`, 439 B):
  Best 39%. Retail assert coordinates lines 386/387 (`src || !count`, `dest || !count`); calls Q3 inline assembly `Com_Prefetch`.
- `0x0048b5a0` (`Com_Memset`, 170 B):
  Best 24%. Calls `_copyDWord` (`0x0048b350`); blocked until `_copyDWord` is resolved.
- `0x0048b6f0` (`Com_Prefetch`, 59 B):
  Best 0%. Q3 inline assembly block with `test byte ptr [ebx], al`; clean check bans `__asm` in `src/`.
- `0x0048b730` (`I_fmin`, 44 B):
  Best 52% (sizes 32/44, first difference at +0x15). `com_math.h` `TU_STATIC` inline helper emitted at TU end when referenced.
- `0x0048b790` (`VectorCopy4`, 23 B):
  Best 65% (sizes 23/23, first difference at +0x1). `com_math.h` `TU_STATIC` inline helper emitted at TU end when referenced.
- `0x0048b7b0` (`Byte4Compare`, 10 B):
  Best 0%. `com_math.h` `TU_STATIC` inline helper emitted at TU end when referenced.

## Verification
- `verify.py --all`: **421 / 421 rows match, 0 failures**
- Compiler rows: **2 / 2 match**
- Unverified in src: strictly **50** (0 growth)
