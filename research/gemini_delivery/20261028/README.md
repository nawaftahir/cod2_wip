# Preserved Gemini delivery research

These text snapshots preserve the latest available Gemini drafts and progress
reports from agent/gemini at 754c328. They are research inputs, not canonical
source or additional game coverage. manifest.json hashes the preserved inputs.
The original worker checkout and its existing session were left untouched.

Do not run the archived scripts directly. They contain old absolute worker paths,
and one script invokes another worker's align.py. Rebase intended function groups
onto current main and keep execution inside the assigned worker's workspace.
The saved complete attempt/backup predates the three accepted 754c328 functions;
copying it over current source silently removes those verified definitions.

shutdown_observed.cpp reconstructs the source text from the previously observed
working-tree diff, not a new committed delivery. Its helper and wrapper must be
re-verified together. The remaining files are exact copied input snapshots.

The initial independent saved-candidate test reproduced four sanitizer helper
MATCHes, but the read core stayed at 39% (1343/1396 B), two existing read wrappers
regressed, and three accepted functions were absent from this old source copy.
review_saved_candidate.json records that result. No game rows were added.
The isolated reviewer then rebased the group on current source, retained those
three functions and tested external linkage, justified by the actual cross-file
caller. Its result is recorded separately; no verifier or masks were changed.

Use the current root TASK_GEMINI.md as the assignment. Near sizes and draft hits
must be reported separately from committed source that passes every ledger row.

The rebased candidate preserves all three previously missing definitions. Giving
the read core external linkage did not change its 39% result (1343/1396 B, first
+0x10). The same two accepted read wrappers still regress. All four sanitizer
helpers match, with their direct strings checked, but this is not a passing
caller group. review_rebased_candidate.json records the remaining two failures.
rebased_candidate.cpp and review_gemini.py reproduce that evidence against the
407-row baseline; no new ledger rows are credited. This candidate also contains
the draft's fs_copyfiles pointer declaration, whose ownership/layout still needs
binary confirmation before canonical source integration.

The updated assignment prioritizes the corrected deletion binding and complete
shutdown pair, then the real TexWnd caller group. Source aliasing through the
filename pointer slot is retained only as research evidence and is not approved
for source integration. The historical progress report's _rmdir credit is obsolete.
