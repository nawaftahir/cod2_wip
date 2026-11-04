# GLM Track — `gfx_d3d_mp_x86_s.dll` 1.0 Renderer Reconstruction

Byte-accurate source reconstruction of the Call of Duty 2 multiplayer renderer
DLL. Track owner: GLM agent. Sibling tracks: `dev/gemini` (CoD2MP_s.exe 1.0),
`dev/reverse` (Linux server anchor).

## Why this track exists

The engine EXE does **not** require the renderer reversed to run — it loads the
DLL at runtime via `LoadLibraryA("gfx_d3d_mp_x86_s.dll")` + `GetRefAPI` and
communicates only through refexport/refimport function tables. The renderer is
reconstructed because it is IW-authored engine code (Phase D scope), and because
a fully source-recovered client needs it.

## Anchor

| | |
|---|---|
| Target | `gfx_d3d_mp_x86_s.dll` (CoD2 1.0, multiplayer) |
| Size | 1,851,392 bytes (Oct 7 2005) |
| Compiler | MSVC 7.1 (13.10.3077) — verify via Rich header in G0 |
| Location | `../reverse/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll` |

## Layout

| Dir | What |
|-----|------|
| `plans/` | Track plan, method notes |
| `src/`, `include/` | Reconstructed renderer source |
| `data/` | Carved data sections / blobs |
| `checksums/` | Anchor registry (registry.yml), per-checkpoint hashes |
| `tools/` | `match_gfx.py` matcher, PE carving, Ghidra export glue |
| `ghidra/` | Ghidra project `gfx10` + scripts |
| `docker/` | `cod2-glm-msvc71` build image (MSVC 7.1 via Wine) |
| `progress/` | Dated progress reports |
| `memory/` | Engine facts, reference bridges, session notes |

## References

- `Refrences/opencod2/src/PC/gfx_d3d/` — ~62-file structural map (NOT byte-parity)
- `Refrences/opencod2/src/PC/client_mp/gfx_dll_v60*.h/.c` — v60 (1.0) API surface tables
- `Refrences/opencod2/src/PC/win32/gfx_dll_v60.c` — how the engine consumes the retail 1.0 DLL
- `Refrences/opencod2/src/Mac/DirectX_9/` — D3D9-on-OpenGL semantics (Mac port)

## Method

Same as the server track: Ghidra decompile → name bootstrap → reconstruct C →
compile per-TU with the historical compiler (MSVC 7.1) → relocation-normalized
per-function diff → full-binary parity. Details in `plans/`.
