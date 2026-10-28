# Codex delivery

Restored the three requested assertive helpers at 0x47c4e0 / 128 B,
0x47c560 / 19 B and 0x47c580 / 12 B: three game rows / 159 B.
The old same-offset-only deferrals are removed. Source order is unchanged.
No byte masks, verifier predicates, compiler flags or inventory changes.

Fresh stock make try and make gate pass: 415/415 game rows, 51,135 / 699,591 B
(7.31%), compiler helpers 2 / 35 B, zero failures, unchanged 50 unverified bodies
and one order warning. This includes Claude's five newly landed Q3 functions.
Whole-file same-offset is 26,114 B / 1.456%, down 96 from the last stored
407-row checkpoint; this remains report-only under the current contract.
Live tests check all five Win32 imports and both directory helpers' shared
buffer, plus the existing lifetime/accounting regressions.

Logs: scratch/codex_1028_assertive_helpers/resumed_{try,gate,tests}.log.
Assertive remains partial. Next source batch is the real CamWnd mouse-down
caller group; its first bounded probes already preserve every existing row.
Main's board will be updated after integration. No GUI boot or full SHA claim.

## CamWnd mouse caller batch

Five more routines / 389 B match: OnLButtonDown 0x4032f0, OnMButtonDown
0x403390, OnRButtonDown 0x403420, OriginalMouseDown 0x403520 and Cam_MouseUp
0x404d70. Source follows Q3 plus pinned retail state-reset/cursor additions.
The callback map binds each real handler; imports and class offsets are checked.
No fake callers, noinline attributes, flags or comparison-rule changes.

Fresh stock try/gate: 421/421 rows, 51,629 game B (7.38%), 11.76% of game
functions, compiler 2 / 35 B. Same-offset 25,807 B / 1.438%, +96 from the
previous checkpoint. Zero failures, unchanged 50 unverified bodies / 1 warning.
Window, restored-helper, camera-target, lifetime and accounting tests pass.
The release callback group and mouse-move body remain in scratch: its first
trial inlines differently; no unmatched source from it ships.
Logs: scratch/codex_1028_cam_mouse/accepted_{try,gate,tests,ci}.log.

## q_shared info-string recovery

Restored Info_ValueForKey (0x496aa0 / 256 B), Info_RemoveKey (0x496bf0 /
281 B), and Info_RemoveKey_Big (0x496d10 / 281 B), using the preserved
server-derived source previously rejected solely for same-offset movement.
Current source was byte-identical to the saved pre-trial file before recovery.
Removed the three obsolete deferrals; retail function order is retained.

Fresh make try and full gate pass 424/424 game rows: 11.85% of functions,
52,447 / 699,591 B (7.50% of game code). Same-offset is 25,947 B / 1.446%,
+140 over the CamWnd checkpoint. Compiler 2 / 35 B, unverified 50, warning
one, failures zero. The live binding check also compares all three actual
error strings with retail; no masks, flags, library mappings or verifier changes.
Proof: scratch/codex_1028_q_shared_resume/{try,gate,tests,ci}.log.
