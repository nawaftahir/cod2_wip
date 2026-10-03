# Register splitting / multiplication-sequence source cohort

Status: complete local V2/V3/CPU gates;807 bytes aggregate-pending.
Clean source: target/src/codex_shader_register_split/register_split.cpp.
Both complete definitions use pinned SDK90 access prefixes and the real
thiscall/private-vs-protected C++ signatures, not transplanted instructions.

SplitRegisters: SDK90/194, target10090e95,586 complete instruction bytes.
MulSequence: SDK90/85, target10087a5d,221 complete instruction bytes.
The source views are access prefixes, not historical allocation layouts.
SplitRegisters operand order was recovered from the target comparisons.
MulSequence follows MOV and MUL producer inputs recursively; its original
defined-writer assumptions are retained, with no invented guards or cycle fix.

Fresh pinned compiler4035 build via build.sh passes check.py --clean: decoded
relocation-normalized referee100 and complete source/SDK/retail equality,
exact symbols/bindings, complete boundaries and negative tests. Legacy raw
diagnostic is100 for SplitRegisters,94 for MulSequence: the byte-scanning
PE masker omits intra-function/self-call operands113/179/204. Each realE8
operand independently decodes to10087a5d and has exact source-local binding.
Wrong MulSequence access initially generated protected IAE instead of private
AAE; the gate rejected the symbol, and the actual private declaration fixed it.
No ABI, mask, size or boundary gate was relaxed.
check_link.py passes644 matches retaining all642 previous matches.
run_clean_test.py passes0 differences/1284 integrated shader cases,
954 successful and330 error outcomes in each image. Complete byte proof is
independent of fixture reachability; these are integrated output comparisons.
All three packet file hashes were independently checked current.

Audit8482 exited1 at the inconsistent raw100 aggregate assertion. Its log is
preserved. Replacement30276 at codex35_output_groups/aggregate.log includes
807+2468 bytes, with exact diagnostic94 and typed/literal self-call assertions.
Until terminal PASS/exit0, these807 bytes are not added to348740. No SDK
dependency, table, duplicate, data or whole-file identity credit is claimed.
The private selector replaces281 distinct definitions/301 physical definitions;
all remaining historical SDK code is an opaque external test dependency.

Replay: sh target/scratch/codex35_register_split/build.sh;
python3 target/scratch/codex35_register_split/check_link.py;
compile_clean_test.sh inside the pinned compiler image, then run_clean_test.py;
python3 tools/check_ten_percent.py. Preserve full logs and packet identities.
