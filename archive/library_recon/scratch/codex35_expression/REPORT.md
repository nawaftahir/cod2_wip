# Expression compiler checkpoint — 2026-10-02

Accepted coverage remains **331,078 / 1,089,680 = 30.383048%**.
The owner requested a pause after saving this checkpoint; **35% is unfinished**.
All files here are scratch; no clean source, canonical source, retail binary,
SDK source or previous accepted checker was modified.

## Actual source and proof

`expression.cpp` implements the full expression emitter, including all numeric
operations 0..26, recursive operand evaluation order, cleanup and final boolean/
integer conversions with range and precision-flag propagation. `helpers.cpp`
implements four actual callees, not stubs. Their target bodies sum to **8,102**
instruction bytes; this is candidate scope, **not verified coverage**.

| Method | Target code bytes | Current standalone bytes | First difference |
|---|---:|---:|---:|
| EmitExpression | 5,701 (+108 jump table) | 5,138 including its tables | +7 |
| EmitPositive | 642 | 616 | +9 |
| EmitLerp | 937 | 947 | +107 |
| EmitClip | 309 | 311 | +45 |
| EmitArgs | 513 | 497 | +18 |

The fresh five-method public-API fixture passes **1,284 complete output
comparisons**, with **954 successful** shader compilations and **330 errors**
in both original and source executables. Every HRESULT and every byte of code,
diagnostic and constant-table buffers is compared. It covers two profiles,
optimized/unoptimized compilation, scalar/vector types, arithmetic/comparisons,
casts, intrinsics, assignments, swizzles, array indexing, functions and clip.
Source/original map ownership is enforced for all five methods. Shader/API
success is not a byte match; the SDK's remaining methods earn zero credit.
Allocation failures, all internal flag/range states and GPU/game boot are not
certified. The fixture uses standalone `helpers.obj`, **not** the cohort below.

## Exact clipping cohort

`helpers_group.cpp` puts the actual previously accepted EmitTemp definition
beside its callers. EmitTemp stays exact28; EmitClip becomes **exact309**,
including all relocation types, offsets, names and addends. The other three
helpers stay mismatched: grouped EmitPositive615, EmitLerp947 (first +97),
EmitArgs497. This is a bounded real caller/callee experiment, not fake calls
or forced register/ABI changes.

`clip_matched.cpp` isolates those two matched definitions and passes strict
**scratch V2**: **337** complete instruction bytes, every retail/SDK/source
binding, full decoding, branch boundaries, changed-byte/wrong-binding negatives
and the original referee's 100% checks. New/delete and EmitInst dependencies
are checked but not credited. EmitTemp's28 bytes are already in the aggregate;
only clipping's309 could be new after clean integration and V3. No private
whole-DLL retained-match check or isolated-cohort CPU fixture has run yet.

## Pinned facts / don't repeat

- SDK member73 gives all signatures; Error is cdecl, the others thiscall.
  Diagnostic strings and the missing-implementation error code DB6h are pinned.
- EmitExpression section126 at1007B5EB is **5,701 instruction bytes plus108
  jump-table bytes**, not5,809 creditable code bytes. All27 typed relocations
  in the table resolve to decoded starts inside the body and the retail table
  agrees. `table_evidence.json` records each destination. No table-byte credit.
- CBaseProgram accessed fields: flags +6Ch/+70h, special register +74h,
  constant label +78h, null-argument label +88h and clip label +A8h. Label's
  per-array counter is+8; argument precision selector is+5Ch; l-value marker
  is+30h. These are access prefixes, not complete allocation layouts.
- Clipping is311 bytes when its temporary callee is opaque,309 when the real
  source callee shares the TU. This observed context change reproduces the
  retail's EDX scheduling; it does not prove historical TU/source provenance.
- Common allocation-failure labels improve Lerp's prefix from+29 to+97 in
  the grouped cohort but do not solve it. Reordering EmitArgs' value branch
  and success epilogue gives497/513, still unmatched. All attempts are saved.
- A fixture freshness gate rejected a run after its source changed during a
  rebuild. The final proof is from rebuilt objects/dependencies/executables;
  it was not waived. Initial constant-table dumping assumed ID3DXBuffer
  inheritance; the actual 2004 interface independently exposes buffer methods,
  so the same typed dump helper is instantiated for both interfaces.

## Replay

From gfx/target, mounted at/work, SDK mounted read-only at/dxsdk:

```sh
# Pinned compiler image:
# sha256:17ddd3cc30517bc070c4e1a1d8bec9c4abd0d8b453115dfa0324e7e20dc94131
sh scratch/codex35_expression/compile.sh
sh scratch/codex35_expression/compile_matched.sh
# On host:
python3 scratch/codex35_expression/probe.py expression.obj expression.cpp
python3 scratch/codex35_expression/probe.py helpers.obj helpers.cpp
python3 scratch/codex35_expression/probe.py helpers_group.obj helpers_group.cpp
python3 scratch/codex35_expression/select_dependencies.py
# Pinned CPU image:
# sha256:9147e3086f65d733e1bb939cfa4aad7882f494cd87183739258b72194661a694
sh scratch/codex35_expression/compile_test.sh
# On host:
python3 scratch/codex35_expression/run_test.py
python3 scratch/codex35_expression/check.py
```

The existing strict SDK selector excludes exactly five source-provided methods
for the public fixture; its generated archive is private/opaque, not reconstructed
library source. The matched cohort remains separate. Check fixture_packet.json
and packet.json hashes against the current files before relying on old outputs.

Next: integrate the exact clipping/callee cohort without duplicate callee
ownership; retain556 linked matches; replay aggregate. Then pursue the remaining
large real methods with actual source-context tests, not relaxed gates. The
final finish remains readable source **and whole-DLL checksum identity**.
