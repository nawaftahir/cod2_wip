# Shader compiler draft checkpoint — 2026-10-02

Accepted renderer coverage stays **330,321 / 1,089,680 = 30.313578%**.
The 35% goal remains active; **51,067** additional accepted instruction bytes
are required. Everything in this directory is scratch, not release source.

## Actual new source

`compiler.cpp` implements thirteen CCompiler methods. Eight reproduce their
complete typed SDK sections, including every relocation's offset, kind,
symbol name and addend: **757 candidate bytes**.

| Definition | Complete SDK bytes |
|---|---:|
| Constructor | 123 |
| Scratch | 99 |
| StackFree | 57 |
| EmitTemp | 28 |
| IsFullySemantic | 69 |
| CompareSemantic | 87 |
| EvalValue | 131 |
| EvalRange_Mul | 163 |

The isolated `compiler_matched.cpp` now passes **scratch V2**: all eight
complete source/SDK/retail bodies, every binding, complete decoding and
internal branch boundaries, changed-byte and wrong-binding negatives, and
100% from the original referee. `check.py` reuses the pinned checker;
`packet.json` records all eight rows and identities. The 69-byte semantic
predicate ends in an internal jump to its fully verified return epilogue,
not a truncated return-bound body. The 21-byte finite and 46-byte isnan CRT
dependencies are independently checked at their typed caller destinations,
as are the already-pinned new/delete dependencies; **zero dependency credit**.

Clean-path rebuild and retained 548-match private-link regression remain
required before promotion/aggregate coverage changes.
No canonical source, release tree, verifier gate or historic accepted input
was edited. Do not promote the entire draft into src.

Five unmatched definitions are preserved too:
StackAlloc 129/129 (first difference +6), GetToken 110/114 (+14),
IsNumeric 123/123 (+12), ApplyType 103/103 (+54),
**EvalRange 3264/3274 (+7)**. EvalRange still has different stack allocation,
register selection and block ordering. Equal behavior/near length is not
byte identity. No claim that matching it is impossible.

The CPU check executes independently linked original-SDK and source versions
and compares every output line: **20,355 cases / zero differences**. Map
ownership checks require all ten invoked compiler methods to come from the
intended original/source objects. The private SDK selector removes source
definitions with its unchanged full safety checks; its retained code is an
opaque dependency and gets zero credit. No /FORCE or multiply-defined-symbol
override is used.

CPU scope: 18,386 range/interval cases plus 1,969 scratch allocation,
nested stack lifetime, guarded temporary filling, semantics/comparator and
constant-value cases. Covers nullable outputs, cached ranges, aliases,
NaNs, infinities and signed zero. Does **not** certify GetToken, IsNumeric,
ApplyType, allocation failures, general indexed EvalValue, GPU/game boot or
whole-file identity. Stack block contents survive nested allocation/free.

## Compiler/analysis facts to reuse

- PINNED: SDK archive member 73 supplies the exact signatures and callees.
  Do not trust the recovered Ghidra export's guessed IMAGE_DOS_HEADER types
  or assign a math function name from its FUN address alone.
- PINNED: the pinned 13.10.4035 backend contains option `-QIftol`.
  `/d2QIftol` is accepted and emits the target's `__ftol` for the two casts;
  without it the same source calls `__ftol2`. Top-level `/QIftol` is ignored.
  This proves reproducible compiler behavior, **not** the historical command
  line. Compile script uses the observed backend option, without ABI or
  retail-byte rewriting. Preserve it when replaying this draft.
- PINNED: CCompiler access fields: program +8, stack cursor +88h, stack
  available +8Ch, scratch pointer +90h, scratch capacity +94h, upper bound
  +A0h, lower bound +A8h, tolerance +B0h. Constructor stores IEEE positive
  and negative infinity using the exact two-word constants; opaque fields
  retain their neutral names. Prefix views are not full allocation contracts.
- PINNED: argument flags +0, register +4, relative index +8, array index
  +Ch, component +10h, range doubles +20h/+28h, instruction +48h,
  semantic marker +68h, semantic index +6Ch. Program arguments +14h,
  labels +10h, instructions +18h; instruction inputs +8/output count +Ch.
- PINNED: unary 10A00000h uses asin; 10B00000h uses acos and reverses
  endpoints. Binary 20700000h/20800000h combine the minimum lower bound
  and maximum upper bound. Do not rewrite them as ordinary max operations.
- PINNED: known-positive/negative/unit-range flag clamps treat unordered
  floating-point comparisons specially. Replacing negated comparisons with
  superficially equivalent <= or >= changes NaN behavior. Initial CPU draft
  had 309 differing cases; SDK-backed corrections eliminate all of them.
- PINNED: LIT's lower pow exponent selects the **upper** exponent bound when
  its base is below one; the upper result chooses the opposite endpoint.

`decomp/` contains fresh analysis only. A private copy of GLM's project,
Ghidra 12.1.4, no reanalysis, read-only processing and a 300-second per-function
timeout recovered exports at 10073752 (EmitIntrinsic, 3210 lines),
1007B5EB (EmitExpression, 972 lines), and 1006C8CA (EvalRange, 528 lines).
All three report completed=true and empty error messages in decompile.log.
Line counts above refer to the original exports; committed copies have only
trailing whitespace/blank EOF lines cleaned. EmitIntrinsic warns that type propagation is not settling. Its SDK section
is 23,940 bytes; the analysis body covers 23,580 addresses. That difference
must be resolved as code versus tables before any full-body credit. None
of the exports are reconstructed source. The private DB and its recoverably
renamed interrupted lock files remain uncommitted; original GLM is untouched.

## Bounded attempts, not tasks to repeat

Initial EvalRange: 3252/3274; structure assignment emitted MOVSD and allocated
extra temporaries. Explicit double-field copies, shared success result,
relative-value temporary reuse, and outer if/else produced 3224/3274.
SDK-confirmed asin/acos and pow correction gave 3251/3274. Exact NaN/clamp
and union-range semantics gave 3257/3274. Explicit default opcode chain,
cached dot width/two induction variables, reordered ranges and reuse of
b.maximum for pow temporaries gave the current 3264/3274.

Before those later source changes, /G5 and /Op- left the then-current 3224-byte
body unchanged; /Op made 3247 bytes but did not match. Neither fixes the
conversion symbol. /d2QIftol fixes that symbol, not the register/stack mismatch.
Historical probe JSONs pin their then-current hashes; do not associate their
objects with today's changed source or credit them.

EvalRange_Mul matched after writing `out->minimum > products[i]`, rather than
the equivalent reversed comparison; actual x87 operand order matters.
StackAlloc's conditional-capacity form gave 127 bytes; explicit minimum
capacity gave 129; introducing separate words=count+2 gave 130 and was
restored. IsNumeric while and explicit infinite loop each gave 123 but
different loop layout; recursive-tail form gave 133 and was restored.
ApplyType's pointer-countdown form differed at +7; indexed iteration gets
the first 54 bytes exact, but primary induction registers still differ.
Reversing the OR operands did not change those register choices. GetToken's
last successful-result test is optimized away, leaving 110 versus 114.
No volatile/ABI/marker variants were invented to force an answer.

## Replay / next action

From gfx/target, mounted at /work with SDK mounted read-only at /dxsdk:

```sh
# In image sha256:17ddd3cc30517bc070c4e1a1d8bec9c4abd0d8b453115dfa0324e7e20dc94131
sh scratch/codex35_compiler/compile.sh
sh scratch/codex35_compiler/compile_matched.sh
# On host, from gfx/target
python3 scratch/codex35_compiler/probe.py compiler.obj compiler.cpp
python3 scratch/codex35_compiler/check.py
python3 scratch/codex35_compiler/select_dependencies.py
# In image sha256:9147e3086f65d733e1bb939cfa4aad7882f494cd87183739258b72194661a694
sh scratch/codex35_compiler/compile_test.sh
# On host, from gfx/target
python3 scratch/codex35_compiler/run_test.py
```

Scratch V2 for the eight is complete. Next fresh-build this isolated subset
at its eventual clean path, preserve all 548 previous matches in the private
link, run clean-profile CPU checks and verify disjoint aggregate accounting
before promotion/counting. Continue the already behavior-checked EvalRange instead
of re-deriving it. Other larger compiler exports are available, but must be
fully read and typed using SDK names before source authorship. Do not use
the raw decompiler export as a source-generation or coverage shortcut.
