// Lane a r8 draft for XYWnd.cpp: button-up cluster + drop menu (NOT built).
// FUN_0044be20 and HandleDrop match 100% (verify.py) but adding them flips GraphGetValueFromFraction
// 0x4832c0 to 79%. The handlers need the extra declarations/message-map lines noted below.
// Class additions: void OriginalButtonUp(UINT, CPoint); void FUN_0044be20(); void HandleDrop();
//   afx_msg void OnLButtonUp/OnMButtonUp/OnRButtonUp(UINT nFlags, CPoint point);
//   message map after ON_WM_CREATE: ON_WM_LBUTTONUP() ON_WM_MBUTTONUP() ON_WM_RBUTTONUP()
// Globals: extern CPrefsDlg *dword_01233b64; struct eclass_t { eclass_t *next; char *name; };
//   extern eclass_t *dword_012334dc;  #include "PrefsDlg.h" and "../universal/assertive.h".
// Retail order: handlers + OriginalButtonUp (0x44a0d0..0x44a2a0) go before fDiff; the two drop
// bodies go after FUN_0044bc50 and before XY_Init.

// ---- before fDiff ----
void CXYWnd::OnLButtonUp(UINT nFlags, CPoint point)
{
    if (ClipMode())
    {
        if (g_pMovingClip)
        {
            ReleaseCapture();
            g_pMovingClip = NULL;
        }
    }
    OriginalButtonUp(nFlags, point);
}

void CXYWnd::OnMButtonUp(UINT nFlags, CPoint point)
{
    OriginalButtonUp(nFlags, point);
}

void CXYWnd::OnRButtonUp(UINT nFlags, CPoint point)
{
    m_bRButtonDown = false;
    if (point == m_ptDown)
    {
        bool bGo = true;
        if (GetKeyState(VK_MENU) & 0x8000)
            bGo = false;
        if (GetKeyState(VK_CONTROL) & 0x8000)
            bGo = false;
        if (GetKeyState(VK_SHIFT) & 0x8000)
            bGo = false;
        if (bGo)
            HandleDrop();
    }
    OriginalButtonUp(nFlags, point);
}

void CXYWnd::OriginalButtonUp(UINT nFlags, CPoint point)
{
    CRect rctZ;
    GetClientRect(rctZ);
    XY_MouseUp(point.x, rctZ.Height() - 1 - point.y, nFlags);
    if (!(nFlags & (MK_LBUTTON | MK_RBUTTON | MK_MBUTTON)))
        ReleaseCapture();
}

// ---- after FUN_0044bc50, before XY_Init ----
void CXYWnd::FUN_0044be20()
{
    CString strActive;
    CString strName;
    if (m_mnuDrop.GetSafeHmenu())
        return;
    {
        m_mnuDrop.CreatePopupMenu();
        int nID = 0x5910;

        HMENU hSelect = ::CreateMenu();
        ::AppendMenu(hSelect, MF_STRING, 0x80d8, "Select Complete Tall");
        ::AppendMenu(hSelect, MF_STRING, 0x80d7, "Select Partial Tall");
        ::AppendMenu(hSelect, MF_STRING, 0x80da, "Select Touching");
        ::AppendMenu(hSelect, MF_STRING, 0x80f0, "Select Inside");
        ::AppendMenu(hSelect, MF_STRING, 0x816c, "Select Targetname");
        m_mnuDrop.AppendMenu(MF_POPUP, (UINT)hSelect, "Select");

        HMENU hPrefab = ::CreateMenu();
        ::AppendMenu(hPrefab, MF_STRING, 0x8195, "Enter Prefab");
        ::AppendMenu(hPrefab, MF_STRING, 0x8196, "Leave Prefab");
        m_mnuDrop.AppendMenu(MF_POPUP, (UINT)hPrefab, "Prefab");
        m_mnuDrop.AppendMenu(MF_SEPARATOR, nID++, "");

        m_mnuDrop.AppendMenu(MF_STRING, 0x810b, "Ungroup Entity");
        m_mnuDrop.AppendMenu(MF_STRING, 0x8113, "Make Structural");
        m_mnuDrop.AppendMenu(MF_STRING, 0x8112, "Make Detail");
        m_mnuDrop.AppendMenu(MF_STRING, 196, "Make Weapon Clip");
        m_mnuDrop.AppendMenu(MF_STRING, 197, "Make Non-Colliding");
        m_mnuDrop.AppendMenu(MF_SEPARATOR, nID++, "");

        m_mnuDrop.AppendMenu(MF_STRING, 0x81c7, "Make Split Coplanar Geo");
        m_mnuDrop.AppendMenu(MF_STRING, 0x81c8, "Make Don't Split Coplanar Geo");
        m_mnuDrop.AppendMenu(MF_SEPARATOR, nID++, "");

        HMENU menu = NULL;
        for (eclass_t *e = dword_012334dc; e; e = e->next)
        {
            strName = e->name;
            int n_ = strName.Find("_");
            if (n_ > 0)
            {
                CString strLeft = strName.Left(n_);
                CString strRight = strName.Right(strName.GetLength() - n_ - 1);
                if (strLeft == strActive)
                {
#line 1264
                    assert(menu);
                    FUN_0044bc50(strName, nID);
                    ::AppendMenu(menu, MF_STRING, nID++, strRight);
                }
                else
                {
                    if (menu)
                        m_mnuDrop.AppendMenu(MF_POPUP, (UINT)menu, strActive);
                    strActive = strLeft;
                    FUN_0044bc50(strName, nID);
                    menu = ::CreateMenu();
                    ::AppendMenu(menu, MF_STRING, nID++, strRight);
                }
            }
            else
            {
                if (menu)
                {
                    m_mnuDrop.AppendMenu(MF_POPUP, (UINT)menu, strActive);
                    menu = NULL;
                }
                strActive = "";
                m_mnuDrop.AppendMenu(MF_STRING, nID++, strName);
            }
        }
    }
}

void CXYWnd::HandleDrop()
{
    if (dword_01233b64->m_bRightClick)
    {
        if (!m_mnuDrop.GetSafeHmenu())
            FUN_0044be20();
        CPoint ptMouse;
        GetCursorPos(&ptMouse);
        m_mnuDrop.TrackPopupMenu(TPM_RIGHTBUTTON, ptMouse.x, ptMouse.y, this);
    }
}

