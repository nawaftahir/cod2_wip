# HeapSort reconstruction — 2026-10-02

New ordinary C++ source: ../../src/codex_shader_program_sort/sort.cpp.
SDK member90 section13, retail10086920, complete279-byte body. The symbol
was absent from existing REVIEWABLE clean packets before drafting.

Clean V2 is REVIEWABLE279 with full SDK/source/retail, bound, binding and
negative-test gates. Private V3 PASS accepts584 source matches retaining583;
selector checks221 distinct definitions and241 removed SDK entries. Actual
fresh CPU fixtures PASS1284 complete shader/error/constant-table outputs,
954 successes and330 errors per profile. All recorded input hashes were
checked current after these runs. Aggregate credit is pending.

Initial conventional source emitted281/279, with root/child register gaps.
Moving firstChild initialization inside the actual split>0 guard and reading
array[child+1] directly yields279/279 with scoped locals. Shared function-scope
locals also emitted279 bytes but differed at byte40; length alone is no match.
probe_scope_0.json and probe_scope_1.json preserve source/object identities.
No assembly, padding, byte transplant, ABI change or partial-body credit.

This is in-place max-heap sorting: O(n log n), constant auxiliary space.
Both function and comparator use the pinned __stdcall ABI. Existing strict
strip/flow verification tools are reused with pinned hashes; no new referee.
Opaque SDK and CRT dependencies receive zero additional source credit.

From gfx/target:

    sh scratch/codex35_program_sort/build.sh
    python3 scratch/codex35_program_sort/check.py --clean
    python3 scratch/codex35_program_sort/check_link.py
    python3 scratch/codex35_program_sort/run_clean_test.py

Rebuild the two real CPU executables via compile_clean_test.sh in the pinned
CPU image after their inputs change. Do not mistake retained definitions for
direct execution coverage of every heap-sort branch.
