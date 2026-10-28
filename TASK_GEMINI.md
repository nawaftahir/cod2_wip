# Gemini assignment: deliver verified filesystem groups

Worktree: /home/nawaf/cod2/test/dev/radiant/.agents/gemini, agent/gemini.
Read this current file from root main, then WORK_ASSIGNMENTS.md and RULES.md.
The owner will relay this assignment to the existing Gemini session.

## Baseline and ownership

First preserve local changes, then merge main into your own branch when no build
is running. Do not reset or write the main checkout. Main now includes your
754c328 delivery and Codex's verified camera setup: 407 game matches / 50,836 B,
7.27% of game code, whole-file same-offset 26,210 B / 1.461%, compiler 2 / 35 B.
Run a fresh gate before using that baseline. The deletion metadata is already
fixed: retail 0x4dad56 is _remove in unlink.obj and calls DeleteFileA.

Own com_files.cpp/.h. You also own only the real filesystem-read caller at
src/radiant/TexWnd.cpp:0x440ca0, plus its immediate 0x440c70 lookup companion
if needed. Leave all other TexWnd routines to their existing declarations or
report a specific new dependency. Codex owns AdvCurveDlg, cameratargetdlg,
CamWnd and shared tools/library/layout work. No overlap and no invented callers.

## Delivery order

1. Land the now-unblocked deletion pair: FS_Remove 0x47e160 (8 B) and
   FS_Rename 0x47e1f0 (257 B). Inspect the original calls and use remove(),
   never _rmdir(). Keep a smaller passing coherent delivery if Rename needs
   additional genuine callees. Do not repeat the old incorrect library binding.
2. Deliver the actual shutdown pair together: FS_ShutdownSearchPaths 0x481910
   (126 B) and FS_Shutdown 0x481990 (68 B). A matched shutdown wrapper is not a
   complete delivery while its new helper fails. The observed source draft is
   preserved in research/gemini_delivery/20261028/shutdown_observed.cpp.
3. Continue the sanitizer/read group using the preserved drafts. Reconstruct
   the real 230-byte TexWnd caller at 0x440ca0, which calls 0x47ed20 at 0x440d01,
   and test it with FS_FOpenFileRead_Internal and its real in-file callers.
   Treat the calling-context explanation as a hypothesis until the full group
   proves it. Pin every argument from disassembly and reference source; the
   decompile may omit register arguments. Do not guess material-header fields,
   globals, or prototypes from its apparent parameter list.

## What must improve

- Produce a committed source delivery. The four sanitizer helpers and shutdown
  are currently draft claims, absent from your ledger and latest commit. Three
  sanitizer matches overlap earlier Codex research. Credit only net new rows
  against current main, and keep research evidence separate from accepted code.
- Keep normal filename and file-handle variables in FS_ReadFile. The saved
  draft casts &qpath to fileHandle_t* and then converts the pointer back to an
  integer. Do not force stack-slot reuse through pointer/int aliasing or change
  the ABI to chase the remaining bytes. Use actual lifetimes and caller context.
- Max eight new source/compiler-context trials per blocker. Reuse prior logs;
  do not repeat an exhausted trial without new caller, type or binary evidence.
  Save the precise best percentage, sizes, first difference and dependency.
- Start from current main and transplant only the intended function group. The
  saved attempt/backup predates your accepted 754c328 functions; restoring that
  whole file removes IwdFileLanguage, iwdsort and FS_AddSearchPath. Preserve all
  verified source before any new trial. A clean Git status does not preserve
  the only draft copy after rollback.
- Your saved read-core definition is static, yet the reported retail caller is
  in TexWnd.cpp. Reconcile real external linkage with the binary/file evidence.
  The overseer tested external linkage on current source: the read core still
  measures 39% (1343/1396 B, first +0x10), and the two read wrappers regress.
  Four helpers match with their strings checked. Read the preserved rebased
  candidate/result before trying a genuinely new real caller context. Also pin
  ownership and addresses of its fs_copyfiles/global state before integrating.
- Keep experiments self-contained in your own worktree. Snapshot scripts refer
  to old absolute paths and another worker's align.py; copy the needed logic
  locally and make paths relative before running them. Do not execute archived
  scripts directly, and never change another worker's source.
- Preserve assert lines and retail function/data order. Test strings, globals,
  real callee/import identities and header contents as well as masked bytes.
- Show both percentages: game-code coverage and whole-file same-offset coverage.
  Near size, individual helper MATCHes and an unchanged 386-row gate do not
  establish a newly accepted batch.

## Checkpoint contract

For a passing group, run stock make try for each proposed row, then make gate
with every existing game/compiler row. No failures or extra unverified bodies.
Commit source/header, new ledger rows and regenerated meter locally; do not push
or run land.sh. Codex independently verifies and integrates main.

When a group remains blocked, preserve the exact candidate plus a concise report
under research/gemini_drafts/<group>/, with the input commit, source hashes,
commands and outputs. You may commit those research files and ledger/defer.tsv
without claiming source progress. Never discard the only matching source copy.

Update REPORT_GEMINI.md with the actual delivery commit, net new rows, both
percentages, exact commands/results, and remaining dependencies. Correct the
stale fad4617 hash and obsolete _rmdir credit. Send the owner the commit/report
as soon as the first coherent group is ready; continue the next group afterward.
