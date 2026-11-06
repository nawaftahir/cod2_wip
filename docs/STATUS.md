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
0. CM_Trace exact body (retail 0x41d120, 1424 B, ours reordered: tw.contents before cmod, size ok). The reorder changes the callee register allocation and loses 8 fns, listed in data/ties13.txt as 'NOT a tie': CM_BoxTrace, CG_Trace, FxHelper::Trace, CG_TouchTriggerPrediction, FX_CalcImpactOrigin, CM_TransformedBoxTrace, UpdateOrigin@Particle, SV_Trace (3,3xx B). Retail spills cmod once after the join; ours spills per branch. Restore them and remove from ties13 when exact. Landed with it (cw): WinMain inlines the pbsv ProcessPbEvents body, SV_Netchan/WWWDownload/RoQShutdown fixes (see TRIED).
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
