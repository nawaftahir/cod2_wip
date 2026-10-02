# Bounded evaluator experiments — 2026-10-02

Zero new accepted coverage. Accepted renderer total stays30.383048%.
This directory preserves eight real source-context tests of the same complete
3,274-byte EvalRange target. Accepted compiler inputs were not edited.

| Source | Built bytes | First difference |
|---|---:|---:|
| baseline | 3264 | +7 |
| scratch_array | 3264 | +7 |
| dot_index | 3264 | +7 |
| array_dot_index | 3264 | +7 |
| binary_scope | 3264 | +9 |
| literal_order | 3264 | +7 |
| scope_literal | 3264 | +9 |
| branch_scopes | 3290 | +9 |

PINNED: target frame84 bytes, baseline88. The target reuses the high word of
a binary operand's maximum bound for a mutually exclusive dot-loop integer;
source lifetime/register choices differ. A five-element interval array is
scalar-replaced by MSVC and does not solve the frame. Replacing the dot loop's
second index with i+count emits the same code. Lexical branch scopes and
reversed literal comparison order do not yield identity either. Do not repeat
these as new tests or invent padding/volatile/unused fields to force a frame.

Both compile scripts use the pinned4035 compiler with
`/O1 /Oy- /hotpatch /MT /Gy /d2QIftol` in image
sha256:17ddd3cc30517bc070c4e1a1d8bec9c4abd0d8b453115dfa0324e7e20dc94131.
The reused probe labels non-default object flags 'historical diagnostic'; the
actual commands are in compile.sh and compile_scopes.sh. Probe JSON records
source/object hashes, full section lengths and first differences; none are
acceptance packets. These eight changed variants have **not** received their
own CPU behavior certification. The older baseline's fixture is separate.

Replay from gfx/target inside the pinned image (target mounted/work, SDK/dxsdk):
`sh scratch/codex35_evalrange/compile.sh` and `compile_scopes.sh`.
On host run `python3 scratch/codex35_evalrange/probe.py NAME.obj NAME.cpp`
for the selected variant. Preserve previous attempts; zero credit until full
V2, clean integration and V3.
