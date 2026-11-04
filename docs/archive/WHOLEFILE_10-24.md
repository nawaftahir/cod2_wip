# CoD2MP_s.exe 1.0: what a byte-identical file needs

Status as of 2026-10-21 night. Meter: `python3 ../shameter.py build/release/CoD2MP_s.exe <retail>` in
claude_client/target (release build, section-relative same-offset bytes). Whole file now **15.10%**.
CI (`gate.yml`) posts these per-section numbers to Discord on every push to master/wip-ci.

| Part | Size | Now | What it needs |
|---|---|---|---|
| PE header | 4 KB | 3,935/4,096 | Section sizes/addresses follow the rest; timestamp + checksum need a post-link step (owner decision) |
| Rich header | <0.2 KB | differs | retail's exact lib objects (VS2002 mss32.lib build) or a post-link step |
| `.text` function bytes | 1.41 MB | 94% of functions matched | ~55 hard functions, by source shape (slow) |
| `.text` positions | same | 3.3% at retail offsets | every function at its exact retail address: right size, order, no extra/missing bodies; total -4.9 KB |
| `.text` int3 padding | ~51 KB | follows positions | free once positions are right |
| `.rdata` | 200 KB | **62.6%** (in progress) | per-TU string/table order, real missing retail strings/tables; cheap |
| `.data` | 74 KB | 92.5% | order right; rest = pointers shifted because `.text` is too big; fixes itself when `.text` fits 0x158000 |
| `.rsrc` | 16 KB | 99.96% | 7 bytes: timestamp + the same address shift |
| Import table | small | 4 mss32 entries swapped | no source lever found; likely post-link |
| `mixerGetRecordLevel` | 2 B | differs | retail hand-patched after link; documented post-link step (owner decision) |

## Order of work

1. `.rdata` toward 100% (cheap, about +1% whole per round). Tools: /home/nawaf/x_ly2t.py, x_rdr.py, lv.sh.
2. Shrink `.text` by ~4.9 KB: `.data`, `.rsrc` and every pointer then line up at once (biggest single jump).
3. `.text` positions from the start of the file (/home/nawaf/dwalk.py, autostep.py, x_drift2.py) alongside the hard functions.
4. Final post-link pass: timestamp, Rich header, 4 import entries, mixer patch (needs owner sign-off).

## Rules that apply

- No dummy/placeholder functions; every added function or string needs binary evidence.
- Count ties (lab/ties.txt) may flip; any other matched function lost = reject.
- Commit at checkpoints; push only on "push it".

## Log

| Date | Whole | .text | .rdata | .data | Note |
|---|---|---|---|---|---|
| 10-21 morning | 12.6% | | 45.8% | 92.0% | |
| 10-21 late | 13.47% | 3.28% | 49.0% | 92.29% | link order, /SAFESEH:NO, table order |
| 10-21 night | 14.19% | 3.29% | 54.97% | 92.45% | Com_EndParseSession into q_parse |
| 10-21 night | 15.10% | 3.29% | 62.63% | 92.53% | DSERR order, real missing strings/tables |
| 10-21 night | 17.79% | 3.29% | 84.90% | 93.96% | table/function placement in bg_animation, g_*, ui_main (11 patches) |
| 10-21 night | 17.94% | 3.29% | 86.15% | 94.12% | ui_shared tables; .rdata/.data layout near its limit (float pool follows .text order, AIL import names, VA shift) |
| 10-22 | 18.00% | 3.29% | 86.15% | 94.12% | .text drift walk: cl_cgame/cl_cin/cl_input order (an earlier "18.08%" was a mis-measured rejected variant; corrected) |
| 10-22 | 20.66% | 5.32% | 94.77% | 94.30% | cl_main tail order, key event patch, single CL_GetKeyCatchers (structure ahead of the +272 B blocker) |
| 10-22 | **22.55%** | 7.61% | 94.78% | 94.31% | cl_main blocker removed (owner-approved: CL_MapLoading calls Dvar_SetString, temporarily unmatched), com_* order/extra bodies, FS_ReadFile, VectorClear copy |
| 10-22 | **22.96%** | | | | set c: single CL_KeyEvent body, CL_MapLoading Dvar inline (owner-approved), shared VectorCopy, cm_load (fa2db13) |
| 10-22 night | 22.93% | | | | 70 same-file function moves to retail order (drift steps 277 -> 240); structure, uncommitted |
| 10-23 | 25.92% | 11.71% | | | genuine helpers in cl_cgame/cl_scrn/cl_console, FS_ReadFile/FS_ConvertPath single bodies, Cmd stub (df1f49c) |
| 10-23 | 28.51% | 14.84% | | | VectorScale4 + Com_Parse + FS_FreeFile macros, Com stub (45e1471) |
| 10-23 | **29.37%** | 15.85% | | | event loops call CL_KeyEvent, Inl->macro batch (agent), common stubs; .text excess 6.8 KB -> 1.6 KB |
| 10-24 | **98.58%** (tree) | | | | header 320 B left = Rich header: retail has 14 entries vs ours 13 (e_lfanew 0x118 vs 0x110, everything after shifts 8 B). Retail mss32.lib was built with VS2002 7.00.9466 (Utc C 0x1c/9466 x1 = MSS_auto_cleanup, Implib 0x19/9466 x2); ours regenerates it with 7.10 (0x5d/3077 x2). Fix needs the original Miles SDK mss32.lib (VS2002 build) or VS2002 cl/lib; opencod1 (VC6 8168) and Kisak (VS2005 50727) libs do not match. Retail also has 7 more LTCG C++ objects (0x64/3077: 271 vs 264) and 1 fewer 0x5f (171 vs 172): TU count/split differs. Tools: /home/nawaf/rich.py EXE, libcid.py LIB, hdr.py OURS RETAIL |
| 10-24 | **94.45%** | .text 94.80 | .rdata 89.69 | .data 99.40 | region/sequential drift agents, stray inline bodies removed (real shared fns, FAST_CEIL/FLOOR one def, .inl), .bss zero-init rule, pairs A/B/C closed (Com_BitCheck placement + G_ShaderIndex, UI_CloseAll + AIL thunks + mss_auto atexit stub, NET_CompareAdr + CG_InitXAnimTrees), rdata missing data restored (64ffc61, pushed). Next: float pool order (27.5 KB run, +16 B pad), CL_SetServerInfoByAddress/CG_InitXAnimTrees/UI_LoadMenus/CG_DrawFPS etc. win-backs (ties.txt), ±16 pairs (Lagometer .inl), real-code fns (da/c2.sh ranking), header 320 B, mixerGetRecordLevel post-link byte (owner decision) |
| 10-23 | **51.62%** | | | | XAnimCalc frame (regalloc oracle: third loop reuses i, rsqrt once), XModelCalcBasePose real QuatMultiply + .inl, SND listener stub named, xmodel block: renderer slot 86/87 wrappers replace fake stubs, surface readers moved, xmodel_load linked first (ec9c785). Parked: cl_console .rdata 16-align (LTCG), SND_RestoreStreamChannel regalloc |
| 10-23 | **48.06%** | 38.2% | | | Scr_MakeValuePrimitive expands RemoveVariable, calls RemoveRefToValue via local ptr (+3.05%); c2 xanim/xmodel/Fx cleanups (7b56db0). Next blocker XAnimCalc +128 (frame 0x1c vs 0x14) |
| 10-22 | **20.48%** | 5.13% | 94.77% | 93.97% | cl_console helper block closed (floorf, real CL_DrawText in cl_main, unreferenced retail helper copies, Con_Shutdown thunk), sqrt chain in cl_input; .rdata vsize now equals retail |

## Top blocker (10-22, measured)

Flat +272 B after the end of cl_main_mp (0x411490 onward; +16 more from the CL_KeyEvent wrapper in 0x40b2b0..0x4112b0)
holds everything after it off-offset. Cause: our standalone helper bodies Dvar_SetStringFromSourceInl + Dvar_SetStringInl
(208 B) and VectorCopy/VectorCopy4 (64 B). Retail's source is the PLAIN call `Dvar_SetString(nextmap, "")`: with that
call (lab/w101_da.patch) the bodies vanish and whole goes 20.66% -> 21.14%, but CL_MapLoading stops matching because
retail's link step INLINED dvar.cpp's Dvar_SetString into CL_MapLoading (retail 124 insns vs ours 105 with a call).
Next attack: what makes LTCG inline Dvar_SetString(+FromSource) there and not elsewhere (callee size/shape in dvar.cpp,
caller count), checked against the other retail callers of Dvar_SetString.

CI note (10-22): lab/cibatch.sh now ships target/Makefile + ci/ties.txt too; before that CI batches built an old
Makefile (no /SAFESEH:NO) and under-read whole by ~0.4%. Commits were always gated locally and are unaffected.

## 10-23 evening: 29.37% -> 43.77%

What paid, in order of value:
- Tiny unreferenced retail functions we lacked, found by dumping retail bytes in each gap (claude_client/rasm.sh):
  `return 0` stubs around SND_AnyActiveListeners (+5.9%), empty fns after Sys_SupportsSSE, Q3 `fastftol`
  (win_shared.c, 0x465010, +1.7%). Before adding a stub, check whether one of OUR functions has that exact body and
  sits elsewhere: then move it (Com_StartupConfigs, Com_CheckSyncFrame, Sys_Print, Hunk_ClearTempMemoryHigh).
- Inl+wrapper pairs: one real body at the retail spot, the inlined sites expand the same text from a .inl with
  `#define pp_x (arg)` substitution (CalcScreenPlacement, Com_EndParseSession, Com_ParseOnLine, Com_SkipRestOfLine,
  I_strlwr). String literals in such a body: `extern const char *const X` in the owner .cpp (else .rdata moves).
- CL_KeyEvent: plain function, body shared via cl_keyevent.inl with Key_ClearStates; UI_SetActiveMenu called through
  a local pointer from CL_KeyEvent (trade: CL_PlayLogo_f in ties).
- Retail vtables give the order of virtual methods (python3 /home/nawaf/vtab.py <addr>).
- Parallel Sonnet agents per address range prepare patches; the lead gates serially (/home/nawaf/gateq.sh).
Dead ends: link-order (tus.txt) changes move .rdata/.data (xmodel: whole 43.8 -> 38.6); I_strlen as a plain extern in
cl_console (LTCG stops inlining it, -22%); removing RemoveVariableNI (LTCG inlines RemoveVariable).

## One body per helper (10-23, 22.96% -> 29.37%)

Rule that paid: our toolchain emits one out-of-line body for every inline/forceinline helper used in a TU, in the first
user TU in link order; retail has no body for helpers it only inlined, and exactly one for the rest. Fixes that worked:
- genuine helper names instead of renamed slot copies (CL_VectorCopy_4011e0 etc.): the genuine inline body lands at
  the retail slot by itself (oc/headers/PC/universal/com_math.h in universal header order);
- per-site forceinline copies (XxxInl) -> statement/expression macros at those sites (COM_PARSE_INLINE,
  FS_FREE_FILE_INLINE, lab/w108_inl_1.patch); header helper retail never emits outside one TU -> macro (VectorScale4);
- `Inl` + noinline wrapper pairs -> one plain function (FS_ReadFile, FS_ConvertPath; FS_FreeFile keeps noinline
  plus the macro at the three sites retail inlines);
- unreferenced tiny retail fns we lacked -> real bodies (Cmd_Stub_41fec0, Com_Stub_42bc80);
- CL_KeyEvent stays forceinline (its body and Key_ClearStates match); Debug_EventLoop under
  `#pragma inline_depth(0)` now matches.
Open blocker: Com_EventLoop is 64 B short (under the pragma it no longer inlines LargeLocal and MSG_Init, which retail
inlines; their globals are static in other modules). Everything after 0x431590 sits 64 B off until this is solved.
Staged behind it: lab/w107_vc30.patch (Com_StartupConfigs / Com_CheckSyncFrame are the retail fns at 0x4329c0 /
0x433960, Com_CloseLogfiles after Com_Frame, Com_SafeClientDObjFree after Com_SafeServerDObjFree).

## Drift census (10-22 night, /home/nawaf/dclass.py)

277 drift steps, net +6,784 B. By cause: 106 functions only misplaced (22 KB), 235 extra bodies of ours
(12.9 KB, mostly *Inl / header-helper copies), 50 retail-only bodies (4 KB), 75 size diffs (net +1.8 KB = hard fns).
- Moves: lab/w105_h.patch (mvlist.txt + mvbatch.sh + r2_mv.py, which now skips `#if 0` dead copies and leaves a
  prototype on a move down) moved 70 fns: steps 277 -> 240, misplaced 106 -> 55. Whole 22.958 -> 22.934 (layout
  structure only; the meter can't count it while drift is non-zero from 0x416f40). Ratchet OK, kept, uncommitted.
- Shared cause of the early steps: our renamed helper slot copies (CL_VectorCopy_4011e0, CL_VectorCopy4_401220,
  CL_VectorClear_412fe0, CL_I_fround_403620, ...) are retail's ONLY bodies of VectorCopy/VectorCopy4/VectorClear/I_fround
  (good.json). Under a new name the genuine header inline still gets one body, at its next user: cm_mesh VectorCopy
  (+32 at 0x416f60), cm_trace VectorClear + VectorCopy4 (0x41a020, 0x41a090), etc. Expanding call sites does not
  remove them (cm_trace still pulls them indirectly) and breaks matches (cm_trace -1,639 B, AxisToQuat -551 B, cm_mesh).
  Real fix = the slot IS the genuine helper body called out-of-line from cl_main; needs LTCG not to inline those
  calls (inlining wall, owner decision).

## Open .text blockers (10-22)

- Cumulative drift never returns to 0 after 0x403520. First step: +288 B in the helper block at the start of cl_console
  (retail 352 B: three ceilf wrappers, I_fsel, I_sel, I_min, I_fclamp, I_fround, Vector2Set, VectorScale4, I_strlen;
  ours 176 B ceil/floor/I_fround, with I_fsel/I_fclamp later). Cause: how cl_console uses those helpers; unknown.
- Our build emits standalone bodies retail lacks: CL_KeyEventBody 1,456 B (only fix found loses Key_ClearStates, a real
  match: not taken), Dvar_SetStringFromSourceInl 112, Dvar_SetStringInl 96, VectorCopy/VectorCopy4 64.
- Layout-only fixes now give ~0.1% each; the next real jump needs these .text blockers solved.

Next session (10-23): gate lab/w108_stub_ui_1.patch (+0.014%, UI getters to retail slots; fdiff neighbours first). Skip w108_stub_addref_2/3 (lower whole). Scr_Read* helper bodies: retail has all 8 in one block at 47a370, ours splits 3 there + 5 at 4821c0 (emission order). Then the Com_EventLoop -64 blocker.
