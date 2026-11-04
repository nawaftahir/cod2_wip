# Texture-vector dependency repair

The source cohort reconstructs TextureAxisFromPlane (0x43f8a0 / 335 B),
TextureVecsForNormal (0x43f9f0 / 459 B), and BuildTextureVecs (0x4401d0 / 985 B).
Their linked referee checks match; the 1,540-byte inverse remains experimental.
This is a PARTIAL file, with external assertion/formatting/SinCos definitions
still unresolved. No complete-TU, image-placement, SHA or GUI claim is made.

## Binary facts and corrections

The complete basis array starts at 0x53db00, not 0x53db0c. It consists of six
36-byte rows containing the cardinal normal, S vector and T vector. Both the
cod2map reconstruction and KisakCOD's later texturevecs reference start at the
first S vector and present a shifted table. The source preserves all 216 retail
bytes and the real DotProduct calculation, including multiplication by zero;
replacing this with only a dominant-coordinate comparison changes NaN behavior.

The helper's five parameter assertions are on source lines 46-50. Its original
S/T selection uses if/else assignments; the ternary version was 449/459 B,
first +0x14f. The direct branch form matches all 459 bytes.

The builder's scale copy is a two-float local array. Separate float locals
produced different stack layout. Its seven assertions are level 1 on lines
153, 156-158 and 160-162, unlike the existing level-0 assertMsg macro. A shared
vassert macro preserves the existing handler/ignore-state model and uses the
measured level argument. Existing macros are unchanged. The 985-byte builder
matches using ordinary C++, the real helper, and existing Vector2Copy/VectorMA;
no ABI annotation, forced noinline, fake caller, flags or mask changes.

The math constants at 0x556b88 and 0x556c64 are float
0.01745329238474369 and 57.2957763671875. The snap helper's double constant at
0x556b28 is 2^-30. These were read from retail rather than copied from the later
reference's different evaluation rules.

## Held inverse and math helpers

Retail's inverse tests matrix row 1's r component, then repeats the row-0
projection using row 0's component, normal and shift. The later reference
projects row 1 instead. The scratch candidate preserves the measured row-0
behavior; no attempt to fix the retail behavior is accepted.

Actual trials and complete candidates are saved under scratch/texturevecs_repair:

- cohort-v2: first valid four-body/math cohort; inverse 1536/1540, first +5;
  builder 977/985. v1 was a compile failure and is not a completed trial.
- v3: real unresolved math declarations; builder 985/985 in length but different
  locals/assert levels; inverse unchanged.
- v4: level-1 assertions and scale array; builder MATCH; inverse 1536/1540, +5.
- v5: target's repeated row-0 projection; inverse 1533/1540, +5 (86%).
- v6: explicit product evaluation order; still 1533/1540, +5 (86%).
- v7: vector snapshots; 1536/1540, +0xc (79%).
- v8: scalar snapshots; 1527/1540, +5 (78%).

Remaining differences include local storage/evaluation and delayed caller stack
cleanup around the snap/atan2 calls. These results do not prove a compiler
limitation. The next useful dependency is the true caller/callee math context,
not another repetition of the same expressions. Unmatched bodies stay in scratch.

SinCosDegrees at 0x4897c0 / 306 B has a stack-parameter/FSINCOS sequence; the
C++ cohort emitted 280 B with a separate FastSinCos call. The earlier rotation
trial was 286/306. The granularity snap at 0x489940 / 471 B uses inline FISTP
with 2^-30; the simple C++ cast emitted a real ftol call and is not a match.
Neither helper is credited or replaced with a placeholder, ABI hack or banned
assembly. The three matched routines use their real declarations.

## Proof

Run the unchanged referee and the supplementary data audit in the toolchain:

```
python3 tools/verify.py --all
python3 research/gemini_review/test_game_ledger.py
python3 research/codex_texturevecs/test_vectors.py
python3 research/codex_density/test_patch_distance.py
python3 research/gemini_review/test_density_partial.py
python3 tools/file_ledger.py
```

The texture-vector audit covers the complete basis table, referenced constants,
strings, imports and twelve independent zero-initialized assertion flags. It
reports the unresolved calls separately instead of treating masked addresses
as proven runtime bindings. The held Pmesh caller cohort was also tested against the matched builder.
The projection caller remained 277/304 B, first +5; adding the real scale and
bounds wrappers gave 81/84 B (+5) and 190/150 B (+5), with no improvement to
that caller. Those bodies and proposed headers stay in scratch; no caller,
material type, UV header change or extra game credit is accepted here.

Target evidence pins both UV layers at control +0xc/+0x14 and a 40-byte
material record with integer autoscale dimensions at +0x14/+0x18. The later
Kisak qe3.h also has 40 bytes; iw3xo has an added eight-byte tail. Its full
texdef_t is 72 bytes, so do not confuse it with the target's held 28-byte local
projection packet (material pointer followed by six floats). The old trial
name texdef_t is a model name, not established historical type provenance.
Use a distinct projection-packet type before continuing that caller group.

Only actual linked referee matches and fresh regression are credited.

## Accepted checkpoint

Fresh gate and supplementary audits pass 548/548 game routines / 64,638 B:
15.32% of functions and 9.24% of game bytes. This adds three / 1,779 B;
the texture-vector TU has 53.60% of its original game-code bytes covered.
Compiler 2/2 / 35 B, zero failures, unchanged 48 unverified bodies and one
order warning. All twelve completed-file audits pass; this partial file is
not added to that list. Same-offset bytes are 26,410 / 1,794,048 (1.472%),
19 fewer than the prior checkpoint, report-only. No passing source was dropped
for that offset movement. Referee, masks, inventory and flags are unchanged.
