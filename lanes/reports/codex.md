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

## Two temporary allocators matched

Two new game MATCHes / 461 B in com_memory.cpp:
- 0x48aae0 / 279 B: Hunk_AllocateTempMemoryInternal.
- 0x48ac00 / 182 B: Hunk_ReallocateTempMemoryInternal.

The retained source follows the verified server's global hunk_low.temp update
sequence, with the actual Windows error strings and target assertions at lines
1639 and 1667. hunkHeader_t and its magic/size fields are the existing pinned
types; no retail addresses, assembly, wrappers, ABI overrides or flag changes.
Reference: cod2engine/archive/lnxded-1.0/src/universal/com_memory.cpp:537-593.

Six bounded source variants were compared with the unchanged linked referee.
Pointer commutation, signed/unsigned address casts, typed locals and declaration
order leave the two SIB encodings different at +0x5a. The reference's direct
global-state flow removes the difference and matches both complete bodies.
The integer casts and raw header writes from the drafts are not in final source.
Explicit symbols are necessary for the allocator probe: best-match guessing can
select the high allocator and pin the wrong callback while the real candidate
uses a temporary LTCG register convention. The stock ledger then preserves the
real address-taken entry; final make gate verifies both without custom flags.

Fresh private gate: 502/502, 59,341 game B (8.48%), 14.03% functions, compiler
2 / 35 B, zero failures, unchanged 48 unverified bodies and one warning. The
extended memory-binding test covers all 46 accepted routines in this TU and
actual literals/import/state identities. Unique-address/anchor-size audit passes.
Main's final combined numbers include separately reviewed Gemini work.

All attempts and evidence: scratch/codex_1029_memory_work/.


## NameDlg integrated; ScaleDialog completed; new Gemini dispatch

Main f535098 lands independently reviewed NameDlg through tools/land.sh
gemini_review; worker referee and merged-tree CI pass and the merge is pushed.
Five new game routines / 245 B. All 512 rows match: 14.31% functions,
59,906 / 699,591 B (8.56% game code). Compiler ledger 2/2 / 35 B; zero
failures, unchanged 48 unverified bodies and one order warning. Same-offset
26,113 / 1,794,048 B (1.456%),
report-only; exact whole-executable SHA and GUI boot remain unfinished.

Codex finished ScaleDialog's full normalized code/class metadata review:
three game routines / 103 B and separate deleting helper / 33 B, 86 vtable
slots, full RTTI/base offsets, defaults/DDX and message-map bindings. /GR alone
restores named RTTI; no EH is emitted. This completes a previously partial
file and adds no game bytes. NameDlg's five game routines, 33-byte scalar,
65-byte shared destructor, 40 B of EH helpers, 3-byte shared CString conversion
and complete metadata/EH tables are separately verified. Absolute image
placement remains PENDING for both files; no whole-image identity is claimed.
Proof/manifest: research/gemini_review/DIALOG_COMPLETION.md. Final actual-main
checks: build/dialog-final-tests.log; owner CI: build/dialog-owner-ci.log;
merge CI: build/ci-last.log. Source, flags and GDI correction: ff14985.

The original NameDlg report had wrong message-map/parent addresses and omitted
internal padding/shared helpers; reviewed corrections are recorded. Removed its
new duplicate AUTO row. No inventory, referee predicate or mask was changed.
Both GDI aliases 0x505804 and 0x50582e are proven wingdi.obj CGdiObject methods;
archive bytes, import relocation and retail GDI32 DeleteObject binding agree.
TexEdit's missing real CTexWnd callback/caller group remains unconstructed.

Latest worker check found active uncommitted NewProjDlg.cpp; preserve and finish
that file first, then DialogInfo.cpp, then DlgEvent.cpp, one TU at a time.
56 easy candidates remain. RotateDlg's reported completion is not accepted:
HEAD 59b3db9 contains only NameDlg; RotateDlg is scratch-only, with empty
OnApply vs retail 475 B and incomplete spin callbacks. Preserve that draft;
Codex takes the hard remainder (32 files). No Rotate flag proposal is adopted
without a genuine verified source delivery. Never overwrite active worker edits.

## RotateDlg verified partial checkpoint

Six new game routines / 498 B pass the unchanged linked referee. The generated
34-byte scalar and 200-byte shared destructor at 0x416350 are checked separately.
Correcting the proven CSpinButtonCtrl library alias makes its destructor check
pass; no mask changed. Canonical source has no unmatched/empty rotation handlers.
Private gate: 518/518, zero failures, unverified 48, one order warning.

RotateDlg stays PARTIAL: OnApply and three spin handlers need the real selection
caller/callee context; the member SpinButton scalar also differs 33/30 B from
retail. Three genuine source trials, exact differences, saved candidates and
actual output are in scratch/codex_rotate. The candidate matrix helper matches
107 B only in that cohort and is not separately credited or retained. All
experimental select.cpp/com_math.cpp changes were restored. Evidence and next
steps: research/gemini_review/DIALOG_BATCH.md. No ABI hacks or guessed layouts.

## Paused after RotateDlg and three-dialog integration

The owner requested a pause after finishing these reviews. Both source merges
are pushed: c7ce6d5 (Codex RotateDlg) and df92ba1 (Gemini snapshot 965e352).
All 529 game rows pass merged CI and the unique-address/exact-span audit:
14.78% functions, 61,031 / 699,591 B (8.72% game code), same-offset
26,127 / 1,794,048 B (1.456%).
Compiler ledger 2/2 / 35 B, zero failures, unchanged 48 unverified bodies and
one order warning. Relative to the prior 512-row checkpoint: +17 game routines /
1,125 B, separately Codex +6 / 498 B and Gemini +11 / 627 B. Same-offset +14 B.

NewProjDlg (3 / 147 B) and DlgEvent (3 / 175 B) are FILE VERIFIED under
normalized code/helper/metadata checks, including their shared 36-byte destructors,
constructor EH/unwind tables and all 86 vtable slots. Their padding is 44 / 32 B,
correcting the worker's final-gap-only totals. TextureLayout adds five / 305 B
and its class scalar/destructor/EH/metadata pass, but it remains PARTIAL:
shared member SpinButton scalar is 33/30 B, first +0x0. Its real 16-byte header
constructor and 30-byte SetRange body match their target shared bodies.

RotateDlg adds six / 498 B; scalar 34 B and shared destructor 200 B match
separately. Four rotation handlers remain scratch-only after three real caller/
callee trials. No near-match or temporary matrix/SinCos helper is credited.
select.cpp and com_math.cpp were restored; no ABI annotation, fake caller or
partial guessed brush/prefs layout was retained. The corrected spin destructor
alias 0x4f56ee is proven by target RTTI and 56 normalized archive bytes.
The remaining SpinButton scalar/context gap also applies to RotateDlg; complete
EH/helper ownership auditing and real callback bodies are still pending.

Proof: research/gemini_review/DIALOG_BATCH.md, test_dialog_batch.py,
test_rotate_checkpoint.py, test_spin_binding.py and build/pause-dialog-final-tests.log.
Both landers' worker/merged CI are retained in build/rotate-land.log,
build/dialog-batch-land.log and build/ci-last.log. No comparison masks, referee
predicates or inventory were changed. Whole-image placement, final SHA and GUI
boot remain pending. Original drafts/safety refs and the unrelated near.py stay.

Board: 51 queued easy candidates for Gemini, 35 Codex lane files including
explicit TextureLayout/DialogInfo/KeyValueSelect hard handoffs. No code from
undelivered DialogInfo/KeyValueSelect scratch is accepted. Next Gemini files
when the owner continues: PatchDensityDlg.cpp then TerrainDensityDlg.cpp.
Codex remains paused, with RotateDlg its next primary continuation.
