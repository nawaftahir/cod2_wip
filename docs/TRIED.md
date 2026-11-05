# CoD2MP_s.exe 1.3: tried and failed (do not repeat)

Measured attempts (source: `archive/NOTES_1.3.md`). Also skip everything in `client-1.0/docs/TRIED.md`
(same compiler). Add a row after every revert; delete it if later solved.

| Function / area | Tried | Result |
|---|---|---|
| SV_Map_f calling Com_CheckSetRecommended() | call added; decl moved; noinline | aligned frame moves from SV_SpawnServer to SV_Map_f, -3,104 B |
| EvalPrimitiveExpression | float cases split without goto | no gain |
| VM_Notify | lnxded-1.3 server text | no gain, lost a 752 B tie |
| Server-text batch (CM_BoxSightTrace, IntersectPlanes, CM_ClearWorld, G_GetPlayerViewOrigin parens, Scr_ParseGameTypeList memset) | one build | -16, rejected |
| LargeLocal ctor/dtor/GetBuf as `__forceinline` in com_memory.h | header change | lost 19 fns / 12.7 KB: per-caller choice |
| HTCache_isFresh | decl order permutations (3), chained init, cc decl in if | slot order not declaration-driven; parked |
| HTEvtLst 2nd static 0x5ddfa8 | name search: libwww-git, coduomp, KisakCOD | no name: DEFER |
| CL_ConsolePrint_AddLine 1.3 body | switch vs if, shared charWidth (4 builds) | 6 reg hunks left; branch `w8-consoleprint-wip2` |
| CL_SetExpectedHunkUsage | direct Dvar_SetIntFromSource(dvar, 0, INTERNAL); local `int zero = 0` / `len = 0` / `hunk` shared with atoi path | still inlined or 533 B; SOLVED by nested-if loop without `continue` (KNOWLEDGE 5) |
| CL_CheckForResend 1.3 | decl order, block scope, buffer size 1020/1024 | slot order data/pbBuf/info unchanged |
| CL_ParseDownload msg in esi | param copy forms | conflicts with LargeLocal load; no lever |
| CL_InitRenderer fonts switch | 7 calls / ascending / one call via local | fn matches but flips DSound_UpdateSample; landed later with tie pool |
| `getKeyAuthorize` string | file-scope `static const char *const`, parenthesised literal | loses SV_DirectConnect / yylex |
| Cmd_Tell_f / Cmd_GameCommand_f removal | 4 combos | flips SP_worldspawn; keep until the fn set before g_spawn is complete |
| CL_BuildMd5StrFromCDKey merged into caller | one fn fewer | PC_EvaluateTokens tie flipped back |
| fn 0x40d310 call in CL_Frame | matches, but flips PC_EvaluateTokens + GScr_CloseFile | not committed; re-add with a bigger gain |
| UI PB fns wH (+257) | 3 fns added | re-rolled yylex (-4,236); bundle |
| fn_4bb450 | `if (hay && needle && *needle) {..}` wrapper; while-with-break loop; `first && p >= first` tail | 268 B, esi/edi pushed at entry, first spilled; fixed by early `return hay` + do/while + two-if tail |
| PbClGameQuery case 109-111 | separate `key` copy of Data used everywhere | extra frame slot (0x10), Data spilled; plain `char *name` local is right |
| Sys_IsMainThread body `!(GetCurrentThreadId() - id)` with a Bool decl | to get sub/neg/sbb/inc | callee 19 B (retail 18); inline users get `sub` instead of `cmp`: lost Con_DrawInput + CL_AllLocalClientsDisconnected. Use int `==` |
| CM_Trace (+16 B in cm_trace) | diff only | retail spills cmod once, ours twice (RA); not tried further |
