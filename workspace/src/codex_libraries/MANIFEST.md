# Verified reconstructed library source

`dxerr9_name.cpp` reconstructs the complete SDK-derived
`DXGetErrorString9A(HRESULT)` lookup as readable C++.
It is not a claim to have recovered Microsoft's historical source file.
HRESULT values and returned names come from the supplied authentic SDK
lookup; alias grouping and source order are confirmed by the target bytes.
This folder does not contain copied Microsoft CRT or compiler sources.

- Source SHA-256: `5d6e13837b2dc528a26aa06ac6c7723f0b778805f1a8353398e1bee895257dcf`.
- Target entry: `0x100cc81b`, `_DXGetErrorString9A@4` (stdcall).
- Build: MSVC `13.10.4035`, `/O1 /Oy- /hotpatch /MT`, Windows SDK headers.
- Complete matched section: 72,524 bytes; code: **48,427**; tables: 24,097
  verified but excluded from instruction coverage.
- Proof: `../../scratch/codex19_dxerr/check.py` + `packet.json`.
  Every relocation site/type and all 8,899 bindings are checked; mutations
  and incorrect targets fail. The original masked referee reports 100%.
- Private closed-link regression: `check_link.py` / `link_packet.json`;
  all 359 prior source matches retained, this lookup added, no `/FORCE`.
- Behavior: 106,560 comparisons against the authentic SDK library pass.
- Build/replay from `gfx/target`: `sh scratch/codex19_dxerr/build.sh`.

This exact source copy is separated from scratch, not added to the canonical
TU list. A standalone non-LTCG object is required with this compiler/flags;
do not compile it with the renderer's `/GL` flags and presume equivalence.
The source-only test DLL is not the retail checksum-identical renderer.
Promotion into `cod2engine/` remains owner-controlled.
