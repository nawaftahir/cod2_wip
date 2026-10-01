# Shader instruction copy, profile selectors and cast compatibility

Readable SDK-derived C++ reconstructed against the pinned Summer 2004 D3DX9
sections and the original renderer. Four complete bodies, 613 instruction bytes:

| Function | Original address | Instruction bytes |
|---|---|---:|
| `CInstruction::Initialize(CInstruction *)` | `10085abe` | 180 |
| `D3DXGetPixelShaderProfile` | `10062c8b` | 176 |
| `D3DXGetVertexShaderProfile` | `10062d3b` | 120 |
| `CParse::IsCast` | `10099846` | 137 |

MSVC 13.10.4035, `/O1 /Oy- /hotpatch /MT /Gy`. Compiler hashes, SDK/header
hashes, source/object hashes, full section comparisons, relocation bindings,
instruction boundaries, original referee 100%, and corruption/wrong-binding
negative tests are in `target/scratch/codex30_instructions/clean_packet.json`.

`CInstruction` declares only its target-visible access prefix through the inline
buffers, not an original allocation layout. `Alloc` is public static `__stdcall`
in the original SDK symbol. That helper remains an opaque dependency with zero
additional source credit. The declaration-only guard and friend enable the CPU
fixture without emitting a replacement implementation into the original test.

The private DLL link retains all 415 preceding source matches and accepts 419.
All four source DxErr lookup sections and their literal/table bindings are also
checked in full. Its W-name routine's code scan now stops at the independently
proved 48,462-byte instruction end instead of decoding its 23,943-byte table as
instructions. The A-name routine likewise stops at 48,427 instruction bytes,
excluding its 24,097-byte table from instruction decoding. Their full 72,405-
and 72,524-byte sections are still verified. The previous and
current objects differ only in source-path/debug metadata; all initialized
non-debug sections and symbolic relocations are compared exactly. No table
bytes are newly credited. The canonical binder is unchanged. A private adapter
proves the original SDK `_g_Targets` array (528 bytes, 44 complete strings and
all relocations) before resolving its flags-column loop end as `_g_Targets +536`.
Otherwise that address appears to refer to an adjacent, unrelated string. The
adapter applies only to the three independently proved operand pairs of the
79-byte SDK function; all canonical byte/data/import/call gates still execute.
The array and opaque SDK function receive zero additional source credit.

The CPU fixture compares 10,285 complete outputs against the original SDK:
capability/version/flag/depth combinations and inline operand-copy counts.
It also covers all 256 cast-code pairs from -1 through 14. The cast routine's
48-byte compiler jump table is fully checked and excluded from coverage;
its final jump reaches its interior `pop ebp; ret 8` epilogue. Nested destination
switches reproduce the original range/chain lowering; boolean OR expressions
did not. The original code permits destination 5 from source 4/8, not 4-to-4
alone. Original enumerator names and the parser allocation layout are not claimed.
It also checks null devices, failed capability queries, null copy inputs,
preserved fields and destination guards. No GPU, game boot, or larger dynamic
allocation claim. The pinned SDK's umbrella header has broken C-interface font
helpers; the fake-COM fixture uses its `d3d9.h` and the two confirmed public
shader-profile signatures instead.

Replay from `gfx/`:

```sh
sh target/scratch/codex30_instructions/build.sh
python3 target/scratch/codex30_instructions/check.py
python3 target/scratch/codex30_instructions/check_link.py
python3 target/scratch/codex30_instructions/run_test.py
python3 tools/check_ten_percent.py
```

To rebuild the fixture, mount `gfx/target` at `/work` and `sdk/sum2004` read-only
at `/dxsdk` in the pinned base image
`sha256:9147e3086f65d733e1bb939cfa4aad7882f494cd87183739258b72194661a694`,
then run `sh scratch/codex30_instructions/compile_test.sh` in `/work`.

Tokenizer and opcode-initialization drafts remain separate, zero credit, in
`target/scratch/codex30_token/`. Whole-DLL SHA identity remains pending.
