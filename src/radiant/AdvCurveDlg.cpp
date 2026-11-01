#include "stdafx.h"
#include "win_main.h"
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

struct CurveSelection
{
    int controlId;
    int value;
    int field_08;
};

struct CurveSubclass
{
    int controlId;
    HWND window;
    WNDPROC previous;
};

typedef char CurveSelectionSize[(sizeof(CurveSelection) == 12) ? 1 : -1];
typedef char CurveSubclassSize[(sizeof(CurveSubclass) == 12) ? 1 : -1];

const char *g_curveScalePresets[8] =
{
    "0.125", "0.25", "0.5", "1.0", "2.0", "4.0", "8.0", "16.0"
};

const char *g_curveSecondPresets[7] =
{
    "16", "32", "64", "128", "256", "512", "1024"
};

const char *g_curveFirstPresets[7] =
{
    "0", "16", "32", "64", "128", "256", "512"
};

CurveSelection g_curveSelection[7] =
{
    {1435, 0, 0},
    {1439, 1, 1},
    {1437, 2, 0},
    {1436, 3, 0},
    {1438, 4, 0},
    {1468, 5, 0},
    {1440, 6, 0},
};

CurveSubclass g_curveSubclass[17] =
{
    {1424, NULL, NULL},
    {1425, NULL, NULL},
    {1426, NULL, NULL},
    {1431, NULL, NULL},
    {1432, NULL, NULL},
    {1435, NULL, NULL},
    {1439, NULL, NULL},
    {1437, NULL, NULL},
    {1436, NULL, NULL},
    {1438, NULL, NULL},
    {1440, NULL, NULL},
    {1069, NULL, NULL},
    {1070, NULL, NULL},
    {1071, NULL, NULL},
    {1428, NULL, NULL},
    {1429, NULL, NULL},
    {1430, NULL, NULL},
};

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
    int FUN_00401fa0(const char *const *items, int count, int x, int y);
    int FUN_00401d90();
    void FUN_00401df0(int selected);
    bool FUN_00401d30();
    bool FUN_00401e50();
    bool FUN_00401e80();
    bool FUN_00401eb0();
    bool FUN_00401ee0();
    bool FUN_00401f10();
    bool FUN_00401f40();
    bool FUN_00401f70();
    void FUN_00402300(COLORREF value);
    COLORREF FUN_00402320();
    void FUN_00402330(BYTE value);
    BYTE FUN_00402350();
    void FUN_00402360(float value);
    float FUN_004023c0();


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


void CAdvCurveEditDlg::OnDestroy()
{
    CDialog::OnDestroy();
    WINDOWPLACEMENT placement;
    HWND window = GetSafeHwnd();
    placement.length = sizeof(placement);
    if (::GetWindowPlacement(window, &placement))
        SaveRegistryInfo("Radiant::AdvCurveDlgPlace", &placement, sizeof(placement));
}

LRESULT CALLBACK FUN_00401860(HWND window, UINT message, WPARAM wparam, LPARAM lparam)
{
    if (message == WM_KEYDOWN && wparam == 'Y')
    {
        ::PostMessageA(g_curveParent->m_hWnd, WM_COMMAND, 0x816a, 0);
        return 0;
    }
    for (unsigned int i = 0; i < 17; ++i)
        if (window == g_curveSubclass[i].window)
            return g_curveSubclass[i].previous(window, message, wparam, lparam);
    return 0;
}

BOOL CAdvCurveEditDlg::OnInitDialog()
{
    CDialog::OnInitDialog();
    for (unsigned int i = 0; i < 17; ++i)
    {
        g_curveSubclass[i].window = ::GetDlgItem(GetSafeHwnd(), g_curveSubclass[i].controlId);
        g_curveSubclass[i].previous = (WNDPROC)::GetWindowLongA(g_curveSubclass[i].window, GWL_WNDPROC);
        ::SetWindowLongA(g_curveSubclass[i].window, GWL_WNDPROC, (LONG)FUN_00401860);
    }
    for (unsigned int i = 0; i < 3; ++i)
    {
        CSliderCtrl *slider = (CSliderCtrl *)GetDlgItem(g_curveControls[i].sliderId);
        if (slider)
        {
            int maximum = (int)floor((float)((g_curveControls[i].maximum - g_curveControls[i].minimum) / g_curveControls[i].step + 0.5f));
            int position = (int)floor((float)((g_curveControls[i].value - g_curveControls[i].minimum) / g_curveControls[i].step + 0.5f));
            slider->SetRange(0, maximum, FALSE);
            slider->SetPos(position);
            g_curveControls[i].slider = slider->m_hWnd;
            g_curveControls[i].edit = ::GetDlgItem(GetSafeHwnd(), g_curveControls[i].editId);
            FUN_00401000(i);
        }
        else
        {
            g_curveControls[i].slider = NULL;
            g_curveControls[i].edit = NULL;
        }
    }
    FUN_00401df0(6);
    GetDlgItem(0x5bd)->SendMessage(BM_SETCHECK, 1, 0);
    GetDlgItem(0x5bb)->SetWindowText("0");
    control_0597.SetCheck(1);
    control_0598.SetCheck(0);
    return TRUE;
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

bool CAdvCurveEditDlg::FUN_00401d30()
{
    if (control_0597.GetCheck() && !::IsWindowVisible(m_hWnd))
        return false;
    if (FUN_00401d90() == 6)
        return false;
    float first = FUN_00401b80();
    if (FUN_00401bd0() <= first)
        return false;
    return true;
}

int CAdvCurveEditDlg::FUN_00401d90()
{
    for (unsigned int i = 0; i < 7; ++i)
    {
        CWnd *control = GetDlgItem(g_curveSelection[i].controlId);
        if (control && control->SendMessage(BM_GETCHECK, 0, 0))
            return g_curveSelection[i].value;
    }
    return 6;
}

void CAdvCurveEditDlg::FUN_00401df0(int selected)
{
    for (unsigned int i = 0; i < 7; ++i)
    {
        CWnd *control = GetDlgItem(g_curveSelection[i].controlId);
        if (control)
            control->SendMessage(BM_SETCHECK, selected == g_curveSelection[i].value, 0);
    }
    ::InvalidateRect(m_hWnd, NULL, FALSE);
}

bool CAdvCurveEditDlg::FUN_00401e50()
{
    if (!GetDlgItem(0x5bd)->SendMessage(BM_GETCHECK, 0, 0))
        return false;
    return true;
}

bool CAdvCurveEditDlg::FUN_00401e80()
{
    if (!GetDlgItem(0x5be)->SendMessage(BM_GETCHECK, 0, 0))
        return false;
    return true;
}

bool CAdvCurveEditDlg::FUN_00401eb0()
{
    if (!GetDlgItem(0x5bf)->SendMessage(BM_GETCHECK, 0, 0))
        return false;
    return true;
}

bool CAdvCurveEditDlg::FUN_00401ee0()
{
    if (!GetDlgItem(0x5c0)->SendMessage(BM_GETCHECK, 0, 0))
        return false;
    return true;
}

bool CAdvCurveEditDlg::FUN_00401f10()
{
    if (!GetDlgItem(0x5c1)->SendMessage(BM_GETCHECK, 0, 0))
        return false;
    return true;
}

bool CAdvCurveEditDlg::FUN_00401f40()
{
    if (!GetDlgItem(0x5c2)->SendMessage(BM_GETCHECK, 0, 0))
        return false;
    return true;
}

bool CAdvCurveEditDlg::FUN_00401f70()
{
    if (!control_0598.GetCheck())
        return false;
    return true;
}

int CAdvCurveEditDlg::FUN_00401fa0(const char *const *items, int count, int x, int y)
{
    CMenu menu;
    menu.CreatePopupMenu();
    for (int i = 0; i < count; ++i)
        menu.AppendMenu(MF_STRING, i + 1, items[i]);
    int result = menu.TrackPopupMenu(TPM_RETURNCMD, x, y, this);
    return result - 1;
}

void CAdvCurveEditDlg::FUN_00402050()
{
    RECT rect;
    control_042d.GetWindowRect(&rect);
    int index = FUN_00401fa0(g_curveFirstPresets, sizeof(g_curveFirstPresets) / sizeof(g_curveFirstPresets[0]), rect.right, rect.top);
    if (index >= 0 && index < sizeof(g_curveFirstPresets) / sizeof(g_curveFirstPresets[0]))
    {
        float value = (float)atof(g_curveFirstPresets[index]);
        FUN_004010c0(1424, value);
    }
}

void CAdvCurveEditDlg::FUN_004020c0()
{
    RECT rect;
    control_042e.GetWindowRect(&rect);
    int index = FUN_00401fa0(g_curveSecondPresets, sizeof(g_curveSecondPresets) / sizeof(g_curveSecondPresets[0]), rect.right, rect.top);
    if (index >= 0 && index < sizeof(g_curveSecondPresets) / sizeof(g_curveSecondPresets[0]))
    {
        float value = (float)atof(g_curveSecondPresets[index]);
        FUN_004010c0(1425, value);
    }
}

void CAdvCurveEditDlg::FUN_00402130()
{
    RECT rect;
    control_042f.GetWindowRect(&rect);
    int index = FUN_00401fa0(g_curveScalePresets, sizeof(g_curveScalePresets) / sizeof(g_curveScalePresets[0]), rect.right, rect.top);
    if (index >= 0 && index < sizeof(g_curveScalePresets) / sizeof(g_curveScalePresets[0]))
    {
        FUN_00401cd0((float)atof(g_curveScalePresets[index]));
    }
}

void CAdvCurveEditDlg::FUN_00402190()
{
    g_curveUpdatePending |= 1;
}

void CAdvCurveEditDlg::FUN_004021a0()
{
    CColorDialog dialog(color, 0, NULL);
    if (dialog.DoModal() == IDOK)
    {
        color = dialog.GetColor();
        ::InvalidateRect(m_hWnd, NULL, FALSE);
    }
}

void CAdvCurveEditDlg::FUN_00402240()
{
    CColorDialog dialog(RGB(alpha, alpha, alpha), 0, NULL);
    if (dialog.DoModal() == IDOK)
    {
        COLORREF value = dialog.GetColor();
        alpha = (BYTE)((GetRValue(value) + GetGValue(value) + GetBValue(value)) / 3);
        ::InvalidateRect(m_hWnd, NULL, FALSE);
    }
}

void CAdvCurveEditDlg::FUN_00402300(COLORREF value)
{
    color = value;
    ::InvalidateRect(m_hWnd, NULL, FALSE);
}

COLORREF CAdvCurveEditDlg::FUN_00402320()
{
    return color;
}

void CAdvCurveEditDlg::FUN_00402330(BYTE value)
{
    alpha = value;
    ::InvalidateRect(m_hWnd, NULL, FALSE);
}

BYTE CAdvCurveEditDlg::FUN_00402350()
{
    return alpha;
}

void CAdvCurveEditDlg::FUN_00402360(float value)
{
    char text[256];
    sprintf(text, "%.0f", value);
    GetDlgItem(0x5bb)->SetWindowText(text);
}

float CAdvCurveEditDlg::FUN_004023c0()
{
    char text[256];
    GetDlgItem(0x5bb)->GetWindowText(text, sizeof(text));
    return (float)atof(text);
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

CAdvCurveEditDlg g_curveDialog(NULL);
