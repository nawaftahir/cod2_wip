# CoD2MP_s.exe 1.3: status

## Numbers (`meter-1.3.json`, s3 accept 84046869, clean build, checkpoint 2026-11-04 night)
- Matched-fn bytes 1,503,407 / 1,645,581 .text = **91.36%** (8,714 / 9,123 fns). TUs in `src/`: 194 / 364.
- Whole-file same-offset 205,586 / 1,970,176 = **10.43%** (.rdata ~31%, .data ~81%, .text 3%).
- Day 11-04: 89.25% -> 91.36% matched-fn, 7.4% -> 10.4% same-offset.

## Policy (owner, 11-04)
- Structure first: a change that makes the function set / data / positions retail-equal is accepted when only
  listed ties flip (`data/ties13.txt`, each with a reason).
- Accept only clean builds. Never leave a tree on an experiment branch others copy from.

## Open leads (best first)
1. Drift: first break CL_SetExpectedHunkUsage +64 B (retail calls Dvar_SetIntFromSource un-inlined for
   constant 0; find what stops the inliner there). Then cl_keys +176 (CompleteCommand), then cl_main_mp
   connect code.
2. PunkBuster client: PbClGameQuery 0x4bbb80 (947 B, 13-case switch, decoded) -> PbClientInitialize 0x4bc000
   unlocks PbClGameCommand / PbClSendToAddrPort (register params until address taken), PbClGameMsg.
3. CL_ConnectionlessPacket split: retail 0x40e750 (PB_ packets) + 0x40ec10 (rest).
4. CL_CheckForResend full 1.3 (812 B, one stack-slot order left: data/info/pbBuf).
5. CL_ConsolePrint_AddLine: in tree, 6 register hunks.
6. Com_Init_Try_Block_Function: multi-core block (GetProcessAffinityMask, r_smp_backend_allowed), frame 0x24 vs 0x20.
7. libwww leftovers (~1 KB): HTCache_isFresh, HTEvtLst stopLoop/init/pump/loop, HTBlackHole/HTErrorStream constants.
8. Bundle-pending gains held back by tie re-rolls: fn 0x40d310 call in CL_Frame, CompleteCommand 1.3, UI PB fns.
9. Top unmatched by size: `archive/NOTES_1.3.md` "TOP40" (UI_RunMenuScript, CG_EntityEvent, nb_decode, ...).

## Next session
Lead in `client-1.3`, up to 6 agents in `.worktrees/<work>` (one area each, briefs name `TRIED.md`), lead
merges and runs `tools/ratchet13.sh` on a clean build, bundling tie losses until net >= 0.
Evidence only: Mac 1.3 STABS, lnxded-1.3 source, retail bytes. Client 1.0 is parked.
