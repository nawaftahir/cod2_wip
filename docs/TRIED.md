# CoD2MP_s.exe 1.0: tried and failed (do not repeat)

Each row was measured. Tags/spec names point into `archive/LESSONS.md` and the old tree's
`lab/w200/inl_notes.txt` (archived). Add a row after every revert; delete a row if it is later solved.

## Whole classes (do not retry anywhere)
| Idea | Result |
|---|---|
| Automated compare/ternary/swap sweeps on near-misses (sweep.py, vary.py, cm1 600 variants) | 0 of 80 / 0 gains; residue was RA/scheduling |
| Picking big fns with 2-12 diff lines (w16) | 0 of 21; residue = scheduling/RA ties |
| Re-attacking a failed fn without new evidence (w10) | 0 bytes |
| Decompiling 1.2/1.3 clients for 1.0 evidence | hard fns byte-identical, same toolchain |
| Other compiler builds (Toolkit 2003 1.0 c2 3052, 1.01) | identical code |
| `static inline` (TU_STATIC) as on the server for com_math/com_files | .text +16 KB, alignment flips; client uses plain `inline` |
| Per-caller inline budget on the cost-model path | does not exist (budget only for uncompiled callees) |
| `#pragma inline_depth`, TU-wide `/Ob1`, `/Og-` to steer split inline decisions | no decision change, or changes callee code |
| Clearing a callee register summary (pragma g off, dead calls, cl flags) | changes callee code or nothing |
| Dropping `static` from static __forceinline helpers | exe identical |
| Link-order position search for ties (empty TUs, possearch6) | spent: only empty_1 moves |
| Global LTCG regime flip (~88-100 KB when voice code calls Com_Printf) | unresolved; history `archive/ltcg-flip-log.md` |
| Invented vanished callees / `if (0) Foo();` | proves a mechanism, never shippable |
| Removing com_endParseSessionUnderflow, literal per site | string emitted early, .rdata 92.55% |
| Replacing all Com_EndParseSession stand-ins at once | .text +96 B |
| Speex TUs as C | bits.c alone landed (tie listed); all speex as C costs ~23 B in ties |
| mss32.lib member order for Rich entries | no effect; first mss reference in LTCG output decides |

## Per function (open ones; current residue in STATUS.md)
| Function | Tried (no gain) |
|---|---|
| CG_CalcCrosshairPosition | halfFov/dot locals ch3, ch6-ch9, chx2, float tan overload, gunYaw re-spellings, Mac/Kisak forms. /Op gates block every spelling of the yaw store (10-31g): stop re-spelling; needs a by-value formal with evidence |
| FX_CalcOriginAndAxis | decl order, inlined yaw/pitch, block-scoped len, width-before-height, height*flrand, block-local height/both, reused GetVal, Mac cylinder order fx11_g, no width local, primTemp alias, split height |
| CG_DrawCursorhint / AdsOverlay / GrenadePointer | ra11_a1, gpa_5..8, aov1/2, (double) sum (no evidence); issue-order only |
| XAnimCalc | temps/parts reuse, CoD2rev shape (aligned frame) |
| EvalPrimitiveExpression | split float cases without goto, server form (two EvalFloat calls) |
| CG_CalcViewValues | BG_GetSpeed term order gs1 (v1*v1 first landed instead) |
| XModelCalcBasePose | server form + /Op TU flag (xcb1/2), term/quat order xb1/xb2, inline_depth, moving the def |
| Com_ShutdownInternal align | removing static; cut search (cutinto.py) |
| CL_InitServerInfo split | cost model gives no split |
| VM_Notify / RemoveVariable splits | server bodies vmn1/sa1, inline_depth(1), /Ob1 |
| XAnimSetTime in CG_UpdateKillCam | real call refused (r 107), CoD4 shape equal |
| GetBestOffhand | real call gbo1/gbo3, CoD4 nested gbo2 (-75 B) |
| Item_ListBox_HandleKey in Scroll_ListBox_AutoFunc | needs constants unfolded; no evidence for the form |
| BG_ParseCommands | strnicmp stand-in args swapped (ALL -54), real call refused |
| Com_LoadSoundAliasFile | real SkipRestOfLine/ParseOnLine refused (esn2) |
| IntersectPlanes | z double, int ok, decl order, `!(fabs>=)` |
| Window_Paint | int cycle o4_wp2, fa/fi in case 1 (C2360) |
| DSound_UpdateSample | return len1+len2, {p;len} pair, dataOffset sum, extra len2 guard |
| CG_FireWeapon / StartWeaponAnim | fw1 Q3 form, i=1..20 loop swa1; IV update order fixed pre-RA |
| Menu_SetNextCursorItem / Item_ListBox_MouseEnter | cursor pointer local, single item local, rect pointer |
| G_GetPlayerViewOrigin | server verbatim, > flip, delta local |
| 720.0f pool slot | fire_grenade and Mantle_CreateAnims share a sweep; link order only |
| Com_ErrorCleanup / subtitle static swap | link-position search exhausted |
| Rich (28,9466)/(25,9466) order | mss32 member order |
| Remaining 6 Rich C++ objects | PunkBuster/libwww (1.2+), fft/convexhull (renderer), Kisak speex extras ruled out; `unknown/after_*.cpp` placeholders have invented identities |
| psweep10 (11-14, w29-10) on 1.0 FX_AddFxToScene, Pickup_Weapon, SV_DirectConnect, Menu_SetNextCursorItem, StartWeaponAnim, CG_FireWeapon, Item_ListBox_MouseEnter | `((rhs))` per assignment, whole fn | every variant identical to base: none of these is a region-cut residue |
| SV_DirectConnect / Pickup_Weapon 1.0 (w29-10, 11-15) | shared diff: after an early `ret`, two param loads swap (retail loads from.type [esp+0x454] before [esp+0x45c]); SV_DirectConnect lab: `guid = 0` moved before the quick-reject loop | 2333 B, 44 lines (worse). Hoisted netadr_t pieces of `from` for the challenge loop; order is scheduler creation-index. Tool /home/nawaf/w29/l10g.sh |
