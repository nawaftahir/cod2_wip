# Allocator/diagnostic reconstruction packet — 2026-10-01

REVIEWABLE: 11 complete clean C++ definitions / 1,162 instruction bytes.
`clean_packet.json` records full source/SDK/retail bodies, typed imports and
callee/global bindings, original referee 100%, negatives and input identity.
`link_packet.json` accepts 516 source matches, retaining all 505 previous
matches. `fixture_packet.json` certifies 3,584 complete-output comparisons,
including the preceding assembler fixture. Clean source, pinned layouts,
limits and replay commands: `../../src/codex_shader_support/README.md`.

The initial zero-byte allocator test incorrectly demanded non-NULL. The
original SDK failed that assertion; the complete original body confirms NULL.
Corrected only that test and reran both original and source fixtures: PASS.
Production and other unmatched drafts stay excluded; external SDK/CRT
implementations and data receive zero new source credit. V2/V3 + CPU proof,
not whole-file checksum identity or game/GPU execution.
