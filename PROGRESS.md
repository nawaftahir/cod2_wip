# Renderer progress

## Whole-file shader SDK integration - 2026-10-22

Work only in gfx. Source: `target/work/src/`. Plan: [WHOLEFILE.md](WHOLEFILE.md).
This is the sole current progress/continuation log. Update it instead of creating
new handoffs. Machine proof receipts and technical reference notes stay separate.

### Verified state

- Previous source checkpoint: `e433c14`; workspace consolidation: `084b513`.
  Current authored C/C++: **100419/253580 bytes (39.601%)**
  against the SUPPORTED game inventory, not the entire DLL.
- Mixed C/C++ and authored assembly:616 game bodies,108206 bytes.
  Assembly is excluded from the C/C++ meter. This wave adds **zero game C/C++ bytes**.
- Original SDK reuse adds **433 verified library extents /67471 bytes**.
  All824 previous protected extents survive; the ratchet now protects **1257**.
  Unique verified engine+library extents cover356338/1089680 retail .text bytes
  (**32.701%**, relocation-normalized; NOT whole-file identity or authored C++).
- All **66** fixtures passed after a forced same-output rebuild; warm/fresh
  binding JSONs are identical. Three removal negatives reject loss of either
  CRT exception-table caller or a new SDK body. No new assembly definitions
  or relaxed binding ownership.
- Current receipt: `target/work/proof/sdk_checkpoint.json`. Current referees:
  `target/work/proof/latest/`. Layout: `target/work/layout/current.json`.
- **Whole-file retail SHA does not match. No release or runtime proof.**

### Actual whole-file work completed

- Material_SetPassShaderArguments is compiled from the real source tree, no
  longer appended from a test-only fixture. Its real D3DX shader-table call
  pulls original Summer2004 SDK objects, growing candidate .text from437792
  to875554 bytes. This is library reuse, not newly authored game source.
- The217-byte wrapper still differs in register allocation. Its SDK entry
  also fails binding closure through operator new. Neither is counted as a
  match; the433 accepted library extents are independently verified bodies.
- Corrected a literal-bounds bug exposed by the new library layout. The old
  checker attributed unnamed data after a5-byte fabs string to the string.
  Bounds now reject that. Two real12-byte CRT exception tables get their exact
  extents/owners from linked PDB contributions, independently confirmed against
  original VC7.1 COFF records. Their internal code labels must keep exact
  instruction offsets inside one matched owner, with a verification dependency.
  Full data/pointer checks and one-to-one ownership remain; no old gate removed.
- Warm candidate raw same-file-offset equality rises from2.044% to7.863%.
  This diagnostic includes headers/data/debug and is NOT source completion.

Previous cubemap/gamma source checkpoint:

- New accepted source: BGRA vertical flip100266f0/97 and hardware gamma
  upload100307e0/91. The uploader copies the real512-byte GfxGammaRamp into
  three SDK gamma channels and routes it to the actual target swap chain.
- Added complete source for cubemap begin/end/save, readback, flipping,
  software gamma, TGA output and Fresnel-alpha routing. These close real API
  dependencies, but **only the two bodies above receive new coverage credit**.
  Tests cover90 begin cases,576 capture routes,144 saves (including257-pixel
  headers),48 hardware ramps and35 software-gamma buffers. Readback failure
  still flips; write failure still frees both buffers; original dangling saved
  pointers are preserved, not silently fixed.
- Remaining blockers: begin -> render-target setup -> viewport366; end ->
  gamma-table producer157; save -> copy89's one SIB encoding difference and
  alpha262-vs266 -> FresnelTerm. Several callers already have equal bytes but
  fail dependency binding. No masked-only or native-test result is credited.
- The producer's real second caller and GfxGammaRamp type fix its argument
  convention and two caller bodies. Its loop-tail scheduling remains different;
  stop syntax sweeps and use original TU/function-set evidence next.
- Gamma/alpha drafts reuse the existing I_fround assembly helper. They are
  unaccepted; accepted exclusions remain31 bodies/7787 bytes. If either later
  matches, its assembly expansion needs explicit exclusion review. The stricter
  build gate will reject unreviewed accounting instead of inflating C/C++ credit.

Previously accepted and still protected:

- Restored the real BeginDebugFrame callback, API59 slot49:73 bytes accepted.
  It saves the original frame pointers, unlocks the original vertex cache when
  needed and switches to the embedded debug frame. Eight routing tests pass.
- Restored typed debug-frame storage and pinned its used offsets at compile
  time. Candidate .data virtual size grows from1248244 to3648180 bytes, versus
  retail6086100. This is genuine state, not padding; full original global size
  and final placement are NOT independently proved by the callback match.
- Restored shared view setup10025570:286 bytes accepted. This is needed by
  LOD-origin and scene submission.192 view/LOD behavior cases pass. The LOD
  callback itself remains unaccepted: a floating constant operand width differs.
- Restored four primary-proven empty API callbacks and the sun-reset wrapper
  for eventual GetRefAPI closure. These receive **zero new credited bytes**;
  they are not invented substitutes for missing implementations.
- Current candidate has158 temporary exports and still no GetRefAPI.54 of98
  written API slots now have accepted implementations. The real front door is
  **not implemented yet**; completing its actual callback graph remains first.
- Current .text virtual size437792 versus retail1089680. Raw same-file-offset
  equality is2.044084%; this is a layout diagnostic, NOT source completion.
- Retail debug metadata pins an age1 PDB at the original c:\\builds path. Our
  reused PDB has a different GUID and increasing age. These remain real SHA
  blockers, not hash fields to silently ignore or patch.

### Cleanup

One active source tree and one incremental build; no duplicate build created.
Superseded handoffs, duplicate status files, notes, claims and rules are saved
in `archive/docs_20261021/`, not erased. Old goals and paths are not instructions.
Required gate inputs are local in `target/work/proof/history/`; API evidence
and inventory are local in `target/work/proof/retail/`. Inactive entrypoints are
in `archive/legacy_entrypoints/`. Shared target/src headers remain required.
Unrelated staged work is preserved, not bundled into this cleanup. No push.

### Next work

1. Recover API59 GetRefAPI and the typed callback/caller graph. Retail has 108
   slots: 98 written callbacks, ten initial zeros.54 written slots have accepted
   implementations; unverified does not mean source absent. Use primary code
   and `target/work/layout/api_callbacks.tsv`; never guess signatures or stub bodies.
2. Complete shader creation at1001a4c0/705 using the primary binary, not the
   references' combined parse/cache/platform loader. Actual PC defines are
   {"PC","",0,0}. Its real D3DXCompileShader call should establish further SDK
   reachability. Include Open already exists; Close is the genuine zero-return
   callback10018310. Preserve original failure cleanup. Resolve the table
   wrapper's register choices and SDK operator-new closure without syntax sweeps.
3. Replace temporary roots with genuine reachability as connected groups close,
   retaining all accepted extents. Candidate has158 exports and no GetRefAPI;
   retail exports only GetRefAPI. Recover TU/data/library ownership alongside code.
4. Complete missing real source and original dependency calls. Reuse exact
   VC7.1/Summer2004 libraries and correct upstream source, not library reversal
   for a counter. Resolve exact layout and metadata, then cold rebuild and smoke.

Same-object relinking already reproduced raw .text/.data/.reloc but changed
timestamp/debug/.rdata/whole-file SHA. This is a real reproducibility blocker;
no output patching or normalized hash may substitute for retail identity.

### Resume

From gfx: `sh target/work/tools/build.sh`. Use `--rebuild` only when warranted.
Full fixtures: `python3 target/work/tests/run.py` (fails immediately on a failed
child). A stale broad extraction in the viewport fixture included the new gamma
function; it now extracts only its intended setter. All assertions remain.
One output: `target/build/codex_boundsoutside_1016_02`; `target/work/build` is
a symlink, not a duplicate. No own builds remain running. Before retrying source
forms, read `target/work/ATTEMPTS.md` and archived NOTES.md. Do not repeat the
three recorded LOD syntax trials; investigate genuine compiler/caller context.
The shared view helper and debug callback now MUST survive every wave. r_bsp upload/init
and light-history drafts remain unaccepted: preserve them without counting them.
Do connected source work next, not another parser/report framework.

Anchor SHA256:
`4553b22daff76e1f628d7ba16fda840b8ba415ae5024072b279fe8b820f634f6`.
Warm SDK candidate SHA256:
`91048bae1fef422f35b10a82f667081617ec0b69fd6a51a1398b086071d8363c`.
Relinking can change debug/timestamp bytes; current actual SHA is in
layout/current.json and the immutable SDK receipt records both builds.

### Limits

Forced compilation passed in the one existing output; no independent fresh
checkout replay or client/GPU smoke test. Do not run receipt-dependent fixtures
against a simultaneously rebuilding DLL: the source-coverage freshness check
correctly rejected that intermediate state; the post-build full rerun passed.
Historical layout receipts are frozen
in proof rather than pointing at the mutable layout/current.json.
No reliable whole-project completion percentage or release date is established.
Renderer checks no longer need dev/codex, **but client/deepseek tools still use
codex/client/salvage_gemini/data/names_1.0.json**. Deleting that folder can break
those tracks; they were not modified here. No retail binaries/assets committed.
