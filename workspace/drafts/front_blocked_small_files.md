# Front Task 2 Blocked Small Files

Audit of the remaining small Task 2 files on `radiant/front` (all remain in `workspace/src/`, not promoted to `src/`):

## 1. `workspace/src/radiant/UNKNOWN_00408f20.cpp` (`0x00408f50`, 121 B)
- **Status:** Blocked on unimplemented LTCG caller & callees (`[PINNED]`).
- **Drift check:** `-20176` / `-20304` (`-128` byte gap for missing `0x00408f50`).
- **Disassembly findings (`[PINNED]`):**
  - `0x00408f50` uses LTCG custom register arguments (`esi = basepath`, `edi = basegame`, `[ebp+8] = game`) supplied by unimplemented caller `0x0046d3d0` (`qe3.cpp`, call site `0x0046d5a4`..`0x0046d5e0`).
  - Calls LTCG callees `0x0048f7c0` (`Dvar_RegisterBool` in `dvar.cpp`, `eax = "sv_cheats"`, `ebx = 0x1018` — not yet matched in `dvar.cpp`), `0x004910d0` (`Dvar_SetStringByName`), and `0x004820a0` (`FS_InitFilesystem`).

## 2. `workspace/src/radiant/TexEdit.cpp` (`0x0043ef60`, 132 B `CTexEdit::OnChange`)
- **Status:** Blocked on out-of-scope callee (`[PINNED]`).
- **Drift check:** `-218832` / `-218976`.
- **Findings (`[PINNED]`):** Calls out-of-scope `0x00442d60` (`CTexWnd::UpdateFilter` in `TexWnd.cpp`, LTCG `edi = m_pTexWnd`, `esi = text`). Partial draft already exists at `workspace/research/web/drafts/TexEdit.cpp`.

## 3. `workspace/src/common/texturevecs.cpp` (`0x0043fbc0`, 1540 B)
- **Status:** Blocked on unimplemented out-of-scope callee (`[PINNED]`).
- **Drift check:** `-219776` / `-219792`.
- **Findings (`[PINNED]`):** Retail disassembly (`0x43fbc0..0x4401d0` and `0x489940`) confirms 6 calls to unimplemented `0x00489940` (`Snap` / `granularity > 0` in out-of-scope `src/universal/com_math.cpp`), currently only declared in `texturevecs.cpp`. Prior attempts in `workspace/research/codex_texturevecs/README.md` (`v2..v8`) reached `1536/1540` (`+5` diff).
