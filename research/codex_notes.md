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

## 2026-10-28: retail-file continuation, scale and swatches

Added the actual 81-byte scale setter at 0x401cd0 and 139-byte OnDrawItem at
0x402420, in their original AdvCurveDlg order. The setter uses the float log
overloads, stores log(2) in a float, and sends log(value)/log(2)+8 through the
existing quantized setter for control 1426. OnDrawItem paints the color field
for 0x5b6, the alpha gray swatch for 0x5ba, and forwards other IDs to CWnd.
Both brush paths delete their real GDI brush after FillRect. No attributes,
flag changes, fake references or comparison changes enter the source.

PINNED log identity: retail 0x4d7a20 branches to known __log_default at
0x4d7aaf. A second bare kernel32 harness maps the original at 0x400000,
skips its entry point, and checks log(1), log(2), log(4), log(0.5) and log(e)
to 1e-12. All five pass. The source, hashes and result are retained in
research/codex_order/{prove_log.cpp,log_proof.json}. No library tables changed.
The live model test checks both scale-setter call sites bind to actual _log.

The 0x4015a0 gap is still unresolved. A plain first-TU /GX /GR build with
static generic helpers gives 362/366, with the 453-byte target at 81%/454 B,
but breaks the accepted constructor, destructor and deleting destructor.
Reject that build model. Adding the real scale setter under the approved
flags yields an exact 81-byte callee and exact five-byte caller stubs, but
inlines the scale conversion into the shared edit body (75%/511 B). Bounded
noinline probes retain the scale body but revert the shared edit body to an
ESI convention (55%/450 B) and its callers to ten bytes. These attributes are
not shipped. All existing 363 matches survive the GL probes. The complete
source/context attempts and direct-symbol results are retained in
scratch/codex_1028_advcurve_gap; no claim of compiler impossibility is made.

The paired trial reports 365/365, 47,540 game bytes (6.80%), fifty unverified
bodies, one order warning, and the same ten leading exact retail addresses.
Whole-file same-offset bytes are 25,134 (1.401%), down 466 from 25,600.
The drawing handler alone is 364/364 but also drops same-offset bytes by 315.
The owner selected retail-file reconstruction in response to the two-counter
question. Continue that file in real order and report layout fluctuations;
do not discard verified bodies solely to chase an incidental offset count.
The earlier strict per-batch offset rule records the superseded interpretation.
The whole-file SHA goal is unchanged; this group proves source byte matches,
not complete whole-file placement or a runnable editor.

Reproduce the standalone log check inside the pinned image from the worktree:

    wine /opt/msvc710/Vc7/bin/cl.exe /nologo /c /O2 /Fobuild/prove_log.obj research/codex_order/prove_log.cpp
    wine /opt/msvc710/Vc7/bin/link.exe /nologo /OUT:build/prove_log.exe /ENTRY:entry /SUBSYSTEM:CONSOLE /BASE:0x10000000 /FIXED /NODEFAULTLIB build/prove_log.obj kernel32.lib
    wine build/prove_log.exe

Stock make try reports both new symbols MATCH, and make gate / make accept
report 365/365 with the measurements above. Both model tests pass. The live
checks pin the control table and shared state, all known dispatch pointers,
the two calls to _log, and the ten exact prefix addresses.

Local CI also passed: 365/365, zero failures, no added unverified bodies or
order warnings. Same-offset remains 25,134; SHA identity remains false.

## 2026-10-28: first-file initialization and selection group

The original contains seven 12-byte selection records at 0x58fa58 and seventeen
12-byte subclass records at 0x58fab0, followed by the existing control table at
0x58fb80. Both tables are now typed C++ data, in that same declaration order.
Selection records contain control ID, returned value and an unclaimed field_08;
only record 1 has field_08 = 1. The subclass records contain control ID, HWND
and previous WNDPROC, with both pointers initially zero. No names or meaning
are invented for the unused field. Raw recovered tables are saved in
scratch/codex_1028_advcurve_selection/tables.json.

The first batch matched nine methods / 861 B with all 365 old rows preserved.
Changing the callback's window comparison operand order matches the 116-byte
window procedure. Explicit false/true returns reproduce the seven checkbox
queries' AL result instead of the 1-byte-longer EAX canonicalization. The
visibility/selection predicate uses the same early false exits followed by a
float <= false exit and explicit true return, matching all 90 bytes. This
preserves the binary's unordered float result too; it is not replaced by a
strict ordered < comparison. These are bounded readable source choices, not
claims about the exact historical spelling.

All eighteen bodies then match (1,305 B): callback 116, OnInitDialog 448,
visibility/selection predicate 90, selection getter/setter 92/93, seven boolean
queries 35/35/35/35/35/35/28, color and alpha accessors 21/7/21/7, and numeric
text setter/getter 87/85. Initialization installs the seventeen real subclass
callbacks, configures the three sliders with float rounding, captures slider
and edit HWNDs, and selects mode 6. The checkbox defaults are checked, checked,
unchecked at IDs 0x5bd, 0x597, 0x598, and ID 0x5bb starts with text "0".
The callback handles WM_KEYDOWN / Y by posting the existing parent command;
other messages dispatch through the matching control's saved WNDPROC, with
zero returned for an unknown HWND. The two code tables and every accessed
field are confirmed on the original. No flags, compiler attributes, fake
callers or library mappings changed.

Final checkpoint before the owner requested pause: stock make try, gate,
accept and local CI all passed (CI exit 0). The extended live model tests
also pass: all three table initializers and their order, accessed globals,
known dispatch entries, the actual subclass callback pointer, and Win32 import
identities are checked independently of address masking. Current accepted
meter: 383/383, 48,845 B (6.98%), 25,329 same-offset bytes (1.412%, +195).
The eighteen-function source/ledger/test/docs batch remains UNCOMMITTED at
pause. Last commit is 3330005. No new matching, builds or probes were started
after the pause request. CODEX_HANDOFF.md and HANDOFF.md record the resume point.

The owner resumed the goal. Reviewed the eighteen-function checkpoint,
confirmed its source/ledger and successful CI, and included it in commit
"AdvCurveDlg: 18 functions match" before starting further reconstruction.

## 2026-10-28: genuine global dialog and compiler accounting

The owner explicitly approved the tested global-dialog proposal. Added the
real `CAdvCurveEditDlg g_curveDialog(NULL)` definition. The original initializes
object 0x1233b68 at startup 0x526a10 and registers cleanup 0x526f50; the compiled
24-byte initializer and 11-byte cleanup both match, bind the correct source
object, and use the actual CRT constructor table. They are recorded separately
in ledger/compiler.tsv, not added to game function or byte coverage.

Applied the reviewed tools/verify.py patch. It keeps every linker-map function
start for extent calculation, including repeated local names, and checks the
compiler ledger with the unchanged per-function byte masks and callee checks.
Compiler failures fail the gate; duplicate game/compiler addresses are rejected.
A retained negative fixture deliberately binds the initializer to the cleanup
and verifies failure while game count/bytes stay unchanged; the accepted report
is restored afterwards. The old three-line boundary proposal is therefore now
applied as part of this explicitly approved change, not still pending.

LTCG reports the actual initializer's map owner as math_vector.obj. Its real
constructor call, object reference and CRT registration prove which lifetime
it implements. The cleanup's old library label is also wrong; the compiler
ledger now supplies the verified identity, while library data remains untouched.
Trying to swap parent/pending declarations did not establish their retail BSS
order under LTCG. That ineffective edit is excluded, and absolute BSS layout
remains open. Approved patch snapshots are archived in
scratch/codex_1028_advcurve_lifetime/approved; hashes are retained in
research/codex_lifetime/proof.json.

Stock make gate / make accept pass: 383/383 game rows, 48,845 B (6.98%),
plus 2/2 compiler rows / 35 B; fifty unverified bodies and one order warning
remain. All live model, lifetime-binding and negative-accounting tests pass.
The ten leading game function addresses remain exact. Whole-file same-offset
is 25,291 (1.410%, -38), reported as approved. SHA identity and GUI boot remain
unverified. Continue this first file with its remaining real handlers.

The applied duplicate-address guard also normalizes hexadecimal spelling,
so capitalization or omitted leading zeros cannot duplicate a game address
in the compiler ledger. The retained fixture exercises this rejection too.
This affects metadata validation only; byte masks and comparison logic remain
unchanged. The accepted verifier hash is recorded separately from the reviewed
patch hash in research/codex_lifetime/proof.json.

Final local CI passed with the normalized duplicate-address guard: 383/383
game rows and 2/2 compiler rows, zero failures. Both regression fixtures pass.
No push or GUI boot was performed.

## 2026-10-28: resumed lanes and global-layout review

The owner resumed Codex and adopted lanes/CODEX_MERGE.md. Same-offset bytes
remain report-only; restore the three previously rejected assertive helpers.
No new Gemini commits exist above main at this check. Keep a safety branch
before every land.sh invocation: rejection still hard-resets the worker.

Escalation for Claude: the newly landed win_qe3.cpp models qeglobals_t as a
single HWND at offset zero. Its Sys_ClearPrintf bytes pass the masked referee,
but the global object's base/field binding has not been independently pinned.
Do not reuse that one-field view as the full shared editor-global layout.
The existing camera/registry blockers require the actual owner and field offsets.
This is a data-layout limitation, not evidence against the instruction match.

## Gemini com_shared review: 2026-10-28

Main 6012019 lands the corrected com_shared delivery: five routines / 441 B
(three recovered seeds / 251 B, two new bodies / 190 B). Worker referee and
combined CI pass 429/429: 11.99% of functions, 52,888 / 699,591 game B (7.56%).
Whole-file same-offset is 26,164 B / 1.458% (+217); compiler 2 / 35 B, zero
failures, unchanged 50 unverified and one order warning. Push completed.

Review removed explicit __fastcall: the normal function also gives stock MATCH.
Its historical name lacked evidence, so it is FUN_0048b760 / UNNAMED. Nine
claimed eight-try deferrals had placeholder logs; their rows were removed and
are not accepted trial evidence. Original delivery: safety/gemini-24e9a09.
Gemini next owns com_memory.cpp; thirteen prior candidates / 1,969 B and
recovery instructions are in research/gemini_seeds/com_memory and TASK_GEMINI.md.
Fresh verification is mandatory before credit. Full SHA and boot remain open.

## Memory delivery integrated: 2026-10-29

Main baaf02a merges all three Gemini commits (safety/gemini-972e389).
Net gain: 25 game routines / 2,935 B. Fresh worker verification and combined CI
pass 454/454: 12.69% of game functions, 55,823 / 699,591 game B (7.98%).
Whole-file same-offset 25,555 / 1,794,048 B (1.424%, -609); compiler 2 / 35 B,
zero failures, one warning, unverified bodies down from 50 to 48. Pushed.

Memory TU: 44/49 functions (89.8%), 3,706/4,768 B (77.7%); corrected the
worker's inflated byte total. Twelve recovered candidates / 1,950 B plus
thirteen further matches / 985 B. Supporting literal assert macro is pinned
by target 0x48a2f0; existing macros remain unchanged. Live binding review
passes 60 literal, 27 import and 35 shared-state identity checks. No flags,
masks, inventory or verifier changes. SHA and boot remain open.

Gemini keeps com_memory.cpp for the five remaining routines, prioritizing
the two reported 99% temporary-allocation bodies. Real outputs/variants are
required; dependency claims remain hypotheses pending caller/callee evidence.

## Small-dialog delivery reviewed without interrupting Gemini

Committed snapshot 325080e was isolated in .agents/gemini_review while Gemini
continued MRU. Main cf9e736 lands that snapshot with correction 36fe8a1 through
tools/land.sh gemini_review; merged CI passed before push. Active MRU source
and inventory edits were neither used nor modified. Safety ref preserves the
original commit. The snapshot's board edits were discarded; Codex owns updates.

Net game gain: thirteen routines / 271 B. Four toolbar methods / 42 B, three
scale-dialog methods / 103 B, four thick-dialog methods / 93 B (including the
omitted five-byte implicit destructor), two unnamed shared helpers / 33 B.
Three AUTO scalar destructors / 99 B are excluded from game credit. Removed
forbidden noinline; the real toolbar destructor still matches.

All 467 game rows pass (13.05% functions), 56,094 / 699,591 B (8.02% game code).
Compiler ledger remains 2 / 35 B; zero failures, 48 unverified, one order warning.
Whole-file same-offset 26,053 B / 1.452% (+498). Actual vtable/default, parent-map
and message-dispatch checks pass. Full-TU completion is not accepted: all three
need RTTI; toolbar helper is 39/33 B, thick-dialog helper fails CALLEE. Scale's
generated helper separately MATCHes, outside game credit. No flags, masks,
inventory or referee changes. The three leftover TUs transfer to Codex;
Gemini retains 65 queued files and its current MRU draft. SHA/boot remain open.
Evidence: build/{dialogs-land-review,small-dialog-binding-review,ci-last}.log
and .agents/gemini_review/scratch/dialog_review/.

## MRU/path delivery: corrected and integrated

Main a369057 lands fbca31a plus review correction 28a4efd through
tools/land.sh gemini_review. Worker and combined CI pass 494/494 game rows:
13.80% of functions, 58,731 / 699,591 B (8.40%). Net gain 27 / 2,637 B.
Compiler 2 / 35 B; failures zero, unverified 48, order warning one. Same-offset
26,105 B / 1.455% (+52). Pushed.

Accepted file totals: MRU 14 / 1,756 B (one baseline / 21 B), CapDialog 4 /
65 B, points 4 / 656 B, Windows helpers 6 / 181 B. Removed AUTO game credit,
pruned incomplete bodies and conflicting pointfile camera class models, fixed
all incorrect row byte totals and preserved assertion line 82. No flags,
inventory, comparison masks or verifier predicates changed. The angle ledger
now maps its two actual functions to separate proven 42-byte retail addresses,
with source order restored; no duplicate game addresses remain.

Live review passes 28 MRU/path game rows, 55 actual import accesses, 11 literals
and seven consistent state references. A reusable game-ledger audit checks
unique addresses, exact anchor spans and separate AUTO/library accounting.
Logs: build/{batch3-land-review,batch3-binding-review,ci-last}.log.

Unmatched MRU registry loading, camera/drawing and Windows enumeration are held
in scratch, with original source preserved by safety/gemini-fbca31a. Those four
partial TUs transfer to Codex; Gemini keeps 61 easy files and Codex 30 hard files.
No whole-TU completion, full SHA or GUI boot claim.

## EditWnd accepted: code and normalized class metadata

Main 842db93 integrates the focused 2fcf82b delivery after independent review.
Six game routines / 149 B pass; the 33-byte generated destructor is checked
separately and excluded from game coverage. Focused checks pass all 77 vtable
slots against overrides/inherited CEdit entries, RTTI hierarchy and base offsets,
all runtime-class fields/factory/base binding, message map and retail padding.
The seven routine spans total 182 B; internal/final padding totals 42 B, making
the mapped interval 224 B. This corrects the report's incomplete padding count.

Codex adopted only EditWnd's /GX /GR row as a reviewed owner change after
retail factory/EH and named RTTI evidence plus regression; other flags remain
unchanged. Game audit, worker gate, merged CI and actual main-image metadata
checks pass 500/500 rows (13.97%), 58,880 / 699,591 B (8.42%). Compiler 2 /
35 B; unverified 48 (the report's 44 was stale), warning one, failures zero.
Main same-offset 26,213 B / 1.461%. Exact whole-image layout/SHA and boot
remain unfinished; normalized metadata agreement is not an absolute-RVA claim.

Gemini next owns RADEditWnd.cpp; its scratch draft is preserved. Sixty queued
files remain. Any new flag/library proposals are reviewed by Codex. Current
worker edits are never overwritten during synchronization. Evidence: research/
gemini_review/test_editwnd.py, build/editwnd-accepted-tests.log, build/ci-last.log,
and .agents/gemini_review/scratch/editwnd_review/.
