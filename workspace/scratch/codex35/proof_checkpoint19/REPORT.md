# Independent renderer checkpoint19

544 game functions /94,753 executable bytes /253,580 =37.3661172%.
95,156 full extents minus403 table/padding bytes. All513 checkpoint9
extents remain, no overlaps, no new library/assembly coverage.

Fresh build: build/codex35_checkpoint19_61aFiz.
Pinned compiler image: sha256:17ddd3cc30517bc070c4e1a1d8bec9c4abd0d8b453115dfa0324e7e20dc94131.
Binding SHA-256: 1fb20f50ac075d846fdd0a2963744c9a8e4320f30e1a637b7f2b1a1a59fbdf49.
469-input manifest SHA-256: 6a521a0444c8a5743887c8c3ac31d55ffd323ce4ce9e9bf5f06e9402479f07e8.
Whole DLL SHA-256: c1be8df226212b7caf8e04d3ad436016b0b036ca8f3f3b1dc00637b2948b2cf7.
The whole DLL is NOT SHA-identical to retail.

Unchanged cmp.py and bindcheck.py reproduce the full warm binding ledger.
Protected regression, missing/truncated/bad-binding negatives, switch-table
audit,46 frozen suites and frozen-input hashes before/after all pass.
New472 bytes: RB_ChangePixelShader104, RB_ChangeVertexShader104,
RB_ChangeVertexDeclaration114 and RB_DrawIndexedPrimitive150.

Fresh compilation/link completed before an environment reset. Verification
resumed from replay.sh line18 on the already-complete cold DLL, after
validating the input manifest and terminal link log. It terminated0 and
copied evidence into cold/. See cold19_resume.log; replay.sh starts a fully
fresh build for independent future reproduction.

Later mutable FFT/water drafts are unaccepted and are not frozen here.
No canonical changes, commits or pushes. Renderer goal is not completed.
