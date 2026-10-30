# Codex current run

The owner resumed work to complete held files and publish a reviewable file ledger.
Eleven files now pass complete normalized code/helper/metadata audits; see
ledger/files.tsv and research/gemini_review/FINISHED_FILES.md. Continue the
remaining hard files without changing masks or fabricating caller contexts.
TextureLayout and KeyValueSelect are complete; next primary target is TexEdit.
RotateDlg's four real bodies and DialogInfo's caller still need completion.
The two density/Pmesh reports are preserved hard handoffs with no accepted source.
Use the common stdafx.h SDK context for MFC TUs. Update the file ledger after
fresh regression and file audits; never mark an unaudited partial as VERIFIED.

# Codex: hard files and integration (2026-10-29)

The mandatory file-completion contract in CLAUDE.md applies to this role: one active TU,
complete routine/helper inventory, real metadata bindings and a full regression
before FILE VERIFIED. Partial checkpoints remain PARTIAL.

The owner assigns Gemini the easy-file queue and Codex the hard work. Follow
WORK_ASSIGNMENTS.md, lanes/BOARD.tsv and lanes/CODEX_MERGE.md. All 49 files in
lanes/GEMINI_QUEUE.tsv are exclusive Gemini scope until a reviewed handoff;
do not reconstruct or change their headers while its checkpoint is active.

## Batch-three hard handoff

Own MRU, CapDialog, points and win_common leftovers now. MRU's registry
loader source is 299 B, but the inventory splits 96/203 at 0x46c440, whose
first instruction reads preceding compare flags. Source and disassembly are
in .agents/gemini_review/scratch/batch3_review; no inventory changes shipped.
CapDialog needs generated-helper/RTTI work and the 13-byte strlen helper's
proper classification. Points Next/Prev require the actual shared camera/main
window layouts, not the delivery's conflicting simplified classes; Draw needs
the real renderer caller group. Windows enumeration has five held dependencies.

A stale ledger mapped both angle functions to 0x487180. They now independently
MATCH at 0x487180 / AngleMod and 0x4872d0 / AngleNormalize360, with retail source
order restored. Before every delivery run test_game_ledger.py plus the referee;
never trust row sizes, duplicate addresses, AUTO rows or a self-reported count.

## New reviewed leftovers

LstToolBar.cpp, ScaleDialog.cpp and DialogThick.cpp now belong to Codex. All
their game rows match (4/42 B, 3/103 B, 4/93 B), but the full TUs are not done.
Retail has named RTTI for each class; current new TUs emit none. LstToolBar's
generated deleting destructor is 39/33 B after removing forbidden noinline.
DialogThick's generated helper fails CALLEE once the five-byte real class
destructor is known: it calls CDialog directly instead. ScaleDialog's generated
helper separately MATCHes 33 B. Keep AUTO code separate from game credit.
These need evidence-backed compiler/caller/RTTI work; do not restore the
attribute or change flags blindly. research/gemini_review/test_small_dialogs.py
checks actual vtable stores, defaults, parent maps, callbacks and helper status.

## Prior owner pause after the reviewed checkpoint

Paused at the owner's explicit request after both source merges and final checks.
Main: 529/529, 61,031 game B / 8.72%, unverified 48. RotateDlg remains the
primary partial file (six game routines / 498 B); do not call it complete.
TextureLayout's member-header context, DialogInfo's Pmesh caller and KeyValueSelect's
select.cpp caller are explicit hard handoffs. Preserve every scratch candidate.
Resume only when the owner asks. Full evidence: research/gemini_review/DIALOG_BATCH.md.

## Earlier complete-file checkpoint

ScaleDialog is FILE VERIFIED: all three game routines / 103 B, generated deleting
helper / 33 B, complete 86-slot class metadata/RTTI/default/message-map bindings.
The reviewed /GR row restores named RTTI without adding EH. Exact image placement
remains pending. Proof: research/gemini_review/DIALOG_COMPLETION.md and its tests.
Memory remains partial at 46/49; allocator trials are already resolved.
RotateDlg is the next primary source file. Its scratch is an incomplete hard
handoff: actual OnApply at 0x43c2b0 is 475 B, whereas the draft is empty.
Spin handlers also omit their retail work. Never merge those placeholders.
Proof: build/rotate-onapply-show.log; preserve the entire Gemini draft.

## Immediate hard work

1. The two temporary allocators now MATCH and are landed. Do not repeat those
   trials. com_memory has 46/49 matches; remaining initialization, data naming
   and enumeration need their real dependency/caller groups. Facts and failed
   variants are in research/codex_memory/README.md and private scratch.
   TexEdit is now Codex-owned for its GDI alias and CTexWnd caller blockers.
2. Continue the editor group: AdvCurveDlg.cpp, CamWnd.cpp and cameratargetdlg.cpp.
   Recover real missing callers and shared global ownership. Do not rerun the
   exhausted edit-body / noinline / Ob1 variants without new evidence.
3. Own the known cross-file blockers: q_shared I_strcmp for com_shared's filter,
   dvar registration for memory initialization, scr_stringlist for the xmodel
   getter, real filesystem/editor callers, and header/global/library bindings.

Explicit transfers from Gemini: com_memory.cpp, com_shared.cpp, q_parse.cpp,
xmodel_utils.cpp and com_files.cpp. Their five/ nine/ parser/ getter/ filesystem
leftovers are hard work now; existing verified source remains intact. Other
hard files are the 37 codex-lane rows in BOARD.tsv. Work on one TU at a time.
No ABI hacks, guessed globals, invented names, fake callers or relaxed masks.

## Integration

Gemini targets 100% of each assigned TU before calling it complete or moving
on. Review each completed-file claim or explicit hard-blocker handoff; never
accept partial function counts as whole-file completion.

Review every new committed Gemini checkpoint and its per-file report. Check
scope against its queue, real source and trial evidence, names, assertions,
callee/data bindings and current baseline. Preserve the delivery SHA on a
safety ref. Require a clean committed worker and clean tracked main state.
Use RADIANT_CI_NO_NOTIFY=1 tools/land.sh gemini. It verifies the worker and
merged main before pushing; never reset a dirty, newer or rejected worker.
Resolve report conflicts by merging main into the worker and preserving the
reviewed report, not by dropping source or overwriting an active checkout.

After each merge, update actual matched counts, owner/status, meter and handoff,
push the checkpoint, then fast-forward the worker only if clean. A file with
only hard leftovers transfers to Codex in the board and is removed from the
Gemini queue before Codex edits it. Keep the rest of Gemini's queue available.

Baseline: 507/507 game matches / 59,661 B (14.17% functions, 8.53% game code),
compiler 2 / 35 B, unverified 48, order warning one. Same-offset 26,582 B /
1.482% is report-only. Exact image SHA and boot remain unfinished.
