# Public shader-comment parser — 2026-10-04

Clean candidate: target/src/codex_shader_comment/comment.cpp.
PINNED D3DXFindShaderComment, SDK57/60, retail10062db3, complete231 bytes.
Full SDK/retail/source equality, original byte referee, decoded boundaries and
wrong-first/last-byte negatives pass. No relocation field is masked; no callee
or external data binding exists in this body. The unique pinned typed SDK
section identifies the public API. SDK callback carriers earn zero credit.

The body ends at offset229 with a literal internal jump to offset180, whose
full pop/pop/pop/pop/ret16 epilogue is checked. Every byte, instruction and
internal branch target is included; no first-RET truncation is used.

Fresh CPU checks pass:1284 complete compiler outputs,954 successful compilations
and330 errors per side;324 direct public comment cases with exact HRESULT,
returned offset and output byte count agreement. Direct cases cover six accepted
header kinds, PS1, invalid kind, null input, optional-output combinations and
bounded token/comment skip paths. Ownership maps require the source object in
the candidate executable and the SDK in the original. No GPU, unbounded buffer
validation or whole-DLL checksum claim.

The winning ordinary C++ form repeats token low-word comparisons instead of
keeping a separate opcode local. This changes the old compiler's register
assignment to the literal target form. The failed combined draft retains the
sampler routine separately; it receives no credit or canonical inclusion.
Neither source-level form claims historical local names/TU grouping.

Linked regression and aggregate acceptance are pending. Accepted coverage stays
353651/1089680=32.454574% until the complete aggregate terminates PASS. The new
proof tools invalidate the previous reuse environment fingerprint; use a cold
audit rather than resealing the old certificate to hide changed closure inputs.
All remaining library functions stay opaque, uncredited dependencies.

V3 now PASS:652 matches retain651, with full linked body, symbol ownership,
retained binding and loss checks. All four packet identities are current.
Cold aggregate session17239 is live at aggregate.log; acceptance still pending.
The preceding linked-regression-pending sentence is superseded by this result.

Replay build.sh, check_link.py, compile_clean_test.sh in the pinned compiler
image, then run_clean_test.py and run_comment_test.py. Use the existing pinned
CPU image for executable comparisons. Proof inputs must remain frozen during
the aggregate. SDK selectors remove only independently source-supplied functions,
never transplant retail code into source or patch post-link bytes.
