# Build the Windows render-state module

This replaces the broad twelve-primary queue in campaign8 for your next pass.
Goal: actual readable C/C++ that rebuilds into the original CoD2 1.0 Windows
renderer. Not a compatible replacement, a copied decompiler dump, a plan, or a
percentage claim. Write the real bodies, compile them, compare them, and resolve
the concrete differences. Keep the existing acceptance gates unchanged.

Work ONLY in scratch/deepseek_render_state_build/. Preserve earlier folders.
Do not touch Codex JPEG work, client/server, CRT, release/progress repositories.
Reuse the existing compiler and check tools; do not build another framework.

## What went wrong; do not repeat it

Your campaign8 wrote one Mac/web-style body with helper calls. The Windows
binary includes actual device calls, logging conditions and retry loops at each
state change. That is missing source, not something a compiler flag can repair.
You already identified this: now implement it. The unused private material
functions disappeared because no real callers were included; that unrelated
experiment is not this module's implementation. Do not repeat it here.

Codex checked the full1485-byte decode of1003cc60: finalRET1003d22c, thenCC.
The old1420 extent is incomplete. Update the local evidence and use1485, but
independently check branches/other exits before claiming a match.

## Concrete source work, in order

1. Reconstruct RB_ChangeState_1 at1003cc60, all1485bytes. Use your existing
   state-bit logic as a starting point, not the wrong platform's call layer.
   Derive the real device, state cache, logging, retry, float handling and table
   accesses from the DLL. Write each missing part in readable source.
2. Reconstruct the companion stateBits0 body at1003c430. Its inventory2055
   is provisional: decode the actual complete body. It uses the same device
   and logging machinery, so reuse the facts/source rather than starting over.
3. Implement their real caller groups at100396d0 and10039b40, plus the caller
   containing100382fb/10038316. The latter is absent from the inventory at those
   sites: establish its true entry/end from decoded code/xrefs, do not invent
   an entry at the call instruction. Existing sizes680/1124 are hints only.
4. Implement the related helpers reached by this group, starting from10038110
   and relevant1003d230,1003d3d0,1003d410,1003d450,1003d4c0. Determine what each
   actually does before using its name/type. Extend through the real call graph
   until the render-state family has complete actual source; not unrelated tiny
   functions to meet a number. Keep unknown external services explicitly named
   by address and proven signature if their historical names are not known.
5. Compile whole related source groups and compare every emitted function from
   each fresh object. For internal register-argument functions, test supported
   private linkage with REAL callers in the group. No fake callers, assembly
   adapters, unused static declarations, or blanket 'requires LTCG' excuses.

## References that actually help

- The Windows DLL and glm/data/decomp/ are the authority. Decompiler types can
  be wrong: state-bit integers must not become floats merely because Ghidra
  printed float. Pin the actual argument/call instructions.
- refrences/opencod2/src/PC/gfx_d3d/rb_state.c and the Mac counterpart explain
  state-bit semantics. Their Dx7 helper calls are NOT the Windows implementation.
- refrences/KisakCOD/src/gfx_d3d/r_state.cpp contains Windows device/log/retry
  patterns (e.g. R_HW_SetDepthWriteEnable and R_HW_SetDepthTestEnable around1360).
  It is CoD4: study the pattern, then reconstruct CoD2's actual instructions.
  Do not import CoD4 error paths or constants absent from this DLL.
- Existing local DirectX headers can supply the real COM interface. No SDK
  installation is needed for this pass. Verify slot0xe4 and calling convention
  against both the target calls and header before invoking SetRenderState.

Starting target operands, to independently pin from instructions:
cached stateBits1 at1076668c; device pointer101d1bf8; logging dvar101ce7ec,
logging file10764584; retry condition1076a830. These are separate globals, not
permission to invent a giant dxState struct. Prove each used type/field/address.

## Execution discipline

Work source-first: investigate a missing fact, resolve it from instructions,
implement the corresponding code, compile, inspect the first real difference.
A missing reference name is not automatically a blocker: an address-backed
temporary name with a proven signature is legitimate. Unknown behavior/types
are blockers; do not guess them. Record precise questions and continue another
body in THIS module while resolving them. Do not return an untouched queue as
the deliverable. Do not promise a match or fabricate to satisfy a quota.

Use at most three meaningful experiments per shared cause; changes must respond
to an observed difference. Preserve successful context and existing matches.
Batch compilation/comparison and tests. Do not replay old unrelated campaigns
for every attempt or spend most of this pass writing reports.

Before final review: unchanged original100% referee, full-boundary/instruction
check, correct symbol/data bindings, wrong-binding negatives and one small32-bit
source fixture for state-change/cached-no-change paths. Mocked D3D services must
be labeled; no actual game-boot claim. Follow the workspace's no-fabrication law.

## Return one source batch

Required implementation checklist: both state-bit bodies, both known callers
100396d0/10039b40, and the real logging/device/table helpers they need. These
four substantial bodies must receive actual reconstruction work, not just
reference searches or a row labeled DEFER. Finish the two state-bit bodies'
source before moving to unrelated work. Missing historical names, mismatches,
or an unavailable reference counterpart do NOT by themselves justify stopping.

For a genuinely blocked body, retain the implemented target-confirmed parts
and provide the exact missing instruction/interface, investigations performed,
and why it prevents safe continuation. Another model must be able to take the
next source step directly. Never guess to satisfy this checklist, and never
conceal unmatched work. An entire unchanged body deferred after a broad search
is an incomplete investigation, not mission completion.

src/ with the implemented module/caller/helper groups; replay.py that really
builds and checks those sources; raw immutable build/diff/test logs; a small
REPORT.md and packet.json separating new exact matches, implemented mismatches
and missing facts. Check process exit codes. A reproduced mismatch is not a
successful reconstruction. No self-assigned coverage; Codex independently
reviews and counts unique code bytes.

If session budget ends, retain every implemented body and report exactly what
remains. Do not call that complete. In the final human response say plainly:
how many substantial bodies were written, how many match, and the concrete next
source changes. Define any necessary technical term in ordinary language.

## Codex target correction — 2026-09-27

Fresh independent rebuild of the logging-macro attempt: 1373 versus1485bytes,
9% diagnostic comparison, zero exact matches. The saved REPORT/primary_work
still describe the older674byte attempt; update them, do not claim completion.
The state function's argument is NOT proven custom-register:1003cc60 reserves8
stack bytes, pushesEBX, then1003cc69 loadsEBX from[ESP+0x10], the original first
stack argument. Do not change this ABI to chase the initial register-order diff.
The concrete missing interface is the logging helper10038110: its caller pushes
stateBits1 at1003cc86 and puts changedBits intoEBX at1003cc87. The helper reads
the stack argument at10038114 and uses incomingEBX at10038133/100381b7. Your
one-argument RB_LogStateBits declaration omits that changed-bit input.
Reconstruct this actual helper and its real helpers10037ba0/10037c10 in the
same source group; ordinary source parameters, no register/assembly adapters.
Then resolve compiler context from real callers. Finish the companion state
body and callers as already required. Keep Codex JPEG files untouched.
