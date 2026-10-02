# Program reconstruction checkpoint — 2026-10-02

Resumed toward the owner's35% goal. Full disjoint aggregate PASS confirms
334461/1089680 =30.693506%, including2663 program instruction bytes.
3340 further bytes reach31%;46927 reach35%. Full output is in aggregate.log.

## Delivered

Twelve complete source definitions /2663 instruction bytes, separated into
../../src/codex_shader_program/program.cpp. Clean byte/binding/negative proof
is REVIEWABLE. Both scratch and integrated source CPU fixtures pass1284
complete outputs,954 successes/330 errors in each original/source profile.
All three proof/fixture packets' file hashes were checked current at pause.
The private DLL builds and links without /FORCE; source selector checks208
distinct source-owned definitions and228 removed archive definitions.

## Historical integration failure — resolved

The initial check_link.py stopped at the new-method acceptance assertion while
retaining559 prior matches. These four methods lacked dependency acceptance:

- CInstruction scalar deleting helper:1006c418/32 bytes.
- CArgument scalar deleting helper:1006db35/32 bytes.
- CProgram::CompactInstructions:10086eae/95 bytes.
- CProgram::CompactArguments:1008d525/249 bytes.

The root cause was two missing1-byte SDK destructor locators. vtables.py now
proves their complete SDK/retail/linked bodies and typed caller destinations,
with wrong-target negatives and zero source credit. V3 now accepts571 matches,
retaining559. All1284 integrated CPU outputs and full disjoint aggregate pass.
The latest link.log records PASS; git checkpoint13fc951 preserves the failure.
No V4 whole-DLL SHA identity, game boot or GPU coverage is claimed.

## Resume commands (from gfx/target)

    python3 scratch/codex31_program/check.py --clean
    python3 scratch/codex31_program/check_link.py

Preserve the complete clean proof, map ownership and relocation/binding checks.
After any harness edits, regenerate clean V2, then genuine V3; do not patch
packet hashes or weaken assertions. Both CPU fixtures reuse the existing
shader corpus, avoiding a separate test framework. To rerun the integrated one:

    python3 scratch/codex31_program/run_clean_test.py

clean_packet.json is the current accepted source proof. The older scratch
packet.json references a previous check.py hash and is historical; it must
be regenerated before using its REVIEWABLE label as current evidence.

tools/check_ten_percent.py now contains the verified cohort and current tool
pins. aggregate_pending.patch is historical and must not be reapplied; it has
an obsolete vtables.py pin. Complete replay also proves address disjointness.

A subsequent flow build had an escaped-path bug that regenerated the program
runtime_new.lib archive metadata. The flow script was corrected. Program V3
and its freshly rebuilt1284-output CPU fixture were rerun successfully, with
current hashes. No retail bytes or packet hashes were manually patched.

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
