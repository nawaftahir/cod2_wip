# Program reconstruction checkpoint — 2026-10-02

Paused at the owner's request. Confirmed aggregate coverage remains331798 /
1089680 =30.449123%;6003 further verified instruction bytes reach31%.
The fresh accepted aggregate output is in ../codex35_compiler_types/aggregate.log.

## Delivered

Twelve complete source definitions /2663 instruction bytes, separated into
../../src/codex_shader_program/program.cpp. Clean byte/binding/negative proof
is REVIEWABLE. Both scratch and integrated source CPU fixtures pass1284
complete outputs,954 successes/330 errors in each original/source profile.
All three proof/fixture packets' file hashes were checked current at pause.
The private DLL builds and links without /FORCE; source selector checks208
distinct source-owned definitions and228 removed archive definitions.

## Integration failure — no new aggregate credit

check_link.py exits1 at the all-new-methods acceptance assertion. Its prior559
source-match retention assertion passes. These four new methods are absent:

- CInstruction scalar deleting helper:1006c418/32 bytes.
- CArgument scalar deleting helper:1006db35/32 bytes.
- CProgram::CompactInstructions:10086eae/95 bytes.
- CProgram::CompactArguments:1008d525/249 bytes.

Other eight new methods appear in the accepted results, but the cohort gate
has not passed. Do not call this571 linked matches or count2663 aggregate bytes.
link.log and ../../build/codex31_program/bind.json preserve the exact failure.
No V4 whole-DLL SHA identity, game boot or GPU coverage is claimed.

## Resume commands (from gfx/target)

    python3 scratch/codex31_program/check.py --clean
    python3 scratch/codex31_program/check_link.py

Inspect the four binding failures against the clean proof, map symbols and
complete SDK/source/retail relocation evidence before changing code or checks.
After any harness edits, regenerate clean V2, then genuine V3; do not patch
packet hashes or weaken assertions. Both CPU fixtures reuse the existing
shader corpus, avoiding a separate test framework. To rerun the integrated one:

    python3 scratch/codex31_program/run_clean_test.py

Only after genuine V3 PASS, install aggregate_pending.patch from gfx/, update
any changed tool pins, and run tools/check_ten_percent.py. The accepted checker
is unchanged at pause. That complete replay also proves address disjointness.
If all2663 bytes are accepted, candidate total334461 =30.693506%;3340 remain
to31%. This is a forecast, not verified coverage.

## Pinned facts and attempts

SDK members87/88 prove class-specific static __stdcall operator delete for
CArgument/CInstruction. Global delete declarations generated33-byte helpers;
the typed class operators reproduce the complete32-byte helpers. Their1-byte
SDK destructors remain external dependencies, not source credit.

ReadWriteInfo's final relocation at+705 names global operator delete, not
_free. A free-based draft matched masked instructions but had wrong binding;
it was corrected before the strict proof. Preserve this binding check.
Ordered D4/D8/DC initialization, loop-local lifetime in CompactArguments and
read/write alias ordering reproduce exact sections without padding or assembly.

Optimize remains an unmatched625-byte draft versus638 retail bytes; the early
EDI save/shared exit layout differs. PROGRAM_MATCHED_ONLY excludes it from the
scratch proof/fixture and it is not present in clean source. CPU success must
not certify this excluded draft. No repeat CRT/library survey was run.
