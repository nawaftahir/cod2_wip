# DelayOutputs source draft — 2026-10-02

Target1008bbde/648, SDK member90 section169. No existing accepted clean packet
owns this symbol. outputs.cpp reconstructs the observed temporary-argument
remapping, output grouping, writer-chain traversal and copy-instruction creation.
Argument/Instruction signatures are pinned by target relocations and SDK names.
Instruction3c is an observed opaque DWORD tested against zero, not an assumed
historical semantic field or allocation-size declaration.

Initial actual source emitted619/648. A source-level shared-cleanup/group
cursor form emitted626/648. MSVC's legacy for-loop scope warned about an outer
i colliding with earlier for declarations; the group cursor was renamed start
and genuinely recompiled, still626/648. Current source/object identities are
recorded by probe_outputs.json. These are complete-section diagnostics, not
V2 acceptance. No linked regression, CPU parity or additional source credit.
Continue bounded target-backed source forms; never count near matches.
