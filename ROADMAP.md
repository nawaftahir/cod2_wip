# CoD2Radiant.exe 1.0: roadmap

Goal: C/C++ source that rebuilds `CoD2Radiant.exe` 1.0 **SHA-256 identical** with the original compiler,
and runs like retail. Structure first, matching second, so matched code never has to move again.

## 1. File map: DONE (2026-10-24, 0309cd8)
Every function in `.text` has a source file and a position: `data/file_map.tsv` (311 ranges, no gap or
overlap), `link/order.txt` (link order), `data/tu_map.tsv` (function to file). 102 game files: 89 `.cpp` +
13 zlib `.c`. Status and evidence: `research/filemap/STATUS.md`.

## 2. Build model: DONE (2026-10-24, 155f780)
Each file is its own object, built `/O2 /Oy- /Op /GL` and linked `/LTCG`, like retail (RULES.md). The
referee (`make try`, `make verify`) builds the whole exe and checks each function inside it. 76/76 ledger
rows match.

## 3. Match the code, file by file: NEXT
- An agent takes one whole file. `data/tu_map.tsv` lists its functions in order, `make show A=<addr>` shows
  each one (disassembly, strings, assert lines, neighbours), `make try S=<file> A=<addr>` judges it.
  Contract: `AGENTS.md`.
- Order: files that mostly call themselves first (zlib, `q_shared`, `com_math`, `dvar`, the rest of
  `src/universal`, splines, xanim), then the editor files. LTCG optimises across files, so a function
  tied to unwritten files may only match once those exist; it is deferred, not forced.
- Optional speed-up: per-file skeletons (every function's address and name, seeding `data/symbols.tsv`).
- Name the 5 `UNKNOWN_*` files as evidence turns up.

## 4. Data layout
Put `.rdata` and `.data` in retail order. Each file has its own string block in file order (strings reversed
inside), so most of this follows from the code once the files exist.

## 5. Finish line: whole-file SHA-256
- Rich header: our compiler stamps `/GL` C++ objects 100, retail has 99 (`research/richtest/gl99.sh`).
- Link timestamp and the RSDS debug GUID/age: need a deterministic link, never output patching.
- Header and section details left after that (`make sections`).

## 6. Boot test
Run the rebuilt exe and check it behaves like retail.
