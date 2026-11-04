/* CModelDlg retail reconstruction. */
#include "stdafx.h"

static CStringArray g_ModelOptions;
static CStringArray g_ModelSelected;

class CModelDlg : public CDialog
{
    DECLARE_DYNAMIC(CModelDlg)

public:
    enum { IDD = 229 };

    CModelDlg(CWnd *pParent = NULL);
    virtual ~CModelDlg();

protected:
    virtual void DoDataExchange(CDataExchange *pDX);
    afx_msg void FUN_00423960();
    afx_msg void FUN_004239c0();
    afx_msg void FUN_00423a80();
    afx_msg void FUN_00423ae0();
    afx_msg void FUN_00423d20();
    afx_msg void FUN_00423eb0();
    DECLARE_MESSAGE_MAP()
};

IMPLEMENT_DYNAMIC(CModelDlg, CDialog)

CModelDlg::CModelDlg(CWnd *pParent) : CDialog(IDD, pParent)
{
}

CModelDlg::~CModelDlg()
{
}

void CModelDlg::DoDataExchange(CDataExchange *pDX)
{
    (void)pDX;
}

void CModelDlg::FUN_00423960()
{
    CWnd *list = GetDlgItem(1566);
    if (::SendMessageA(list->m_hWnd, LB_GETCURSEL, 0, 0) != LB_ERR)
    {
        LRESULT index = ::SendMessageA(list->m_hWnd, LB_GETCURSEL, 0, 0);
        ::SendMessageA(list->m_hWnd, LB_DELETESTRING, (WPARAM)index, 0);
        ::SendMessageA(list->m_hWnd, LB_SETCURSEL, (WPARAM)-1, 0);
    }
}

void CModelDlg::FUN_004239c0()
{
    CWnd *from = GetDlgItem(1566);
    CWnd *to = GetDlgItem(1564);
    char text[256];

    if (::SendMessageA(from->m_hWnd, LB_GETCURSEL, 0, 0) != LB_ERR)
    {
        LRESULT selection = ::SendMessageA(from->m_hWnd, LB_GETCURSEL, 0, 0);
        ::SendMessageA(from->m_hWnd, LB_GETTEXT, (WPARAM)selection,
                       (LPARAM)text);
        if (::SendMessageA(to->m_hWnd, LB_FINDSTRINGEXACT, (WPARAM)-1,
                           (LPARAM)text) == LB_ERR)
        {
            LRESULT index = ::SendMessageA(to->m_hWnd, LB_ADDSTRING, 0,
                                           (LPARAM)text);
            if (index >= 0)
                ::SendMessageA(to->m_hWnd, LB_SETCURSEL, (WPARAM)index, 0);
        }
    }
}

void CModelDlg::FUN_00423a80()
{
    CWnd *list = GetDlgItem(1564);
    if (::SendMessageA(list->m_hWnd, LB_GETCURSEL, 0, 0) != LB_ERR)
    {
        LRESULT index = ::SendMessageA(list->m_hWnd, LB_GETCURSEL, 0, 0);
        ::SendMessageA(list->m_hWnd, LB_DELETESTRING, (WPARAM)index, 0);
        ::SendMessageA(list->m_hWnd, LB_SETCURSEL, (WPARAM)-1, 0);
    }
}

void CModelDlg::FUN_00423ae0()
{
    CWnd *to = GetDlgItem(1566);
    CWnd *from = GetDlgItem(1564);
    char text[256];

    if (::SendMessageA(from->m_hWnd, LB_GETCURSEL, 0, 0) != LB_ERR)
    {
        LRESULT selection = ::SendMessageA(from->m_hWnd, LB_GETCURSEL, 0, 0);
        ::SendMessageA(from->m_hWnd, LB_GETTEXT, (WPARAM)selection,
                       (LPARAM)text);
        if (::SendMessageA(to->m_hWnd, LB_FINDSTRINGEXACT, (WPARAM)-1,
                           (LPARAM)text) == LB_ERR)
        {
            LRESULT index = ::SendMessageA(to->m_hWnd, LB_ADDSTRING, 0,
                                           (LPARAM)text);
            if (index >= 0)
                ::SendMessageA(to->m_hWnd, LB_SETCURSEL, (WPARAM)index, 0);
        }
    }
}

void CModelDlg::FUN_00423d20()
{
    CListBox *options = (CListBox *)GetDlgItem(1566);
    CListBox *selected = (CListBox *)GetDlgItem(1564);

    g_ModelOptions.SetSize(0);
    for (int i = 0; i < options->GetCount(); ++i)
    {
        CString item;
        options->GetText(i, item);
        g_ModelOptions.SetAtGrow(g_ModelOptions.GetSize(), item);
    }

    g_ModelSelected.SetSize(0);
    for (int i = 0; i < selected->GetCount(); ++i)
    {
        CString item;
        selected->GetText(i, item);
        g_ModelSelected.SetAtGrow(g_ModelSelected.GetSize(), item);
    }
}

void CModelDlg::FUN_00423eb0()
{
    FUN_00423d20();
    Default();
}

BEGIN_MESSAGE_MAP(CModelDlg, CDialog)
    ON_BN_CLICKED(1578, FUN_00423960)
    ON_BN_CLICKED(1581, FUN_004239c0)
    ON_BN_CLICKED(1576, FUN_00423a80)
    ON_BN_CLICKED(1580, FUN_00423ae0)
END_MESSAGE_MAP()
