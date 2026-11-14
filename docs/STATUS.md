# CoD2MP_s.exe 1.3: status

## Numbers (`meter-1.3.json`, last accept e7778762 on 11-14, clean gate)
- Whole-file same-offset 1,973,410 / 1,974,272 = **99.956%**, 862 B differ (BSL matched, MOTD "1.3", Sway). All strings equal retail. PE header fully equal to retail
  (Rich fixed 11-13 by the two-pass VC7.0 lib.exe mss32.lib build; timestamp/CheckSum/RSDS set at link time).
- Matched-fn bytes 1,563,230. Functions identical 9,485 / 9,504. TUs: empty TUs count as identical since 11-12
  (owner decision, tools/meter.py).
- Source tree follows IW's layout since 11-13 (docs/LAYOUT.md, 281/370 TUs pinned by Mac 1.3 STABS).

## 11-14 w29: +13 (Cursorhint h add in double, KNOWLEDGE 26), same-offset 1,973,423 (849 B left). New tools: fast
non-/GL harness /home/nawaf/w29/x13.py (x87 roles), tools/c2sched13.sh + decoded scheduler (KNOWLEDGE 27), Ghidra c2 project.
1.0 port of the same fix is green (+13) on client/1.0/w29 (19ef37a1), parked until 1.3 is done (owner 11-14).

## 11-14 late (w29/w32a): +32 via the scheduling-region cut (KNOWLEDGE 27): G_GetPlayerViewOrigin matched (+16),
IntersectPlanes matched (+6), GrenadePointer +10 (2 lines left). Same-offset 1,973,455 (817 B left). Tool tools/psweep13.py
(`((rhs))` per assignment, greedy). Swept with no change: CG_FireWeapon, StartWeaponAnim, Window_Paint, MouseEnter,
Crosshair head, Menu_SetNextCursorItem, Objective 244-276, XAnimCalc 1676-1760, Cursorhint.

## Remaining 955 B (handoff 11-13; per-item state lives in KNOWLEDGE.md, never repeat a TRIED row)
1. CL_ConsolePrint_AddLine 532: parked with an exact model of c2's colour priority (KNOWLEDGE 17, STATE w21):
   outer charWidth n3 -192 must beat targetLineWidth -157; retail bytes show no instruction-level difference
   in charWidth's range. Block weights decoded (w22: 1 << natural-loop depth, same CFG as retail, so not the
   lever). Next: the round-end test (loop constant nodes + `_p` emptied by targetLineWidth's ebx pick).
   Tool: tools/c2opwalk13.sh (GAIN=1/2, A/B/C/Q/X hooks).
2. CG_BuildSolidList: MATCHED (w23, KNOWLEDGE).
3. ~16 small fns ~160: per-fn state lines in KNOWLEDGE 25 (w13). Levers that paid: redundant parens (x87),
   if/else vs ternary store count (slot weight). Next: c2opwalk13-style trace per fn.
4. Compile-order data + address operands ~134: Com_ErrorCleanup, fire_grenade, CL_DemoCompleted each one
   compile pass off; source, callees, obj owner and peel model ruled out (w3/w7/w11/w18). Needs a new idea.
5. FX_CalcOriginAndAxis 54: slot item weight = IL ref count; height/len need <= 3 refs, no
   behaviour-preserving shape found; retail inlines VectorMA too (w12).
6. CG_CalcCrosshairPosition tail ~12: dot-term order only; set by direct gunDir[k] reference order; needs the
   c2 site that picks the commutative x87 operand (w14).

## Policy (owner)
- Structure first; accept only clean builds; ties in data/ties13.txt never count.
- Agents: own worktree, grep TRIED before every lab, scratch in /home/nawaf/<worktree>/ only, rebase +
  ancestor check before pushing main. Max 3 agents at a time.
