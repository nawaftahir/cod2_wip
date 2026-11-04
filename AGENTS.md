<!-- Generated from CLAUDE.md by sync-agents.sh. Edit CLAUDE.md, not this file. -->

# CoD2Radiant reconstruction workspace

Target: CoD2Radiant.exe 1.0, rebuilt from readable C/C++ with the original MSVC
7.1 toolchain to the anchored whole-file SHA-256 in checksums.yml. Work stays
inside radiant/. References outside this tree are read-only. No other project,
server, game installation, binary, asset or Ghidra project may be changed.

This is the authoritative track contract. After editing it, run
./sync-agents.sh to regenerate AGENTS.md and GEMINI.md. Current ownership is in
workspace/WORK_ASSIGNMENTS.md and workspace/lanes/BOARD.tsv; tasks and the queue refine that scope.

## One proper file at a time: mandatory for every worker

Each worker has one active source TU. Reconstruct it in its existing retail
file and function/data order, then verify the entire file before calling it
complete or moving to unrelated source. Codex's independent review of submitted
worker files may run alongside its primary reconstruction file.

A passing function is progress, not proof that its whole file is complete.
Verified partial checkpoints may be committed and integrated without losing
work, but the file stays PARTIAL. Continue that same file. A genuine dependency
blocker must identify the address, real best result, first differing byte,
needed caller/type/global, saved candidate and actual trial output. Resolve a
bounded dependency or arrange an explicit ownership handoff/reassignment before
switching files. Never hide a blocker or label the file complete to move on.

A FILE VERIFIED report requires all of the following:

1. Account for every original routine owned by the file, including routines
   omitted from the game ledger, generated destructors, inlines, EH/unwind
   helpers and emitted code outside the contiguous main TU range. Record each
   address, symbol, target byte span, status and source/evidence. A suspected
   bad inventory boundary is a proposal to review, not permission to drop code.
2. Every game routine passes the unchanged linked-executable referee at 100%.
   Game addresses are unique, row sizes equal anchored spans, and known callees
   bind correctly. AUTO/compiler/library code is verified separately and never
   inflates game function or byte coverage. A near-match is not a match.
3. Verify the file's actual constants, strings, globals, field offsets, tables,
   vtables, RTTI hierarchy/base offsets, runtime-class records, message maps,
   callback identities and relevant initialization/cleanup references. Compare
   contents and referenced identities after relocation normalization. Matching
   instructions with masked addresses does not establish these data bindings.
4. Preserve original source ownership, class definitions, storage/contributor
   order, assertion expressions and retail line numbers. No conflicting class
   views, fabricated fields/callees, duplicate helpers or later planned moves.
5. Run the game-ledger audit, full regression gate and relevant binding checks.
   Existing game matches/bytes may not decrease; unverified canonical bodies
   may not increase. New unmatched bodies stay in scratch. Merged-tree CI must
   pass before publication; never mistake stale build artifacts for proof.
6. Commit the verified result and report the completed file to the user with
   exact per-file game/helper/metadata totals, proof commands, remaining layout
   work and project function %, game-byte % and whole-file same-offset %.

PARTIAL means any required routine, helper or data binding is missing, failed
or unchecked. FILE VERIFIED means the above source/code/metadata checks pass
under relocation normalization. It does not mean its current addresses equal
retail. Report absolute image placement as PENDING until demonstrated. Only a
rebuilt whole-executable SHA-256 equal to the anchor establishes whole-file
identity; report GUI boot/smoke separately. Never describe a green submitted
ledger as a 100% whole-TU or whole-executable match.

## Source and evidence

The retail binary is authoritative, followed by the track analysis DB and
independent agreeing references. Use the verified server source for shared
engine files and Q3Radiant/CoD4 structural references for editor files. Inspect
make show before editing. Names require target strings or agreeing reference
logic; otherwise use FUN_<addr> / UNNAMED. Confirm types and layout from target
instructions, allocation sizes, actual call sites and data. Never guess.

Editor C++ files include stdafx.h for the measured MFC header frame profile.
The shared SDK header context omits frames; game bodies retain them. Editor
C++ exception/RTTI features are the owner-reviewed default in data/flags.tsv.
Do not replace that context with local ABI or noinline workarounds. The full
file completion table is ledger/files.tsv, regenerated only after the fresh
referee and every complete-file audit pass: python3 tools/file_ledger.py.

Real C/C++ only. No retail-byte arrays, copying/patching retail bytes after link,
asm/_emit/naked functions, fake callers/wrappers, forced noinline, invented ABI
annotations or weakened comparison masks. Numeric constants are allowed when
proved by the target (for example window-style flags and allocator magic);
absolute retail addresses must not substitute for proper source symbols.

Use make try with the exact known symbol when best-match guessing chooses the
wrong routine. LTCG register conventions require real source/caller context,
not ABI hacks. Keep bounded, distinct source trials and their actual outputs.
Eight tries is a ceiling, not a quota. Never fabricate or pad try logs; ledger
deferrals require the recorded evidence. Do not repeat exhausted variants.

## Ownership, integration and cost

Local workers use .agents/<name> and agent/<name>, one TU at a time.
The browser worker uses radiant/web/<lane> (see workspace/TASK_WEB.md) and workspace/TASK_WEB.md; its exclusive file
is FindTextureDlg.cpp. Codex does not edit that file during the reservation. Gemini edits only
its assigned source, matches/defer rows and report. Shared headers, flags,
inventory, tools, library identities and link layout require Codex/owner review;
Gemini submits evidence-backed proposals. Codex may adopt those changes only
after target evidence and regression proof, documenting the decision.

Codex reviews committed snapshots without interrupting active worker edits,
preserves safety refs and integrates through tools/land.sh where applicable.
A dirty worker is preserved; review an isolated committed snapshot instead.
Never reset, overwrite or claim over unmerged/newer work. Preserve unrelated
owner files and drafts. Only Codex integrates/pushes main under the owner's
existing authorization. The browser worker may commit/push only its assigned
radiant/web/<lane> (see workspace/TASK_WEB.md) branch, following workspace/TASK_WEB.md. Other workers never push. Use the configured Nawaf identity,
short messages, no Co-Authored-By, and never commit binaries/assets/projects.

Use RADIANT_CI_NO_NOTIFY=1 unless notifications are separately requested.
Same-offset bytes are report-only while layout is incomplete; do not discard
passing source because offsets moved. Keep structure correct as each file goes.
Reuse fresh objects for a source cohort, run independent reads in parallel and
keep builds in the background. Do not overlap links in the same worktree or
repeat successful checks without a changed input or an unresolved concern.
