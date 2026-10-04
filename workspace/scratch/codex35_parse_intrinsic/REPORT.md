# Constant intrinsic evaluator — 2026-10-04

New complete ordinary C++: evaluator.cpp implements the target's supported
constant intrinsic switch, argument evaluation/conversion, diagnostics,
matrix operations, output conversion and all-path allocation cleanup.
The SDK/retail section is5104 bytes including its switch data; this entire
number is NOT creditable instruction coverage. No V2 match, no promotion.

Original and selected-source public SDK fixtures pass1400 full CPU comparisons
(944 successes,456 errors), zero differences in HRESULT, shader, diagnostics
and constant-table outputs.57 expressions across six types/two profiles/two
optimization modes plus eight matrix/zero-normalization expressions. Inputs
are static constants to exercise parsing-time evaluation. Map ownership proves
EvalIntrinsic comes from evaluator.obj; only that SDK definition is removed.
Posthash passed all23 recorded identities. Baseline evaluator.cpp is FROZEN at
fixture hash9562624531143be10952dd05274f6fce6563aa2b5e1fbd720a67cb292aa1ec7e.
Do not apply this CPU claim to later variants or imply exhaustive internal,
allocation-failure, NaN-state, GPU, game boot or whole-file coverage.

## Bounded builds (all UNMATCHED)

| Source | Full section bytes | First difference |
|---|---:|---:|
| evaluator |4934/5104|7|
| evaluator_separate |5107/5104|7|
| evaluator_helpers |5103/5104|7|
| evaluator_casts |5103/5104|7|
| evaluator_group |5049/5104|8|
| evaluator_init |5174/5104|7|

Separate source restores independent derivative-zero loops and log-base cases;
similar lengths still have many real register/storage/instruction differences.
The group variant uses actual reconstructed casts and reloadable references
at diagnostic sites, not fake calls. init explicitly zeroes arrays and stores
the argument count before its pointer. No volatile markers, padding, changed
ABI, retail byte wrappers or post-link patching. New variants lack CPU proof.

Two real callees were recovered during this work. casts.cpp's reordered
0/3/2/1 Float switch and separate signed/unsigned Value cases reproduce94/115.
casts_natural Float94 first17 is still wrong; casts_float_first also matches
both. Their source is independently certified in sibling codex35_parse_casts,
not counted from these diagnostic group duplicates. Reuse that clean source.

PINNED: member74 names/signatures, node kind13 and operation26, four input
arrays; 16-byte _D3DXVALUE with tag0/1/2/3 = bool/signed/unsigned/double.
Input list is expression.field24->child, output list field24->next; output
arguments with non-null children reject. SDK section/disassembly confirms
all calls and flags. CParse Error is cdecl varargs/void, not decompiler garbage
ECX/EDX/EDI parameters. Existing verified node types are reused, not allocated
through an invented private CParse layout. Retail analysis DB was read-only.

Exact constants: degrees57.29577791868205, radians0.017453293005625408,
color255.001953125. Preserve them and original NaN/comparison branches.
CastToValue applies signed epsilon0.000001 before truncation; both integer
cases share generated code but separate source types reproduce dispatch.

## Replay

compile.sh runs in pinned17ddd compiler image with target/work and SDK/dxsdk.
On host select_dependencies.py builds one-definition dependency selection.
Compile test in pinned9147 image via compile_fixture.sh, then run_fixture.py.
probe.py NAME.obj NAME.cpp is diagnostic only, including switch data and
masked COFF fields; it does not establish bindings or accepted code boundaries.

Next: source-context work from instruction differences, especially array
storage/indexing and target call-preserved registers. Do not repeat the six
identical variants above. Preserve the frozen1400-case baseline separately.
