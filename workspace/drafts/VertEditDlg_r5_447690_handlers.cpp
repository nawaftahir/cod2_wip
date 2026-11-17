#include "stdafx.h"
#include "Pmesh.h"
#include "../universal/assertive.h"


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

struct VertEditRgb
{
    int r;
    int g;
    int b;
};

struct VertEditHsl
{
    int h;
    int s;
    int l;
};

struct VertEditPatchRef
{
    patchMesh_t *def;
};

struct VertEditBrushDef
{
    unsigned char pad[0x44];
    patchMesh_t *patch;
};

struct VertEditBrush
{
    VertEditBrush *prev;
    VertEditBrush *next;
    unsigned char pad0[0xc];
    VertEditBrushDef *def;
    unsigned char pad1[8];
    VertEditPatchRef *patch;
};

extern VertEditBrush selected_brushes;
extern int g_nUpdateBits;
extern int DAT_010c4d84;
extern int DAT_010c4d88[];
int __fastcall FUN_00429df0(void *, int value);

VertEditHsl FUN_00447230(VertEditRgb rgb);
VertEditRgb FUN_00447410(VertEditHsl hsl);

class CVertEditDlg : public CDialog
{
    DECLARE_DYNAMIC(CVertEditDlg)

public:
    enum { IDD = 226 };

    CVertEditDlg(CWnd *pParent = NULL);
    virtual ~CVertEditDlg();

protected:
    virtual void DoDataExchange(CDataExchange *pDX);
    virtual BOOL OnInitDialog();
    afx_msg void OnHScroll(UINT nSBCode, UINT nPos, CScrollBar *pScrollBar);
    afx_msg void FUN_00446aa0();
    afx_msg void FUN_00446ab0();
    afx_msg void OnDrawItem(int nIDCtl, LPDRAWITEMSTRUCT lpDrawItemStruct);
    afx_msg void FUN_00446c20(NMHDR *pNMHDR, LRESULT *pResult);
    afx_msg void FUN_00446e00(NMHDR *pNMHDR, LRESULT *pResult);
    afx_msg void FUN_00446f50(NMHDR *pNMHDR, LRESULT *pResult);
    afx_msg void FUN_00447690();
    DECLARE_MESSAGE_MAP()

    int m_nAlpha;
    VertEditRgb m_rgb;
    VertEditHsl m_hsl;
    int field_8c; // retail layout proves this 4-byte member; semantics remain unknown

    CSliderCtrl m_wndAlpha;
    CSliderCtrl m_wndHue;
    CSliderCtrl m_wndSaturation;
    CSliderCtrl m_wndLuminance;
    CButton m_btnAlpha;
    CButton m_btnColor;
    CButton m_btnRealTime;

    friend void __stdcall FUN_00446830(CVertEditDlg *dlg);
};

IMPLEMENT_DYNAMIC(CVertEditDlg, CDialog)

CVertEditDlg::CVertEditDlg(CWnd *pParent)
    : CDialog(IDD, pParent)
{
    m_rgb.g = 0;
    m_rgb.b = 0;
    m_rgb.r = 255;
    m_nAlpha = 255;
    m_hsl = FUN_00447230(m_rgb);
}

CVertEditDlg::~CVertEditDlg()
{
}

void CVertEditDlg::DoDataExchange(CDataExchange *pDX)
{
    CDialog::DoDataExchange(pDX);
    DDX_Text(pDX, 1528, m_nAlpha);
    DDX_Slider(pDX, 1527, m_nAlpha);
    DDX_Slider(pDX, 1533, m_hsl.h);
    DDX_Slider(pDX, 1534, m_hsl.s);
    DDX_Slider(pDX, 1535, m_hsl.l);
    DDX_Control(pDX, 1527, m_wndAlpha);
    DDX_Control(pDX, 1533, m_wndHue);
    DDX_Control(pDX, 1534, m_wndSaturation);
    DDX_Control(pDX, 1535, m_wndLuminance);
    DDX_Control(pDX, 1529, m_btnAlpha);
    DDX_Control(pDX, 1530, m_btnColor);
    DDX_Control(pDX, 1537, m_btnRealTime);
}

BEGIN_MESSAGE_MAP(CVertEditDlg, CDialog)
    ON_BN_CLICKED(1526, FUN_00446aa0)
    ON_BN_CLICKED(1461, FUN_00446ab0)
    ON_WM_HSCROLL()
    ON_WM_DRAWITEM()
    ON_NOTIFY(NM_CUSTOMDRAW, 1533, FUN_00446c20)
    ON_NOTIFY(NM_CUSTOMDRAW, 1534, FUN_00446e00)
    ON_NOTIFY(NM_CUSTOMDRAW, 1535, FUN_00446f50)
    ON_BN_CLICKED(1464, FUN_00447690)
END_MESSAGE_MAP()

void __stdcall FUN_00446830(CVertEditDlg *dlg);

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


BOOL CVertEditDlg::OnInitDialog()
{
    CDialog::OnInitDialog();
    for (unsigned int i = 0; i < 11; ++i)
    {
        g_vertEditSubclass[i].window = ::GetDlgItem(GetSafeHwnd(), g_vertEditSubclass[i].controlId);
        g_vertEditSubclass[i].previous = (WNDPROC)::GetWindowLongA(g_vertEditSubclass[i].window, GWL_WNDPROC);
        ::SetWindowLongA(g_vertEditSubclass[i].window, GWL_WNDPROC, (LONG)FUN_00446410);
    }
    m_wndAlpha.SetRange(0, 255);
    m_wndHue.SetRange(0, 240);
    m_wndSaturation.SetRange(0, 240);
    m_wndLuminance.SetRange(0, 240);
    m_btnRealTime.SetCheck(1);
    UpdateData(FALSE);
    return TRUE;
}

void CVertEditDlg::OnHScroll(UINT nSBCode, UINT nPos, CScrollBar *pScrollBar)
{
    if (nSBCode <= SB_THUMBTRACK)
    {
        UpdateData(TRUE);
        m_rgb = FUN_00447410(m_hsl);
        if (m_wndHue.GetPos() < m_wndHue.GetRangeMax())
        {
            m_wndHue.SetPos(m_wndHue.GetPos() + 1);
            m_wndHue.SetPos(m_wndHue.GetPos() - 1);
        }
        else
        {
            m_wndHue.SetPos(m_wndHue.GetPos() - 1);
            m_wndHue.SetPos(m_wndHue.GetPos() + 1);
        }
        if (m_wndSaturation.GetPos() < m_wndSaturation.GetRangeMax())
        {
            m_wndSaturation.SetPos(m_wndSaturation.GetPos() + 1);
            m_wndSaturation.SetPos(m_wndSaturation.GetPos() - 1);
        }
        else
        {
            m_wndSaturation.SetPos(m_wndSaturation.GetPos() - 1);
            m_wndSaturation.SetPos(m_wndSaturation.GetPos() + 1);
        }
        if (m_wndLuminance.GetPos() < m_wndLuminance.GetRangeMax())
        {
            m_wndLuminance.SetPos(m_wndLuminance.GetPos() + 1);
            m_wndLuminance.SetPos(m_wndLuminance.GetPos() - 1);
        }
        else
        {
            m_wndLuminance.SetPos(m_wndLuminance.GetPos() - 1);
            m_wndLuminance.SetPos(m_wndLuminance.GetPos() + 1);
        }
        Invalidate(FALSE);
        UpdateData(FALSE);
        if (m_btnRealTime.GetCheck())
            FUN_00446830(this);
    }
    CDialog::OnHScroll(nSBCode, nPos, pScrollBar);
}

void CVertEditDlg::FUN_00446aa0()
{
    FUN_00446830(this);
}

void CVertEditDlg::FUN_00446ab0()
{
    CColorDialog dlg(RGB(m_rgb.r, m_rgb.g, m_rgb.b), CC_FULLOPEN | CC_RGBINIT);
    if (dlg.DoModal() == IDOK)
    {
        COLORREF color = dlg.GetColor();
        m_rgb.r = GetRValue(color);
        m_rgb.g = GetGValue(color);
        m_rgb.b = GetBValue(color);
        m_hsl = FUN_00447230(m_rgb);
        UpdateData(FALSE);
        Invalidate(FALSE);
        if (m_btnRealTime.GetCheck())
            FUN_00446830(this);
    }
}

void CVertEditDlg::OnDrawItem(int nIDCtl, LPDRAWITEMSTRUCT lpDrawItemStruct)
{
    if (nIDCtl == 1463)
    {
        HBRUSH brush = CreateSolidBrush(RGB(m_rgb.r, m_rgb.g, m_rgb.b));
        FillRect(lpDrawItemStruct->hDC, &lpDrawItemStruct->rcItem, brush);
        DeleteObject(brush);
        return;
    }

    CDialog::OnDrawItem(nIDCtl, lpDrawItemStruct);
}

static void __stdcall FUN_004470b0(COLORREF from, COLORREF to, CDC *dc, RECT rc);

void CVertEditDlg::FUN_00446c20(NMHDR *pNMHDR, LRESULT *pResult)
{
    NMCUSTOMDRAW *draw = (NMCUSTOMDRAW *)pNMHDR;
    switch (draw->dwDrawStage)
    {
    case CDDS_PREPAINT:
        *pResult = CDRF_NOTIFYITEMDRAW;
        return;
    case CDDS_ITEMPREPAINT:
        break;
    default:
        *pResult = 0;
        return;
    }
    if (draw->dwItemSpec != TBCD_CHANNEL)
    {
        *pResult = 0;
        return;
    }
    RECT channel;
    m_wndHue.GetChannelRect(&channel);
    int step = (int)((float)(channel.right - channel.left) / 6.0f + 0.5);
    RECT seg = channel;
    seg.right = step;
    FUN_004470b0(0xff, 0xffff, CDC::FromHandle(draw->hdc), seg);
    seg.left = step;
    seg.right = step * 2;
    FUN_004470b0(0xffff, 0xff00, CDC::FromHandle(draw->hdc), seg);
    seg.left = step * 2;
    seg.right = step * 3;
    FUN_004470b0(0xff00, 0xffff00, CDC::FromHandle(draw->hdc), seg);
    seg.left = step * 3;
    seg.right = step * 4;
    FUN_004470b0(0xffff00, 0xff0000, CDC::FromHandle(draw->hdc), seg);
    seg.left = step * 4;
    seg.right = step * 5;
    FUN_004470b0(0xff0000, 0xff00ff, CDC::FromHandle(draw->hdc), seg);
    seg.left = step * 5;
    seg.right = channel.right;
    FUN_004470b0(0xff00ff, 0xff, CDC::FromHandle(draw->hdc), seg);
    *pResult = CDRF_SKIPDEFAULT;
}

void CVertEditDlg::FUN_00446e00(NMHDR *pNMHDR, LRESULT *pResult)
{
    NMCUSTOMDRAW *draw = (NMCUSTOMDRAW *)pNMHDR;
    switch (draw->dwDrawStage)
    {
    case CDDS_PREPAINT:
        *pResult = CDRF_NOTIFYITEMDRAW;
        return;
    case CDDS_ITEMPREPAINT:
        break;
    default:
        *pResult = 0;
        return;
    }
    if (draw->dwItemSpec != TBCD_CHANNEL)
    {
        *pResult = 0;
        return;
    }
    VertEditHsl hsl = m_hsl;
    VertEditRgb low, high;
    hsl.s = 0;
    hsl.l = 128;
    low = FUN_00447410(hsl);
    hsl.s = 240;
    high = FUN_00447410(hsl);
    RECT channel;
    m_wndSaturation.GetChannelRect(&channel);
    FUN_004470b0(RGB(low.r, low.g, low.b), RGB(high.r, high.g, high.b), CDC::FromHandle(draw->hdc), channel);
    *pResult = CDRF_SKIPDEFAULT;
}

void CVertEditDlg::FUN_00446f50(NMHDR *pNMHDR, LRESULT *pResult)
{
    NMCUSTOMDRAW *draw = (NMCUSTOMDRAW *)pNMHDR;
    switch (draw->dwDrawStage)
    {
    case CDDS_PREPAINT:
        *pResult = CDRF_NOTIFYITEMDRAW;
        return;
    case CDDS_ITEMPREPAINT:
        break;
    default:
        *pResult = 0;
        return;
    }
    if (draw->dwItemSpec != TBCD_CHANNEL)
    {
        *pResult = 0;
        return;
    }
    VertEditHsl hsl = m_hsl;
    RECT channel;
    m_wndLuminance.GetChannelRect(&channel);
    int mid = (int)((float)(channel.right - channel.left) / 2.0f + 0.5);
    VertEditRgb color;
    hsl.l = 120;
    color = FUN_00447410(hsl);
    COLORREF ref = RGB(color.r, color.g, color.b);
    RECT half = channel;
    half.right = mid;
    FUN_004470b0(0, ref, CDC::FromHandle(draw->hdc), half);
    half = channel;
    half.left = mid;
    FUN_004470b0(ref, 0xffffff, CDC::FromHandle(draw->hdc), half);
    *pResult = CDRF_SKIPDEFAULT;
}

static void __stdcall FUN_004470b0(COLORREF from, COLORREF to, CDC *dc, RECT rc)
{
    int width = rc.right - rc.left;
    for (int i = 0; i < width; i++)
    {
        RECT column;
        SetRect(&column, rc.left + i, rc.top, rc.left + i + 1, rc.bottom);
        float t = (float)i;
        t = t / (float)width;
        float b = t, g = t, r = t;
        BYTE blue = (BYTE)((1.0f - b) * (float)GetBValue(from) + (float)GetBValue(to) * b);
        BYTE green = (BYTE)((1.0f - g) * (float)GetGValue(from) + (float)GetGValue(to) * g);
        BYTE red = (BYTE)((1.0f - r) * (float)GetRValue(from) + (float)GetRValue(to) * r);
        dc->FillSolidRect(&column, RGB(red, green, blue));
    }
}

void FUN_00447210()
{
    ::PostMessageA(g_curveParent->m_hWnd, WM_COMMAND, 0x81af, 0);
}

VertEditHsl FUN_00447230(VertEditRgb rgb)
{
    float rf = rgb.r / 256.0;
    float gf = rgb.g / 256.0;
    float bf = rgb.b / 256.0;
    float mx = max(rf, max(gf, bf));
    float mn = min(rf, min(gf, bf));
    float h, s, l;
    if (mn == mx)
    {
        h = 0;
        s = 0;
        l = rf;
    }
    else
    {
        float sum = mn + mx;
        l = sum / 2.0f;
        if (l < 0.5)
            s = (mx - mn) / sum;
        else
            s = (mx - mn) / (2.0 - mx - mn);
        if (rf == mx)
            h = (gf - bf) / (mx - mn);
        else if (gf == mx)
            h = (bf - rf) / (mx - mn) + 2.0;
        else
            h = (rf - gf) / (mx - mn) + 4.0;
        h = h / 6.0f;
        if (h < 0.0f)
            h += 1.0f;
    }
    VertEditHsl out;
    out.h = (int)(h * 240.0);
    out.s = (int)(s * 240.0);
    out.l = (int)(l * 240.0);
    return out;
}

VertEditRgb FUN_00447410(VertEditHsl hsl)
{
    float h = hsl.h / 240.0;
    float s = hsl.s / 240.0;
    float l = hsl.l / 240.0;
    float tb, tg, tr, q;
    if (s == 0.0f)
    {
        tr = l;
        tg = l;
        tb = l;
    }
    else
    {
        if (l < 0.5)
            q = (s + 1.0f) * l;
        else
            q = l + s - l * s;
        l = 2.0f * l - q;
        tr = h + 1.0 / 3.0;
        if (tr > 1.0)
            tr -= 1.0f;
        tg = h;
        tb = h - 1.0 / 3.0;
        if (tb < 0.0)
            tb += 1.0f;
#define VERTEDIT_CHANNEL(t) \
    if (t < 1.0 / 6.0) \
        t = (q - l) * t * 6.0 + l; \
    else if (t < 0.5) \
        t = q; \
    else if (t < 2.0 / 3.0) \
        t = (q - l) * (2.0 / 3.0 - t) * 6.0 + l; \
    else \
        t = l;
        VERTEDIT_CHANNEL(tr)
        VERTEDIT_CHANNEL(tg)
        VERTEDIT_CHANNEL(tb)
#undef VERTEDIT_CHANNEL
    }
    VertEditRgb out;
    out.r = (int)(tr * 255.0);
    out.g = (int)(tg * 255.0);
    out.b = (int)(tb * 255.0);
    return out;
}

void CVertEditDlg::FUN_00447690()
{
    for (VertEditBrush *b = selected_brushes.next; b != &selected_brushes; b = b->next)
    {
        if (!b->patch)
            continue;
#line 575
        assert(b->patch->def == b->def->patch);
        patchMesh_t *patch = b->patch->def;
        for (int i = 0; i < patch->width; i++)
        {
            for (int j = 0; j < patch->height; j++)
            {
                PatchControl *cp = &patch->ctrl[i][j];
                if (cp->flags_34 & 2)
                    continue;
                if (FUN_00429df0(0, (int)cp) < 0)
                    continue;
                m_rgb.r = (&patch->ctrl[0][0])[i * 16 + j].color_28[2];
                m_rgb.g = (&patch->ctrl[0][0])[i * 16 + j].color_28[1];
                m_rgb.b = (&patch->ctrl[0][0])[i * 16 + j].color_28[0];
                m_hsl = FUN_00447230(m_rgb);
            }
        }
    }
    if (m_wndHue.GetPos() < m_wndHue.GetRangeMax())
    {
        m_wndHue.SetPos(m_wndHue.GetPos() + 1);
        m_wndHue.SetPos(m_wndHue.GetPos() - 1);
    }
    else
    {
        m_wndHue.SetPos(m_wndHue.GetPos() - 1);
        m_wndHue.SetPos(m_wndHue.GetPos() + 1);
    }
    if (m_wndSaturation.GetPos() < m_wndSaturation.GetRangeMax())
    {
        m_wndSaturation.SetPos(m_wndSaturation.GetPos() + 1);
        m_wndSaturation.SetPos(m_wndSaturation.GetPos() - 1);
    }
    else
    {
        m_wndSaturation.SetPos(m_wndSaturation.GetPos() - 1);
        m_wndSaturation.SetPos(m_wndSaturation.GetPos() + 1);
    }
    if (m_wndLuminance.GetPos() < m_wndLuminance.GetRangeMax())
    {
        m_wndLuminance.SetPos(m_wndLuminance.GetPos() + 1);
        m_wndLuminance.SetPos(m_wndLuminance.GetPos() - 1);
    }
    else
    {
        m_wndLuminance.SetPos(m_wndLuminance.GetPos() - 1);
        m_wndLuminance.SetPos(m_wndLuminance.GetPos() + 1);
    }
    UpdateData(FALSE);
    Invalidate(FALSE);
    g_nUpdateBits = -1;
}

