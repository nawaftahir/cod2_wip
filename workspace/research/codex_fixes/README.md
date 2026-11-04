# Function-boundary correction history

The boundary correction was approved and applied with the later global-dialog
compiler-accounting change. Do not reapply this old patch or run its preparation
script against the updated tool. The historical patch collects every function
address in the linker map, including repeated static names, while keeping the
existing symbol lookup, byte masks and callee checks.

Historical commands for the pre-approval tool only, inside the pinned image:

```
python3 workspace/research/codex_fixes/prepare_boundary_fix.py
python3 workspace/research/codex_fixes/test_boundaries.py
```

The first command generates the draft `verify_fixed.py`; it never edits tools/.
The second checks the duplicated-name boundary and unchanged comparison logic.
`existing_image_proof.json` records the additional check on the saved full math
trial: 340/341 before, 341/341 after, with only Hunk_ShowTempMemoryHigh changing.
That image has since been replaced by later builds; its source is saved in
`scratch/codex_1028_math/attempt.cpp`. Do not treat the recorded image result as
proof about an arbitrary current build.
