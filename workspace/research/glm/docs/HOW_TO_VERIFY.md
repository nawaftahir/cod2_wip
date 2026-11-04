# How to verify any reconstruction claim — for humans and agents

## Layout: what's what

| Path | Contents |
|------|----------|
| `build/rawdumps/<addr>_<size>B_<name>.asm` | **Ground truth**: capstone disassembly of every one of the 2,702 DLL functions. `MANIFEST.tsv` lists all. |
| `src/f/*.c`, `src/tu/*.c`, `src/crt_red/*` | **Reconstructed sources**. A ledger row's source column points at the exact file. |
| `MATCHES.md` | The ledger. **Last row per address wins.** Each MATCH row names its source file. |
| `data/match_classification.json` | Machine view of the ledger (regenerate: `python3 tools/classify_matches.py --json ...`). |
| `data/decomp/<addr>_<name>.c` | Ghidra reference decompilations (reading aid, NOT reconstructions). |

## Method classes (what a MATCH can mean)

- **C** — real readable C in this repo, compiled with our MSVC7.1 container, byte-identical.
- **CRT-SRC** — compiled from authentic Microsoft VC7.1 CRT source (`crt71/`), byte-identical.
- **NAKED-ASM / MASM** — byte transplants (_emit/asm). Bytes match; NOT semantic reconstructions; excluded from the honest count.

## Verify a single claim in 30 seconds

    python3 tools/match_gfx.py diff <ADDR> <obj-file> [symbol]

Prints `MATCH (normalized) 100%` or a byte-level first-diff.

Cluster-B family rebuilds atomically:

    sh tools/rebuild_cb.sh

Other TU files:

    docker run --rm -v $PWD:/work -w /work/src/tu cod2-msvc71 \
      sh -c "cl /nologo /W0 /O2 /c <file>.c /Fo../../build/objs_red/<x>.obj"

## Authoritative counts

    python3 tools/classify_matches.py --json data/match_classification.json

Only `C` + `CRT-SRC` rows count as honest reconstructions (156 today).

## Rules every agent must keep

1. Never trust a scoreboard from an object you didn't just build (stale-obj).
2. One function family per translation unit while tuning (whole-TU codegen law).
3. Semantics come from rawdumps side-by-side, never byte-guessing.
4. Record every negative result in memory/engine_facts.md.
