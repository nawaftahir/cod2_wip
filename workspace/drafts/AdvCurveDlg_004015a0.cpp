// 0x004015a0 (453 B) CAdvCurveEditDlg apply; called by OnOK and FUN_00401f90.
// Best: 511/453, the only diff is FUN_00401cd0 inlined here (retail calls it). Plain-function variant breaks 0x401cd0.
// owner unknown: each pair holds a size typed in the dialog and that size / 64
extern float DAT_0058fb90, DAT_0058fb94, DAT_0058fbb0, DAT_0058fbb4;

void CAdvCurveEditDlg::FUN_004015a0()
{
    CString text;
    control_05ca.GetWindowText(text);
    float value = (float)atof(text);
    if (value == 0.0f)
    {
        value = 1024.0f;
        GetDlgItem(0x5ca)->SetWindowText("1024");
    }
    DAT_0058fb90 = value;
    DAT_0058fb94 = value / 64.0f;
    control_05cb.GetWindowText(text);
    value = (float)atof(text);
    if (value == 0.0f)
    {
        value = 1024.0f;
        GetDlgItem(0x5cb)->SetWindowText("1024");
    }
    DAT_0058fbb0 = value;
    DAT_0058fbb4 = value / 64.0f;
    control_0594.GetWindowText(text);
    value = (float)atof(text);
    FUN_004010c0(0x590, value);
    control_0595.GetWindowText(text);
    value = (float)atof(text);
    FUN_004010c0(0x591, value);
    control_0596.GetWindowText(text);
    value = (float)atof(text);
    FUN_00401cd0(value);
    g_curveUpdatePending |= 1;
}

/*
 * Diagnostic summary for 0x004015a0 (453 B) — BLOCKED after 3 make try attempts + /Ob1 check:
 * - [PINNED] Retail .text check: 0x004015a0 pointer hits=[], callers only 0x00401770 (OnOK, jmp)
 *   and 0x00401f90 (jmp); 0x00401cd0 (81 B) pointer hits=[], callers only 0x0040171e (in 0x004015a0)
 *   and 0x00402184 (in 0x00402130).
 * - [PINNED] Try 1 (draft verbatim): 75%, 511/453 B, first diff +0x1a (sub $0x10 vs sub $0x8);
 *   disassembly of built 0x403130 confirms every instruction before/after 0x40171e matches retail,
 *   only FUN_00401cd0 got inlined. OnOK (0x401770), 0x401cd0, 0x401f90, 0x402130 match.
 * - [PINNED] Try 2 (calling FUN_00401c90 & FUN_00401cb0): 0x401c90 & 0x401cb0 match 24/24 B and
 *   inline to FUN_004010c0(0x590/0x591), but FUN_00401cd0 still inlines (75%, 511/453 B, +0x1a).
 * - [PINNED] Try 3 (non-extern DAT_0058fb90/b94/fbb0/fbb4 globals): 75%, 511/453 B, +0x1a unchanged.
 * - [PINNED] /Ob1 container test (/O2 /Oy- /Op /GS /GL /GX /GR /Ob1, flags.tsv unchanged): stops
 *   FUN_00401cd0 inlining, but shrinks 0x4015a0 to 440/453 B (56%, diff +0x1b, custom CC) and breaks
 *   0x401b80 (71/66), 0x401bd0 (71/66), 0x401c20 (71/97).
 * - [SUPPORTED] Prior workspace/research/codex_notes.md: __declspec(noinline) on FUN_00401cd0
 *   (banned by CLAUDE.md) keeps 0x401cd0 81/81 B, still fails 0x4015a0 at 55% (450/453 B, custom
 *   esi calling convention) and breaks OnOK (0x401770) & 0x401f90 from 5 B jmp to 10 B; omitting
 *   /GL breaks AdvCurveDlg ctor/dtor (362/366).
 */
