/* CModelDlg retail reconstruction. */
#include "stdafx.h"
#include <string.h>
#include <stdlib.h>
#include "../universal/assertive.h"

static CStringArray g_ModelOptions;
static CStringArray g_ModelSelected;

struct epair_t;

struct eclass_t
{
    unsigned char pad00[4];
    char *name;
};

struct entity_t
{
    unsigned char pad00[0x50];
    eclass_t *eclass;
    unsigned char pad54[0x10];
    epair_t *epairs;
};

struct entityInst_t
{
    unsigned char pad00[8];
    entity_t *def;
};

struct brushdef_t
{
    unsigned char pad00[8];
    entity_t *owner;
};

struct brush_t
{
    brush_t *prev;
    brush_t *next;
    entityInst_t *owner;
    unsigned char pad0c[8];
    brushdef_t *def;
};

extern brush_t active_brushes;
extern entityInst_t *DAT_012334ec;
extern entity_t *DAT_010bcd34;
extern int g_nUpdateBits;
char *ValueForKey(epair_t *&e, const char *key);
void ConvertDOSToUnixName(char *dst, const char *src);
bool FUN_0044f5d0(brush_t *b);
bool FUN_00465e10(entity_t *e, const char *key, const char *value);
void FUN_00465bf0(entity_t *e, const char *key, const char *value);

class CModelDlg : public CDialog
{
    DECLARE_DYNAMIC(CModelDlg)

public:
    enum { IDD = 229 };

    CModelDlg(CWnd *pParent = NULL);
    virtual ~CModelDlg();

protected:
    virtual void DoDataExchange(CDataExchange *pDX);
    afx_msg void OnShowWindow(BOOL visible, UINT status);
    afx_msg void FUN_00423080();
    afx_msg void FUN_004234f0();
    afx_msg void FUN_00423960();
    afx_msg void FUN_004239c0();
    afx_msg void FUN_00423a80();
    afx_msg void FUN_00423ae0();
    afx_msg void FUN_00423ba0();
    afx_msg void FUN_00423d20();
    afx_msg void OnClose();
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

void CModelDlg::OnShowWindow(BOOL visible, UINT status)
{
    Default();
    if (visible == TRUE)
    {
        CWnd *from = GetDlgItem(1566);
        CWnd *to = GetDlgItem(1564);

        while (::SendMessageA(from->m_hWnd, LB_DELETESTRING, 0, 0) > 0)
        {
        }
        while (::SendMessageA(to->m_hWnd, LB_DELETESTRING, 0, 0) > 0)
        {
        }

        for (int i = 0; i < g_ModelOptions.GetSize(); ++i)
        {
            ::SendMessageA(from->m_hWnd, LB_ADDSTRING, 0, (LPARAM)(LPCSTR)g_ModelOptions[i]);
        }
        for (int i = 0; i < g_ModelSelected.GetSize(); ++i)
        {
            ::SendMessageA(to->m_hWnd, LB_ADDSTRING, 0, (LPARAM)(LPCSTR)g_ModelSelected[i]);
        }
    }
    else
    {
        FUN_00423d20();
    }
}

void CModelDlg::FUN_00423080()
{
    CString base = ValueForKey(DAT_010bcd34->epairs, "basepath");
    if (base.GetLength() > 0 && base.GetAt(base.GetLength() - 1) != '\\')
        base += '\\';
    CString dir(base);
    dir += "main\\xmodel\\";

    CFileDialog dlg(TRUE, NULL, NULL, OFN_OVERWRITEPROMPT, "Model files (*)|*||", this);
    dlg.m_ofn.lpstrInitialDir = dir;
    if (dlg.DoModal() == IDOK)
    {
        CString path(dlg.GetPathName().GetBuffer(0));
        path.MakeLower();
        base.MakeLower();
        ConvertDOSToUnixName(path.GetBuffer(0), path.GetBuffer(0));
        ConvertDOSToUnixName(base.GetBuffer(0), base.GetBuffer(0));
        if (path.Find(base) == 0)
        {
            path = path.Right(path.GetLength() - base.GetLength());
            int n = path.Find("/");
            if (n != 0)
                path = path.Right(path.GetLength() - n - 1);
        }
        CWnd *list = GetDlgItem(1566);
        if (::SendMessageA(list->m_hWnd, LB_FINDSTRINGEXACT, (WPARAM)-1, (LPARAM)(LPCSTR)path) == LB_ERR)
        {
            LRESULT index = ::SendMessageA(list->m_hWnd, LB_ADDSTRING, 0, (LPARAM)(LPCSTR)path);
            if (index >= 0)
                ::SendMessageA(list->m_hWnd, LB_SETCURSEL, (WPARAM)index, 0);
        }
    }
}

void CModelDlg::FUN_004234f0()
{
    CString base = ValueForKey(DAT_010bcd34->epairs, "basepath");
    if (base.GetLength() > 0 && base.GetAt(base.GetLength() - 1) != '\\')
        base += '\\';
    CString dir(base);
    dir += "main\\xmodel\\";

    CFileDialog dlg(TRUE, NULL, NULL, OFN_OVERWRITEPROMPT, "Model files (*)|*||", this);
    dlg.m_ofn.lpstrInitialDir = dir;
    if (dlg.DoModal() == IDOK)
    {
        CString path(dlg.GetPathName().GetBuffer(0));
        path.MakeLower();
        base.MakeLower();
        ConvertDOSToUnixName(path.GetBuffer(0), path.GetBuffer(0));
        ConvertDOSToUnixName(base.GetBuffer(0), base.GetBuffer(0));
        if (path.Find(base) == 0)
        {
            path = path.Right(path.GetLength() - base.GetLength());
            int n = path.Find("/");
            if (n != 0)
                path = path.Right(path.GetLength() - n - 1);
        }
        CWnd *list = GetDlgItem(1564);
        if (::SendMessageA(list->m_hWnd, LB_FINDSTRINGEXACT, (WPARAM)-1, (LPARAM)(LPCSTR)path) == LB_ERR)
        {
            LRESULT index = ::SendMessageA(list->m_hWnd, LB_ADDSTRING, 0, (LPARAM)(LPCSTR)path);
            if (index >= 0)
                ::SendMessageA(list->m_hWnd, LB_SETCURSEL, (WPARAM)index, 0);
        }
    }
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

void CModelDlg::FUN_00423ba0()
{
    FUN_00423d20();
    if (g_ModelOptions.GetSize() == 0)
        return;
    if (g_ModelSelected.GetSize() == 0)
        return;
    for (brush_t *b = active_brushes.next; b != &active_brushes;)
    {
        brush_t *next = b->next;
        if (!FUN_0044f5d0(b) && b->owner != DAT_012334ec)
        {
#line 240
            assert(b->owner->def == b->def->owner);
            entity_t *e = b->owner->def;
            for (int i = 0; i < g_ModelOptions.GetSize(); ++i)
            {
                if (memcmp(e->eclass->name, "misc_model", 11) == 0 && FUN_00465e10(e, "model", g_ModelOptions[i]))
                    FUN_00465bf0(e, "model", g_ModelSelected[rand() % g_ModelSelected.GetSize()]);
            }
        }
        b = next;
    }
    g_nUpdateBits = -1;
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

void CModelDlg::OnClose()
{
    FUN_00423d20();
    Default();
}

BEGIN_MESSAGE_MAP(CModelDlg, CDialog)
    ON_WM_SHOWWINDOW()
    ON_BN_CLICKED(1570, FUN_00423080)
    ON_BN_CLICKED(1568, FUN_004234f0)
    ON_BN_CLICKED(1578, FUN_00423960)
    ON_BN_CLICKED(1581, FUN_004239c0)
    ON_BN_CLICKED(1576, FUN_00423a80)
    ON_BN_CLICKED(1580, FUN_00423ae0)
    ON_BN_CLICKED(1575, FUN_00423ba0)
    ON_WM_CLOSE()
END_MESSAGE_MAP()
