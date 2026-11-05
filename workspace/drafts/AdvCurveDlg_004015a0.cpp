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
