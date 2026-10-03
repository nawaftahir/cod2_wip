# Pool/predicate/parameter batch — 2026-10-03

Clean source supplies three independently matched complete methods /699
instruction bytes. CombinePools293 and MutuallyExclusive181 matched the
first signature-correct build. SwizzleParameter initially224/225; replacing
memcpy with the target-backed counted copy loop produces225/225. Fresh clean
V2 passes all source/SDK/retail, binding, boundary and negative gates.

Selected232 distinct source definitions /252 removed SDK definitions.
Linked regression passes595 matches, retaining all592. Actual original/source
CPU fixtures pass1284 full shader/error/constant-table outputs:954 successful
compiles and330 diagnostics per profile. Every recorded input hash is current.
The initial runner failed before executing fixtures: replacement212->232
followed by232->252 makes both assertions252. After the original pinned V3
finished, those substitutions were reversed and V2/V3/CPU genuinely rerun.
No assertion was weakened. Full aggregate inclusion remains pending.

Vectorize10099251/267 stays scratch-only: initial265/267; restoring the
observed explicit nonzero-result branch produces267/267 but swaps EBX/EDI.
Equal length is not equal bytes. No compiler-impossibility or ABI change.

Commands from gfx/target:

    sh scratch/codex35_program_coalesce/build.sh
    python3 scratch/codex35_program_coalesce/check_link.py
    python3 scratch/codex35_program_coalesce/run_clean_test.py

Build/check logs and JSONs preserve actual results; dependency code adds zero
source credit. Full aggregate inclusion is pending.
