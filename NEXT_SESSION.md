# Next session (state 2026-11-03 evening). Paste the prompt at the bottom into a FRESH session.

## State
- 1.0 client (`~/cod2/test/dev/claude_client`, branch master, HEAD cf58819): release build
  **1,699,145 / 1,699,840 same-offset section bytes = 99.959%, 695 B left** (11-03: +186, see LESSONS 11-03). Gate green.
  Not pushed: everything since bb47c37 (owner pushes with "push it").
- Measure: `bash ~/lv.sh` (full release build + shameter ALL line). Land: `lab/w200/shapeb.sh TAG
  "REL:SPEC.py:" -- CALLEES` (patch + full build), then `sh lab/gate_w18.sh /abs/path/TAG.patch`
  (run from dev/; absolute patch path), commit only on KEPT.
- Release checkpoint copy: `cod2engine/archive/mp-1.0` (uncommitted, owner commits). Repo
  `nawaftahir/cod2engine` was recreated 11-02 (private, main only); old one is `cod2engine-old`.
- 1.3 client: worktree `~/cod2/test/dev/claude_client13` (branch client-1.3) is run by the owner's
  opencode agents (brief `AGENTS.md`, ratchet `ratchet13.sh`, notes `NOTES_1.3.md`, baseline 5.16%,
  ~218 KB of 1.3 code missing). Do NOT work there; only review it when the owner asks.

## Next: identify the 6 code-free TUs (Rich 265 vs 271, Mac STABS candidates in LESSONS 10-29), then settle ties once.
11-03 closed: Crosshair (no source spelling forwards yaw under /Op; MP+SP retail agree), x87 draw trio (IL arg layout), FX residue (width slot).

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
Continue the CoD2MP_s.exe 1.0 client to 100% in ~/cod2/test/dev/claude_client. Read
claude_client/NEXT_SESSION.md (state, remaining items, cost rules) and LESSONS.md entries 10-31c..i
first. Be cost efficient: at most 2 agents, background builds, no repeats of tried variants.
