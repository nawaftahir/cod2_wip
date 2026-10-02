# Shader read/write analysis draft — 2026-10-02

Three new ordinary C++ definitions reproduce their complete SDK sections in
a fresh pinned-image compile: ReadInfo94, WriteInfo98, CommitOrigin203, total
395 instruction bytes. probe_readwrite.json records the source/object hashes.
These are discovery diagnostics only: clean typed V2, linked V3, integrated
CPU and full aggregate proof have not run. No coverage credit is awarded.

PINNED SDK member90/sections116..118 and matching retail placements:
ReadInfo1008a7ee, WriteInfo1008a84c, CommitOrigin1008a8ae. Signatures are the
actual decorated symbols, private __thiscall CProgram methods. ReadInfo follows
relative arguments, accounting on their origins and pools. WriteInfo stores
the instruction and previous/next write links through the pool's lastWrites
table, indexed by argument index*4+component, then reads relative2. CommitOrigin
copies origin fields and merges reader bounds/counts, then propagates firstRead
back to aliases. Access prefixes agree with the directly disassembled target;
there is no allocation-size or historical-header claim.

Compile compile.sh in the same pinned compiler image as the clean strip
cohort, then from gfx/target:

    python3 scratch/codex35_program_rw/probe.py readwrite.obj readwrite.cpp

Next: project only these three matched bodies into a clean source module,
reuse the strict strip cohort gates, require223 distinct source definitions /
243 removed SDK definitions, preserve all583 previous linked matches, compare
actual full shader outputs, then run the full disjoint aggregate. The parent
ReadWriteInfo717 method is an additional unimplemented source opportunity, not
an accepted function. The active target remains35%, not a31% substitution.
