# Renderer audit checkpoint — 2026-09-26

Latest continuation: [NEXT_SESSION.md](NEXT_SESSION.md) records thirteen clean
source candidates, a fresh 79-function recovery-snapshot rebuild, naming fixes,
recovered CRT builds and a binary-backed renderer interface map.
The corrected `.text` denominator supersedes older GLM documentation.
No candidates have been independently promoted yet.

Latest evidence supersedes the initial setup notes below: BATCH_4_REVIEW.md
records a successful DirectX import-library link, linker 7.10.3077, additional
authentic CRT builds, full free-body proof and _output data bindings.
Further continuation: BATCH_7_REVIEW.md records a fresh 43-TU historical JPEG
build and 5,219-byte transform packet with exact constant bindings. These are
third-party library candidates, not canonical release completion.

## Verified setup

- Retail anchor resolves to `cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll`.
  SHA-256 matches `4553b22daff76e1f628d7ba16fda840b8ba415ae5024072b279fe8b820f634f6`.
- Existing GLM scripts point at removed `reverse/` paths. `audit_legacy.py` loads
  the original matcher with paths changed in memory; GLM files remain untouched.
- Container image: `sha256:9147e3086f65d733e1bb939cfa4aad7882f494cd87183739258b72194661a694`.
  Compiler reports MSVC 13.10.3077 for x86. Linker version not yet checked.
- No d3d9.h, d3dx9.h or d3d9.lib found by the container's `/opt` search.
- Existing reference SDK at `refrences/iw3xo-radiant/deps/dxsdk` has headers
  and x86 import libraries. Its `d3dx9core.h` declares D3DX SDK version 43;
  do not assume it reproduces the historical 2005 SDK.
- `dxsdk_probe.cpp` compiled successfully at `/O2` with MSVC 7.1 and the
  reference SDK mounted read-only. This proves d3d9.h compile compatibility,
  NOT import-library linking, D3DX compatibility, runtime operation or byte identity.

## Harness findings (runnable synthetic reproductions)

`python3 codex/renderer/audit_legacy.py`

1. Legacy PE branch masking scans raw bytes and can mistake an E8 inside an
   immediate operand for a call, masking unrelated instruction bytes.
2. Its loop misses a five-byte branch at the end of a function.
3. Its COFF mask is not rebased for nonzero function symbol offsets in a section.
4. Classifier labels CRT-SRC by pathname before testing source existence.
   Current audit found no missing files among the CRT-labelled rows.

`check_shape.py` reuses legacy PE/COFF parsing but decodes branches with Capstone
5.0.7, requires equal lengths and equal relocation sites/types, rejects ambiguous
shared-section boundaries and reports unresolved bindings. It is intentionally
only a diagnostic for single-function code sections. Inventory boundaries,
source semantics, relocation addends and symbol destinations still need review.
It never certifies V2 or a linked binary.

## Fresh source rebuild

Input: `glm/src/tu/missing7.c`, SHA-256
`22f039e14d2fbba6b72b4e055f2559f29a7d749832d37e9723daa8b9f330d548`.
Command inside pinned image:

```sh
cl /nologo /O2 /c 'Z:\inputs\src\tu\missing7.c' '/FoZ:\out\missing7_audit.obj'
```

GLM mounted `/inputs:ro`; this directory mounted `/out`. Docker network disabled.
Object SHA-256 observed:
`c99e811309a6cf9ff86fecb104b5e7d342da22784d23b6ba5a38713c9d415bf5`.
COFF timestamps can change object hashes on later fresh builds.

```sh
python3 codex/renderer/check_shape.py 0x1000aa60 codex/renderer/missing7_audit.obj _FUN_1000aa60
```

Result: `R_GetFarPlaneDist` has equal length and normalized instruction shape,
82 bytes. Eight relocation sites refer to seven global symbols. Those bindings
and semantics are NOT independently certified. No ledger promotion or V2 claim.

## Unverified ledger inventory and next action

Latest-row classification: 97 C, 97 CRT-SRC, 573 MASM, 532 NAKED-ASM, 7 MISSING.
These are source categories, not fresh-build matches or percentage completion.

Next: audit function extents and COFF binding handling; batch fresh-build the
readable-source candidates with recorded per-TU flags and explicit symbols.
Separate multi-function TUs for boundary-aware checking. Rank reviewed engine
families by recoverable bytes and dependencies; do not repeat transplant sweeps.
Do not modify Claude's client work, GLM's manifest, or canonical release source.

## DirectX on Linux

Use Windows SDK headers/import libraries as read-only inputs to MSVC under Wine
inside the pinned Linux Docker container; do not substitute a Linux compiler.
The checked probe needs no installer. For reconstruction, pin the SDK inputs and
verify the historical version from target evidence before promoting SDK-dependent
results. The DirectX runtime needed for a later graphical smoke test is a separate
question from the SDK used for compilation.

Microsoft reference:
https://learn.microsoft.com/en-us/windows/win32/directx-sdk--august-2009-
Modern SDK/package guidance is not proof of the SDK used to build this 2005 DLL.
