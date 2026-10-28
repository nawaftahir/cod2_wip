# Radiant coordination

The owner appointed Codex overseer. This file is the current assignment contract;
it overrides older auto-claim, auto-land and source-order directions where they
conflict. Byte-accurate C/C++, binary evidence, the pinned compiler and the referee
remain mandatory. No pushes, fabricated callers, assembly blobs or byte patches.

| Owner | Worktree | Exclusive source ownership |
|---|---|---|
| Gemini | /home/nawaf/cod2/test/dev/radiant/.agents/gemini | src/universal/com_files.cpp and com_files.h; TexWnd.cpp only 0x440ca0 and its immediate 0x440c70 companion |
| Codex | /home/nawaf/cod2/test/dev/radiant/.agents/codex | src/radiant/AdvCurveDlg.cpp, cameratargetdlg.cpp and CamWnd.cpp; shared tools, library identities and layout |
| Codex integration | /home/nawaf/cod2/test/dev/radiant/.agents/overseer | independent review and main-tree integration |

Only Codex integrates main. Workers commit locally. They may merge main into
their own clean branch between builds, but never merge into main, reset or
write another worktree. Do not use tools/land.sh: it auto-pushes and hard-resets
worker branches. Other old agent worktrees are inactive and are not assignments.
The root gemini/ folder holds progress documents; it is not a Git worktree.

Gemini continues the entire filesystem TU from the consolidated baseline; do
not redo already-covered rows. Codex continues the editor TU
and fixes shared blockers. Gemini may preserve blocked candidates under
research/gemini_drafts/ and report evidence without crediting those as game matches. Changes to qcommon.h, shared types, flags, library
maps or link order require a request to Codex with the target addresses and
binary evidence. Workers may update their own ledger/matches.tsv, defer.tsv,
meter.json and REPORT_GEMINI.md. These are local copies; integration checks and
combines new rows by address instead of overwriting the main ledger.

Delivery: one coherent source/caller batch, a local commit, exact verification
commands/results, matched code bytes and whole-file same-offset bytes. Report
which parts of the TU remain unfinished. After eight failed source trials,
record the precise mismatch/dependency and continue elsewhere in the same TU.
No new source file or speculative ABI change to force a counter.

Review gate: check scope and duplicate addresses; compare actual callee/import
identities as well as masked bytes; independently build and run all ledger rows
and compiler rows; require no regressions or increased unverified count. Check
changes in file order, constants, globals and whole-file offsets. Record the
result before updating main. Passing a worker's local counter is insufficient.

Known review finding: Gemini's sole row absent from the consolidated Codex
baseline is FS_Remove at 0x47e160. Its _rmdir body is withheld: retail's wrapper
0x4dad56 calls DeleteFileA, while _rmdir removes directories. That library map is now corrected in main. Use remove(), preserve genuine caller
context, and do not spend more variants on the incorrect binding.
