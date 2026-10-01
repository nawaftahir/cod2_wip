# Shader tokenizer source

`lexer.cpp` defines seven complete methods: Initialize, LexFloat,
LexIdentifier, LexFloatSuffix, LexIntegerSuffix, LexOctal and LexChar.
**1,037 instruction bytes**, no table or opaque-library credit.

The fresh clean-source object passes complete source/typed-SDK/retail bodies,
all relocation fields and symbol identities, complete instruction boundaries,
first/final-byte and wrong-binding negatives, and the original 100% referee.
The private closed link accepts **523** source matches, retaining all **516**.
**9,976** complete-output CPU comparisons pass: 6,392 bounded tokenizer cases
and 3,584 previous allocator/diagnostic/assembler cases. This is per-function
and integration evidence, not whole-DLL SHA identity or game/GPU boot.

From `gfx/`:

    sh target/scratch/codex35_lexer/build.sh
    python3 target/scratch/codex35_lexer/check.py --clean
    python3 target/scratch/codex35_lexer/check_link.py
    docker run --rm --network none -v "$PWD/target:/work" -v "$PWD/../sdk/sum2004:/dxsdk:ro" -w /work sha256:9147e3086f65d733e1bb939cfa4aad7882f494cd87183739258b72194661a694 sh scratch/codex35_lexer/compile_test.sh
    python3 target/scratch/codex35_lexer/run_test.py
    python3 tools/check_ten_percent.py

Compiler: pinned VC 13.10.4035, `/O1 /Oy- /hotpatch /MT /Gy`.
The verifier needs the original `libcmt.lib`, SHA-256
`6e2b3742e58245de52149137f64281b73db1487a07a31e165fff269fbf9b2ee8`,
in the private `scratch/codex35_lexer/dependencies/` directory. Copy it from
`/opt/msvc710/Vc7/lib/libcmt.lib` in the pinned CPU image if absent; it is an
external proof dependency, never committed or counted as reconstructed source.
Its six complete runtime bodies match the retail call targets derived from
complete SDK callers. The original MASM stack probe lacks COFF function type;
its exact named 61-byte code section is separately checked, not credited.

PINNED access view: cursor +0, end +4, eight-word token +8, mode +40,
allocator +44, diagnostics +48. The 52-byte declaration is confirmed by SDK
accesses and original/source CPU cases, not asserted as an original source TU.
Token words 4/5 carry file/line. Unimplemented methods remain declarations;
the selected SDK supplies them as zero-credit dependencies.

Tested code-generation facts: Initialize computes end immediately after
cursor, before metadata stores. LexFloat's integral marker and integer-suffix
flags are 32-bit ints, not bools. Its first digit loop is an empty preincrement
for loop; its allocation length is local to the output branch. LexIdentifier
starts at text+1. Integer-suffix declaration order is long flag, cursor,
unsigned flag. LexOctal uses an int overflow marker and an inclusive '7'
bound. LexChar advances a cursor after LexStringChar. These source forms
reproduce complete bodies; no ABI changes or compiler-impossibility claims.

The original rejects exponent '+', accepts only its observed suffix forms,
and preserves malformed-character behavior. Do not fix quirks during matching.
Runtime cases compare integer/floating bit patterns, unchanged token words,
null outputs, bounded prefixes, allocated strings and complete diagnostics.
Allocation failure and non-ASCII locale behavior are not tested.
