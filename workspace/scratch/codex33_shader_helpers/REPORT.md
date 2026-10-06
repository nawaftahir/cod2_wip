# Native shader helpers — 2026-10-05

Five ordinary C++ definitions supply616 complete instruction bytes. All pass
the unchanged strict SDK/source/retail referee, boundary and corruption tests.
No relocations, hidden SDK instructions or retail data arrays are supplied.
The private renderer accepts705 source matches, retaining all700 preceding
matches. The CPU fixture passes13952 cases with zero differences, covering
1296 masks/eight versions,256 pool initialize/copy/self-copy/null groups,
512 register restrictions and2048 capability configurations.

Clean source: target/src/codex_shader_native_helpers/. The access views are
binary-confirmed records, not claimed original full allocation declarations.
Capability CPU cases use an oversized access record and a direct qualified
member call; they do not construct a retail shader-program object or execute
a virtual dispatch/GPU path. SDK-dependent code remains opaque and uncredited.

The capability flag is a real one-bit field at word0x6c/bit17. Keeping that
assignment as an unsigned bitfield yields the target's AND1 before SHL17;
a plain shifted bool omits the three-byte AND. The zeroed word0x30 precedes
the bit set at byte0xcd. Literal masks/offsets are pinned to the full SDK
section and identical retail body, not inferred from Ghidra labels.

IsValidDotWriteMask104, ExchangeRow107 and ReverseInsts74 remain unmatched
drafts in helpers.cpp. Their nearest source sizes are104/105/73. They receive
zero credit and are not in native_helpers.cpp. No marker functions, ABI
variants or synthetic emission were used to match the five accepted candidates.

Full aggregate acceptance is pending. The combined new candidates contribute
3904+616=4520 prospective disjoint bytes. Expected total359615/1089680
(33.001835%) is not accepted until aggregate_33.log terminates PASS/exit0
and an independent posthash succeeds. Old accepted total remains355095.
2026-10-06 checkpoint: the cold audit stopped without terminal PASS; no job
is running. The owner cleared the goal. Six new packets rehashed successfully
(826 recorded /533 unique identities); this is not aggregate acceptance.

Replay build.sh, check.py, check_link.py, select_link_dependencies.py --cpu,
compile_fixture.sh in the pinned compiler image, then run_fixture.py.
The --cpu selector removes only these five SDK definitions for the fixture;
the renderer selector removes342 source-owned definitions. Both check the
identical standard ABI before exposing a static SDK symbol. Source ownership
is checked independently in original/source maps; all input hashes survive
the two concurrent CPU runs. No SDK archive modifications are release source.
