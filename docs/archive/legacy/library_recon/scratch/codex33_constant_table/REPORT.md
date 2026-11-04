# Constant-table reconstruction — scratch only

LATEST:32 complete definitions/3904 instruction bytes have clean source in
target/src/codex_shader_constant_table/. Full V2 passes; V3 accepts700 and
retainsall668 preceding source matches. The20396 public reflection/upload
CPU cases match the authentic original SDK. Initialization388 and array
elements411 are newly exact; the obsolete30/3105 statements below describe
the earlier checkpoint. Remaining drafts are still excluded. Global acceptance
awaits a completed cold audit; aggregate_33.log stopped without terminal PASS.
At the owner's2026-10-06 checkpoint no audit is running. Allnew37
definitions/4520 bytes would yield33.001835%, not accepted until terminal PASS
and independent posthash. No whole-DLL identity or game/GPU boot is claimed.

Accepted coverage remains355095/1089680 (32.587090%). This batch has clean
locally verified source but is not globally accepted or whole-DLL identity.
The owner cleared the goal and requested a checkpoint. All six new packets
passed a rehash of826 recorded /533 unique identities. Resume from HANDOFF.md;
4500 additional accepted instruction bytes are required for33%.

The sources recover SDK63/retail constant descriptions, typed setters,
lookup, construction, destruction, recursive type sizing and initialization.
Fresh pinned4035 builds compare complete original SDK sections and relocation
field layouts using the unchanged diagnostic codex30_constants/probe.py.
These probes are discovery only: they do not prove symbol bindings or linking.

Current exact-pattern candidates:

-25 methods in constants_ordered.cpp:1966 bytes; SetDefaults(CConstant) and
 GetDesc(CConstantTable) are still unmatched. The other25 remain exact.
-TypeSize187, constructor113, destructor142, generated scalar deletion33.
 The helper is emitted by genuine child-object deletion, not a marker.
-Create664 in create.cpp now matches after preserving the inline version
 expressions and separate allocation/initialization failure returns.
-CompareStringA65 in names.cpp matches in its genuine two-caller context.
 The callers themselves still differ; do not force helper emission or count
 it from an unused standalone definition.

The first group above plus lifetime/type/create candidates total3105 bytes,
before any binding, retained-link, CPU or aggregate acceptance. Count the
deletion helper once. No accepted source has been overwritten.

Important correction: the first lifetime.cpp draft misidentified a spilled
parent-register index as info.DefaultValue. That assignment was wrong and
has been removed from lifetime_ordered.cpp. Initialize preserves the copied
DefaultValue. The SDK disassembly separates the20-byte info at frame-0x28
from the parent-index spill at frame-0x14; TypeInfo is at frame-0x1c and
DefaultValue at frame-0x18. Do not retry or promote the original draft.

Source-context findings:

-Private CompareStringA's first source argument is the stored name, second
 the query; its observed machine convention uses EBX for name, EAX for query
 and one stack length argument. Reversing source argument order did not
 preserve the original private convention. No register ABI was hand-authored.
-TypeSize's direct branch expressions produce the complete187-byte body.
 A shared rows/columns/product temporary yields equal-length register swaps.
-Typed setters must keep a non-escaped local constant after lookup and a
 tail-tested sibling loop. A do/while or escaped pointer local differs.
-GetConstantDesc preserves the descriptor destination while reusing the
 original descriptor argument slot for the lookup output. GetSamplerIndex
 analogously reuses the handle slot only in the string path.

Bounded /Og- builds substantially worsened every body; their separate
probe_*_nog.json files are diagnostic only. No compiler-impossibility claim.
The isolated matched.cpp now passes full V2 for30 bodies/3105 bytes, including
SDK/source/retail equality, exact relocation fields, typed27-slot table
bindings, genuine recursive-call binding and negative tests. packet.json
records raw legacy scores97/94/96 for TypeSize/destruction/SetScratch; the
unchanged reviewed decoded referee reports100 for all30. The raw scores are
preserved, not overwritten. Final internal epilogues of the two handle getters
are checked explicitly against their complete SDK bodies.

The new verifier invalidates the old reviewed-cache environment. A fresh cold
aggregate is required before resealing. Retained668-source link regression,
direct/public CPU comparisons and clean promotion are still pending. V2 alone
does not raise the accepted percentage.

Research exports are local-only; the Ghidra database was opened read-only
and all in-memory signature hypotheses were discarded. Never commit the raw
exports, retail bytes, SDK objects or generated binaries.
