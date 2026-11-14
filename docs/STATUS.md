# CoD2MP_s.exe 1.0: status

## Numbers (`meter-1.0.json`, accept ed7898a3 on 11-13, clean gate)
- Whole file same-offset: 1,699,582 / 1,699,840 = **99.985%** (258 B left). PE header equal to retail (two-pass mss32.lib).
- 11-13: 1.3 fixes ported (Rich, AdsOverlay, CG_CalcCrosshairPosition +380, Sway); IW folder layout mirrored from 1.3,
  exe byte-identical (05427834, 7b0fd376). No longer parked: 1.0 and 1.3 share every remaining residue.
- Left (bytes): FX_CalcOriginAndAxis 56, CG_DrawCursorhint 30, CG_DrawGrenadePointer 16, G_GetPlayerViewOrigin 16,
  XAnimCalc 15, EvalPrimitiveExpression 14, CG_CalcCrosshairPosition tail 12, Item_ListBox_MouseEnter 11,
  DSound_UpdateSample 9 (tie), ~20 fns <= 7 B, data/address ~40. State per fn: client-1.3/docs/KNOWLEDGE.md.

## Remaining items (state 11-03, causes in KNOWLEDGE.md, attempts in TRIED.md)
| Item | Bytes | Next attack |
|---|---|---|
| CG_CalcCrosshairPosition | ~392 | /Op gates block every spelling; yaw must arrive as a by-value formal. Find evidence of such a helper, else DEFER |
| FX_CalcOriginAndAxis | 86 | stack-packer slot roles of cylinder height/width |
| CG_DrawCursorhint 30, AdsOverlay 29, GrenadePointer 16, XAnimCalc 15, EvalPrimitiveExpression 14, CalcViewValues 4 (diff lines) | ~110 | x87/int issue order; first-reference rule not yet tried on all |
| Numbering ties, 720.0f slot, Com_ErrorCleanup/subtitle static swap, Rich entry order | ~140 | link-position search exhausted |
| Rich header: 6 code-free C++ TUs | 4 B header + identities | identify the real TUs (Mac STABS candidates); replace the `unknown/empty_N.cpp` stand-ins |
| Stand-ins (KNOWLEDGE.md section 5) | 0 B now | must become real code before release |
| mixerGetRecordLevel 2-byte patch | 2 | post-link step, owner decision |

## Next
1. Identify the 6 code-free TUs (Rich 265 real vs 271), then settle the tie list once.
2. Then the stand-ins, one per session, each through `tools/ratchet10.sh`.

## Whole-file checklist
See `WHOLEFILE.md`.
