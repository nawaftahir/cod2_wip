# Current checkpoint - Codex owns the parked Gemini queue

The owner stopped Gemini for quota and assigned all of its remaining work and
drafts to Codex. The web worker exclusively owns FindTextureDlg.cpp on web/reconstruction;
do not overlap its source. workspace/TASK_WEB.md defines its review contract. Keep .agents/gemini preserved;
work in .agents/codex. workspace/lanes/BOARD.tsv records ownership. The former 45-file
GEMINI_QUEUE.tsv remains the backlog order.

Current primary TU is PatchDialog.cpp. Its fifteen accepted routines / 1,391 B
and two real win_main.cpp registry dependencies / 260 B add seventeen matches.
Both files remain PARTIAL. The shared registry header also repairs AdvCurve's
old unresolved FUN_0047a140 call. All 552 previous matches survive.

Baseline: 569/569 / 68,749 B (9.83%), 15.90% functions, 44 unverified,
one order warning; same-offset 26,574 B (1.481%). Compiler ledger 3/69 B;
the actual global-object-qualified lifetime proof separately checks 35 B.
Fourteen existing complete-file proofs remain green. No full-image identity
or boot claim. Proof: workspace/research/codex_patchdialog/test_partial.py.

Next resolve the real 0x433910 texture-info callee group and original shared
patch/global types, or the compiler/lifetime context of the genuine modal
dialog. Actual blockers, best byte results and source snapshots are documented
in workspace/research/codex_patchdialog/README.md. Do not repeat the recorded source
variants or restore noinline/stubs. Keep passing dependent bodies held until
their real dependency matches and canonical unverified bodies do not grow.

BinDiff really compared CoD2Radiant and iw3xo's IW3xRadiant. Its cached database
can be queried per TU without re-exporting; use workspace/research/codex_refdiff/report.py.
KisakCOD supplies reference source but no executable here. Low-score false pairs
are documented and must not become invented names/types. Whole-TU inventory,
all data/helper bindings and fresh regression are required before FILE VERIFIED.
