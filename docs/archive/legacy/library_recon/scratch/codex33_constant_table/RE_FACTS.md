# Pinned reconstruction facts — 2026-10-06

These facts come from complete SDK sections and matching retail bodies,
not guessed decompiler signatures. Clean/link/fixture packets identify inputs.

- CConstant Create1008085f/664 allocates68 bytes. CONSTANTINFO occupies20
  bytes at this+4; type+18, upload+1c, scratch+20, next+24, members+38,
  elements+3c, elementType+40. CConstantTable is only an access prefix;
  do not use its declaration to allocate SDK table objects.
- TypeSize1007d733/187 takes six stdcall arguments, ret24. Its recursive
  self-relocation is+77. Direct branch expressions match; a shared product
  temporary changes register assignment.
- GetDesc1007d9d4/163 clears12 bytes then writes48. Preserve the behavior.
- SDK table constructor10080e16/33 binds27 virtual slots, verified against
  full108-byte table and SDK/retail relocations; the carrier has zero credit.
- Negative handles negate a constant pointer; positive handles are names.
  Setters keep a non-escaped lookup result and traverse next+24, stopping on
  upload failure. GetConstantDesc saves the destination before reusing its
  descriptor argument for lookup output; sampler lookup reuses the handle
  argument only on the string path.
- Initialize10080af7/388 preserves the copied DefaultValue. Frame-0x14 is
  a separate parent-index spill, not DefaultValue at frame-0x18. The original
  lifetime.cpp draft got this wrong and must never be promoted. The exact
  limit expression directly reads parent registerCount/registerIndex.
- GetConstantElement10080c7b/411 truncates element-register product to WORD,
  directly reads registerIndex in new-index and available-count expressions,
  retains the saved index for clamping, and clears the slot on init failure.
  A local allocation pointer, not a reloaded slot, controls the null check.
- Create retains the inline version expression in both orientation branches
  and separate allocation/init failure returns. Combining them changes code.
- CompareStringA1007d7ee/65 has nameEBX/queryEAX/lengthstack/ret4. Ordinary
  static C++ in its caller context generates this private convention. Both
  callers still mismatch; no standalone emission or credit is authorized.
- InitCaps100a6f12/179 accesses versionC8, flagsCC, originalVersion108,
  capability words from28. Word6c bit17 is an unsigned one-bit field:
  AND1 before SHL17 is required. Clear word30 before setting byteCD bit0.
  Ghidra has no function here; full SDK/retail equality and CPU tests prove it.
- CPool initializers touch0..30. SwapRegisters uses argumentCount8,pools10,
  arguments14,poolflags200,argpool4,indexC,remap30. These are access views,
  not complete allocation contracts. Capability fixtures use oversized raw
  access records and qualified calls, not retail construction or GPU dispatch.

32 table bodies/3904 bytes and5 native bodies/616 pass local V2/V3 and34348
CPU cases. Raw table scores97/94/96 remain recorded; decoded normalization
proves exact relocations. All37 await a completed aggregate, not new source.
/Og- experiments worsened output; no compiler-impossibility claim is made.
