# Clean density-dialog checkpoint

Eight authored routines / 480 B pass the unchanged linked referee, four / 240 B
in each of PatchDensityDlg.cpp and TerrainDensityDlg.cpp. Both files remain
PARTIAL: OnOK is declared but unresolved pending the real Pmesh implementation.
The valid source is recovered from Gemini dd98dac without its stubs, forced
noinline, empty header overloads, compiler flags or duplicated frame/window
classes. Source includes the shared stdafx.h profile. No scalar enters game credit.

| File | Original address | Bytes | Routine |
|---|---|---|---|
| PatchDensityDlg | 0x4242c0 | 117 | constructor |
| PatchDensityDlg | 0x424370 | 49 | DoDataExchange |
| PatchDensityDlg | 0x4243b0 | 6 | GetMessageMap |
| PatchDensityDlg | 0x424460 | 68 | OnInitDialog |
| TerrainDensityDlg | 0x43ec80 | 117 | constructor |
| TerrainDensityDlg | 0x43ed30 | 49 | DoDataExchange |
| TerrainDensityDlg | 0x43ed70 | 6 | GetMessageMap |
| TerrainDensityDlg | 0x43ed80 | 68 | OnInitDialog |

Separate proof covers both 34-byte scalars, the 89-byte shared destructors at
0x41a470 and 0x41a560, four EH handlers / 40 B, eight unwind cleanups / 76 B,
and each 28-byte FuncInfo / 16-byte unwind table. The actual ComboBox SDK
constructor at 0x40bc90 / 16 B, scalar at 0x40bca0 / 30 B, and SetCurSel at
0x40bc60 / 19 B match separately. The constructor is bound to the actual
ComboBox vtable; the selector's imported USER32 call identity is checked.
None of these generated/shared routines adds game coverage.

The 86 virtual slots per dialog, complete RTTI/base offsets, inherited runtime
class, empty message maps, constructor and control bindings pass, with exactly
one explicit pending slot per dialog: OnOK (0x4243c0 and 0x43edd0). That slot
must remain unresolved, not silently point to a fabricated handler. OnInitDialog
is bound to its two real saved selections and their zero/one initial values:
Patch 0x12334ac/0x12334b0, Terrain 0x590a60/0x590a64. Absolute placement remains pending.

Proof: research/gemini_review/test_density_partial.py, the game-ledger audit,
full CI and tools/file_ledger.py. The shared dialog audit has an explicit PARTIAL
mode; complete-file checks continue to require every callback binding. The
referee, inventory and comparison masks are unchanged.

Private evidence: .agents/codex/scratch/density_repair/{clean-checkpoint-ci.log,
accepted-partial-audit.log,accepted-game-ledger.log,accepted-files.log}. Original
worker source and OnOK drafts, plus the four retail dependency disassemblies,
are saved in the same directory. Active Gemini source/configuration was also
copied with hashes under scratch/gemini_takeover_20261031; its worktree is untouched.

Next: the real Patch_GenericMesh 0x4293f0 / 756 B and Create_Terrain 0x4296f0 /
771 B require the actual patch/control layout, naturalization, brush and selection
routines. Their custom argument passing must follow real source context. Do not
restore print stubs or force noinline. Pmesh allocation at 0x425770 pins a 0x3838
patch with control data at 0x24, 16x16 entries of stride 0x38; positions are the
first three floats. This supports the real distance-helper reconstruction next.

## Two real Pmesh helpers recovered

Patch_WidthDistanceTo (0x426b80 / 139 B) and Patch_HeightDistanceTo
(0x426c10 / 127 B) now match in the linked image. Pmesh.h defines one shared
0x3838 patch layout with a 0x24 control start and 16x16 controls of stride
0x38. Only the position floats and width/height are decoded; other storage is
explicitly opaque. No temporary caller, ABI annotation, noinline or stub is used.

Three bounded trials are preserved under scratch/density_repair. Direct double
sqrt expressions produced 133/139 and 121/127 B. Reusing the real VectorSubtract,
VectorLength and I_sqrt helpers restored float rounding and reached 97%/96% with
correct lengths. The retail norm adds squared Z, X, then Y in this compiler
context; the corresponding explicit component order with I_sqrt makes both
routines exact. No shared math helper was changed.

research/codex_density/test_patch_distance.py verifies both routines and their
actual _sqrt callee, plus the two emitted 28-byte SDK wrappers against the retail
representative at 0x41f0f0. Equal wrapper code does not establish original TU
ownership or absolute placement. These SDK bodies add no game credit.

The original CRT sqrt object is also pinned: __CIsqrt at 0x4d98c0, _sqrt at
0x4d98d4 (+20), and their shared FSQRT tail. All 186 bytes agree with the original
sqrt.obj after relocation normalization. The inventory divides that section into
20-, 9- and 157-byte spans; its entries and the referee are unchanged. A masked
nine-byte prefix alone would not have established sqrt's identity.

Combined corrected checkpoint: 543 game matches / 62,150 B (8.88%), 15.17%
functions, 48 unverified bodies, one order warning and zero failures. Total
recovery this takeover: eight density routines plus two Pmesh helpers, 10 / 746 B.
Compiler ledger stays 2 / 35 B. Eleven fully audited files remain verified;
these three files remain PARTIAL. The real generators and their mesh/brush/
selection dependencies are still required before either OnOK can be restored.
