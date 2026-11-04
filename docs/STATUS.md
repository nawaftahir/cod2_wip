# CoD2MP_s.exe 1.0: status

## Numbers (`meter-1.0.json`, commit b2af8f89; only the gate writes them)
- Whole file same-offset: 1,699,171 / 1,699,840 = **99.961%** (669 B left). PE header excluded by shameter.
- Sections same-offset: .text 1,408,369 / 1,408,683; .rdata 200,690; .data 100%; .rsrc 100%.
- Matched functions: 7,154 / 7,269 game fns, 1,336,591 matched-fn bytes. TUs in `src/`: 181 / 271.
- Not SHA-identical yet. Parked by the owner (11-04) while 1.3 runs: work here only on new evidence.

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
