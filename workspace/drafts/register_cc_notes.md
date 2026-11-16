# Register-argument helpers (lane a, 2026-11-16)

## I_strncpyz 0x00496430: RESOLVED
Source form: the CoD2rev body plus three asserts (`src`, `dest`, `assertMsg((destsize >= 1), "(destsize) = %i", destsize)`)
under `#line 546` so the asserts sit on retail lines 548-550. Attempt 1 matches 100% (245 B).
The old "perturbs Dvar_SetFromString" was a wrong ledger row: 0x00490ba0 is a Dvar_SetBool wrapper
(esi=dvar, calls 0x0048fe70 = Dvar_SetBoolFromSource with the bool and source 0), not Dvar_SetFromString.
It only matched before because Dvar_SetFromStringFromSource happened to take dvar in esi. Row renamed to Dvar_SetBool: matches.
Callers now matching: FS_GetHandleAndOpenFile, FS_FOpenFileWrite, FS_FOpenTextFileWrite, FS_FOpenFileAppend, FS_OpenFileForWrite.
Still commented out as DEFERRED in q_shared.cpp (callers of I_strncpyz, now unblocked): Com_DefaultExtension, the Q_strcat-style
function at ~749, ParseConfigStringToStruct.

## CopyStringInternal 0x00489dd0: OPEN (2 attempts)
Row already matches (79 B). Problem is only that FS_AddFileToList 0x004803e0 gets it inlined.
Facts: retail has 6 call sites (Dvar_InternString, Dvar_PerformUnregistration, Dvar_RegisterNew, Sys_ListFilteredFiles,
Sys_ListFiles, FS_AddFileToList); ours has the same 6 sources, 5 keep the call, only the smallest caller inlines.
1. Drop the unused 4th param allocType: AddFileToList code identical (23%), but FS_ListFiles (33/36 B),
   FS_ListFilteredFilesOfDirType and FS_GetFileList regress. Retail keeps passing allocType. Reverted.
2. Compared CopyStringInternal shape to CoD2rev and retail: same. Retail AddFileToList takes name in eax, nfiles in edi;
   ours keeps name in ebx because of the inlined body.
Next ideas (not tried): link-order effects (com_files.obj is before com_memory.obj); needs owner flags/order decision.
