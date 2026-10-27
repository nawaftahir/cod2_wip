# Radiant matching, 2026-10-27

## Baseline

Private worktree `.agents/codex`, branch `agent/codex`, based on cb05b44.
Fresh `make gate`: 304/304, 40,711 game bytes, 50 unverified bodies,
one existing Bounds constructor order warning. Same-offset bytes 21,268
(the committed meter says 21,270; timestamp/debug values vary each link).
No owner-only structure, flag, tooling or symbol-map files changed.

## PINNED: incorrect CRT name blocks deletion-function verification

`data/lib_funcs.tsv` calls 0x004dad56 `__rmdir` (42 bytes). Retail
0x004dad5a calls IAT 0x005283ac, which PE imports resolve to
KERNEL32!DeleteFileA. The next import, 0x00528490, is GetLastError.
This is file deletion, not directory removal. The same retail entry is
called by com_files at 0x0047e161 and 0x0047f470. Do not change the
reconstructed source to call `_rmdir` to satisfy that incorrect name.
Owner must correct the library mapping with import-binding evidence;
this worker leaves data/ unchanged. `make show A=0x004dad56` reproduces
the call. Evidence also saved in scratch/codex_1027_com_files/retail.txt.

## com_files trial

Reference: cod2engine/archive/lnxded-1.0/src/universal/com_files.cpp.
The import script defaults to lnxded-1.3, so it was not used with its default.
Radiant's own binary confirms direct stdio, no server string prefix,
fatal initialization checks, and extra asserts with original line numbers.
Full trial source and all 97 assigned retail bodies are saved in scratch.
Candidate hits are not accepted progress until canonical pruning and the
full regression gate pass. Linked relocation-normalized equality does not
prove retail RVAs or whole-file identity.

## com_files checkpoint: 7589c4a

38 functions in the file verify as linked (one replaced the old unnamed row):
37 net new functions, 4,555 additional game bytes. Global total 341/341,
45,266/699,591 game bytes (6.47%), 50 unverified functions unchanged.
Whole-file same-offset bytes 21,828/1,794,048 (1.217%); no exact-RVA or SHA claim.
`make gate`, `make accept`, and local CI pass. Local CI's first host-side
write hit Docker ownership; ownership was restored and CI rerun successfully.
No webhook is present in this private worktree, so no Discord message was sent.

PINNED iwd_t: 0x318 bytes (allocation at 0x48005e); handle +0x300,
numFiles +0x304 (0x480170 and 0x480fb3), referenced byte +0x308
(0x481fb7), hashSize +0x30c and hashTable +0x310 (0x480099/0x48009f).
The inherited server checksum and pure_checksum members do not exist here.
Only com_files uses this type; header now checks size and critical offsets
at compile time. FS_DisplayPath omits the server pure-list branch, as retail does.

Full file is DEFERRED, not finished: deletion's library binding is incorrect;
the seven caller-dependent rows are recorded in ledger/defer.tsv. Trial bodies
that failed pruning are absent from src/. Six static helper hits and their
callers remain in the full trial snapshots; no fake references were added.

## com_shared: rejected by the strict whole-file offset requirement

The complete verified-server source was trialed in file order. Four bodies
matched initially: Com_StringContains (88 B), Com_FilterPath (153 B),
Com_HashKey (67 B), Com_RealTime (96 B). After removing unmatched bodies,
Com_FilterPath became 87% (154/153 B, first difference +0x79); its call
convention depends on the missing Com_Filter body.

Com_Filter trials: server buf[0] form 28% (629/587 B, first +0x5);
retail's strlen(buf) form and an explicit local length both 31%
(645/587 B, first +0x5). Retail calls Com_StringContains at 0x48b040;
our LTCG build inlines it. No noinline/forceinline, fake callers or new
flags were introduced. The real I_strcmp comparator is still unwritten.
The reference memcpy/memset wrappers also do not match retail's memory
routines; they were removed, not counted.

Pruned trial passes 344/344 with the original 50 unverified bodies, but
same-offset bytes fall from 21,828 to 21,568. The user requires offsets
strictly, so all three surviving normalized hits (251 B) were rejected.
Canonical com_shared and its ledger were restored to checkpoint 7589c4a.
Sources and full 14-function primary disassembly are in
scratch/codex_1027_com_shared/. This file is not finished or credited.

## 2026-10-28: bounded read-graph trial

Saved evidence and server source were reused; two builds covered the caller group.
PINNED differences in FS_FOpenFileRead_Internal: no server pure-list/restriction
branches or fake checksum; Com_Memcpy of the 128-byte unzip state is unconditional.
Filename assertion is line 1358, before the initialization check.

FS_SanitizeFilename matches all 643 bytes, including assert lines 1268/1269/1270,
1284 and 1297. The two diagnostic asserts format a nested va("%s\n\t%s", ...);
the last passes handler type 1, not 0. Matching source is saved in
scratch/codex_1028_read_graph/attempt.cpp, with input/output hashes in check.json.
FS_IsBackupSubStr (27 B) and FS_FilesAreLoadedGlobally (161 B) also match.

After restoring the genuine FS_ReadFile and FS_TouchFile callers, the central
read routine remains 39% (1343/1396 B, first +0x10): ours receives file in ECX,
retail loads it from the stack. Both existing read-wrapper ledger rows then
fail. This is not proof that source matching is impossible. The group is
deferred without ABI tricks, fake callers or forced inlining; canonical source
was restored immediately. No new progress is credited for these trial hits.

## 2026-10-28: linearmapping bounded whole-file trial

All six assigned functions were trialed together from the sibling Radiant
reference, with the binary's 168-byte solver layout, float-to-double inputs,
residual sign, and both original assertion lines (159 and 189). Binary
IS_NAN tests exponent bits 0x7f800000, including infinities, rather than a
libc isnan call. Primary disassembly and both sources are saved under
scratch/codex_1028_linearmapping/.

Two builds covered the sibling form and a Numerical Recipes form with
shared locals plus an explicit residual accumulation loop. Both retain
341/341 protected rows. Best results: LU factor 77% (1055/995 B, first +5),
back-substitution 53% (495/495 B, first +5), refinement 12% (122/107 B,
first +5), apply 61% (243/244 B, first +5), setup 27% (149/157 B, first +3),
wrapper 69% (121/121 B, first +5). Equal length is not equality.
No body is credited; canonical file was restored. The setup's genuine
major-axis callee 0x4839b0 is still unwritten in com_math.

## 2026-10-28: math bulk trial and verifier boundary defect

The verified 1.0 server has 155 function bodies, versus 70 in our math file.
A bulk trial preserved all 70 accepted bodies and their Radiant ordering.
The server orders LerpAngle/AngleSubtract/AnglesSubtract/AngleNormalize360;
Radiant's already-verified order starts with AngleNormalize360 (0x487180),
then LerpAngle (0x4871b0), AngleSubtract (0x487210), AnglesSubtract (0x487290).
That existing correction was retained; fixed file maps and flags were untouched.

Only one new candidate pairs, VectorRotateAroundOrigin (75 B at 0x489350).
It is not credited: its VectorRotate callee remains unmatched, and the full
trial exposed the verifier defect below. Canonical math source was restored.

PINNED extent-reader defect: the linked map lists duplicate static helper
names at distinct addresses. Linked.syms uses setdefault (first occurrence),
then derives all function boundaries from that name dictionary. Later copies
are omitted as boundaries. In the math trial, Hunk_ShowTempMemoryHigh at
0x408bf0 is 18 B, ending RET at +0x11; the next function is I_fsel at 0x408c10.
More helper copies start at 0x408c40 and 0x408c70. The reader swallows these
and reports an extent of 124 B, incorrectly failing the protected hunk row.

Draft correction records every function-marked map address for boundaries
while preserving first-name symbol lookup, all label aliases, and the exact
byte/mask/callee predicates. The duplicate-name regression test passes.
Against the same unmodified candidate image, original reader: 340/341;
draft reader: 341/341, with only the hunk row changing. Proof and a three-line
owner-review patch are in research/codex_fixes/. tools/ remains untouched
pending the explicit owner exception requested through the approval question.

## 2026-10-28: assertion helpers accepted

Commit b4d4b6d adds CopyMessageToClipboard (114 B), FUN_0047da40 (8 B),
and FUN_0047da50 (10 B), preserving the file's two existing functions.
All three pass make try and the full gate: 344/344, 45,398 game bytes (6.49%),
50 existing unverified bodies and one existing order warning. Same-offset
bytes increase from 21,828 to 21,888 in the accepted build (1.220%);
an earlier gate measured 21,887. No SHA identity or GUI boot claim.

The clipboard API sequence is independently checked against retail IAT
bindings. A native mock test covers eight allocation/locking combinations
and both state resets. Evidence is in scratch/codex_1028_assertive/.
AssertNotify is deferred at 95% (121/121 B, first +0x6b), after four source
forms. Callback, message captions, Shift result and ExitProcess behavior
agree, but the shared return block differs. Its body stays outside src/.

A second bounded batch matches four more helpers: FixWindowsDesktop
(128 B), directory save/restore (19/12 B), and GetModuleBase (190 B).
The first gamma form unrolled to 226 B; the sibling's WORD index and
separate assignments produce the exact 128 B function. Tests cover all
768 ramp entries, directory round trip and 18 module lookup paths.
make try and regression pass 348/348, with the same unverified count.
However, whole-file same-offset bytes fall by 222. All four are rejected
under the user's strict offset rule; source and ledger are restored.
The matching trial and test generator remain in
scratch/codex_1028_assertive_helpers/. This file is still incomplete.

## 2026-10-28: q_shared batch retained only as research

Ten missing functions were imported from verified 1.0 server source into
their existing declaration positions, preserving every accepted body and
the I_stricmp assertion lines. GetLeanFraction emitted a second I_fabs
at 0x407180; the first is at 0x4024e0. The same map-reader defect incorrectly
extends Com_Parse3DMatrix from 184 to 220 B. Removing GetLeanFraction and
other unmatched candidates restores all protected rows with stock tools.

Info_ValueForKey (256 B), Info_RemoveKey (281 B), and Info_RemoveKey_Big
(281 B) survive pruning and pass make try and regression: 347/347,
46,216 game bytes, 50 unverified bodies and one order warning. Primary
disassembly confirms their error strings lack the server's 0x15 prefix;
the prefix was removed before final checks. Same-offset bytes fall by
364, so these 818 B are rejected under the strict user requirement.
Canonical source and ledger are restored to b4d4b6d. Full and pruned
trials, primary disassembly, per-function results and gate output remain
in scratch/codex_1028_q_shared/. No extra progress is credited.
