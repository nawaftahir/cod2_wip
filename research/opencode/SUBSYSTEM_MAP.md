# Initial subsystem map

Derived from function addresses/names only; boundaries are hypotheses until xref
and decompilation review.

| Range | Functions | Bytes | Likely content |
|---|---:|---:|---|
| `0x401000–0x4c0000` | 2,519 | 663,771 | Primary IW/Radiant application/editor code |
| `0x4c0000–0x4d3000` | 425 | 47,784 | Mixed application/MFC boundary |
| `0x4d3000–0x4e9000` | 631 | 76,806 | MFC/ATL + CRT/runtime |
| `0x4e9000–0x4f2000` | 161 | 30,192 | CRT/locale/EH/conversion runtime |
| `0x4f2000–0x500000` | 592 | 44,649 | MFC/import thunks/static framework tail |
| `0x500000–0x528000` | 1,906 | 134,956 | MFC/CRT/unwind metadata and small helpers |

Only one obvious non-`FUN_` app-domain symbol exists below `0x4c0000`
(plus one MFC accessor), confirming that the primary editor body is largely
unnamed and must be recovered by clustering/xrefs/reference structure.

## Q3Radiant-led cluster order

Primary reference: `dev/refrences/Quake-III-Arena/q3radiant`.

1. Entry/app shell: `Win_main.cpp`, `QE3.CPP`, `Radiant.cpp`,
   `MainFrm.cpp`, `ChildFrm.cpp`, `RadiantDoc.cpp`.
2. View windows: `CamWnd`, `XYWnd`, `ZWnd/ZView`, `TexWnd`, `EditWnd`.
3. Map data: `MAP.CPP`, `ENTITY.CPP`, `BRUSH.H`, `SELECT.CPP`, `Undo.cpp`.
4. Geometry operations: `CSG.CPP`, `Winding.cpp`, patch files.
5. Preferences/project/dialogs: `PrefsDlg.cpp`, command/entity dialogs.
6. Texture/material flow: `TextureLoad`, `TextureBar`, `ShaderInfo`.
7. Plugin/message interfaces: `PlugIn*`, `Messaging`, `IEpairs`, `IShaders`.

These clusters guide xref analysis and naming. They never substitute for target
byte evidence or exact compiler-object matches.
