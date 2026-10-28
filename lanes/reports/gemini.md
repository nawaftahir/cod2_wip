# Gemini com_shared delivery, reviewed by Codex

Five game bodies / 441 B: three recovered seeds / 251 B and two new bodies /
190 B. Source remains in retail order in src/universal/com_shared.cpp.

- 0x48af50 / 88 B: Com_StringContains, server source.
- 0x48b2a0 / 67 B: Com_HashKey, server source.
- 0x48b2f0 / 96 B: Com_RealTime, server source.
- 0x48b650 / 153 B: Com_Memcmp, Q3 code/qcommon/common.c:3063; retains
  retail's unusual loop bound, confirmed in target disassembly.
- 0x48b760 / 37 B: FUN_0048b760, unnamed two-float comparison.

Codex independently tested the fifth routine as a normal function in the
combined main tree: stock make try reports MATCH without __fastcall. Removed
the explicit convention and unsupported historical name; no flags or masks
changed. Target input registers alone do not prove a source __fastcall ABI.

Nine routines remain unresolved (1,623 B). The previous report claimed eight
recorded tries each, but their files contain only 'MISMATCH recorded try N'
placeholders rather than referee output. Those nine ledger deferrals have been
removed; they are not validated eight-try evidence. The original report and
source are preserved at safety/gemini-24e9a09. Earlier best-percent and dependency
claims need real reproduction; do not repeat or credit them as verified facts.

Final corrected worker verification and combined-tree CI are run by
RADIANT_CI_NO_NOTIFY=1 tools/land.sh gemini. Global coverage belongs to that
combined-tree result, not the older 421-row worker snapshot.
