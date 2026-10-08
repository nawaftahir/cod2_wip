# Reconstructed shader parsers

This is clean reconstructed C++, not copied historical Microsoft source.
One shared shift/reduce parser drives the preprocessor, assembler and HLSL
grammar action lists. Each emitted body matches the original SDK and retail
DLL completely, including jump-table and symbol-binding proof.

| Entry | Retail address | Instruction bytes | Excluded jump table |
|---|---|---:|---:|
| d3dxtok_parse | 0x10066a19 | 1,128 | 188 |
| d3dxasm_parse | 0x1006b861 | 1,263 | 248 |
| d3dxshader_parse | 0x100a352e | 3,691 | 1,172 |

Total source instruction credit: **6,082**. Grammar tables, global storage,
Token/Production/Error methods and remaining SDK code are still external
dependencies and receive **zero** additional source credit. The protected
class declarations are name/signature views, not allocation layouts.

The compiler is hash-pinned MSVC 13.10.4035, `/O1 /Oy- /hotpatch /MT /Gy`.
Historical TU grouping and a historical parser-generator version are not
established. Action lists are generated from target decompilation rule/count
pairs and verified by the complete compiled bodies; they are not byte arrays.

From `gfx/target`:

```
sh scratch/codex30_parser/build.sh
python3 scratch/codex30_parser/check.py --clean
python3 scratch/codex30_parser/check_link.py
```

The private link excludes only source-replaced definitions from a generated
SDK dependency archive. It does not patch the retail DLL or reconstructed
objects, use `/FORCE`, or change the canonical build or binder. Retained SDK
members are opaque dependencies, not reconstructed source. Source-object
ownership is checked in the resulting map.

The map omits ends of string sections. A private derived map supplies only
literal ends proved by the source COFF section and complete retail string.
These are data extent metadata, never function markers or coverage entries.
The unrefined standard-binder result is preserved separately.

`scratch/codex30_parser/compile_test.sh` builds original-SDK and source-backed
CPU fixtures in the pinned compiler container. `run_test.py` compares 96
assembly/HLSL cases across four flags, including macros and syntax errors.
It compares complete shader bytecode, HRESULTs and diagnostic buffers, not
only hashes or return codes. It is not a GPU test or game boot.

Whole-DLL SHA identity remains pending.
