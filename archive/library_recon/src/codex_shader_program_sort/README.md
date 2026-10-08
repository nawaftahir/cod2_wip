# Shader index heap sort

sort.cpp supplies the complete 279-byte D3DXShader::HeapSort at 10086920.
The callback and helper are both __stdcall, pinned by the SDK symbols and
the already accepted CompareIndex caller. Ordinary C++ builds a max heap,
then removes roots: O(n log n) time, constant auxiliary space. No stability
claim or historical private-header claim.

Clean V2 checks complete source/SDK/retail bodies, bounds, bindings and
negative tests. Private V3 accepts 584 matches, retaining all 583. The actual
integrated CPU fixtures agree on 1,284 complete shader/error/constant-table
outputs. This is integration coverage, not direct execution of every path.
Aggregate credit is pending; no whole-DLL SHA or GPU certification.

Build and proof tools: ../../scratch/codex35_program_sort/.
