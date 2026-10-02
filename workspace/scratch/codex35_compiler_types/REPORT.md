# Type/diagnostic reconstruction — 2026-10-02

## Current checkpoint: clean integration

The owner requested31%, then checkpoint/pause. This batch supplies411 new
instruction bytes, not31% completion. Clean source is
`../../src/codex_shader_compiler_types/types.cpp`. Clean V2 passes, private V3
accepts559 source matches retaining all557, and the fresh clean CPU fixture
passes1284 complete outputs (954 successes/330 errors in both).
The first full aggregate replay was interrupted by an environment restart.
After the owner resumed work, the fresh replay completed with exit0/PASS:
**331798/1089680 =30.449123%**,6003 bytes short of31%. Full output is preserved
in aggregate.log. The411 disjoint instruction-byte gain is now counted.
This is not an achieved31% checkpoint or a whole-DLL identity claim.

The local decoded `referee.py` fixes the confirmed normalization defect without
editing the legacy referee or weakening typed/binding proof. It masks actual
self-call operands, not internal E9 jumps, table bytes or E8/E9 inside immediates.
Raw legacy scores98-byte Error100/313-code-plus52-table GetTypeFlags95 are
retained separately; corrected normalization is100 for both. The complete
SDK/source/retail bytes, every typed binding/addend, decoded boundaries,
all13 table destinations and changed-byte/wrong-binding negatives still pass
independently. Table52 and authentic CRT dependency86 receive no extra credit.

The strict selector replaces196 distinct source methods/206 archive definitions
(10 duplicates), with exact removed/source symbol-set equality. No /FORCE or
retail patching. Source/module inputs, tools, objects, and output hashes are in
clean_packet.json, link_packet.json, clean_fixture_packet.json. The separate
older standalone fixture is not a substitute for this clean integration.

Replay: build.sh, check.py --clean, check_link.py, run_clean_test.py; fresh CPU
executables use compile_clean_test.sh in pinned9147e308… image, target:/work,
SDK:/dxsdk:ro. Source build uses pinned17ddd3cc… compiler and original flags.

The material below is the **historical DEFER checkpoint**, superseded by the
clean integration above, retained to explain the original blocker and attempts.

Accepted renderer coverage is331387/1089680 =30.411405%. This directory adds
**zero accepted coverage**; packet.json is explicitlyDEFER. No clean/canonical
source, accepted compiler inputs or legacy referee were modified.

Actual readable C++ definitions:

| Method | Address | Code | Table | Legacy score |
|---|---|---:|---:|---:|
| CCompiler::Error |1006DCA1|98|0|100%|
| CCompiler::GetTypeFlags |1006DDF3|313|52|95%|

Both complete source sections reproduce the SDK. check.py independently
compares the complete source/SDK/retail bytes, every typed relocation and
symbol/addend, every decoded code boundary, all13 table destinations, and
changed-first/last-byte plus wrong-binding negatives. All those checks pass.
__vsnprintf's86-byte authentic CRT dependency is checked at its typed caller
destination100F61B9 and receives zero extra credit. Source/input/toolchain/
object identities and all binding rows are in packet.json.

The original legacy referee does not pass GetTypeFlags: default normalization
leaves four recursive-call operands unmasked (first difference+96).
MASK_INTRA=1 masks those operands, but also masks exact internal E9 jumps only
on the retail side (first difference+25). Both report349/365=95%. We have not
changed that referee, claimed it passed, or weakened acceptance. The packet
keeps the95 score andDEFER state. Resolve this normalization defect with a
bounded independently checked correction before promotion; no source/ABI
workaround or claim that reconstruction is impossible.

CPU fixture passes **1284** complete original/source public shader outputs,
954 successful compilations and330 errors in both. It compares every HRESULT,
shader byte, diagnostic byte and constant-table byte. Map ownership requires
both methods to come from types.obj in the source executable and from the
SDK in the original. The strict SDK selector replaces exactly these two
methods, with no duplicate definitions or /FORCE. Remaining SDK code is opaque.
This does not certify every internal state, allocation failure, GPU/game boot,
full-DLL retained-match regression or whole-file checksum identity.

The first type draft initialized count before checking node and saved EBX
on the null-node path, unlike the original. Initializing count after the
null return reproduces the target's conditional save and the full section.
Error matches on the first compile. Table constants and opaque field accesses
are confirmed in member73 and existing accepted node/support declarations.

Replay from gfx/target:

1. Run compile.sh in pinned compiler image17ddd3cc30517bc070c4e1a1d8bec9c4abd0d8b453115dfa0324e7e20dc94131,
   with target at/work and the Summer2004 SDK read-only at/dxsdk.
2. Run probe.py types.obj types.cpp; then select_dependencies.py on host.
3. Run compile_test.sh in pinned CPU image9147e3086f65d733e1bb939cfa4aad7882f494cd87183739258b72194661a694.
4. Run run_test.py and check.py on host; expect CPU PASS and byte packetDEFER.

Next: validate the narrow self-call normalization correction without masking
internal jumps, integrate these methods via a separate clean src module,
retain all557 existing linked matches, and replay the disjoint aggregate.
Until then do not add411 to the percentage. Tables never count as code.
