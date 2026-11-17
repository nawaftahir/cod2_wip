/* CTexEdit original MFC control, reconstructed from CoD2 retail.
 * Q3Radiant TexEdit.cpp and TexEdit.h (GPL-2.0-or-later) were
 * structural references, then five authored bodies were individually
 * verified against the retail MSVC 7.1 output.
 * OnChange is declared but not defined: see workspace/drafts/TexWnd_00442d60.cpp.
 */
#include "stdafx.h"

#include "TexWnd.h"

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

int CTexEdit::OnCreate(LPCREATESTRUCT cs)
{
    if (CEdit::OnCreate(cs) == -1)
        return -1;
    m_Font.CreatePointFont(100, "Arial");
    SetFont(&m_Font, FALSE);
    return 0;
}
