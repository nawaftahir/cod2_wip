#include "stdafx.h"


extern CWnd *g_curveParent;

struct VertEditSubclassControl
{
    int controlId;
    HWND window;
    WNDPROC previous;
};

VertEditSubclassControl g_vertEditSubclass[11] =
{
    {1461, NULL, NULL},
    {1526, NULL, NULL},
    {1527, NULL, NULL},
    {1528, NULL, NULL},
    {1529, NULL, NULL},
    {1530, NULL, NULL},
    {1533, NULL, NULL},
    {1534, NULL, NULL},
    {1535, NULL, NULL},
    {1537, NULL, NULL},
    {1464, NULL, NULL},
};

class CVertEditDlg : public CDialog
{
public:
    virtual ~CVertEditDlg();

protected:
    virtual void DoDataExchange(CDataExchange *pDX);
    afx_msg void OnDrawItem(int nIDCtl, LPDRAWITEMSTRUCT lpDrawItemStruct);

    int m_nAlpha;
    int m_nRed;
    int m_nGreen;
    int m_nBlue;
    int m_nHue;
    int m_nSaturation;
    int m_nLuminance;
    int field_8c; // retail layout proves this 4-byte member; semantics remain unknown

    CSliderCtrl m_wndAlpha;
    CSliderCtrl m_wndHue;
    CSliderCtrl m_wndSaturation;
    CSliderCtrl m_wndLuminance;
    CButton m_btnAlpha;
    CButton m_btnColor;
    CButton m_btnRealTime;
};

CVertEditDlg::~CVertEditDlg()
{
}

void CVertEditDlg::DoDataExchange(CDataExchange *pDX)
{
    CDialog::DoDataExchange(pDX);
    DDX_Text(pDX, 1528, m_nAlpha);
    DDX_Slider(pDX, 1527, m_nAlpha);
    DDX_Slider(pDX, 1533, m_nHue);
    DDX_Slider(pDX, 1534, m_nSaturation);
    DDX_Slider(pDX, 1535, m_nLuminance);
    DDX_Control(pDX, 1527, m_wndAlpha);
    DDX_Control(pDX, 1533, m_wndHue);
    DDX_Control(pDX, 1534, m_wndSaturation);
    DDX_Control(pDX, 1535, m_wndLuminance);
    DDX_Control(pDX, 1529, m_btnAlpha);
    DDX_Control(pDX, 1530, m_btnColor);
    DDX_Control(pDX, 1537, m_btnRealTime);
}


LRESULT CALLBACK FUN_00446410(HWND window, UINT message, WPARAM wparam, LPARAM lparam)
{
    if (message == WM_KEYDOWN && wparam == 'G')
    {
        ::PostMessageA(g_curveParent->m_hWnd, WM_COMMAND, 0x81af, 0);
        return 0;
    }
    for (unsigned int i = 0; i < 11; ++i)
        if (window == g_vertEditSubclass[i].window)
            return g_vertEditSubclass[i].previous(window, message, wparam, lparam);
    return 0;
}


void CVertEditDlg::OnDrawItem(int nIDCtl, LPDRAWITEMSTRUCT lpDrawItemStruct)
{
    if (nIDCtl == 1463)
    {
        HBRUSH brush = CreateSolidBrush(RGB(m_nRed, m_nGreen, m_nBlue));
        FillRect(lpDrawItemStruct->hDC, &lpDrawItemStruct->rcItem, brush);
        DeleteObject(brush);
        return;
    }

    CDialog::OnDrawItem(nIDCtl, lpDrawItemStruct);
}


void FUN_00447210()
{
    ::PostMessageA(g_curveParent->m_hWnd, WM_COMMAND, 0x81af, 0);
}
