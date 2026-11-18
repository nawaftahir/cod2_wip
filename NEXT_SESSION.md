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

## Do not repeat
Everything in docs/TRIED.md. Spelling sweeps, declared-type changes, agent waves (11-18: 7 B per ~1.5M tokens).
Next real attack: IL-level differences in the functions compiled before the residues (heap and busy-set state).
