# Accepted global-dialog lifetime reconstruction

The owner explicitly approved and applied the tested proposal, including
tools/verify.py and ledger/compiler.tsv. The preceding source checkpoint is
committed as b899ba4: 383 game matches / 48,845 bytes.

The source change adds the real CAdvCurveEditDlg global instance with NULL
parent. Retail startup at 0x526a10 constructs object 0x1233b68 and registers
cleanup 0x526f50, which destroys that same object. The existing class layout
checks pin its 0x4d8 size. Generated source helpers match 24 and 11 bytes.
They are compiler code, not new game functions.

The verifier patch collects all map function starts, including repeated local
names, and verifies an optional ledger/compiler.tsv with the existing byte and
callee checks. Compiler matches and bytes are reported separately; they never
increase the game count or game bytes. A failed compiler row fails verification.
Compiler rows cannot duplicate game addresses. No masks, per-function comparison
logic, compiler flags, fixed source map or linker flags change.

The source helpers use local names _$E1 and _$E2, also present in MFC objects.
The old extent calculation includes later code in _$E2; the corrected one ends
at the next actual function start. LTCG attributes the initializer to
math_vector.obj in the map; its actual constructor, object pointer and CRT
registration establish the binding. The cleanup's current library label is
incorrect; the compiler ledger takes precedence without changing library data.

The approved patches and row snapshot are archived under
scratch/codex_1028_advcurve_lifetime/approved. The source definition, verifier
correction and ledger/compiler.tsv are now canonical.

- test_lifetime.py: checks both byte matches, the actual object and cleanup
  references, CRT constructor registration and unchanged game coverage.

The linked probe and negative lookup fixture are in
scratch/codex_1028_advcurve_lifetime/check_proposal.py. The negative fixture
reuses the fresh image and deliberately selects the wrong helper; it must fail.
Absolute BSS placement remains incomplete. Swapping the two existing global
source declarations did not establish their retail BSS order under LTCG, so
that ineffective change is excluded from the proposal.

After a normal gate, run inside the pinned image:

    python3 research/codex_lifetime/test_lifetime.py
    python3 research/codex_lifetime/test_accounting.py

No GUI boot or complete file identity is claimed. Do not push.

The accepted linked reconstruction retains 383/383 game matches (48,845 B), verifies
two compiler helpers (35 B), and retains fifty unverified bodies / one order
warning. A wrong compiler helper fails the gate. Same-offset is 25,291
(1.410%, -38 from 25,329); masks and per-function comparison ASTs are unchanged.
Compact reviewed hashes and results are in proof.json. Normal gate and both
post-application tests pass; test_accounting.py retains the negative fixture.
