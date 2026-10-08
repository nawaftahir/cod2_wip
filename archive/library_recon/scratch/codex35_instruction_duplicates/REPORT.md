# Duplicate instruction reconstruction — 2026-10-02

Clean source: ../../src/codex_shader_instruction_duplicates/instructions.cpp.
SDK member90 sections140/141/210; targets1008b1b3/415,1008b352/44,
10094eb4/647. All three were unclaimed in existing clean packets before work.
Total1106 complete source instruction bytes, no tables or opaque credit.

Fresh V2 REVIEWABLE1106 with full typed SDK/source/retail, bounds, bindings
and negative tests. Private V3 PASS590 retains all587 preceding matches.
Actual CPU fixture PASS1284 complete outputs:954 successes and330 errors
per profile. All packet input hashes were checked current after these runs.
The combined full aggregate is running; no new aggregate credit yet.

Both helpers matched on their first grouped source build. The private
__stdcall comparator's first argument is passed in ECX and it returns8,
while the address-taken stable wrapper returns12. These are real transformations
made by the pinned compiler on static functions in the same TU; no manual
fastcall declaration, ABI hack or LTCG-impossibility claim. A survey of all
SDK member relocations found helper callers only in sections141/210.

The first main draft emitted650/647. Initializing count before allocation,
using a shared cleanup path, matching bounded-loop predicates, and correcting
the observed field24 to opaque24 reproduce647/647. That field is not children20.
No guessed semantic type, volatile access, padding or byte transplant.

The first strict clean gate rejected the415-byte comparator because its
complete section ends in a backward jump to its shared return epilogue.
The narrow added boundary proof pins the function name/415-byte size, exact
jump destination338, and decoded pop/pop/pop/leave/ret8 epilogue at338..342.
The full section, all fields, SDK body and negative tests are still checked;
no truncation, blanket jump exception or weakened referee.

Private dependency selection retains helpers in source, not as public ABI
exports. It requires exact literal415/44-byte source/SDK bodies, complete
relocation type/name equality, original/source static classes, and zero
retained SDK callers before removing the now-unreferenced original symbols.
All actual calls remain in the reconstructed TU. Existing public callback
rules remain unchanged.227 distinct source definitions/247 removed SDK entries.

Sorting is O(n log n); scanning duplicate groups can be quadratic per pass,
and the target repeats passes until remaps stop. This is preserved target
behavior, not a new optimized replacement. CPU parity is integration coverage,
not direct execution of every possible optimizer path.

From gfx/target:

    sh scratch/codex35_instruction_duplicates/build.sh
    python3 scratch/codex35_instruction_duplicates/check.py --clean
    python3 scratch/codex35_instruction_duplicates/check_link.py
    python3 scratch/codex35_instruction_duplicates/run_clean_test.py

Rebuild the actual CPU executables via compile_clean_test.sh in the pinned
CPU image after any input changes. Never reuse stale objects as fresh proof.
