# Shader syntax-tree source

`nodes.cpp` defines 72 complete reconstructed SDK node constructors, comparisons
and copies: 4,783 instruction bytes. Every defined function passed complete
source/typed-SDK/retail comparison, relocation binding checks, boundary checks,
byte and binding mutation negatives, and the original byte-match referee.
Vtables are checked as three typed function-pointer slots, not masked data.
Their bytes and empty shared Print methods receive no additional credit.

The fresh private link accepts 491 source matches, retaining all 419 previous
matches. The SDK-reference CPU fixture passes 10,496 complete-output comparisons.
The complete aggregate replay passed: 324,406 / 1,089,680 = 29.770758%.
Remaining methods are declared
for the target-confirmed layouts but supplied by the original SDK dependency,
with zero new source credit. Drafts remain in `scratch/codex35_nodes/`.

Build and replay from `gfx/`:

    sh target/scratch/codex35_nodes/build.sh
    python3 target/scratch/codex35_nodes/check.py --clean
    python3 target/scratch/codex35_nodes/check_link.py
    python3 target/scratch/codex35_nodes/run_test.py
    python3 tools/check_ten_percent.py

Compiler: pinned VC 13.10.4035, `/O1 /Oy- /hotpatch /MT /Gy`. Numeric enum names
are neutral placeholders for binary-confirmed codes, not claimed historical
names. The historical source and original translation-unit grouping are unknown.
No whole-DLL identity or game/GPU boot is established by this module.
