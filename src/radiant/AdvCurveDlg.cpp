#include <afxwin.h>
#include <afxcmn.h>
#include <math.h>
#include <stddef.h>
#include <stdio.h>

struct CurveControl
{
    int sliderId;
    int editId;
    float value;
    float minimum;
    float maximum;
    float step;
    HWND slider;
    HWND edit;
};

typedef char CurveControlSize[(sizeof(CurveControl) == 32) ? 1 : -1];
typedef char CurveControlValue[(offsetof(CurveControl, value) == 8) ? 1 : -1];
typedef char CurveControlEdit[(offsetof(CurveControl, edit) == 28) ? 1 : -1];

CurveControl g_curveControls[3] =
{
    {1424, 1428, 16.0f, 0.0f, 1024.0f, 16.0f, NULL, NULL},
    {1425, 1429, 64.0f, 0.0f, 1024.0f, 16.0f, NULL, NULL},
    {1426, 1430,  8.0f, 0.0f,   16.0f,  1.0f, NULL, NULL}
};

int g_curveUpdatePending;
CWnd *g_curveParent;
typedef char CurveParentWindowOffset[(offsetof(CWnd, m_hWnd) == 0x1c) ? 1 : -1];

float FUN_00401c20();

void FUN_00401000(int index)
{
    char text[64];
    if (index >= 0 && index < sizeof(g_curveControls) / sizeof(g_curveControls[0]) && g_curveControls[index].edit)
    {
        if (g_curveControls[index].sliderId == 1426)
            sprintf(text, "%g", FUN_00401c20());
        else
            sprintf(text, "%g", g_curveControls[index].value);
        SetWindowTextA(g_curveControls[index].edit, text);
        g_curveUpdatePending |= 1;
    }
}

float FUN_00401090(int id)
{
    for (unsigned int i = 0; i < 3; ++i)
        if (g_curveControls[i].sliderId == id)
            return g_curveControls[i].value;
    return 0.0f;
}

void FUN_004010c0(int id, float value)
{
    for (unsigned int i = 0; i < 3; ++i)
    {
        if (g_curveControls[i].sliderId == id)
        {
            if (value <= g_curveControls[i].minimum)
                value = g_curveControls[i].minimum;
            else if (value >= g_curveControls[i].maximum)
                value = g_curveControls[i].maximum;
            int position = (int)floor((float)((value - g_curveControls[i].minimum) / g_curveControls[i].step + 0.5f));
            g_curveControls[i].value = (float)position * g_curveControls[i].step + g_curveControls[i].minimum;
            if (g_curveControls[i].slider)
                SendMessageA(g_curveControls[i].slider, 0x405, TRUE, position);
            FUN_00401000(i);
        }
    }
}

class CAdvCurveEditDlg : public CDialog
{
public:
    CAdvCurveEditDlg(CWnd *parent);
    virtual void DoDataExchange(CDataExchange *dx);
    DECLARE_MESSAGE_MAP()
public:
    afx_msg void OnDestroy();
    afx_msg int OnCreate(LPCREATESTRUCT create);
    afx_msg void OnHScroll(UINT code, UINT position, CScrollBar *bar);
protected:
    virtual LRESULT DefWindowProc(UINT message, WPARAM wparam, LPARAM lparam);
    virtual BOOL OnInitDialog();
    virtual void OnOK();
    virtual void OnCancel();
public:
    afx_msg void FUN_00401f90();
    afx_msg void FUN_00402050();
    afx_msg void FUN_004020c0();
    afx_msg void FUN_00402130();
    afx_msg void FUN_00402190();
    afx_msg void FUN_004021a0();
    afx_msg void OnDrawItem(int id, LPDRAWITEMSTRUCT item);
    afx_msg void FUN_00402240();
    void FUN_00401c90(float value);
    void FUN_00401cb0(float value);
    void FUN_00401cd0(float value);

    CButton control_042e;
    CButton control_042d;
    CButton control_042f;
    CEdit control_0595;
    CEdit control_0594;
    CEdit control_0596;
    CEdit control_05ca;
    CEdit control_05cb;
    CEdit edit_unbound;
    CSliderCtrl control_0591;
    CSliderCtrl control_0590;
    CSliderCtrl control_0592;
    CButton control_0597;
    CButton control_0598;
    COLORREF color;
    BYTE alpha;
};

typedef char CurveDialogSize[(sizeof(CAdvCurveEditDlg) == 0x4d8) ? 1 : -1];
typedef char CurveFirstControl[(offsetof(CAdvCurveEditDlg, control_042e) == 0x70) ? 1 : -1];
typedef char CurveColorOffset[(offsetof(CAdvCurveEditDlg, color) == 0x4d0) ? 1 : -1];
typedef char CurveAlphaOffset[(offsetof(CAdvCurveEditDlg, alpha) == 0x4d4) ? 1 : -1];

CAdvCurveEditDlg::CAdvCurveEditDlg(CWnd *parent) : CDialog(187, parent)
{
}



void CAdvCurveEditDlg::DoDataExchange(CDataExchange *dx)
{
    DDX_Control(dx, 0x042e, control_042e);
    DDX_Control(dx, 0x042d, control_042d);
    DDX_Control(dx, 0x042f, control_042f);
    DDX_Control(dx, 0x0595, control_0595);
    DDX_Control(dx, 0x0594, control_0594);
    DDX_Control(dx, 0x0596, control_0596);
    DDX_Control(dx, 0x05ca, control_05ca);
    DDX_Control(dx, 0x05cb, control_05cb);
    DDX_Control(dx, 0x0591, control_0591);
    DDX_Control(dx, 0x0590, control_0590);
    DDX_Control(dx, 0x0592, control_0592);
    DDX_Control(dx, 0x0597, control_0597);
    DDX_Control(dx, 0x0598, control_0598);
}


BEGIN_MESSAGE_MAP(CAdvCurveEditDlg, CDialog)
    ON_WM_DESTROY()
    ON_WM_CREATE()
    ON_WM_HSCROLL()
    ON_EN_KILLFOCUS(0x594, FUN_00401f90)
    ON_EN_KILLFOCUS(0x5ca, FUN_00401f90)
    ON_EN_KILLFOCUS(0x5cb, FUN_00401f90)
    ON_BN_CLICKED(0x42d, FUN_00402050)
    ON_BN_CLICKED(0x42e, FUN_004020c0)
    ON_BN_CLICKED(0x42f, FUN_00402130)
    ON_EN_KILLFOCUS(0x595, FUN_00401f90)
    ON_EN_KILLFOCUS(0x596, FUN_00401f90)
    ON_BN_CLICKED(0x5a0, FUN_00402190)
    ON_BN_CLICKED(0x59f, FUN_00402190)
    ON_BN_CLICKED(0x59d, FUN_00402190)
    ON_BN_CLICKED(0x59e, FUN_00402190)
    ON_BN_CLICKED(0x59b, FUN_00402190)
    ON_BN_CLICKED(0x59c, FUN_00402190)
    ON_BN_CLICKED(0x5b4, FUN_004021a0)
    ON_WM_DRAWITEM()
    ON_BN_CLICKED(0x5b8, FUN_00402240)
END_MESSAGE_MAP()

BOOL FUN_00401560()
{
    return ::PostMessageA(g_curveParent->m_hWnd, WM_COMMAND, 0x816a, 0);
}

void CAdvCurveEditDlg::OnCancel()
{
    ::PostMessageA(g_curveParent->m_hWnd, WM_COMMAND, 0x816a, 0);
}

bool FUN_0047a140(const char *name, const BYTE *data, DWORD size);

void CAdvCurveEditDlg::OnDestroy()
{
    CDialog::OnDestroy();
    WINDOWPLACEMENT placement;
    HWND window = GetSafeHwnd();
    placement.length = sizeof(placement);
    if (::GetWindowPlacement(window, &placement))
        FUN_0047a140("Radiant::AdvCurveDlgPlace", (const BYTE *)&placement, sizeof(placement));
}

LRESULT CAdvCurveEditDlg::DefWindowProc(UINT message, WPARAM wparam, LPARAM lparam)
{
    if (message == WM_CLOSE)
        return 0;
    return CDialog::DefWindowProc(message, wparam, lparam);
}

void CAdvCurveEditDlg::OnHScroll(UINT code, UINT position, CScrollBar *bar)
{
    HWND window = bar->GetSafeHwnd();
    for (unsigned int i = 0; i < 3; ++i)
    {
        if (g_curveControls[i].slider == window)
        {
            int sliderPosition = (int)::SendMessageA(bar->m_hWnd, 0x400, 0, 0);
            g_curveControls[i].value = (float)sliderPosition * g_curveControls[i].step + g_curveControls[i].minimum;
            if (g_curveControls[i].value > g_curveControls[i].maximum)
                g_curveControls[i].value = g_curveControls[i].maximum;
            FUN_00401000(i);
            break;
        }
    }
    CDialog::OnHScroll(code, position, bar);
}

float FUN_00401b80()
{
    return FUN_00401090(1424);
}

float FUN_00401bd0()
{
    return FUN_00401090(1425);
}




float FUN_00401c20()
{
    return (float)pow(2.0, (double)(FUN_00401090(1426) - 8.0f));
}

void CAdvCurveEditDlg::FUN_00401c90(float value)
{
    FUN_004010c0(1424, value);
}

void CAdvCurveEditDlg::FUN_00401cb0(float value)
{
    FUN_004010c0(1425, value);
}

void CAdvCurveEditDlg::FUN_00401cd0(float value)
{
    float denominator = log(2.0f);
    FUN_004010c0(1426, log(value) / denominator + 8.0f);
}

void CAdvCurveEditDlg::FUN_00402190()
{
    g_curveUpdatePending |= 1;
}

void CAdvCurveEditDlg::OnDrawItem(int id, LPDRAWITEMSTRUCT item)
{
    if (id == 0x5b6)
    {
        HBRUSH brush = CreateSolidBrush(color);
        ::FillRect(item->hDC, &item->rcItem, brush);
        DeleteObject(brush);
    }
    else if (id == 0x5ba)
    {
        HBRUSH brush = CreateSolidBrush(RGB(alpha, alpha, alpha));
        ::FillRect(item->hDC, &item->rcItem, brush);
        DeleteObject(brush);
    }
    else
        CDialog::OnDrawItem(id, item);
}
