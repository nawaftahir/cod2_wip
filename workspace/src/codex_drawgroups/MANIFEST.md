# Verified drawgroup source

`gfx_d3d/r_splitscreen.cpp` is an unchanged copy of the completely checked
six-function file in `target/scratch/codex15_drawgroups/`. SHA-256:
`10601fdeb692bc831120dfc53121894bf1c7185205c5de6c4d5052b0b4e1ea9a`.

Verified instruction bytes: R_InitDrawGroups 53, R_BeginDrawGroupSection 44,
R_BeginDrawGroupLoop 63, R_EndDrawGroupLoop 70, R_EndDrawGroupSection 40,
R_IssueDrawGroups 317; total 587. All are already counted, not extra coverage.

Proof uses the private no-`/FORCE` closed link and `tools/codex15_bindcheck.py`;
the aggregate `python3 gfx/tools/check_ten_percent.py` replays it. Includes
and helper implementations currently come from that private build context.
This copy separates accepted source from experiments; it is not independently
buildable, a complete DLL, or evidence of original historical TU grouping.
The one-past-array binding correction requires independent review before
canonical integration. No canonical source or release tree is overwritten.
