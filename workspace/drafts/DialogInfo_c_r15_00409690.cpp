// Lane c r15: 67% (stack convention, retail passes text in esi). Not built.

extern "C" void FUN_00409690(const char *text)
{
    if (!g_dlgInfo.GetSafeHwnd())
        g_dlgInfo.Create(CDialogInfo::IDD, NULL);
    g_dlgInfo.m_wndInfo.SetWindowText(text);
    g_dlgInfo.ShowWindow(SW_SHOW);
    DAT_01233488->SetFocus();
}
