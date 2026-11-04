# Temporary allocator caller group

Two new game MATCHes / 461 B in com_memory.cpp:
- 0x48aae0 / 279 B: Hunk_AllocateTempMemoryInternal.
- 0x48ac00 / 182 B: Hunk_ReallocateTempMemoryInternal.

The retained source follows the verified server's global hunk_low.temp update
sequence, with the actual Windows error strings and target assertions at lines
1639 and 1667. hunkHeader_t and its magic/size fields are the existing pinned
types; no retail addresses, assembly, wrappers, ABI overrides or flag changes.
Reference: cod2engine/archive/lnxded-1.0/src/universal/com_memory.cpp:537-593.

Six bounded source variants were compared with the unchanged linked referee.
Pointer commutation, signed/unsigned address casts, typed locals and declaration
order leave the two SIB encodings different at +0x5a. The reference's direct
global-state flow removes the difference and matches both complete bodies.
The integer casts and raw header writes from the drafts are not in final source.
Explicit symbols are necessary for the allocator probe: best-match guessing can
select the high allocator and pin the wrong callback while the real candidate
uses a temporary LTCG register convention. The stock ledger then preserves the
real address-taken entry; final make gate verifies both without custom flags.

Fresh private gate: 502/502, 59,341 game B (8.48%), 14.03% functions, compiler
2 / 35 B, zero failures, unchanged 48 unverified bodies and one warning. The
extended memory-binding test covers all 46 accepted routines in this TU and
actual literals/import/state identities. Unique-address/anchor-size audit passes.
Main's final combined numbers include separately reviewed Gemini work.

All attempts and evidence: scratch/codex_1029_memory_work/.
