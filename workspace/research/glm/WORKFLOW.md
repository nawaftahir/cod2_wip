# gfx track reconstruction workflow (for agents)

Goal: byte-exact C reconstruction of functions in `gfx_d3d_mp_x86_s.dll` (CoD2 1.0
renderer), compiled with **MSVC 7.1 `cl /c /O2`** and diffed relocation-normalized.

## Your loop (per assigned function)

1. Read the decompile: `data/decomp/<addr8>_*.c` and raw bytes:
   `python3 tools/match_gfx.py carve 0x<addr>`
2. Write `src/f/<addr8>_<Name>.c` reconstructing the function in C (see rules).
3. Compile it: `cd /home/nawaf/cod2/test/dev/glm && docker run --rm -v $PWD:/work -w /work/src/f cod2-msvc71 sh -c "cl /c /O2 <file>.c /Fo../../build/objs/"`
4. Verify: `python3 tools/wave.py diff 0x<addr>`  → want `match 100%`
5. If not 100%: use `python3 tools/match_gfx.py diff 0x<addr> build/objs/<stem>.obj`
   for the first-diff context; adjust source; recompile; repeat.
6. When matched (or stuck after ~6 iterations): move to the next function.
   DO NOT edit `data/manifest.tsv` — the orchestrator updates it.

## Verified codegen rules (MSVC 7.1 /O2, learned from matched functions)

- Returns in **AL only** (`xor al,al`, `sete al`, `mov al,1`) = return type
  `unsigned char` (Bool). Int returns use full eax zero-extension forms.
- 12-byte struct copy: struct-assign `*dst = *src` OR dst-local + member assigns.
  Which variant matches differs per function — try both.
- Float equality vs `0.0f` uses pooled m32 const; writing `0.0` (double) breaks it.
- `float / *(int*)` → `fidiv` directly — keep int-typed denominators.
- memset(x, 0, N) with N%4==0 → `rep stosd`; memcpy 44 → `rep movsd`. Add
  `#include <string.h>` or the call is NOT inlined.
- Loop `do { ... } while (--count != 0);` with a pre-guard `if (count > 0)` —
  constants (0, 1.0f) get hoisted into registers (ecx/esi).
- `mov al,1` + branchy returns come from explicit `return 1; return 0;` statements,
  NOT from boolean expressions (those give `setne al`).
- Calls to static functions with args in esi/ecx/edx (custom reg args from IPRA)
  CANNOT be matched standalone — the callee must be reconstructed in the same TU.
  Skip those; mark as cluster-needed.
- Push order is right-to-left; indirect calls through global fn pointers:
  `(*g_fn)(a,b)` → `ff 15 <addr>`.
- Dvar pattern: `*(int *)((char *)g_dvarPtr + 8)` = dvar current.value.

## File conventions

- One function per file: `src/f/<addr8>_<RealName>.c` (addr = 8 hex digits, no 0x).
- Globals: `extern` with an address comment. Unknown statics: `extern` + a
  plausible name; the call gets masked, so signatures only matter for arg pushes.
- Keep comments minimal and technical.
