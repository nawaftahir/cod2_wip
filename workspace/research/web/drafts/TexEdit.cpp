/* Q3Radiant-derived class structure, independently tested against CoD2.
 * Licensed under GPL-2.0-or-later (id Software Q3Radiant TexEdit.cpp).
 * Experimental: not part of the canonical game ledger until retail matches.
 */
#include "stdafx.h"

// The ancestor and the real runtime records agree: CTexWnd derives from
// CWnd, contains CTexEdit at +0x50, CButton at +0xac and a flag at +0xfc.
// Definition follows CTexEdit to express real object ownership and size.
class CTexWnd;
class CTexEdit : public CEdit {
public:
    CTexEdit();
    virtual ~CTexEdit();
    CTexWnd *m_pTexWnd;
    CFont m_Font;
protected:
    afx_msg HBRUSH CtlColor(CDC *dc, UINT type);
    afx_msg void OnChange();
    afx_msg int OnCreate(LPCREATESTRUCT cs);
    DECLARE_MESSAGE_MAP()
};
// This needs to become one reviewed shared TexWnd header, not a separate
// guessed class view in the owning TexWnd.cpp translation unit.
class CTexWnd : public CWnd {
    DECLARE_DYNCREATE(CTexWnd)
public:
    CTexWnd();
    virtual ~CTexWnd();
    void UpdateFilter(const char *text);
protected:
    CTexEdit m_wndFilter;
    CButton m_wndShaders;
    bool m_bNeedRange;
};
typedef char check_texedit_size[(sizeof(CTexEdit) == 0x5c) ? 1 : -1];
typedef char check_texwnd_size[(sizeof(CTexWnd) == 0x100) ? 1 : -1];

CTexEdit::CTexEdit() { m_pTexWnd = NULL; }
CTexEdit::~CTexEdit() { }
BEGIN_MESSAGE_MAP(CTexEdit, CEdit)
    ON_WM_CTLCOLOR_REFLECT()
    ON_CONTROL_REFLECT(EN_CHANGE, OnChange)
    ON_WM_CREATE()
END_MESSAGE_MAP()
HBRUSH CTexEdit::CtlColor(CDC *dc, UINT type)
{
    if (type == CTLCOLOR_EDIT) {
        dc->SetBkColor(RGB(192,192,192));
        return (HBRUSH)GetStockObject(LTGRAY_BRUSH);
    }
    return NULL;
}
void CTexEdit::OnChange()
{
    CString text;
    GetWindowText(text);
    if (m_pTexWnd)
        m_pTexWnd->UpdateFilter(text);
}
int CTexEdit::OnCreate(LPCREATESTRUCT cs)
{
    if (CEdit::OnCreate(cs) == -1)
        return -1;
    m_Font.CreatePointFont(100, "Arial");
    SetFont(&m_Font, FALSE);
    return 0;
}
