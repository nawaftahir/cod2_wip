# Duplicate shader instructions

instructions.cpp contains three complete ordinary C++ definitions:
CompareDuplicateInstructions1008b1b3/415,
CompareDuplicateInstructionsStable1008b352/44 and
RemoveDuplicateInstructions10094eb4/647. Total1106 instruction bytes.

The optimizer groups equivalent instructions, remaps duplicate outputs, and
repeats after input aliases change. The helpers stay static in the same TU;
the pinned compiler itself generates the SDK's private register-argument
calling pattern. Do not split them or manually change their declared ABI.
Observed instruction24 is an opaque DWORD, not an assumed children pointer.

Clean V2 passes complete source/SDK/retail, boundary, binding and negative
gates. Private V3 accepts590 source matches retaining587. The actual CPU
fixtures agree on1284 full shader/error/constant-table outputs. Aggregate
credit is pending; no full-DLL checksum or GPU certification.
Build/proofs: ../../scratch/codex35_instruction_duplicates/REPORT.md.
