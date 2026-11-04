# Four-lookup reconstruction and clean-module checkpoint

New source: DXGetErrorString9W (48,462 instruction bytes),
DXGetErrorDescription9A and DXGetErrorDescription9W (9,617 each).
New unique gain: **67,696 instruction bytes**. Their full COFF sections
contain **27,703 table bytes**, verified and excluded from instruction credit.
These are reconstructed SDK-derived C++ functions, not original Microsoft
source files and not game-authored rendering logic.

The accepted method reuses the preceding compiler/source-shape discovery:
group same-result HRESULT aliases under common case labels, order shared
returns by original SDK return-leaf relocation order, build with the
hash-pinned 13.10.4035 compiler and `/O1 /Oy- /hotpatch /MT`.
All three first candidates matched their complete sections. Full source
proofs check all **10,991 relocation bindings**, original string initializers,
typed complete functions, direct-branch destinations, table destinations,
PE sites/types and negative tests. The original referee returns 100%.

SDK oracle: 6,561 queried inputs recover 5,449 wide names and 656 descriptions
of each character width. This oracle is discovery only; the complete source
section match establishes acceptance. No observed cases alone earn credit.
`oracle_packet.json` pins oracle/SDK/tool/input and mapping hashes.
`generate.py` emits candidates; clean copies are byte-identical to them.

The four accepted files (including the earlier ASCII-name source) are in
`target/src/codex_libraries`. `build.mk` compiles these clean paths directly,
not scratch candidates. `link.mk` incorporates all four as standalone
non-/GL objects into an unchanged private snapshot of Claude's source and
tracks the objects as real dependencies. Fresh engine objects were built;
no `/FORCE`, fake service definitions or target-byte patching was used.

The standard raw placement scan accepts 361 source functions, preserving
all 359 baseline and all 360 previous source matches. It does not resolve
the two description functions: their masked code layouts have two placements.
The full source string initializers uniquely resolve ASCII versus UTF-16;
each wrong-width candidate is explicitly rejected. Scanning the complete
section as instructions also yields a spurious CALL/extent failure in table
data. The proven code extent ends with RET4 at offset 9,617; its following
1,880 table bytes are separately checked, including all destination pointers.

`check_link.py` independently checks complete linked lookup sections against
the source objects/target, including source-local pointers and complete
linked string initializers. It refines only the two description placements
and their proven code extents in a private comparison packet, then reruns
the **unchanged** standard binder. All 363 source matches pass with no prior
losses. `cmp.json` / `bind_raw.json` retain raw results; `cmp_placed.json` /
`bind.json` retain source-proven results. No broad ambiguity or boundary
exception was added to the referee. Independent review before canonical
integration remains required.

Behavior: a separately renamed source fixture tests all four reconstructed
functions against the authentic SDK library over 6,561 boundary/unknown
inputs plus 100,000 deterministic random values. **426,244 comparisons pass**.
The normal objects used for source/link proofs are not the renamed fixture
objects. `fixture_packet.json` hashes every fixture input/output.

Rebuild from `gfx/target`: `sh scratch/codex25_dxerr/build.sh`.
Replay source and regression using `check.py` and `check_link.py` there;
rerun behavior using `run_test.py`. Pinned images and the prior external
compiler cache are required. The wrapper restores ownership of its own
Docker-created private build outputs before host verification; no other
workspace output or canonical source is changed.

The cross-tree aggregate audit remains the progress authority:
`python3 gfx/tools/check_ten_percent.py` from the workspace root.
It passes **307,651 / 1,089,680 = 28.233151%**, exceeding the 25% floor by
35,231 bytes. The prior ASCII-name source is counted only once; all target
instruction ranges remain address-disjoint.
No original Microsoft source, compiler binaries, SDK library or game binary
is committed. No whole-DLL SHA identity or runtime-release claim is made.
