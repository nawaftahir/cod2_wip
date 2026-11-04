# Next session (state 2026-11-03 evening). Paste the prompt at the bottom into a FRESH session.

## State
- 1.0 client (`~/cod2/test/dev/claude_client`, branch master, HEAD cf58819): release build
  **1,699,171 / 1,699,840 same-offset section bytes = 99.961%, 669 B left** (11-03: +212, see LESSONS 11-03; residue map lab/w200/residue_11-03.txt). Gate green.
  Not pushed: everything since bb47c37 (owner pushes with "push it").
- Measure: `bash ~/lv.sh` (full release build + shameter ALL line). Land: `lab/w200/shapeb.sh TAG
  "REL:SPEC.py:" -- CALLEES` (patch + full build), then `sh lab/gate_w18.sh /abs/path/TAG.patch`
  (run from dev/; absolute patch path), commit only on KEPT.
- Release checkpoint copy: `cod2engine/archive/mp-1.0` (uncommitted, owner commits). Repo
  `nawaftahir/cod2engine` was recreated 11-02 (private, main only); old one is `cod2engine-old`.
- 1.3 client: worktree `~/cod2/test/dev/claude_client13` (branch client-1.3) was run by the owner's
  opencode agents until 11-04, now owned by the main session (brief `AGENTS.md`, ratchet `ratchet13.sh`, notes `NOTES_1.3.md`, baseline 5.16%,
  ~218 KB of 1.3 code missing). Merged 1.0 master on 11-04 (148a13b), worklist in WORKLIST_1.3.md.

## Next: identify the 6 code-free TUs (Rich 265 vs 271, Mac STABS candidates in LESSONS 10-29), then settle ties once.
11-03 closed: Crosshair (no source spelling forwards yaw under /Op; MP+SP retail agree), x87 draw trio (IL arg layout), FX residue (width slot).


## 1.3 client (main session, state 2026-11-04)
- Tree claude_client13 (branch client-1.3, HEAD cb58970). Meters: ratchet13.sh (builds, prints same-offset AND
  matched-fn bytes; decides on matched-fn, no fn lost vs good13.json, ties in ties13.txt), tools/cmp13 alone = referee.
- Matched-fn bytes 1,468,702 of retail .text 1,645,581 (~89%, 11-04 midday; same-offset 144,970). Today: 168,890 -> 1,441,522 (referee fixes ~1,000 KB,
  PunkBuster layer +172 KB, TLS threads +34 KB, libwww __LINE__ +26 KB, serverInfo_t pb byte +7 KB, small fixes).
- Work list: WORKLIST_1.3.md (tools/classify13.py), LAYOUT_1.3.md (tools/layout13.py), causes tools/why13.py.
- Agents work in own worktrees lab13/wX (copy dsound.lib + vc70; ratchet13.sh needs a path-adapted copy + ANCHOR=),
  deliver branches; lead merges + ratchets in claude_client13.
- 11-04 midday paid: libwww upstream git revisions + Id-line drops + WWW_WIN_ASYNC in config.h (+24 KB), 1.3 disconnect
  flow + CL_ConsolePrint critsect 0, Com_ExecStartupConfigs fs_defaultConfigName, SVC_Info pb integer, SV_UserinfoChanged strlen.
- Open leads (NOTES_1.3.md): libwww HTEvtLst/HTTCP/HTNews/HTHost remainders; dl_main placement is already correct;
  CL_ConsolePrint_AddLine 0x404690 (~2 KB, rewritten in 1.3, blocks CG_SubtitlePrint + 8 sound fns; Mac file truncated, no names);
  UI_RunMenuScript = regalloc only; CL_Input 0x412670 sync body (names unknown); UI_RunMenuScript body; CL_InitOnceForAllClients;
  Com_Init localized-cfg; re-auth fn 0x40d310 (no Mac name yet, do not invent); ties13 SND getter twins = recheck.
- Client SVC_Status keeps the 0x4000 cap in 1.3 (server MAX_MSGLEN form loses it).

## Remaining 1.0 items (pinned causes in LESSONS 10-31c..i, lab/w200/inl_notes.txt)
| Item | B | Next attack |
|---|---|---|
| CG_CalcCrosshairPosition | ~392 | c2 /Op gates make every re-spelling fail (10-31g); needs yaw via a by-value formal/param: look for evidence of such a helper, else DEFER |
| CG_InitXAnimTrees | 152 | retail reads the size address as its own pointer from a 2nd global read (10-31i); find a REAL XAnimCreateTree-call shape that does it (hand-inlining rejected) |
| FX_CalcOriginAndAxis | 86 | slot roles of cylinder height/width swapped (hs2 notes) |
| CG_DrawCursorhint 30, AdsOverlay 29, GrenadePointer 16, XAnimCalc 15, EvalPrimitiveExpression 14, CalcViewValues 4 lines | ~110 | x87/int ordering ties; first-reference-order rule (10-31f) not yet tried on all |
| numbering ties, 720.0f slot, Com_ErrorCleanup/subtitle static swap, Rich entry order | ~140 | link-position search exhausted (10-31c) |

## Cost rules (owner, 11-03: usage matters)
- One task per session; /compact mid-task; start fresh instead of continuing a giant chat.
- Agents: max 2 at a time, brief = AGENT_BRIEF_10-31.md + function names + "skip tried list in
  inl_notes", hard cap (6-8 variants per function), stop on a pinned explanation. Sonnet for mechanical work.
- Builds/searches run in the background; end the turn and wait for the notification; never poll.
- Write every result into LESSONS.md (+ skill when it generalises) right away.

## Prompt
Continue the CoD2MP_s.exe 1.3 client in ~/cod2/test/dev/claude_client13 (branch client-1.3). Read
claude_client/NEXT_SESSION.md (1.3 section: meters, worktree setup, open leads), claude_client13/AGENTS.md and
NOTES_1.3.md first. Meter = ratchet13.sh (matched-fn bytes, no fn lost; ties in ties13.txt), now 1,468,702 / 1,645,581.
Run up to 6 agents in parallel, each in its own worktree lab13/wN, one area each; they deliver commits, the lead
merges and ratchets in claude_client13 (bundle tie losses until net >= 0). Never fabricate names: Mac 1.3 STABS
or retail evidence only. 1.0 (claude_client, 99.961%) is parked; do not work there unless new evidence appears.

## Renderer gfx_d3d_mp_x86_s.dll 1.0 (research 11-04, gfx/FASTPATH_11-04.md)
- State: 117,113 / 253,580 C++ bytes verified (46.2%), ~1 body per 6-10 builds: one agent, every probe = locked full
  DLL build + byte + binding + 2512-extent regression, plus per-body fixtures/receipts. tus.txt order is a guess.
- References: Mac 1.3 client links the renderer (61 named r_*/rb_* files, ~1.3 MB decompile) + KisakCOD (CoD4, 100
  renderer .cpp) = named reference for nearly all of it. CoD2rev has none. SP 1.0 renderer ~82% similar (free 2nd
  target later); 1.3 renderer ~3% (useless).
- Fast plan: (1) TU set + link order from the Mac file list; (2) reuse claude_client13 tools (cmp13, ratchet_fn,
  why13, layout13) with bindcheck kept in the ratchet; (3) 6 agents in own worktrees, easiest bodies first;
  (4) per-body fixtures/receipts optional except for shared header/struct changes. OWNER DECISION needed for (4):
  it relaxes gfx/RULES.md. Estimate (unmeasured) 100-250 agent-hours + 20-40 lead hours.

## Prompt (renderer)
Continue the renderer gfx_d3d_mp_x86_s.dll 1.0 in ~/cod2/test/dev/gfx. Read gfx/RULES.md, PROGRESS.md and
gfx/FASTPATH_11-04.md first. Step 1: TU set + link order from the Mac 1.3 renderer file list; step 2: port the
claude_client13 referee/ratchet/layout tools (keep the gfx byte + binding referees); then run up to 6 agents in own
worktrees by area, lead merges and ratchets. Never fabricate; Mac/Kisak are references, retail bytes decide.
- Renderer quick-win scan (11-04): credit is already automatic (build.sh credits every bindcheck-bound hit). Locked
  value: 117 functions / 18,876 B already byte-match but fail binding because a callee is unmatched (e.g.
  R_InitRenderTargets 2102 B waits on Image_TrackFullscreenTexture 0x1000c9d0, 149 B). First renderer wave = match those
  callees (callee-first unlocking). Also 52 multi-hit twins / 1,707 B need a second copy in the right TU (layout).
