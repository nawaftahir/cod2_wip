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

// selected_brushes list node: def at 0x14, patch instance at 0x20
struct VertEditBrush
{
    VertEditBrush *prev;
    VertEditBrush *next;
    unsigned char pad08[0x0c];
    VertEditBrushDef *def;
    unsigned char pad18[8];
    VertEditPatchRef *patch;
};

struct brushdef_t;
void Undo_AddBrush(brushdef_t *brush);
void FUN_004269d0(patchMesh_t *p, bool bRebuildBrush);

extern VertEditBrush selected_brushes;
extern int g_nUpdateBits;
extern int DAT_010c4d84;
extern PatchControl *DAT_010c4d88[];

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

// first picked control point of the move list, or -1
static int FindMovePoint(PatchControl *c)
{
    for (int i = 0; i < DAT_010c4d84; i++)
        if (c == DAT_010c4d88[i])
            return i;
    return -1;
}

static void BracketPatch(patchMesh_t *p)
{
    if (!p->field_382e)
    {
        brushdef_t *brush = (brushdef_t *)p->cache_3828;
        p->field_382e = 1;
        Undo_AddBrush(brush);
    }
}

// 0x00446830 (609 B)
void __stdcall FUN_00446830(CVertEditDlg *dlg)
{
    for (VertEditBrush *b = selected_brushes.next; b != &selected_brushes; b = b->next)
    {
        if (!b->patch)
            continue;
#line 199
        assert(b->patch->def == b->def->patch);
        patchMesh_t *p = b->patch->def;
        int changed = 0;
        for (int col = 0; col < p->width; col++)
        {
            for (int row = 0; row < p->height; row++)
            {
                PatchControl *c = &p->ctrl[col][row];
                if (c->flags_34 & 2)
                    continue;
                if (FindMovePoint(c) < 0)
                    continue;
                if (dlg->m_btnColor.GetCheck())
                {
                    changed = 1;
                    BracketPatch(p);
                    c->color_28[2] = (unsigned char)dlg->m_rgb.r;
                    c->color_28[1] = (unsigned char)dlg->m_rgb.g;
                    c->color_28[0] = (unsigned char)dlg->m_rgb.b;
                }
                if (dlg->m_btnAlpha.GetCheck())
                {
                    changed = 1;
                    BracketPatch(p);
                    c->color_28[3] = (unsigned char)dlg->m_nAlpha;
                }
            }
        }
        if (changed)
            FUN_004269d0(p, true);
    }
    g_nUpdateBits = -1;
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
