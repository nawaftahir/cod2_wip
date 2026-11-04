#include "stdafx.h"

class CDialogInfo : public CDialog
{
public:
    enum { IDD = 0x96 };
    CDialogInfo(CWnd *pParent = NULL);
    CEdit m_wndInfo;

protected:
    virtual void DoDataExchange(CDataExchange *pDX);
    virtual BOOL OnInitDialog();
    DECLARE_MESSAGE_MAP()
};

CDialogInfo g_dlgInfo;

class CMainFrame : public CWnd { public: void UpdatePatchToolbarButtons(); };
CMainFrame *g_pParentWnd; // Trial storage; source identity/layout still unproven.

void ShowInfoDialog(const char *pText)
{
    if (!g_dlgInfo.GetSafeHwnd())
        g_dlgInfo.Create(CDialogInfo::IDD);
    g_dlgInfo.m_wndInfo.SetWindowText(pText);
    g_dlgInfo.ShowWindow(SW_SHOW);
    g_pParentWnd->SetFocus();
}

void HideInfoDialog()
{
    if (g_dlgInfo.GetSafeHwnd())
        g_dlgInfo.ShowWindow(SW_HIDE);
}

CDialogInfo::CDialogInfo(CWnd *pParent)
    : CDialog(CDialogInfo::IDD, pParent)
{
}

void CDialogInfo::DoDataExchange(CDataExchange *pDX)
{
    DDX_Control(pDX, 0x470, m_wndInfo);
}

BEGIN_MESSAGE_MAP(CDialogInfo, CDialog)
END_MESSAGE_MAP()

BOOL CDialogInfo::OnInitDialog()
{
    CDialog::OnInitDialog();
    return TRUE;
}
