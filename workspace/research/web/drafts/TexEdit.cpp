/* Q3Radiant-derived class structure, independently tested against CoD2.
 * Licensed under GPL-2.0-or-later (id Software Q3Radiant TexEdit.cpp).
 * Experimental: not part of the canonical game ledger until retail matches.
 */
#include "stdafx.h"

class CTexWnd {
public:
    void UpdateFilter(const char *text);
};
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
