# Next session: CoD2MP_s.exe 1.3 (then 1.0) to 100%

Worktree `dev/cod2_wip/.worktrees/w29` (branch `client/1.3/w29`, equal to `client/1.3/main`).
State 11-18: 1.3 1,974,158 / 1,974,272 same-offset (114 B, all .text); 1.0 (w10o) 1,699,707 / 1,699,840 (133 B).
Gate: `tools/ratchet13.sh` / `tools/ratchet10.sh` with absolute ANCHOR/DXSDK; clean builds only for accept.
Lab slots: `.worktrees/w29a`, `w29b`, `w29c` (reset to client/1.3/w29 and lab every touched obj before use).

## What is left (1.3)
FX_CalcOriginAndAxis 56, CG_DrawCursorhint 17, XAnimCalc 15, VM_Notify 6, CG_DrawGrenadePointer 6,
Menu_SetNextCursorItem 5, Window_Paint 4, nb_decode 3, FX_AddFxToScene 2. 1.0 adds DSound_UpdateSample 9,
CL_SetCGameTime 6, Pickup_Weapon 4 (heap-pointer ties, KNOWLEDGE 33).

## Facts to start from (KNOWLEDGE.md, 11-18)
- `tools/fdiff.py` stops at 60 output lines unless a 6th arg is given (use 100000). FX real base = 116 lines.
- Local picks: per-class round robin, next FREE reg after the pointer (`tools/c2rr13.sh`, `tools/c2pk13.sh`).
  Rotated residues = a different busy set at a pick, not missing dead picks (CG_BuildSolidList control).
- XAnimCalc: retail = our pick order (parts t8e0, obj t849, animToModel t8e1) with the pointer one step further
  right after byte pick 12. Find what takes that step.
- FX: retail branch-4 height shares its GetVal temp slot (0x2c), width alone at 0x30; weight order alone cannot
  give the 8th entry (one more retail item overlaps width).
- Load CSE is per definition of the pointer var: a same-value re-def ends the family (CG_FireWeapon win).

## Exact pointer routes (KNOWLEDGE 11-18, winedbg force = fdiff 0)
- XAnimCalc: (A) base order + pointer +1 after byte pick 12, or (B) `unsigned int modelName = obj->animToModel[entry];`
  in the else arm + pointer at ecx after pick 12. x1 + a cross-arm byte `counter` gives the whole else arm (route B) but
  the counter load folds into `[edx+eax*2]` and a loop entry loses its jmp (15 lines).
- Menu_SetNextCursorItem: Item_SetFocus on the direct expression + loop entry test not a pick. Every loop shape tried
  (while, for(;;)+break, goto into the test, guarded do/while, CoD4 do/while) still makes the entry test pick 1.
- FX_AddFxToScene: the model load must not be a pick (TRIED 511).

## 11-18 late mechanism notes (KNOWLEDGE tail)
- Menu: both loop tests are `cmp mem(cursor), t` with t an uncoloured kind-3 CSE temp; the bit-4 action loads the
  cursor side into a register-less temp = the local pick. The increment block's edx/ecx come from post-pick lowering of
  `inc mem`, so they never move the pointer. Need: a source form whose ENTRY test has no uncoloured CSE temp.
- FX: slot packer is newest-entry-first; decoded conflict graph: width conflicts only with height. With that graph no
  item order leaves width alone (retail 0x30), so retail's IL gives width more conflicts or a hidden R4 item.
- nb_decode: SR base/index order looks tied to walker vs diff temp numbers (VecNCompare vs lsp_dist examples).

## Do not repeat
Everything in docs/TRIED.md. Spelling sweeps, declared-type changes, agent waves (11-18: 7 B per ~1.5M tokens).
Next real attack: IL-level differences in the functions compiled before the residues (heap and busy-set state).
