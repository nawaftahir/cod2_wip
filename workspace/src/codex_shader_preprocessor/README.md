# Shader preprocessor source

`preprocessor.cpp` defines 22 C++ methods; the compiler emits three additional
deleting helpers. All **25 complete bodies / 2,199 instruction bytes** match
the typed SDK sections and retail entries. The clean module excludes every
unmatched draft. Declarations for other methods are supplied by the SDK as
zero-credit dependencies, not claimed as reconstructed source.

The private closed link accepts **548** source matches and retains all **523**
preceding matches. **12,259** full-output CPU comparisons pass: 2,283 new
preprocessor cases and 9,976 unchanged tokenizer/allocator/diagnostic/assembler
regressions. This proves per-function matching and private integration, not
whole-DLL checksum identity, historical source grouping, or game/GPU boot.

From `gfx/`:

    sh target/scratch/codex35_preprocessor/build.sh
    python3 target/scratch/codex35_preprocessor/check.py --clean
    python3 target/scratch/codex35_preprocessor/check_link.py
    docker run --rm --network none -v "$PWD/target:/work" -v "$PWD/../sdk/sum2004:/dxsdk:ro" -w /work sha256:9147e3086f65d733e1bb939cfa4aad7882f494cd87183739258b72194661a694 sh scratch/codex35_preprocessor/compile_test.sh
    python3 target/scratch/codex35_preprocessor/run_test.py
    python3 tools/check_ten_percent.py

Compiler: pinned VC 13.10.4035, `/O1 /Oy- /hotpatch /MT /Gy`.
Both full bodies and every relocation's symbol identity are checked; byte and
binding negative tests must fail. Two recursive destructors use the original
referee's existing `MASK_INTRA=1` option only after the private verifier proves
their typed self-call relocations. No canonical referee was changed.
FindDefine's complete 135-byte body ends with a jump to its interior epilogue;
the full instruction decode and all control-flow boundaries are checked.

The private build selects the original 14-byte operator-new dependency rather
than the incompatible 36-byte C++ library implementation. Its source-rebuilt
CRT object is hash-pinned and checked against the original SDK caller/retail
body. `runtime_new.lib` is external dependency accounting: no source credit
and never committed. Proven string-end labels are added only where no real
map symbol already supplies that boundary.

PINNED access layouts: CPreProcessor is 684 bytes; allocator +0, diagnostics
+24, 127 define buckets +108, include stack +616, current lexer +620, token
+632, mode +664. CPPConditional is 16 bytes, CPPBlock 12, CPPDefine 20.
CPPInclude's 112-byte access view retains opaque file/resource fields; this
module does not implement their construction or destruction.

Source forms that reproduce target code: GetBufferPointer tests end >= cursor;
FindDefine handles recursion before searching; DoUndef uses an initial nonempty
test followed by a do/while; UintDefine compares signed token kinds 2..4.
Escape tracks quoting and escaping as 32-bit ints and does not append NUL.
SDK constructor/destructor and unimplemented parsing remain dependencies.

Do not promote the scratch Enter/Leave methods: they name the wrong static
global even though Leave has masked-equal bytes. SDK member 94 uses CNode's
allocator global, not CPreProcessor's parser callback global. This is why
masked equality alone cannot certify a function.

CPU checks preserve original malformed-directive behavior and compare full
diagnostics and public shader assembly buffers. Allocation-failure paths,
shader compilation/GPU execution and whole-file identity remain unproved.
