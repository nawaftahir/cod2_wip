# Gemini correction review, 2026-11-01

Reviewed committed snapshot 0cfaf5b, preserved as safety/gemini-0cfaf5b.
Its six-file delta removes the fake Pmesh dependencies, six empty header
overloads and forced noinline, and separates three generated scalars. These
are useful corrections to the rejected dd98dac delivery, not new game matches.
No source or ledger rows from this snapshot are accepted.

The earlier shared-layout and ABI findings remain unresolved: the density
files still invent CMainFrame/CXYWnd views with raw offset getters; ZWnd still
adds a conflicting CFrameWnd-derived declaration and __stdcall HandleKeyUp.
The files still bypass stdafx.h. Scalar helpers need actual code and binding
proof before owner compiler-ledger changes. The worker branch also predates
accepted real Pmesh, KeyValueSelect, MRU and texture-vector source. A bulk merge
would lose newer accepted work; preserve the branch and port reviewed changes.

## Active draft snapshots

Read-only copies and SHA-256 identities are saved in
scratch/gemini-review-0cfaf5b/drafts.json. These were uncommitted worker drafts;
they are not a completed delivery and their reported match count is unverified.
The active worker was not edited, reset, synchronized or built.

PatchDialog.cpp (404 lines / 8,486 B) claims 23/28 routines in its comment.
Before a source delivery:

- Remove auto_inline(off/on) around OnBtnPatchreset and use stdafx.h. A
  per-function forced inlining suppression is not an accepted caller repair.
- Use the owner's Pmesh.h declaration. The local patchMesh_t/drawVert_t types
  conflict with the canonical full 0x3838 extent and opaque control storage.
  Propose target-pinned texture-coordinate fields rather than replacing types.
- Propose one shared CTextureLayout declaration. The draft omits virtual
  DoDataExchange, OnOK, OnInitDialog and the message map found in the accepted TU.
- Prove each callback, real global instance, global initializer/destructor,
  CString cleanup, EH, vtable/RTTI, controls and dependency/global bindings.
  Unmatched bodies stay in scratch with actual best-result logs. Report PARTIAL
  until every original entry and metadata check passes.

win_main.cpp (35 lines / 1,028 B) only drafts SaveRegistryInfo/LoadRegistryInfo;
the assigned inventory has 21 entries. It is not a whole-file delivery. Keep it
preserved while PatchDialog is active. After a complete or documented blocked
PatchDialog handoff, continue win_main and audit registry imports, key string,
shared state, return paths and the remaining 19 original entries.

Main remains 548 game matches / 64,638 B, 13 audited files. No expensive build
of the rejected snapshot was needed: the remaining source/type violations are
visible before compilation. Existing independent proofs already accepted the
useful SDK identities from the earlier review.
