# Shader assembler source

`asm_nodes.cpp` defines six complete constructors/copies (565 instruction bytes).
`assembler.cpp` defines eight complete assembler helpers (952 bytes): constructor,
NonNull, mask/swizzle decoding, buffer growth, word emission, token classification
and GetShaderCode. Total: **14 functions / 1,517 instruction bytes**.

All definitions pass full source/typed-SDK/retail byte comparison, relocation
identity checks, complete boundaries, mutation negatives and the original
100% byte-match referee. The private closed link accepts **505 source matches**,
retaining all preceding **491**. The pinned original-SDK CPU comparison passes
**1,440 full-output cases**, including invalid assembly and both debug modes.
Two new three-slot virtual tables are checked, not credited as source.

From `gfx/`:

    sh target/scratch/codex30_assembler/build.sh
    python3 target/scratch/codex30_assembler/check.py --clean
    python3 target/scratch/codex30_assembler/check_link.py
    docker run --rm --network none -v "$PWD/target:/work" -v "$PWD/../sdk/sum2004:/dxsdk:ro" -w /work sha256:9147e3086f65d733e1bb939cfa4aad7882f494cd87183739258b72194661a694 sh scratch/codex30_assembler/compile_test.sh
    python3 target/scratch/codex30_assembler/run_test.py
    python3 tools/check_ten_percent.py

Compiler: pinned VC 13.10.4035, `/O1 /Oy- /hotpatch /MT /Gy`. Build scripts
compile these clean paths, not the drafts. Shared diagnostic declarations are
in `../codex_shader_support/support.h`; base-node declarations are reused from
`../codex_shader_nodes/nodes.cpp` with bodies disabled in this TU.

PINNED: instruction/register node sizes are 96/44 bytes. Instruction bytes
0x5c..0x5f are untouched by constructors. ULONG parameter types and protected
assembler methods follow SDK COFF mangling. CTErrors::Error is a cdecl varargs
method, not an ordinary thiscall. The assembler declaration is a confirmed
128-byte access prefix, not a claim that the historical class ended there.

PINNED: compiling the base-node definitions into the asm-node TU changes four
constructor register sequences. Keeping those definitions external matches
the original SDK TU boundary and makes all six complete bodies identical.
Token's final jump goes back to its already verified epilogue; it is not
truncated at the earlier RET. GetShaderCode must preserve the escaped storage
variable's reloads after virtual calls. A local buffer alias changes codegen.

Other methods remain external SDK dependencies and earn zero source credit.
Production's unmatched 1,500-byte draft versus a 1,453-byte original section
(1,277 code + 176 tables) remains in scratch. Do not copy it here or change an
ABI to raise coverage. No original historical source/TU recovery, whole-DLL
identity, allocation-failure injection, game boot or GPU runtime is claimed.
