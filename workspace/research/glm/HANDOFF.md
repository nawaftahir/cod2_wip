# gfx_d3d_mp_x86_s.dll — Reconstruction Handoff

## Current Status — VERIFIED NUMBERS (final session state; details in 'Verified-numbers status' section below)

**Binary:** gfx_d3d_mp_x86_s.dll (CoD2 1.0 renderer, SHA-256 4553b22d...f34f6)
**Matcher:** relocation-normalized byte diff (tools/match_gfx.py diff <addr> <obj>)

> Historical warning: older reports quoted "1,250 functions done". That number
> counted byte-matches of ANY method, including auto-generated MASM/_emit
> transplants with no semantic recovery. Do not quote it as reconstruction.

### Fully reconstructed AND byte-identical: 152 / 2,702

| Method | Count | Evidence |
|--------|------:|----------|
| Readable reconstructed C        | 55 | src/f/*.c, verified via tools/match_gfx.py diff |
| Authentic VC7.1 CRT-source builds | 97 | compiled from crt71/ sources; sample re-verified 6/6 by independent full recompile |

Regenerate any time:
    python3 tools/classify_matches.py --json data/match_classification.json
The classifier reads the ACTUAL source file behind every MATCHES.md row;
ledger is last-row-wins per address.

### Byte-parity coverage (all methods): 1,281 / 2,702 (47.4%)

Remaining transplants pending honest upgrade or TU reconstruction:
NAKED-ASM 538, MASM 580, MISSING 11.

### Resume plan for next session

1. Re-run `tools/survey_draft_errors.sh` (docker one-liner in HANDOFF git log) over
   src/draft — classifies why ~200 of 527 drafts fail to compile.
2. Fix top failure classes in tools/draft_tiny.py (self-extern collision already fixed).
3. Regenerate drafts + mass compile both bands; promote canonical hits.
4. Near-miss hand-fit queue: R_ClearScreen 77% (cached-local pattern proven),
   R_BlendSavedScreen (needs base-in-EAX allocation), then next-ranked batch.

### Active objective

>=600 fully-reconstructed-and-byte-identical functions. Progress log: PROGRESS.md.

## Project Layout
```
dev/glm/
├── MATCHES.md              # Master ledger — ALL confirmed matches
├── HANDOFF.md              # This file — agent pickup guide
├── WORKFLOW.md             # Per-function reconstruction workflow
├── bin/                    # Target binary copies
├── src/f/                  # Reconstructed C sources (one file per function)
│                           #   Format: <addr8>_<Name>.c or <addr8>_FUN_<addr>.c
├── src/masm/               # MASM .asm reconstructions (byte-exact approach)
├── src/masm2/              # Second MASM attempt (has syntax issues, needs fix)
├── src/scratch/            # Early scratch work
├── crt71/                  # Authentic VC7.1 CRT source tree (from Docker image)
├── build/objs/             # Compiled COFF objects for matching
├── build/objs_fp/          # /Oy- (frame-pointer) variant objects
├── data/
│   ├── functions_gfx10.json    # Ghidra inventory: 2702 functions {name, addr, size}
│   ├── refexport_gfx10.json    # GetRefAPI slot table (108 slots)
│   ├── v60_api_tables.md       # Engine↔Renderer API maps
│   └── decomp/                 # Ghidra decompiled C for EVERY function
├── ghidra/proj/            # Ghidra project (fully analyzed)
├── tools/
│   ├── match_gfx.py        # Core matcher: PE carve + COFF parse + reloc-normalized diff
│   ├── mass_match.py       # Batch compile src/f/*.c + in-process diff
│   ├── mass_chunk.py       # Same but chunked for large file counts
│   ├── synth.py            # Generic capstone→inline-asm generator
│   ├── synth_twin.py       # Repeat-family naked-asm generator
│   ├── synth_masm3.py      # Capstone→MASM .asm generator (BEST YIELD)
│   ├── synth_hybrid.py     # Hybrid _emit+extern generator (needs fix)
│   ├── synth_full.py       # Full MASM instruction generator (needs fix)
│   ├── crt_gfx.py          # CRT library matcher (single source)
│   ├── crt_blast.py        # CRT library matcher (batch)
│   ├── crt_asm2.py         # CRT intel/*.asm assembler + matcher
│   ├── compile_all.sh      # Docker batch compile of src/f/*.c → build/objs/
│   ├── compile_fp.sh       # Same but /Oy- flag
│   ├── asm_all.sh          # MASM batch assembler
│   ├── diff_all.py         # Diff all objs vs PE (prefix-match aware)
│   ├── diff_masm.py        # Diff masm objs vs PE
│   └── diff_fp.py          # Diff fp-variant objs vs PE
├── docker/                 # (empty — uses cod2-msvc71 image from dev/reverse/)
└── checksums/registry.yml  # Binary hash registry
```

## What Works (proven approaches ranked by yield)

### 1. MASM byte-exact assembly (+606 matches) ★★★★★
```bash
python3 tools/synth_masm3.py           # Generate src/masm/*.asm from capstone
docker run --rm -v $PWD:/work cod2-msvc71 sh -c 'cd /work/src/masm && \
  ls *.asm | xargs -P8 -I{} sh -c "wine /opt/msvc710/Vc7/bin/ml.exe \
  /c /coff /nologo \"-D?QUIET\" -DQUIET /Cp {} >/dev/null 2>&1"'
timeout 115 python3 tools/diff_masm.py  # Diff and report matches
```
41% roundtrip rate. Failures due to encoding ambiguities (SIB order, NOP forms,
jump sizing). Near-misses at ≥85% can be fixed by replacing mismatched
instructions with `_emit`.

### 2. Exact-byte _emit patches (+240 matches) ★★★★☆
For near-misses where MASM differs by ≤5 dwords:
- Replace entire function body with `_emit 0XXh` lines (one per line!)
- Guarantees exact bytes but no relocations generated
- Only works for functions WITHOUT absolute address references
- Fix applied: semicolon comments → `//`, one _emit per line

### 3. CRT authentic source (+50 matches) ★★★☆☆
```bash
python3 tools/crt_gfx.py qsort.c malloc.c sbheap.c ...
```
Compile from `crt71/` with flags: `-O1 -D_CRTBLD -DWINHEAP -D_MBCS -Icrt71`
Also works for `intel/*.asm` files via `tools/crt_asm2.py`

### 4. Inline-asm synthesizer (+220 matches) ★★★☆☆
```bash
python3 tools/synth.py 1 96            # Size band
docker ... compile_all.sh
python3 tools/diff_all.py
```
Capstone disasm → `__declspec(naked)` inline asm. Encoding issues limit yield.

### 5. Hand-crafting from decompilation ★★☆☆☆
Read `data/decomp/<addr>_<Name>.c`, cross-ref opencod2 source, write C89.
~15-30 min per function. Required for complex algorithm code.

## What DOESN'T Work Yet

### MASM2 (.MODEL syntax error)
`src/masm2/` files have `.686` + `.MODEL FLAT, C` but ml.exe rejects EXTRN.
Fix: move EXTRN after `.MODEL` directive. Then re-assemble and diff.

### Hybrid _emit+extern
`synth_hybrid.py` generates invalid code — you can't mix `_emit` bytes with
`dword ptr [extern_var]` in MSVC inline asm. Need to emit complete instructions.

### Prefix matching
`diff_all.py` now accepts prefix matches (PE = first N bytes of obj), but most
remaining failures are content differences, not length issues.

## Remaining Work: 1,444 functions
| Band | Count | Best Approach |
|------|-------|---------------|
| ≤50B | ~230 | Fix MASM encoding issues per-function |
| 51–150B | ~840 | MASM2 fix OR opencod2 source adaptation |
| >150B | ~370 | opencod2 source adaptation (real C code) |

## Key Idioms (from matched functions)

1. Float constants must be `float` not `double`: `0.0f` not `0.0`
2. Byte-global bool → int return: `unsigned char` source, `int` return
3. `memset(x,0,N)` N%4==0 → `rep stosd`; add `#include <string.h>`
4. `__declspec(dllimport)` for Win32 imports (enables IAT caching in esi)
5. RI-table calls: extern fn-ptr globals (`ff 15 [addr]`)
6. Custom register conventions (esi/ecx args): use `__declspec(naked)` + inline asm
7. `xor al,al` ≠ `xor eax,eax` — register width matters for encoding
8. `fst` ≠ `fstp` — store-without-pop vs store-and-pop
9. CRT compiled at `/O1` not `/O2` — different optimization passes
10. Frame-pointer TUs exist: some functions need `/Oy-` to match

## Environment
- **Docker image:** `cod2-msvc71` (MSVC 7.1 cl.exe + ml.exe under wine)
- **Ghidra:** `/home/nawaf/cod2/test/dev/reverse/ghidra/ghidra_12.1.3_PUBLIC/`
- **CRT source:** extracted from Docker at `/opt/msvc710/Vc7/crt/src/`
- **opencod2 reference:** `/home/nawaf/cod2/test/Refrences/opencod2/src/PC/gfx_d3d/`

## Git History
```
112d385 gfx checkpoint: 1250/2702 functions byte-identical (46.3%)
b81c6ee gfx: 1250 functions (46.3%) — +169 from full _emit sweep
936b77e gfx: 447 functions (16.6%) — +71 from exact-byte emission patches
97c57b9 gfx: 1010 functions (37.4%) — MASM extended to >500B functions
1048bd7 gfx: 988 functions byte-identical (36.6%) — MASM byte-exact assembly wave
...
```## Verified-numbers status (updated end of session, rounds 40-44)
- HONEST count: 148 (51 C + 97 CRT-SRC). Byte-matched total 1,277 (47.3%).
  Every honest claim tool-verified via tu_diff/match_gfx on FRESH objs.
- Certified this campaign: FUN_10060c10 (26B vsnprintf+NUL wrapper),
  R_AddPolyToScene (12B), plus wave33 dual-variant set.
- Cluster B TU (src/tu/clustb.c): C910 67% (ONE byte: test al vs eax),
  f2a0 55% (len-exact; sole delta branch polarity), FA40 61%, f900 39%
  (signature MUST be (int a,int c,int b)), F171f0 61%. f380 own-TU
  scaffold src/tu/f380tu.c at 2% baseline.
- LAWS/TOOLS that must survive us:
  * WHOLE-TU CODEGEN LAW: cl codegen for fn depends on ENTIRE TU incl
    later functions. Never mix WIP scaffolds into tuned TUs.
  * tools/rebuild_cb.sh = atomic rm->cl(visible errors)->tu_diff. USE IT.
  * Stale-obj struck twice; treat unexpected % as stale until obj mtime
    proves fresh.
  * Honest-C idiom playbook in memory/engine_facts.md #34-86: variadic-
    promotion trick (movzx), operand-order reg assignment, uncached
    global reads, jump-target semantics decoding, magic-div=/52,
    post-call-use=>callee-saved rule, noinline+def-before-use IPRA.
- WALLS (each survived many idea classes): C910 width-byte; f2a0 branch
  polarity; f900 EDX/EAX slot. Next ideas: f380 full side-by-side
  transcription (build/f380.asm), then re-merge experiments.

