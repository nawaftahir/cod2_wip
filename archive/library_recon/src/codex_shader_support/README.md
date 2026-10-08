# Shader allocator and diagnostic source

`alloc.cpp` defines CAlloc constructor/destructor/Alloc: **3 functions / 356
instruction bytes**. `errors.cpp` defines eight CTErrors methods: **806 bytes**.
Total: **11 complete functions / 1,162 instruction bytes**.

Every definition passes full source/typed-SDK/retail byte comparison, typed
callee/global/import binding, complete boundaries, mutation negatives and the
original 100% byte-match referee. The private closed link accepts **516 source
matches**, retaining all preceding **505**. The CPU fixture passes **3,584
full-output original-SDK/source comparisons**, including the previous 1,440
assembler cases, allocator reserve/commit/growth/alignment, preserved payloads,
diagnostic sorted insertion/duplicates, warning levels/specifiers, message
ordering, null/empty outputs and clearing/destruction.

From `gfx/`:

    sh target/scratch/codex30_support/build.sh
    python3 target/scratch/codex30_support/check.py --clean
    python3 target/scratch/codex30_support/check_link.py
    docker run --rm --network none -v "$PWD/target:/work" -v "$PWD/../sdk/sum2004:/dxsdk:ro" -w /work sha256:9147e3086f65d733e1bb939cfa4aad7882f494cd87183739258b72194661a694 sh scratch/codex30_support/compile_test.sh
    python3 target/scratch/codex30_support/run_test.py
    python3 tools/check_ten_percent.py

Compiler: pinned VC 13.10.4035, `/O1 /Oy- /hotpatch /MT /Gy`. Build scripts
compile these clean paths. `support.h` is also used by the clean assembler TU;
remaining diagnostic and CBuffer methods are declared but supplied by the SDK.
Their dependency bytes, CRT operator-new/delete, vtables and strings add no new
source coverage. No whole-DLL SHA identity or game/GPU boot is established.

PINNED: CAlloc is six 32-bit words / 24 bytes: block chain, commit granularity,
cursor, committed bytes, reserved bytes, initial reserve. It uses the named
Windows GetSystemInfo/VirtualAlloc/VirtualFree imports. An initial zero-byte
request returns NULL without reserving a block; the original SDK CPU run and
the complete Alloc body confirm it. Preserve this behavior, do not fix it.

PINNED: CTErrors is 32 bytes: head, byte count, error count, warning count,
warning level, specifier count, code-array pointer, flags-array pointer. Push
is protected; Error/Warning are cdecl varargs methods. ErrorChunk text starts
at +4, so allocation is pointer-size + strlen + 1, not sizeof padded struct.
Push preserves the original partial-allocation behavior and NULL cleanup call.
Clear retains warning rules and removes flag 0x20; it resets messages/counters.

PINNED: Alloc's final jump returns to its earlier pop/pop/pop/leave/RET8
epilogue; the complete 234-byte body is checked. Operand orientation and
ascending separate field stores are necessary for original register/code
selection; grouping the initial stores or replacing NOT+INC with unary NEG
changes output. These are tested source-codegen facts, not a compiler excuse.

The fixture's first zero-byte assertion originally assumed a non-NULL result;
the original SDK rejected it. Only the test was corrected. Allocation failure,
integer overflow, malformed alignment and GPU behavior have not been tested.
