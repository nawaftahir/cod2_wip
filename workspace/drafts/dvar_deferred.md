# src/universal/dvar.cpp deferred functions

Status: 63 of 125 `tu_map.tsv` rows matched in `ledger/matches.tsv` (50%+ of functions; all remaining functions are blocked by cross-TU `/LTCG` cascades, banned `__asm` in `I_fround`, or unimplemented dependencies, except `0x0048ca50 Dvar_StringToValue` which exhausted 3 tries at 96% `+0x68`).

`workspace/drafts/dvar_batch2_draft.cpp` holds the full source including `Dvar_GetString`.
`workspace/src/universal/dvar.cpp` keeps all non-banned functions except `Dvar_GetString` (blanked out so `com_files.cpp`'s `GetBspExtension` stays matched).

## Deferral reasons (PINNED on built exe + retail disasm)

1. **Banned `__asm` (`I_fround` FPU `fadd (1/(1<<30)); fistp`)**
   - `0x0048c890` `Dvar_StringToColor` (446B)
   - `0x0048fc90` `Dvar_RegisterColor` (478B)
   - `0x00490830` `Dvar_SetColorFromSource` (869B)

2. **Shared header `com_math.h` return type (`bool` vs retail `int`)**
   - `0x0048d7d0` `Dvar_ValuesEqual` (468B): calls `Vector2Compare` (`0x0048b760`, `int`), `VectorCompare` (`0x004794a0`, `int`), `Vector4Compare` (`0x00453410`, `int`), which are declared returning `bool` in shared `com_math.h` (not owned by `engine-1`).

3. **3-attempt limit reached (96%, 344/344)**
   - `0x0048ca50` `Dvar_StringToValue` (344B): epilogue `pop edi` scheduling differs by 1 slot at `+0x68` (`BOOL`) and `+0xc1` (`STRING`), likely coupled to stubbed `Dvar_StringToColor`.

4. **Missing `dvar_cmds.cpp` caller of `Dvar_PrintDomain` (`0x0048d780`) + `/LTCG` `Dvar_SetVariant` (`0x0048da90`) register cascade**
   - Without external callers of `Dvar_PrintDomain`, `/LTCG` inlines `Dvar_PrintDomain` into `Dvar_SetVariant` (`1104/968`) and shifts `Dvar_SetVariant`'s `dvar` param from `eax` to `ecx`, cascading into:
   - `0x0048f270` `Dvar_MakeLatchedValueCurrent` (15B, 86%)
   - `0x0048fe70..0x004904d0` `Dvar_Set{Bool,Int,Float,Vec2,Vec3,Vec4}FromSource` (6 fns, all 99% exact size!)
   - `0x00490cc0` `Dvar_SetFromStringFromSource` (144B; also calls `q_shared.cpp` `I_strncpyz`)
   - `0x00490d50` `Dvar_SetFromString`? / `0x00491210` `Dvar_SetFromStringByNameFromSource` / `0x00491280`
   - `0x00491380` `Dvar_Reset` (91B)
   - `0x004913e0` `Dvar_SetCheatsToReset` (48B, 97%)
   - `0x00491730` `Dvar_ResetDvars` (48B)
   - `0x00491890` `Com_LoadDvarsFromBuffer` (997B)

5. **Missing external callers in unlinked TUs (`/LTCG` stack vs register convention) and `q_shared.cpp` `CanKeepStringPointer` (`0x004969a0`)**
   - `0x0048dee0` `Dvar_ClearModified`, `0x0048df40` `Dvar_SetModified`, `0x0048dfa0` `Dvar_UpdateEnumDomain`,
     `0x0048e190..0x0048e330` `Dvar_Get{Bool,Int,Float}`, `0x0048e640` `Dvar_GetString` (omitted), `0x0048e710` `Dvar_GetVariantString`,
     `0x0048ec70` `Dvar_ClearFlagsFromAll`, `0x0048edd0` `Dvar_ChangeResetValue`, `0x0048efc0` `Dvar_MakeExplicitType`,
     `0x0048f150` `Dvar_ReinterpretDvar`, `0x0048f2b0` `Dvar_Reregister`, `0x0048f5e0` `Dvar_RegisterNew`,
     `0x0048f7c0` `Dvar_RegisterVariant` (also needs `CanKeepStringPointer`), `0x0048f900..0x0048fa10` `Dvar_Register{Bool,Int,Float,Vec2,Vec3,Vec4}`,
     `0x0048fa50` `Dvar_RegisterString` (also needs `CanKeepStringPointer`), `0x0048fb70` `Dvar_RegisterEnum`,
     `0x00490650` `Dvar_SetStringFromSource`, `0x00490bc0..0x00490c90` `Dvar_Set{Bool,Int,Float,Vec2,Vec3,Vec4,Enum,String}`,
     `0x00490d70..0x004910d0` `Dvar_Set*ByName`, `0x00491140` `Dvar_SetColorByName`,
     `0x00491410` `Dvar_Init`, `0x004915f0` `Dvar_LoadDvarsFromBuffer`.
