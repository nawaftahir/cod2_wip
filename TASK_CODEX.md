# Codex: hard files and integration (2026-10-29)

The owner assigns Gemini the easy-file queue and Codex the hard work. Follow
WORK_ASSIGNMENTS.md, lanes/BOARD.tsv and lanes/CODEX_MERGE.md. All 61 files in
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

## Immediate hard work

1. Take over the five com_memory.cpp leftovers. Start with the 99% allocation
   and reallocation drafts at 0x48aae0 / 279 B and 0x48ac00 / 182 B. Preserve
   the real source and inspect the single SIB difference before trying bounded
   operand-order/caller-context variants. Draft copied to private scratch:
   scratch/codex_1029_memory_remaining/candidate.cpp. The reported percentages
   are Gemini observations, not proof that a compiler limitation exists.
2. Continue the editor group: AdvCurveDlg.cpp, CamWnd.cpp and cameratargetdlg.cpp.
   Recover real missing callers and shared global ownership. Do not rerun the
   exhausted edit-body / noinline / Ob1 variants without new evidence.
3. Own the known cross-file blockers: q_shared I_strcmp for com_shared's filter,
   dvar registration for memory initialization, scr_stringlist for the xmodel
   getter, real filesystem/editor callers, and header/global/library bindings.

Explicit transfers from Gemini: com_memory.cpp, com_shared.cpp, q_parse.cpp,
xmodel_utils.cpp and com_files.cpp. Their five/ nine/ parser/ getter/ filesystem
leftovers are hard work now; existing verified source remains intact. Other
hard files are the 30 codex-lane rows in BOARD.tsv. Work on one TU at a time.
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

Baseline: 494/494 game matches / 58,731 B (13.80% of functions, 8.40% game code),
compiler 2 / 35 B, unverified 48, order warning one. Same-offset 26,105 B / 1.455%
is report-only. No full SHA or boot claim. Never discard passing source for an
incidental offset dip. Current user permission includes pushing after merges.
