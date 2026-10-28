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

## 2026-10-28: memory-file Windows adaptation

All 49 assigned retail functions were extracted once. A whole-file server
import preserved the 21 existing bodies and their globals. PINNED Windows
differences: allocation primitives distinguish MEM_COMMIT and MEM_RESERVE;
shutdown uses VirtualFree with MEM_RELEASE; data-name lookup uses CRT
_stricmp at 0x4e752e, rather than the engine's I_stricmp. The packed
fileData_t type byte is at +8, name at +9; Hunk_AddData allocates 9 B.

Added the original assertion expressions and lines for virtual allocation,
shutdown, hunk data, alignment, and high/low allocators. Hunk_AllocAlign
checks lines 1367/1374/1375/1403; the low allocator checks
1526/1533/1534/1562. Both call the genuine matching temp-memory check.
No extra commit/decommit path was borrowed from the later CoD4 reference.

After removing every new unmatched body, 13 new functions survive:
17 B allocation primitive, Z_VirtualAllocInternal (131 B),
Z_VirtualCommitInternal (138 B), Hunk_Shutdown (218 B), internal/public
data lookup (56/23 B), Hunk_DataOnHunk (97 B), Hunk_AddData (124 B),
high temporary allocator (266 B), and high/low allocation wrappers and
aligning allocators (19/435/15/430 B). Total 1,969 B. Stock regression
passes 357/357 with 50 existing unverified bodies and one order warning.

The first pruning script added one blank line per removed function;
correcting it restores all retail assertion immediates. No comparison
predicate was changed. The full unmatched Hunk_FreeTempMemory trial had
also changed protected FS_FreeFile; pruning restores that row.

Same-offset bytes fall by 360 (21,528 versus accepted 21,888), so the
entire gain is rejected under the strict user requirement. Canonical
source and ledger are restored. All primary evidence, source variants,
names, final candidate source, ledger and gate results are saved in
scratch/codex_1028_com_memory/. No new match is credited.

## 2026-10-28: retail-order continuation

The owner clarified that the retail file order and correct placement are the
priority. Investigation moved to the first fixed-map TU, AdvCurveDlg.cpp,
which had no source file. No link/file map or per-TU flags were edited.

Primary evidence pins its three 32-byte control records at 0x58fb80: IDs
1424/1428, 1425/1429, 1426/1430; initial values 16/64/8; ranges 0..1024,
0..1024, 0..16; steps 16/16/1. Value is +8, slider HWND +24, edit HWND +28.
The first helper formats %g, special-cases control 1426, updates the edit
and sets the update flag. The setter clamps inclusively, rounds half up,
sets slider message 0x405, then calls the display helper. Native tests cover
bounds, disabled controls, clamping, rounding and exponential display.

Seven reconstructed functions pass make try with stock tools (543 B):
0x401000, 0x401090, 0x4010c0, 0x401b80, 0x401bd0, 0x401c90, 0x401cb0.
The power-display helper 0x401c20 is deferred: bytes agree, but the CRT map
labels its two-double math call _atan and rejects the source _pow call.
Actual stub slow path at 0x4d7824 accesses both stack doubles. Do not change
pow to atan to satisfy the map. Full proof is still needed for an override.

Default /GL emits ATL header helpers first, putting the first application
function at 0x401b30. Isolated plain/public, plain/static, /GL /Gy-, and
plain/static /Gy- probes do not restore the first retail RVA. Plain/static
still reproduces all seven bodies; this is not evidence that source
matching is impossible, and changing the per-TU flags is not proposed.

A linker /ORDER input generated from verified ledger addresses gives the
first three functions their exact retail RVAs: 0x401000, 0x401090, 0x4010c0.
All 351 candidate rows match with the unchanged byte/callee referee. The
trimmed candidate has 21,688 same-offset bytes, while an earlier untrimmed
probe has 22,480. The accepted checkpoint remains 21,888 and 344/344.
These are different images; do not report the larger trial as accepted.
This recreates recovered order; original use of /ORDER is not established.
The reviewed ten-line proposal, tests and hashed proof are in
research/codex_order/. tools/ is unchanged pending the specific exception.

RTTI pins CAdvCurveEditDlg, and all fourteen member control vtables in its
constructor: three CButton, six CEdit, three CSliderCtrl, two CButton,
at +0x70 through +0x480 in 0x50-byte steps. The DDX IDs and vtable/type
proof are saved in scratch/codex_1028_advcurve/. The next actual file work
is its constructor/destructor and DDX method, before moving to the next TU.

Additional bounded trials: dvar full import preserves its 43 existing
bodies and yields only the four already-deferred static helpers. The full
caller graph changes protected GetBspExtension (115/115 B, first +1).
Canonical dvar was restored. The util_str file's four CRT assertions were
changed to the engine handler with lines 307/321/360/420. All four methods
match (707 B), regression is 348/348 and unverified count drops to 46, but
same-offset bytes fall by 74; that trial was restored before the owner's
retail-order clarification. Both attempts and primary disassembly remain
in their corresponding scratch/codex_1028_* folders. No extra matches are
credited for them.

A fourteen-control class-group probe confirms DoDataExchange at 0x401450
(247 B) exactly, including all thirteen DDX_Control IDs and member offsets;
all 351 prepared rows remain matching. Constructor is 287/393 B (47%,
first +0), deleting destructor 33/34 B (47%, +6), destructor 168/269 B
(34%, +0). Retail has EH registration and cleanup states which this fixed
flag build does not emit. No flags were changed to count them. These
bodies stay in scratch/codex_1028_advcurve/members.cpp, and the reviewed
seven-function source was restored. The class color at +0x4d0 is passed
to CColorDialog and CreateSolidBrush; the byte at +0x4d4 is separately
read/written. Do not claim an original total allocation size until its
allocation site is confirmed.

## 2026-10-28: first-TU constructor and data model confirmed

The fixed compiler invocation has both _CPPUNWIND and _CPPRTTI off (confirmed
with the pinned compiler's preprocessor). A private /GX /GR probe gives the
exact 393 B constructor. An implicit C++ destructor reproduces the 34 B
scalar deleting destructor and all 269 B of the destructor; the explicit
empty out-of-line destructor did not. This is a matching source choice,
not a claim about the historical spelling of the original source.

The destructor's three remaining CALLEE failures were incorrect library
names. PINNED directly on each callee: 0x516647 writes vtable 0x52cf5c whose
RTTI names CButton; 0x5168e8 writes 0x52d34c, CEdit; 0x4f57ba writes 0x52e12c,
CSliderCtrl. The current map calls all three CDialogBar. Their real library
member paths were checked in nafxcw.lib. Proposed overrides preserve sizes.

The original CRT address 0x4d7790 was tested directly with (2,0), (2,1),
(2,3), (2,-2), (9,0.5), yielding 1,2,8,0.25,3. The bare harness loads the
original fixed image with DONT_RESOLVE_DLL_REFERENCES, refuses any base other
than 0x400000, calls the two-double function, and never runs the retail entry
point. A conventional CRT harness mapped at 0x440000 and was rejected before
any call. The bare kernel32-only executable avoids that allocation conflict.
Working commands, from this worktree inside the pinned image:

    wine /opt/msvc710/Vc7/bin/cl.exe /nologo /c /O2 /Foscratch/codex_1028_advcurve/math_probe_bare.obj scratch/codex_1028_advcurve/math_probe_bare.cpp
    wine /opt/msvc710/Vc7/bin/link.exe /nologo /OUT:scratch/codex_1028_advcurve/math_probe_bare.exe /ENTRY:entry /SUBSYSTEM:CONSOLE /BASE:0x10000000 /FIXED /NODEFAULTLIB scratch/codex_1028_advcurve/math_probe_bare.obj kernel32.lib
    wine scratch/codex_1028_advcurve/math_probe_bare.exe

The twenty-entry MFC message table and its CDialog parent map are reconstructed
from raw target data. The independent table audit caught an incorrect draft
EN_CHANGE macro: retail uses EN_KILLFOCUS (0x200). It was corrected before
proposing the final model. Vtable slots also confirm DefWindowProc, OnInitDialog,
OnOK and OnCancel overrides; these are declared without fake bodies.

A global /ORDER prototype caused eight new ordering warnings in later private
helpers. That version is rejected. The refined first-TU-only proposal retains
all later TU ordering, while placing all eight leading functions exactly at
0x401000, 0x401090, 0x4010c0, 0x401180, 0x401310, 0x401340, 0x401450, 0x401550.
The first eight contain 1,312 source bytes. The full prepared group has thirteen
new functions / 1,589 B, total 357/357 and 46,987 game bytes, with the original
50 unverified bodies and one order warning. Same-offset bytes are 25,428,
up 3,540 from the accepted 21,888. Proof, tests, source diff and the combined
build/config patch are in research/codex_order/. No owner files were changed.

Further primary lifetime evidence: the startup thunk at 0x526a10 pushes parent
NULL and object 0x1233b68, calls 0x401180, then registers cleanup 0x526f50 with
atexit. Cleanup calls 0x401340 on that same object. The next object initializer
uses 0x1234040, exactly 0x4d8 later, confirming the class extent alongside its
last byte field at +0x4d4. The actual global dialog instance and its two compiler
lifetime thunks remain to be added and accounted separately from game functions.

## 2026-10-28: reviewed model applied and accepted

The owner replied "Apply the reviewed corrections" to the combined first-TU
proposal. Applied exactly tools/link.py and data/{flags,lib_funcs,lib_overrides}.tsv,
then installed the thirteen-function source and ledger. Stock make try confirms
all thirteen; make gate and make accept report 357/357, 46,987 matched game
bytes (6.72%), 25,428 same-offset bytes (1.417%, +3,540). The first eight
functions are at their exact retail addresses; the other five are normalized
matches awaiting the intervening handlers. Both live regression tests pass.
No verifier predicates, masks or boundary fixes were changed. The separate
verifier proposal still requires its own review. Previous "prepared" and
"owner files unchanged" notes above describe the pre-approval experiments.

Local CI completed successfully: 357/357 rows match, zero failures, both meters
retained. No webhook is present in this private worktree; no message was sent.

## 2026-10-28: first-file handlers, six more matches

The next verified group is 0x401560 (28 B), OnCancel 0x401580 (28 B),
OnDestroy 0x401780 (67 B), DefWindowProc 0x401aa0 (35 B), OnHScroll 0x401ad0
(167 B), and the shared button notification 0x402190 (8 B). The parent pointer
at 0x1233488 supplies CWnd::m_hWnd at +0x1c; a compile-time offset check pins
that layout. Both close-command entries post WM_COMMAND / 0x816a / zero.
The unnamed free entry preserves PostMessageA's observable BOOL in EAX;
its original C++ return declaration is not recoverable from the unused result.
OnCancel's void signature is pinned by its CDialog virtual slot.

OnDestroy calls CWnd::OnDestroy, gets the safe HWND before initializing the
44-byte WINDOWPLACEMENT, then saves only on successful GetWindowPlacement.
The registry callee at 0x47a140 was inspected directly: three stack arguments
(name, binary data, byte count), binary REG_BINARY write and bool success.
It belongs to win_main.cpp and is declared here without an invented body.
DefWindowProc suppresses WM_CLOSE and otherwise forwards all three arguments.
OnHScroll gets the slider position before calculating the float value, clamps
only the upper bound, refreshes its edit control, then forwards the original
three arguments to CWnd::OnHScroll. Moving the message result to a local was
the bounded source correction that reproduced the target's evaluation order.

The pruned six-body source passes 363/363 with 47,320 bytes (6.76%), no added
unverified bodies or order warnings, and 25,600 same-offset bytes (1.427%, +172).
The leading TEN functions, through OnCancel at 0x401580, now occupy exact
retail addresses. The 453-byte edit-reading body and its two five-byte callers
remain drafts. Two out-of-line source forms and an inline-member form gave
453/450-byte bodies at 59/55%, while the target takes this in ECX and LTCG
chose ESI; both actual callers (0x401770, 0x401f90) were confirmed from decoded
instructions. A generic make-try search initially picked an unrelated header
jump for the five-byte target; direct symbol checks rejected that false choice.
No such row was added. No compiler/flag changes or fake callers were used.
Drafts and the complete results remain in scratch/codex_1028_advcurve_handlers/.

The applied six-body source passes stock make try, gate, accept and local CI.
Both model tests pass, including exact control-table bytes, shared-global
operand bindings, known callback routing and all ten leading function addresses.
The compact accepted record is research/codex_order/handlers_proof.json.
