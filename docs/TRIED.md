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
| UI_DrawConnectScreen 1.3 (879 B vs 818) | read only | same calls; retail inlines a dvar-string check (cmp [966ff8]; mov cl,[dvar+0x1c]) ours expands as a type switch: not attempted |
| Item_ListBox_Paint (2081 vs 2104) | read only | retail tests listBoxDef+0x10c (a field we lack, after noScrollBars) in the selected-row draw; struct field unknown, DEFER |
| CG_DrawScoreboard_Objective (790 vs 1540), CG_EntityEvent (4328 vs 4360) | read only | retail bodies differ structurally (20 calls vs 9); not attempted |
| DL_BeginDownload (769 vs 781) | read only | retail keeps 0 in esi (xor esi,esi) for ~6 uses; ours pushes imm 0 (zero-in-register pattern) |

| CL_SyncGpu body (sz1) | rdtsc in-body asm with 64-bit locals; `static __forceinline` rdtsc helper | 91 B / helper emitted as a 3 B fn (asm fns do not inline); low-dword-only locals fit the 80 B bucket, bytes not yet exact |
| Sys_IsMainThread body `!(GetCurrentThreadId() - id)` with a Bool decl | to get sub/neg/sbb/inc | callee 19 B (retail 18); inline users get `sub` instead of `cmp`: lost Con_DrawInput + CL_AllLocalClientsDisconnected. Use int `==` |
| CM_Trace (+16 B in cm_trace) | diff only | retail spills cmod once, ours twice (RA); not tried further |
| CM_Trace (retail 1424 B, ours 1427: the -16 break at CM_BoxTrace) | `tw.contents = brushmask` before `cmod = CM_ClipHandleToModel(model)` | size aligns (+88 KB drift behind it) but cmod/brushmask regs change and CM_BoxTrace, CM_TransformedBoxTrace, SV_Trace, CG_Trace, FxHelper::Trace, UpdateOrigin, FX_CalcImpactOrigin, CG_TouchTriggerPrediction (3.2 KB) lose their match; reverted. Retail merges both cmod branches into one edx and spills once at +0x55; ours spills per branch |
| CG_EntityEvent 1.3 (4328 vs 4360) | read only (instruction diff) | retail footstep cases keep a bool in [esp+0x1b] and test it after the call (2 extra add esp,8 / test pairs near 0x4e0a90); ours ends with an extra fild/fchs/fstp epilogue; cause not found, DEFER |
| CG_DrawScoreboard_Objective plain loop | shared nextLine tail via goto | 1608 -> 1580 B (retail 1540) but clean same-offset 330,557 -> 329,491: REVERTED, not merged |

| SP_worldspawn (464 B retail, ours 469: dead `lea eax,[ecx+esi*8+2]` after the inlined Scr_SetString refCount++) | (a) `GetRefString(stringValue)->refCount++` in SL_AddRefToString; (b) same spelling only inside Scr_SetString | (a) SP_worldspawn matches but lost 27 fns / 18 KB (SL_AddRefToString, Scr_SetString, AddRefToValue, ...); (b) lost 10 fns / 3.4 KB (Scr_SetString, G_Spawn*, G_InitGentity); both rejected. Retail Scr_SetString/SL_AddRefToString keep the refStr-local shape |

| WinMain (713 B vs 820, the +112 step at NET_ErrorString) | read only + `__forceinline` on PbServerProcessEvents | ours inlines stPbCl::ProcessPbEvents into the loop but calls stPbSv::ProcessPbEvents (3 tail copies); retail inlines both. `__forceinline` across TUs: LNK2001, definition not emitted. Cause of the LTCG choice not found. Also `__forceinline PbServerProcessEventsInl` + wrapper (client-recon pattern): WinMain still 713 B, lost the 13 B PbServerProcessEvents/PbClientProcessEvents wrappers, same-offset -215 KB |
| RoQShutdown (283 vs 255) | call CIN_RunNextmap() instead of the pasted body | fn matches (+255) but same-offset 518,583 -> 342,941: the -32 only pays together with WinMain +112, CL_WWWDownload -48 (DL_DLIsMotd inlined, 440 vs 386), SV_Netchan_PrintProfileStats -16, DL_DLIsMotd 16: sum 0 |
| Item_ListBox_Paint ternary spellings | `noScrollBars ? w : w-16` then `-4`; local `rectW -= 16` | same 2091 B as the original; SOLVED by two UI_FillRect calls in if/else (tail merge, KNOWLEDGE 6) |
| HTEvtLst fn_54ed70 (13 B, retail 0x54ed70, after Timer_deleteWindowsTimer) | defined before Terminate / at end of file / near Timer_* | PUBLIC unreferenced fns are emitted in source order, Timer_* and HTEventInit are emitted late; retail slot (between Timer_deleteWindowsTimer and HTEventInit) not reached, it sits before Timer_setWindowsTimer |
| DL_BeginDownload (770 vs 781, same 16 B slot) | `char *requestUrl = NULL` (matches retail's entry store, +1 B); decl order requestUrl/scheme swapped; `char *password` hoisted | size stays 770; scheme/host swap edi<->ebx and a 4 B slot shift left; cause not found |
| CL_ParseDownload / CL_ParseWWWDownload | read only | retail ParseDownload (720 B) takes msg in eax->esi, ours has it on the stack (see the msg-in-esi row above); ParseWWWDownload 568 vs 571 |
| Item_ListBox_MouseEnter, Menu_SetNextCursorItem, CL_Netchan_DrawProfileLine, CM_TempBoxModel | read only (24/9/9/22 diff bytes) | pure register / load-order residue in zero-drift regions; swapping the horzAlign/vertAlign stores did not help |
