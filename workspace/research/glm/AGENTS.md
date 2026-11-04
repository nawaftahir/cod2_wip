# AGENTS.md — worker contract for the gfx_d3d_mp_x86_s.dll track

You are a worker on a **byte-accurate reconstruction** of `gfx_d3d_mp_x86_s.dll` (CoD2 1.0 renderer).
The goal is source C/C++ that recompiles, with the exact 2005 MSVC 7.1 toolchain, to a
**checksum-identical** binary. This file is the law. Read it fully before touching anything.
`HANDOFF.md` is your pickup guide; `WORKFLOW.md` has the detailed method; `PROGRESS.md` has the
verified scoreboard.

---

## 0. The one loop

For each assigned function (smallest / leaf-first within a TU cluster):

1. Read its Ghidra decompile in `data/decomp/` + xrefs; identify its real callees/globals.
2. Write candidate C/C++ into `src/f/<addr8>_<Name>.c(pp)` (one function per file).
3. Run the **referee**: `python3 tools/match_gfx.py diff <addr> <obj>`.
4. Iterate on the printed `DIFF @ +N` until `MATCH (normalized)`, **or DEFER** (see §2).
5. Before any checkpoint: `python3 tools/regress.py` (if exists) or full `diff_all.py` must be **green**.
   Then update `MATCHES.md`.

The referee is the only authority. Your opinion that code "looks right" counts for nothing —
only a relocation-normalized 100% diff does.

---

## 0a. Provenance law — record flags, rebuild from source

Two rules that keep the ledger honest:
- **Every ledger entry MUST record its exact `flags`.** `/O1` vs `/O2` vs `/Oy-` change codegen;
  an entry without flags cannot be reproduced. The classifier (`tools/classify_matches.py`) reads
  the actual source file behind each row.
- **Fresh recompile is the authoritative gate** — a match can never ride on a stale object.
  `tools/rebuild_cb.sh` = atomic rm→cl(visible errors)→tu_diff. USE IT.

---

## 1. Prime law — never fabricate

**If you cannot confirm a callee name, a constant, a struct offset, or a type in the target
binary / Ghidra DB / a cited reference — you DEFER. You do not guess.** A wrong address or invented
callee silently corrupts the reconstruction and wastes everyone's tokens. "Plausible C" is a
failure, not a match. When in doubt, stop and write down exactly what you couldn't confirm.

---

## 2. Deferring is a valid, valued outcome

A defer is not a failure — it protects the tree. To defer: leave the function **out** of
`MATCHES.md`, and record a one-line reason (in your pass report under `progress/`) — e.g.
"callee at 0x10045ce0 not named in DB", "custom reg-convention chain (esi/ecx) needs full TU
context". A hard function handed up with a precise reason is worth more than a fabricated match.

---

## 3. This binary's specifics (MSVC 7.1, `/O2`)

- Compiler: **MSVC 7.1** (cl 13.10, linker 7.10) in the `cod2-msvc71` Docker image. Pinned flags:
  **`cl /c /O2`** (already wired into `match_gfx.py` — don't change them).
- `/O2` means **optimized** codegen: instruction reordering, inlining, IPRA (interprocedural
  register allocation), custom calling conventions. Match the *shape* the decompiler shows;
  don't expect the tidy 1:1 of an `-O0` build.
- **Biggest free wins:** CRT library functions from authentic VC7.1 source (`crt71/`) — these
  match at `/O1` (not `/O2`) and are already 97 certified. Sweep CRT / library-member leaves first
  before touching renderer logic.
- **C-vs-C++ TU:** a function that returns an aggregate (struct/union) **by value** must live in a
  `.cpp` (the C++ struct-return path differs from C). This is the top cause of "almost matches".
- **Frame-pointer TUs exist:** some functions need `/Oy-` to match (proven: `R_BeginDebugFrame`).
  If a function resists `/O2`, try `/Oy-` as a separate build variant.

---

## 4. Evidence & confidence discipline

When references disagree about a callee/offset/constant, trust in this order:
**(1) the target binary itself** (disasm / this binary's Ghidra DB) > **(2) this track's own
ledger** (`data/functions_gfx10.json`, `MATCHES.md`) > **(3) a second independent reference
agreeing** > **(4) opencod2 source / kisakCOD gfx_d3d**. A lower rung never overrides a higher one.

Tag every non-obvious fact in your report:
- **PINNED** (confirmed in the binary — safe to build on)
- **SUPPORTED** (a reference agrees but unconfirmed on this binary — usable, flag it)
- **HYPOTHESIS** (inferred — never ship; DEFER until it becomes PINNED)

---

## 5. The verification ladder (what "done" means)

**V1** per-function `match_gfx.py` MATCH → **V2** full `diff_all.py` green (broke nothing) →
**V3** link compare → **V4 rebuilt whole-file SHA-256 == anchor SHA** (the real finish line) →
**V5** Wine boot smoke. Never claim a rung you haven't cleared. Report `.text`-byte coverage
(matched bytes / 1,091,728), not just a function count.

---

## 6. Key codegen idioms (from matched functions — DO NOT RE-DERIVE)

1. **Float constants must be `float` not `double`:** `0.0f` not `0.0` (pooled m32 const vs m64).
2. **Byte-global bool → int return:** source `unsigned char` global, function returns `int`
   (emits `xor eax,eax; test; setne al`).
3. **`memset(x,0,N)` N%4==0 → `rep stosd`; `memcpy` 44 → `rep movsd`.** Add `#include <string.h>`
   or the call is NOT inlined.
4. **Loop `do { ... } while (--count != 0);` with pre-guard `if (count > 0)`** — constants
   (0, 1.0f) get hoisted into registers (ecx/esi).
5. **`mov al,1` + branchy returns** come from explicit `return 1; return 0;` statements,
   NOT from boolean expressions (those give `setne al`).
6. **Calls to static functions with args in esi/ecx/edx (custom reg args from IPRA)**
   CANNOT be matched standalone — the callee must be reconstructed in the same TU.
   Skip those; mark as cluster-needed.
7. **Push order is right-to-left; indirect calls through global fn pointers:**
   `(*g_fn)(a,b)` → `ff 15 <addr>` (extern fn-ptr globals).
8. **Dvar pattern:** `*(int *)((char *)g_dvarPtr + 8)` = dvar current.value.
9. **`__declspec(dllimport)` for Win32 imports** (enables IAT caching in esi).
10. **RI-table calls:** extern fn-ptr globals (`ff 15 [addr]`).
11. **`xor al,al` ≠ `xor eax,eax`** — register width matters for encoding.
12. **`fst` ≠ `fstp`** — store-without-pop vs store-and-pop.
13. **CRT compiles at `/O1` not `/O2`** — different optimization passes.
14. **12-byte struct copy:** struct-assign `*dst = *src` OR dst-local + member assigns.
    Which variant matches differs per function — try both.
15. **`float / *(int*)` → `fidiv` directly** — keep int-typed denominators.

---

## 7. Staying merge-safe

- One function per file in `src/f/`. Don't edit a file another worker owns.
- Drafts go in `scratch/`, never straight to canonical.
- `MATCHES.md` is the registry: a row **only** after a real MATCH, with its `src/f/` path.
- Never commit the anchor `.dll`, Ghidra project, or any retail asset/DLL (see `.gitignore`).

---

## 8. Role prompt templates (for the human routing you)

Paste one of these when assigning a packet, filling the `< >` slots:

**Analyst** — analyze only `<function(s)>` at `<address(es)>`. Read the target disasm/xrefs, named
references, current canonical decls. Do NOT edit canonical source. Return: bounded target assembly;
ABI/stack/return details; globals + struct offsets with evidence; reference divergences; confidence
labels; every unresolved fact. Do not fill gaps with plausible C.

**Implementer** — draft only `<function(s)>` in `scratch/<batch>/`. Use `<C or C++>`, these confirmed
prototypes/types, no edits outside your scratch files. Masked-reloc callees = extern decls only when
their type is proven. Verify with `python3 tools/match_gfx.py diff <addr> build/objs/<stem>.obj`.
Return source paths, exact command output, required decls, evidence, uncertainties, one lesson
from the generated assembly.

**Verifier** — independently verify `<function(s)>` from `<path>` against the target. Re-read the
target instructions; do NOT trust the prior report. Run the exact match command. Report MATCH /
MISMATCH / BLOCKED with the first material discrepancy. Do not merge or alter ledger status.

**Integrator** — integrate only independently-matched functions from `<batch>` into the owning TU.
Reconcile only target-backed decls. Update `MATCHES.md` + `matches.json`. Run per-function match,
then full `diff_all.py`. Stop and report if any prior match fails or an ABI/type conflict appears.

---

## 9. Reference hierarchy for this binary

| Priority | Source | What it gives |
|----------|--------|---------------|
| 1 (Exact) | `data/decomp/` + `match_gfx.py carve` | Ground truth bytes + decompile |
| 2 (Exact) | `MATCHES.md` + `data/functions_gfx10.json` | Already-matched callees/globals |
| 3 (Structural) | `Refrences/opencod2/src/PC/gfx_d3d/` | Full renderer source (C) — verify offsets! |
| 4 (Structural) | `Refrences/CoD4/KisakCOD/src/gfx_d3d/` | CoD4 renderer (C++) — closest structural analog |
| 5 (Behavioral) | `Refrences/zk_libcod/code/` | Runtime hooks/offsets cross-check |

---

_Server track (the sister effort) uses the same laws with GCC 3.3.4 `-O0`; see
`dev/reverse/FLEET_RULES.md` and the primer at `dev/plans/study/RE_PRIMER.md`._