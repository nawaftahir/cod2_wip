# Shader compiler helpers

`compiler.cpp` contains eight complete reconstructed C++ definitions, totaling
757 instruction bytes: constructor, Scratch, StackFree, EmitTemp,
IsFullySemantic, CompareSemantic, EvalValue and EvalRange_Mul.
Clean-path V2 proves the complete typed SDK sections, retail bodies, symbol
bindings, decoding/branch boundaries and byte/binding negative tests.

The private closed link accepts 556 matches and retains all 548 previous
matches. The CPU fixture compares 20,355 complete original/clean-source
outputs. All eight methods must be owned by the clean compiler object.
StackAlloc and EvalRange deliberately remain SDK dependencies; the fixture
checks their map ownership too, and they receive zero source credit.
The separate thirteen-method draft and its earlier behavioral evidence stay
in scratch; do not confuse that draft with this eight-method module.

From `gfx/`:

    sh target/scratch/codex35_compiler/build.sh
    python3 target/scratch/codex35_compiler/check.py --clean
    python3 target/scratch/codex35_compiler/check_link.py
    docker run --rm --network none -v "$PWD/target:/work" -v "$PWD/../sdk/sum2004:/dxsdk:ro" -w /work sha256:9147e3086f65d733e1bb939cfa4aad7882f494cd87183739258b72194661a694 sh scratch/codex35_compiler/compile_clean_test.sh
    python3 target/scratch/codex35_compiler/run_clean_test.py
    python3 tools/check_ten_percent.py

Compiler: pinned VC 13.10.4035 with `/O1 /Oy- /hotpatch /MT /Gy /d2QIftol`.
This is a reproducible context, not a claim about the historical command line
or translation-unit grouping. Whole-DLL SHA identity and game/GPU boot are
not established. Allocation-failure paths are not behavior-tested.

PINNED access prefixes: compiler program +8, stack cursor +88h/available +8Ch,
scratch pointer +90h/capacity +94h, upper bound +A0h/lower bound +A8h,
tolerance +B0h. Argument ranges +20h/+28h, instruction +48h, semantic marker
+68h/index +6Ch; program arguments +14h/instructions +18h. Opaque fields
have no invented historical meanings; these views are not full allocation
contracts for SDK-owned objects.

The 69-byte semantic predicate ends with an internal jump to its verified
return epilogue; it is not truncated at the first return. EvalValue's two
finite calls and range multiplication's isnan call are independently bound
to complete original runtime bodies. Operator new/delete and retained SDK
code are external dependencies, never extra reconstructed-source credit.
