// 0x00442d60 CTexWnd::UpdateFilter (242 B) and 0x0043ef60 CTexEdit::OnChange (132 B)
// Both 100% in make try (LTCG register form: this=edi, filter=esi, OnChange is the only caller).
// Emitting them flips Com_Filter 0x48afb0 (32%, 582/587 B, first diff +0xf) and GraphGetValueFromFraction
// 0x4832c0 (76%, 828/832 B, first diff +0x5): LTCG ties, so parked here. Needs the extra declarations of
// workspace/src/radiant/TexWnd.h plus the texWndGlobals fields of TexWnd.cpp (filterEnabled, filter,
// textureOffset) and these externs: g_nTimerHandle (int), g_nLastLen (int), g_cLastChar (char),
// g_nUpdateBits (int), CTexWndMainProjection::m_nCurrentStyle.

// 0x00442d60 (242 B)
void CTexWnd::UpdateFilter(const char *pFilter)
{
    if (g_nTimerHandle > 0)
        KillTimer(1);
    texWndGlobals.filterEnabled = false;
    if (pFilter)
    {
        texWndGlobals.filter = pFilter;
        if (texWndGlobals.filter.GetLength() > 0)
        {
            texWndGlobals.filterEnabled = true;
            int style = reinterpret_cast<const CTexWndMainProjection *>(g_pParentWnd)->m_nCurrentStyle;
            if (style == 1 || style == 2)
            {
                if (texWndGlobals.filter.GetLength() > g_nLastLen)
                {
                    g_cLastChar = toupper(texWndGlobals.filter.GetAt(texWndGlobals.filter.GetLength() - 1));
                    if (g_cLastChar == 'N' || g_cLastChar == 'O')
                        g_nTimerHandle = SetTimer(1, 800, NULL);
                }
            }
        }
        g_nLastLen = texWndGlobals.filter.GetLength();
        SortTextures();
    }
    g_nUpdateBits |= 0x10;
}


// TexEdit.cpp:
// void CTexEdit::OnChange()
// {
//     CString str;
//     GetWindowText(str);
//     if (m_pTexWnd)
//         m_pTexWnd->UpdateFilter(str);
// }
