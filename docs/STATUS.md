# CoD2MP_s.exe 1.3: status

## Numbers (`meter-1.3.json`, meter commit 4aaa2370, written by the f44e3a7d accept; reproduced clean on t1 11-11)
- Whole-file same-offset 1,971,472 / 1,974,272 = **99.858%** (header 4,092/4,096, .text 1,643,925, .rdata 229,250, .data 77,821, .rsrc 16,384; .rsrc complete). 2,800 B differ: breakdown at the top of `TAIL_1.3.md`.
- Matched-fn bytes 1,554,513 / 1,645,581 .text = **94.47%** (8,979 / 9,547 fns). Functions identical (match or same bytes in place) 9,471 / 9,504. TUs in `src/` 150 / 370, unverified_in_src 0.

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
