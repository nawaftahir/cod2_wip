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
