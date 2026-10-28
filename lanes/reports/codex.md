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
