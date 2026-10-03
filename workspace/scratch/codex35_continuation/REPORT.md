# Renderer continuation checkpoint — 2026-10-04

Status: DRAFT / ZERO NEW ACCEPTED BYTES.
Accepted source lower bound:353651/1089680 =32.454574%.
35% threshold:381388;27737 further verified bytes required.
Owner requested a checkpoint before further reconstruction. No jobs are live.
Whole-DLL checksum identity and GPU smoke testing are not achieved.
Checkpoint rehash: PASS,35 cohort pin sets,105 authoritative packets,
13889 file identities,33 reviewed reuse states and environment current.
This identity recheck is not a new compilation or fresh CPU run.

## Preserved work

- codex35_emit_args: five complete source/control-flow drafts and one genuine
  compiler caller/callee group. None is accepted. args_exit.cpp is the best
  direct numeric-conversion/list draft; do not confuse similar instructions
  with full byte equality.
- codex35_predicate_states:24 genuine four-field phase-state layouts, fresh
  batch compiler log and discovery-only probe JSONs. Every candidate is1459
  versus1462 bytes, first difference7, zero credit. Source/header/object hashes
  are recorded in the packets; objects are not committed. Do not repeat this
  sweep or infer compiler impossibility from it.
- codex35_shader_comments/comments.cpp: complete SDK-header-backed ordinary
  C++ drafts of D3DXFindShaderComment and D3DXGetShaderSamplers. Fresh compiled
  object compared with SDK sections; both still mismatch. No local V2/V3/CPU
  acceptance or added coverage.
- codex35_intrinsic: read-only Ghidra export scripts/logs. The typed export
  applies876 SDK naming/signature hypotheses in memory and recovers the large
  EmitIntrinsic body. Changes were discarded from the shared DB. Generated
  decompilation is research, not maintainable reconstructed source; no credit.

## Precise continuation points

PINNED SDK73/131 EmitArgs:513 bytes, retail1007cc9c. Direct unsigned-to-double
conversion produces the original x87 conversion/correction; manual signed
conversion plus4294967296 did not. Remaining args_exit differences include
zero-register setup versus push0, the shared error/return block being placed
after instead of before the list loop, and a removed second child-null check.
Original ends with an internal jump to its earlier return block. Certify the
complete513-byte boundary explicitly if matched; never trim the tail to RET.
The group draft matches already-accepted EmitTemp28 and EmitClip309 only;
EmitPositive, EmitLerp, EmitExpression and EmitArgs remain unmatched. Those
two group matches are duplicates, not new coverage.

PINNED SDK57/60 D3DXFindShaderComment:231 bytes, retail10062db3. Remaining
differences are opcode/mask register allocation, FourCC comparison operand
order, and success/return block placement before versus after the loop body.
The original ends with an internal jump to an earlier epilogue. Full boundary
proof must include that tail. No additional shader-length guard was invented.

PINNED SDK57/65 D3DXGetShaderSamplers:190 bytes, retail100635fe. Remaining
differences include invalid-data block placement before versus after the main
body, data/constant/count register assignment and Name-versus-byte-count CMP
operand order. The compiler already reuses the dead shader parameter stack
slot for the byte count, as in the original; no aliasing hack is needed.
Preserve original missing null checks/offset checks until byte-identical source
exists; fixing retail bugs is a separate later task. Types come from the pinned
summer2004 d3dx9shader.h, not a guessed CTAB layout.

## Reproduction

Use compiler image sha256:17ddd3cc30517bc070c4e1a1d8bec9c4abd0d8b453115dfa0324e7e20dc94131,
compiler scratch/codex19_dxerr/compiler/cl.exe, flags
/O1 /Oy- /hotpatch /MT /Gy /d2QIftol, with the existing target mount at /work
and SDK sum2004 read-only at /dxsdk. Include the compiler/PlatformSDK headers
and Z:\dxsdk\Include. Compile comments.cpp or args_exit.cpp into each draft's
obj/ directory. Existing predicate compile.sh/probe.py reproduce the24-layout
batch. Discovery probes are diagnostic only and cannot accept source.

For research export, run the existing Ghidra project gfx10 read-only,
-process gfx_d3d_mp_x86_s.dll -noanalysis -readOnly, with these saved Java
scripts. The typed script takes SDK discovery.json and an output C path.
Never save those temporary hypothesis types into the shared analysis project.

Keep accepted cohort inputs frozen. Current guarded proof reuse rejects changes
to any tracked tool/SDK/header/package/image input. Adding a new .py/.sh/.mk
under the broad verifier closure invalidates it. Do not reseal a stale proof
to bypass rejection. New source must clear complete V2, retained V3, CPU and
aggregate address-disjointness gates before moving into target/src/ or counting.
