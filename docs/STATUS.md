# CoD2MP_s.exe 1.3: status

## Numbers (`meter-1.3.json`, meter commit 4aaa2370, written by the f44e3a7d accept; reproduced clean on t1 11-11)
- Whole-file same-offset 1,971,472 / 1,974,272 = **99.858%** (header 4,092/4,096, .text 1,643,925, .rdata 229,250, .data 77,821, .rsrc 16,384; .rsrc complete). 2,800 B differ: breakdown at the top of `TAIL_1.3.md`.
- Matched-fn bytes 1,554,513 / 1,645,581 .text = **94.47%** (8,979 / 9,547 fns). Functions identical (match or same bytes in place) 9,471 / 9,504. TUs in `src/` 150 / 370, unverified_in_src 0.

## Finish-line inventory (w6, 11-12, clean gate after the HTEvtLst fix: same-offset 1,972,877, 1,395 B differ)
diffclass13: .text code 1,257 + addr 63, .rdata data 63 + addr 5, .data addr 3, header 4. Per-class detail below was
measured on the 1972713 baseline; the LoadServerDll (70 B) and HTEvtLst timer-order (94 B) fixes are gone since:
- PE header 4 B: only the Rich (25,9466)/(28,9466) swap (0xca/0xcc/0xd2/0xd4). TimeDateStamp, CheckSum (0), e_lfanew and all other fields equal.
- Debug dir / RSDS: identical (GUID, age, timestamp, PDB path). Done at link time, not post-link: Makefile runs link under
  libfaketime (`FAKETIME=2006-05-02 00:09:51`) and LD_PRELOAD `tools/guidpin.c` (feeds PDB_GUID to UuidCreate). No owner decision needed.
- .text code 1,426 B in 49 fns: CL_ConsolePrint_AddLine 532, CG_CalcCrosshairPosition 391, CG_BuildSolidList 88, FX_CalcOriginAndAxis 56,
  Timer_set/deleteWindowsTimer + fn_54ed70 + HTEventInit 94 (order, now FIXED), CG_DrawCursorhint 30, CG_DrawAdsOverlay 29, CG_DrawScoreboard_Objective 26,
  then 38 fns <= 16 B (scheduling/regs, .bss/__real address operands).
- .rdata 68 B (was 126): __real pool order (1000.0, 720.0f, neighbours; compile order, KNOWLEDGE data1).
- .data 3 B: address operands. .rsrc 0.
- Rich swap is the only header blocker: original Miles mss32.lib unavailable (KNOWLEDGE); owner decision if no lib is found.

## Policy (owner, 11-04)
- Structure first: a change that makes the function set / data / positions retail-equal is accepted when only
  listed ties flip (`data/ties13.txt`, each with a reason).
- Accept only clean builds. Never leave a tree on an experiment branch others copy from.

## Open leads (best first)
1. Drift: first break now CL_BlendSavedScreen (-192 B: ours 9 B, retail has a full fn at 0x402260), then
   16 B steps in cl_cin/console/input, cl_keys +176, cl_main_mp connect code. CL_SetExpectedHunkUsage and
   CompleteCommand 1.3 are in.
2. PunkBuster client: PbClGameQuery, PbClGameMsg, PbClientInitialize, stPbCl::initialize, fn_4bb450 and
   CL_ConnectionlessPacket (one fn, 2,658 B) are matched (11-05). Left in pbcl: UnloadClientDll, ~stPbCl
   (retail passes `this` in esi/ecx per caller), PbClientProcessEvents/CompleteCommand/Connecting.
3. (done, see 2)
4. CL_CheckForResend full 1.3 (812 B, one stack-slot order left: data/info/pbBuf).
5. CL_ConsolePrint_AddLine: in tree, 6 register hunks.
6. Com_Init_Try_Block_Function: multi-core block (GetProcessAffinityMask, r_smp_backend_allowed), frame 0x24 vs 0x20.
7. libwww leftovers (~1 KB): HTCache_isFresh, HTEvtLst stopLoop/init/pump/loop, HTBlackHole/HTErrorStream constants.
8. Bundle-pending gains held back by tie re-rolls: fn 0x40d310 call in CL_Frame, UI PB fns.
9. Top unmatched by size: `archive/NOTES_1.3.md` "TOP40" (UI_RunMenuScript, CG_EntityEvent, nb_decode, ...).

## Next session
Lead in `client-1.3`, up to 6 agents in `.worktrees/<work>` (one area each, briefs name `TRIED.md`), lead
merges and runs `tools/ratchet13.sh` on a clean build, bundling tie losses until net >= 0.
Evidence only: Mac 1.3 STABS, lnxded-1.3 source, retail bytes. Client 1.0 is parked.

Handoff (11-13, same-offset 1,973,317 / 1,974,272). Remaining residue, grep TRIED before any lab:
- CL_ConsolePrint_AddLine 532 B: parked. Needs the exact n3 model: a block-weight trace, or work from the targetLineWidth side (KNOWLEDGE 17, STATE w21).
- CG_BuildSolidList 88 B: walker `cg->nextSnap->entities` + `if (snap->numEntities <= 0) return;` (lab g2) gives retail colouring and loop entry.
  Left: local-temp rotation one pick off (snap ecx vs eax) and the edi/ebx push order; size 234 vs 241. g2 gated -68 same-offset, so not
  landed. Next: the source change that adds one local pick before the snap load (KNOWLEDGE 20 rule) on top of g2 (KNOWLEDGE BSL w20 lines).
- FX_CalcOriginAndAxis 54 B: no source shape found yet; look at the height/len refs.
- ~16 small fns (<= 16 B each): see the state lines in KNOWLEDGE 25.
- Crosshair tail ~12 B: term order; the c2 site that picks operands is unknown.
- Compile-order data ~134 B: three fns are one pass off; source changes are ruled out.
