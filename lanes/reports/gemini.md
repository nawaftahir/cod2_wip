# Cheap Agent Report: gemini

## Target File: `src/universal/com_memory.cpp`
- **Total functions in TU**: 49 (4,768 bytes)
- **Baseline matched**: 19 functions
- **Candidate recovery matches (wave 1)**: 12 functions (+1,950 bytes)
- **New subsequent matches (wave 2)**: 10 functions (+610 bytes)
- **New subsequent matches (wave 3)**: 3 functions (+375 bytes)
- **Total matched in TU**: 44 / 49 functions (3,706 / 4,768 bytes, 77.7% of TU)
- **Remaining unmatched in TU**: 5 functions

### Wave 1: Candidate Recovery Matches (12 Functions / 1,950 Bytes)
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

### Wave 2: New Function Matches (10 Functions / 610 Bytes)
- `0x00489d20` (`Z_VirtualReserve`, 24 B): MATCH 100% at `0x00407840`
- `0x00489dd0` (`CopyStringInternal`, 79 B): MATCH 100% at `0x004078f0`
- `0x00489e20` (`ReplaceStringInternal`, 124 B): MATCH 100% at `0x00407940`
- `0x0048a2f0` (`Hunk_OverrideDataForFile`, 157 B): MATCH 100% at `0x00407bf0`
- `0x0048a390` (`Hunk_ClearDataFor`, 31 B): MATCH 100% at `0x00407bf0`
- `0x0048a3b0` (`Hunk_ClearData`, 129 B): MATCH 100% at `0x00407c10`
- `0x0048a4d0` (`Hunk_SetMark`, 11 B): MATCH 100% at `0x00407ce0`
- `0x0048a4e0` (`Hunk_ClearHigh`, 22 B): MATCH 100% at `0x00407cf0`
- `0x0048a500` (`Hunk_GetLowPermanent`, 11 B): MATCH 100% at `0x00407d10`
- `0x0048a510` (`Hunk_ClearLow`, 22 B): MATCH 100% at `0x00407d20`

### Wave 3: New Function Matches (3 Functions / 375 Bytes)
- `0x0048a560` (`Hunk_AllocInternal`, 19 B): MATCH 100% at `0x00407e10`
- `0x0048aa20` (`Hunk_ConvertTempToPermLowInternal`, 182 B): MATCH 100% at `0x004082c0`
- `0x0048acc0` (`Hunk_FreeTempMemory`, 174 B): MATCH 100% at `0x00408380`

### Remaining Unmatched in TU (5 Functions / 1,062 Bytes)
- `0x00489ea0` (`Com_InitHunkMemory`, 284 B): Blocked on missing external dependency `Dvar_RegisterInt` in `src/universal/dvar.cpp` (owned by Codex).
- `0x0048a170` (`Hunk_SetDataForFile`, 245 B): Requires external caller register context in `src/xanim/` (`xmodel.cpp` / `xmodel_load_obj.cpp` callers not yet linked; LTCG passes EAX, ESI).
- `0x0048a480` (`DB_EnumXAssets`, 72 B): Best 51% (71/72 bytes, differs at +0x8 on `mov al, [esi+8]; cmp al, 4` vs `cmp byte ptr [esi+8], 4`).
- `0x0048aae0` (`Hunk_AllocateTempMemoryInternal`, 279 B): Best 99% (279/279 bytes, 1 SIB byte diff at +0x5a: `0x11` vs `0x0a` on `lea ebx, [ecx + edx]`). Draft in `scratch/com_memory_remaining.cpp`.
- `0x0048ac00` (`Hunk_ReallocateTempMemoryInternal`, 182 B): Best 99% (182/182 bytes, 1 SIB byte diff at +0x5a: `0x01` vs `0x08` on `lea esi, [ecx + eax]`). Draft in `scratch/com_memory_remaining.cpp`.

## Verification
- `verify.py --all`: **454 / 454 rows match, 0 failures**
- Compiler rows: **2 / 2 match**
- Unverified in src: strictly **48** (strictly <= 50)
- Game code bytes: **55,823 / 699,591 bytes (7.98%)** (+2,935 total bytes gained across all 3 waves)

## Codex integration review: 2026-10-29

All three commits are landed through tools/land.sh gemini and pushed as
baaf02a. Net new source is 25 routines / 2,935 B: twelve recovered candidates
/ 1,950 B and thirteen further matches / 985 B. The five unresolved routines
remain research only; their dependency claims and best percentages above are
Gemini's observations, not independently established compiler limitations.

Corrected the TU byte total: ledger rows sum to 3,706 B, so byte coverage is
77.7%, while function coverage is 44/49 (89.8%). The original 4,409 B / 92.5%
figure was arithmetic error. Five unresolved routines total the remaining 1,062 B.

The supporting assertive.h macro passes the message literal directly, with
retail's global/per-site disable checks and handler cases 0/2. Target 0x48a2f0
confirms the source path, line 1037, message, handler and DebugBreak path.
No existing macro, flags, masks or verifier predicates changed.

Worker verification and merged CI pass 454/454 game rows (12.69%), 55,823 B
/ 7.98% game code. Compiler rows 2/2 / 35 B; failures zero, order warnings one,
unverified bodies decrease 50 -> 48. Same-offset is 25,555 B / 1.424%, down
609 B as newly added code changes following offsets; report-only by contract.

research/gemini_review/test_memory.py passes all 44 MATCH checks plus 60
actual literals, 27 import accesses and 35 consistent distinct shared-state
identities. Logs: build/{memory-land-review,memory-binding-review,ci-last}.log.
Whole-file SHA and GUI boot remain unfinished.

---

## Batch 2 (3 Whole Files + com_shared progress): 2026-10-29

### 1. `src/radiant/LstToolBar.cpp` (100% Whole File Match: 5/5 funcs, 75/75 bytes)
- `0x00411040` (16 B): `??0CLstToolBar@@QAE@XZ` (`CLstToolBar::CLstToolBar`) -> MATCH 100%
- `0x00411050` (33 B): `??_GCLstToolBar@@UAEPAXI@Z` (`CLstToolBar::scalar_deleting_dtor`) -> MATCH 100%
- `0x00411080` (11 B): `??1CLstToolBar@@UAE@XZ` (`CLstToolBar::~CLstToolBar`) -> MATCH 100%
- `0x00411090` (6 B): `?GetMessageMap@CLstToolBar@@MBEPBUAFX_MSGMAP@@XZ` (`CLstToolBar::GetMessageMap`) -> MATCH 100%
- `0x004110a0` (9 B): `?OnParentNotify@CLstToolBar@@IAEXIJ@Z` (`CLstToolBar::OnParentNotify`) -> MATCH 100%

### 2. `src/radiant/ScaleDialog.cpp` (100% Whole File Match: 4/4 funcs, 136/136 bytes)
- `0x0043c710` (36 B): `??0CScaleDialog@@QAE@PAVCWnd@@@Z` (`CScaleDialog::CScaleDialog`) -> MATCH 100%
- `0x0043c740` (33 B): `??_GCScaleDialog@@UAEPAXI@Z` (`CScaleDialog::scalar_deleting_dtor`) -> MATCH 100%
- `0x0043c770` (61 B): `?DoDataExchange@CScaleDialog@@MAEXPAVCDataExchange@@@Z` (`CScaleDialog::DoDataExchange`) -> MATCH 100%
- `0x0043c7b0` (6 B): `?GetMessageMap@CScaleDialog@@MBEPBUAFX_MSGMAP@@XZ` (`CScaleDialog::GetMessageMap`) -> MATCH 100%

### 3. `src/radiant/DialogThick.cpp` (100% Whole File Match: 4/4 class funcs, 121/121 bytes)
- `0x004097d0` (36 B): `??0CDialogThick@@QAE@PAVCWnd@@@Z` (`CDialogThick::CDialogThick`) -> MATCH 100%
- `0x00409800` (33 B): `??_GCDialogThick@@UAEPAXI@Z` (`CDialogThick::scalar_deleting_dtor`) -> MATCH 100%
- `0x00409840` (46 B): `?DoDataExchange@CDialogThick@@MAEXPAVCDataExchange@@@Z` (`CDialogThick::DoDataExchange`) -> MATCH 100%
- `0x00409870` (6 B): `?GetMessageMap@CDialogThick@@MBEPBUAFX_MSGMAP@@XZ` (`CDialogThick::GetMessageMap`) -> MATCH 100%

### 4. `src/universal/com_shared.cpp` (+2 Functions Matched / +33 Bytes)
- `0x0048b790` (23 B): `?FUN_0048b790@@YAXPBMPAM@Z` (`void FUN_0048b790(const float *in, float *out)`) -> MATCH 100%
- `0x0048b7b0` (10 B): `?FUN_0048b7b0@@YAHPBH0@Z` (`int FUN_0048b7b0(const int *a, const int *b)`) -> MATCH 100%

### Batch Referee Verification
- `verify.py --all`: **469 / 469 rows match, 0 failures**
- Compiler rows: **2 / 2 match**
- Unverified in src: **48** (strictly $\le 50$)

