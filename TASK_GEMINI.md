# Gemini assignment

Read the root CLAUDE.md first. lanes/BOARD.tsv owns file assignments;
lanes/GEMINI_QUEUE.tsv is the complete current 46-file reserved queue.

## Current owner takeover

The owner parked Gemini and assigned its corrections to Codex. Original commits,
all scratch candidates and dirty source/configuration are preserved. The existing
.agents/gemini worktree is not synchronized; never reset or overwrite it or merge
main yourself. Codex handles synchronization before the next worker run.

Codex recovered four real routines / 240 B in each density dialog and three real
Pmesh bounds/distance helpers / 676 B. Combined main is 544 game matches / 62,560 B
(8.94%), with eleven fully audited files. Density OnOK callbacks remain pending.
Pmesh, both density files, ZWnd.cpp, z.cpp and common/texturevecs.cpp now belong to Codex. Do not redo them.

## Work when resumed

Start PatchDialog.cpp, then win_main.cpp, then continue through the entire
reserved TSV in order. One active TU and one source commit per file. Codex can
review committed batches; no new assignment is required between reserved files.
Preserve the existing PatchDialog/win_main drafts and actual trial output.

Use stdafx.h and the owner-reviewed editor defaults. Preserve hwndEnt[33] in
win_ent.cpp and the shared EditWnd.h declaration. Shared headers, flags, library
identities, inventory, link layout, assignments and main integration belong to
Codex: submit evidence-backed proposals instead of editing those files.

A real dependency blocker is a proper partial handoff. Save the candidate and
actual referee output, identifying the address, sizes, first difference and
needed type/caller/global. Do not leave unverified replacement bodies in src/.
Codex takes the hard remainder; continue the next reserved file after reporting.

## Required corrections to the old submission

Read research/gemini_review/REVIEW_dd98dac.md. Print-and-return dependency stubs,
forced noinline and empty inline header overloads do not reconstruct the game.
Do not suppress unverified names. Three generated scalars were counted as game;
verify generated/header/library routines separately and add no game credit.

Use real shared types and bound globals, without conflicting class views or
unverified padding/offset getters. A green submitted ledger is not full-file
proof: verify the complete routine/helper inventory, EH/unwind data, vtables,
RTTI, runtime records, message maps, constants, imports and initialization.
Keep files PARTIAL until every required check passes. Report absolute image
placement and whole-executable SHA separately.

Commit with the configured Nawaf identity. Workers never push or send notices.
Run RADIANT_CI_NO_NOTIFY=1; do not change the referee or comparison masks.
