# Instruction-transform driver — 2026-10-03

Clean source ../../src/codex_shader_transform_driver/driver.cpp reconstructs
Apply100cc228/1129, SDK91 section17. Standalone and original helper-group source
both reproduce all1129 bytes and typed relocation sites. No ABI/padding shortcut.

Initial1136/1129 stored the result in an extra stack slot. Delaying result=0
until after flow-tag initialization reproduces its observed EDI lifetime and
gives1129 bytes. A shared failure label still appeared before the optimize block,
first difference81; per-allocation assignment blocks produced1136 and differed79.
The ordinary final-allocation success block with shared cleanup/failure labels
reproduces the complete target layout. Earlier/helper source was moved intact
into this sibling directory before rebuilding proofs; no evidence was waived.

Source preserves the target's ignored ReadWriteInfo result, observed allocation
initialization, cleanup order, and negative Reduce early return. No bug fixes
were inserted into byte reconstruction. Private field labels are observed-use
prefixes, not recovered historical names or allocation provenance.

Clean V2 passes complete source/SDK/retail body, all typed bindings, full boundary
and negative gates. Private V3 passes613 source matches, retaining all612;
250 distinct source definitions replace270 SDK entries. Actual fresh CPU
fixtures pass1284 complete shader/error/constant-table outputs:954 successful
compiles and330 diagnostics per profile. All recorded input hashes are current.
Aggregate inclusion remains pending. SDK/runtime dependencies add zero credit.
No whole-DLL SHA, GPU, exhaustive branch or failure-injection claim.
