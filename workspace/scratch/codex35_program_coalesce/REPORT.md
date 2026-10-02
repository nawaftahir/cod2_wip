# Pool/predicate/parameter batch — 2026-10-03

Clean source supplies three independently matched complete methods /699
instruction bytes. CombinePools293 and MutuallyExclusive181 matched the
first signature-correct build. SwizzleParameter initially224/225; replacing
memcpy with the target-backed counted copy loop produces225/225. Fresh clean
V2 passes all source/SDK/retail, binding, boundary and negative gates.

Selected232 distinct source definitions /252 removed SDK definitions.
Linked regression is still running at checkpoint (expected595 retain592,
not an acceptance claim). The actual freshly linked CPU fixtures were built,
but run_clean_test.py failed before executing them: replacement212->232
followed by232->252 makes both assertions252. Reverse those two substitutions
after the current pinned V3 run finishes, then refresh V2/V3 and really rerun
CPU fixtures. Do not edit pinned gates while a check is running. No fabricated
CPU result or additional aggregate percentage.

Vectorize10099251/267 stays scratch-only: initial265/267; restoring the
observed explicit nonzero-result branch produces267/267 but swaps EBX/EDI.
Equal length is not equal bytes. No compiler-impossibility or ABI change.

Commands from gfx/target:

    sh scratch/codex35_program_coalesce/build.sh
    python3 scratch/codex35_program_coalesce/check_link.py
    python3 scratch/codex35_program_coalesce/run_clean_test.py

Build/check logs and JSONs preserve actual results; dependency code adds zero
source credit. Full aggregate inclusion is pending.
