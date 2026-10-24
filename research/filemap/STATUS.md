# File map status (2026-10-24): step 1 done, waiting for owner review

Result
- data/file_map.tsv: 311 ranges, all of .text 0x401000-0x52720e, no gap or overlap (merge.py over
  proposals/A-F.tsv). Game code: 102 files (89 .cpp + 13 zlib .c), every game function assigned:
  PINNED 594 (own assert), SUPPORTED 2,916, HYPOTHESIS 61, OUTLIER 4 (code inlined from another file).
  5 functions inside library code stay unknown (0x4d942e, 0x4d9554, 0x4f334d, 0x4f3359, 0x4f336b).
- Inventory data/functions_cod2radiant.json: 9,936 functions = carved game range + F_funcs.tsv (2,631 starts
  Ghidra missed or sized wrong, incl. import thunks and EH funclets) - F_funcs_drop.tsv (96 split pieces).
  Backups: research/filemap/functions_ghidra.json.
- AUTO 637: header code (data/auto_funcs.tsv, 93) + game EH funclets / dynamic initializers / atexit
  destructors at the end of .text (linker/text_* placeholders, compiler-emitted, never written).
- lib_funcs.tsv resweeps with the new sizes: 3,940 functions, none before 0x4d0c40 (game and the VC6 P4
  API sit before MFC; tools/lib_sweep.py skips them). The sweep now names _fseek and _free, which exposed
  4 ledger rows whose callees were never checked; fixed (unzip.c stdio, LTCG forward rule), 75/75 again.
- make gate green; whole-file same-offset 1.030% (was 1.048%: the link now resolves unzip's stdio calls).

Facts found
- NOT one compile unit (RULES.md, probe/once/run.sh): every game file is its own object, built /GL, linked
  /LTCG. 102 game files vs 104 prodid-99 objects. Open: our image stamps /GL C++ as prodid 100, retail 99.
- LTCG inlines forwarding wrappers across files and keeps the out-of-line copy under /DEBUG
  (probe/ltcg/run.sh): zcfree -> Z_FreeInternal -> free.
- Link order = file name sorted ignoring case inside groups: editor, Q3 core (brush..z), src/universal,
  splines, xanim+script mixed by name, zlib (adler32 0x4acfc0 .. zutil), P4 API (VC6), MFC/CRT, then the
  .text$x funclets and initializers.
- Retail is in definition order (assert lines rise with address per file). Each file has its own .rdata
  string block in file order (strings reversed inside).

Open for step 2
- The build must move from src/unit.cpp to per-file objects + /GL + /LTCG (verify.py, link.py, flags.tsv,
  gen_unit.py, AGENTS.md "one unit" text). Settle the prodid 99/100 question first.
- Unnamed files: radiant/UNKNOWN_00408f20, UNKNOWN_00420930, UNKNOWN_00425080 (game P4 StdClientUser layer),
  src/universal/UNKNOWN_00494480 (value noise), UNKNOWN_004985d0 (engine stubs). 2 /GL objects not found yet.
- HYPOTHESIS boundary calls in proposals/*.md (brush head 0x453d70/0x453da0, brush tail 0x45f6a0, trees.c
  1-byte head, assertive.cpp tail 0x47d4b0-0x47da80).
