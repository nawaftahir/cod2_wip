# src/xanim/dobj.cpp deferred functions

Status: 33 of 56 `tu_map.tsv` rows matched in `ledger/matches.tsv` (28 new in batches 1+2, +5,445 bytes total). All 23 remaining `dobj.cpp` functions are either exhausted at 3/3 attempts, blocked on banned `__asm` in `FastSinCos`, or blocked on unimplemented TUs (`scr_stringlist.cpp`, `xmodel.cpp`, `win_qe3.cpp`, `com_files.cpp` boundary).

## 1. Exhausted 3/3 attempts (`workspace/drafts/dobj_attempt3_bounds_matrixarray.cpp`)

- `0x004a41d0` `DObjSetBounds` (688 B, PINNED)
- `0x004a4f90` `DObjGetMatrixArray` (236 B, PINNED)

## 2. Blocked on banned `__asm` in `FastSinCos` (`workspace/drafts/dobj_blocked_fastsincos.cpp`)

- `0x004a6ff0` `DObjSetLocalTagInternal` (320 B, SUPPORTED — attempt 1/3, 25%, 358/320 B): retail inlines `FastSinCos` `fsincos` at `+0x48, +0x72, +0x9d` (`client-1.0/build/tree/universal/com_math.h:389-404`), whereas non-asm `FastSinCos` emits 6 calls to CRT `sin`/`cos`.
- `0x004a71d0` `DObjSetLocalBoneIndex` (52 B, SUPPORTED — attempt 1/3, 36%, 47/52 B): calls `DObjSetLocalTagInternal` and inherits shifted `/LTCG` register allocation (`ebx`/`edi` vs `edi`/`esi`).

## 3. Header / cross-TU inlines attributed to `dobj.cpp`

- `0x004a16d0` `MatrixTransformVectorQuatTransEquals` (114 B, SUPPORTED): inline in `workspace/src/xanim/xanim_public.h:707`; calls `0x004826e0` (`ConvertQuatToMat` in `com_files.cpp` boundary).
- `0x004a1750` `QuatMultiplyReverseEquals` (151 B, SUPPORTED): inline in `workspace/src/xanim/xanim_public.h:722`; `/LTCG` custom `eax`/`ecx` regs from `DObjCalcSkel`.
- `0x004a17f0` `QuatMultiplyEquals` (151 B, SUPPORTED): inline in `workspace/src/xanim/xanim_public.h:736`; `/LTCG` custom `eax`/`ecx` regs from `DObjCalcSkel`.
- `0x004a5a60` `DObjBad` (117 B, OUTLIER): inlined from `xmodel.cpp` (`#line 39`).
- `0x004a6f70` `DObjHasContents` (126 B, OUTLIER): inlined from `xmodel.cpp` (`#line 396`).

## 4. Blocked on unimplemented external TUs

- `0x004a1500` `DObjShutdown` (56 B) & `0x004a4970` `DObjFree` (384 B): call `0x004a9ba0` (`SL_RemoveRefToStringOfLen` in `scr_stringlist.cpp`, `/LTCG` `eax` reg arg `0x11` in `0x004a151f`).
- `0x004a48e0` `DObjClone` (131 B, `workspace/drafts/dobj_blocked_sl_addref.cpp`): calls `0x004a9b00` (`SL_AddRefToString` in `scr_stringlist.cpp`).
- `0x004a4480` `DObjCreate` (1109 B): calls `0x004a8b80` (`scr_stringlist.cpp`), `0x004aaba0` (`xmodel.cpp`), `0x0047ae50` (`win_qe3.cpp`).
- `0x004a1890` (265 B): calls `0x004aaba0` (`xmodel.cpp`).
- `0x004a19a0` `DObjCreateDuplicateParts` (1376 B): calls `0x004a9080` (`scr_stringlist.cpp`) and `0x004a1890`.
- `0x004a1f00` `DObjGetHierarchyBits` (837 B), `0x004a2250` `DObjCompleteHierarchyBits` (818 B), `0x004a2700` `DObjCalcSkel` (6700 B): call `0x004a19a0` (`DObjCreateDuplicateParts`).
- `0x004a57e0` `DObjGetBoneIndex` (211 B): calls `0x004a8fc0` (`SL_IsLowercaseString` in `scr_stringlist.cpp`, `/LTCG` `eax` reg arg) and `0x004a1890`.
- `0x004a7130` `DObjSetControlTagAngles` (80 B) & `0x004a7180` `DObjSetLocalTag` (71 B): call `0x004a57e0` (`DObjGetBoneIndex`, `/LTCG` `esi` reg arg) and `DObjSetLocalTagInternal` (banned `__asm FastSinCos`).
- `0x004a5af0` `InvMatrixTransformVectorQuatTrans` (120 B) & `0x004a5b70` `DObjTraceline` (3787 B): call `0x004826e0` (`ConvertQuatToMat` in `com_files.cpp` boundary; `0x004a5b70` also calls `0x00482910`).
