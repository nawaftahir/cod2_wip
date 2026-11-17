// XYWnd.cpp: top-down/side 2D editor view. Q3Radiant XYWnd.cpp layout, retail order.
#include "stdafx.h"
#include <stddef.h>
#include <string.h>
#include <math.h>
#include "PrefsDlg.h"
#include "../universal/assertive.h"

#define W_XY 2

enum { YZ, XZ, XY };

struct brush_s
{
    brush_s *prev;
    brush_s *next;
};

// Q3Radiant qeglobals_t view: the fields this file reads (base 0x10bcd28).
struct XYQEGlobals
{
    int d_showgrid;
    int d_gridsize;
    unsigned char pad0[0x38];
    HWND d_hwndXY;
};
extern XYQEGlobals g_qeglobals;
extern int g_nUpdateBits;

extern bool g_bSwitch;
extern bool g_bClipMode;
extern bool g_bRogueClipMode;
extern bool g_bRotateMode;
extern bool g_bScaleMode;
extern bool g_bPointMode;
extern int g_nScaleHow;
extern int g_nPointCount;
extern float g_vRotateOrigin[3];
extern float g_vRotation[3];
extern void *g_pMovingClip;
extern brush_s g_brClipboard;
extern brush_s g_brUndo;

void FUN_0047a760(const char *format, ...);
void Drag_MouseUp(int buttons);

// The three CMainFrame methods called through g_pParentWnd (same projection as TexWnd.cpp).
class CMainFrame;
struct CXYWndMainProjection
{
    void OnKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags);
    void __stdcall OnKeyUp(UINT nChar);
    BOOL OnMouseWheel(UINT nFlags, short zDelta, CPoint pt);
};
extern CMainFrame *g_pParentWnd;

extern CPrefsDlg *dword_01233b64;
struct eclass_t
{
    eclass_t *next;
    char *name;
};
extern eclass_t *dword_012334dc;

// Retail list node hanging off the window (owner and name still unknown).
struct XYWndNode
{
    XYWndNode();
    XYWndNode(int id, const char *name);
    int field_00;
    CString field_04;
    XYWndNode *next;
};

class CXYWnd : public CWnd
{
    DECLARE_DYNCREATE(CXYWnd)
public:
    CXYWnd();
    virtual ~CXYWnd();
    void XY_Init();
    void SnapToPoint(int x, int y, float point[3]);
    void XY_ToPoint(int x, int y, float point[3]);
    void XY_ToGridPoint(int x, int y, float point[3]);
    void FUN_0044c5c0(int x, int y, float origin[3], float dir[3]);
    void FUN_00452c30();
    void VectorCopyXY(float in[3], float out[3]);
    bool ClipMode();
    bool RogueClipMode();
    bool PointMode();
    void SetPointMode(bool b);
    float (&GetOrigin())[3];
    void SetOrigin(float org[3]);
    bool RotateMode();
    bool ScaleMode();
    void SetScaleMode(bool bMode);
    float (&RotateOrigin())[3];
    float (&Rotation())[3];
    BOOL AreaSelectOK();
    void XY_MouseUp(int x, int y, int buttons);
    BOOL DragDelta(int x, int y, float move[3]);
    void FUN_0044bc50(const char *name, int id);
    void FUN_0044be20();
    void HandleDrop();

    bool m_bActive;
    unsigned char pad_51[3];
    int m_nUpdateBits;
    int m_nWidth;
    int m_nHeight;
    float m_fScale;
    float m_TopClip;
    float m_BottomClip;
    bool m_bDirty;
    float m_vOrigin[3];
    CPoint m_ptCursor;
    bool m_bRButtonDown;
    int m_nButtonstate;
    int m_nPressx;
    int m_nPressy;
    float m_vPressdelta[3];
    bool m_bPress_selection;
    // Retail-only storage between the press state and the drop menu.
    unsigned char field_a1[0x3f];
    CMenu m_mnuDrop;
    XYWndNode field_e8;
    int m_nViewType;
    int m_nTimerID;
    int m_nScrollFlags;
    CPoint m_ptDrag;
    CPoint m_ptDragAdj;
    CPoint m_ptDragTotal;
    CPoint m_ptDown;
protected:
    virtual BOOL PreCreateWindow(CREATESTRUCT &cs);
    afx_msg int OnCreate(LPCREATESTRUCT lpCreateStruct);
    afx_msg void OnNcCalcSize(BOOL bCalcValidRects, NCCALCSIZE_PARAMS *lpncsp);
    afx_msg void OnKillFocus(CWnd *pNewWnd);
    afx_msg void OnSetFocus(CWnd *pOldWnd);
    afx_msg void OnClose();
    afx_msg void OnKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags);
    afx_msg void OnKeyUp(UINT nChar, UINT nRepCnt, UINT nFlags);
    afx_msg BOOL OnMouseWheel(UINT nFlags, short zDelta, CPoint pt);
    afx_msg void OnSysKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags);

    DECLARE_MESSAGE_MAP()
};

typedef char XYWndSize[(sizeof(CXYWnd) == 0x120) ? 1 : -1];
typedef char XYWndUpdateOffset[(offsetof(CXYWnd, m_nUpdateBits) == 0x54) ? 1 : -1];
typedef char XYWndScaleOffset[(offsetof(CXYWnd, m_fScale) == 0x60) ? 1 : -1];
typedef char XYWndOriginOffset[(offsetof(CXYWnd, m_vOrigin) == 0x70) ? 1 : -1];
typedef char XYWndButtonOffset[(offsetof(CXYWnd, m_nButtonstate) == 0x88) ? 1 : -1];
typedef char XYWndPressOffset[(offsetof(CXYWnd, m_bPress_selection) == 0xa0) ? 1 : -1];
typedef char XYWndMenuOffset[(offsetof(CXYWnd, m_mnuDrop) == 0xe0) ? 1 : -1];
typedef char XYWndStringOffset[(offsetof(CXYWnd, field_e8) == 0xe8) ? 1 : -1];
typedef char XYWndViewOffset[(offsetof(CXYWnd, m_nViewType) == 0xf4) ? 1 : -1];
typedef char XYWndTimerOffset[(offsetof(CXYWnd, m_nTimerID) == 0xf8) ? 1 : -1];

IMPLEMENT_DYNCREATE(CXYWnd, CWnd)

CXYWnd::CXYWnd()
{
    g_brClipboard.next = &g_brClipboard;
    g_brUndo.next = &g_brUndo;
    g_nScaleHow = 0;
    g_bRotateMode = false;
    g_bClipMode = false;
    g_bRogueClipMode = false;
    g_bSwitch = true;
    g_pMovingClip = NULL;
    m_bActive = false;
    m_bRButtonDown = false;
    m_nUpdateBits = W_XY;
    m_nTimerID = -1;
    XY_Init();
}

CXYWnd::~CXYWnd()
{
    XYWndNode *head = &field_e8;
    while (head->next)
    {
        XYWndNode *node = head->next;
        head->next = node->next;
        delete node;
    }
    m_mnuDrop.DestroyMenu();
}

// Retail order; entries for the other handlers are added as their bodies land.
BEGIN_MESSAGE_MAP(CXYWnd, CWnd)
    ON_WM_CREATE()
    ON_WM_KEYDOWN()
    ON_WM_DESTROY()
    ON_WM_KEYUP()
    ON_WM_NCCALCSIZE()
    ON_WM_KILLFOCUS()
    ON_WM_SETFOCUS()
    ON_WM_CLOSE()
    ON_WM_MOUSEWHEEL()
    ON_WM_SYSKEYDOWN()
END_MESSAGE_MAP()

BOOL CXYWnd::PreCreateWindow(CREATESTRUCT &cs)
{
    WNDCLASSA windowClass;
    HINSTANCE instance = AfxGetInstanceHandle();
    if (!::GetClassInfoA(instance, "QXY", &windowClass))
    {
        memset(&windowClass, 0, sizeof(windowClass));
        windowClass.style = CS_NOCLOSE;
        windowClass.lpszClassName = "QXY";
        windowClass.hCursor = NULL;
        windowClass.lpfnWndProc = ::DefWindowProcA;
        if (!AfxRegisterClass(&windowClass))
            FUN_0047a760("CCamWnd RegisterClass: failed");
    }
    cs.lpszClass = "QXY";
    cs.lpszName = "VIEW";
    if (cs.style != 0x56c70000)
        cs.style = 0x56000000;
    return CWnd::PreCreateWindow(cs);
}

// 0x00449760: grid size to rotation step.
int FUN_00449760()
{
    switch (g_qeglobals.d_gridsize)
    {
    case 1:
        return 1;
    case 2:
        return 2;
    case 4:
        return 5;
    case 8:
        return 15;
    case 16:
        return 30;
    case 32:
    case 64:
        return 45;
    default:
        return 90;
    }
}

int CXYWnd::OnCreate(LPCREATESTRUCT lpCreateStruct)
{
    if (Default() == -1)
        return -1;
    g_qeglobals.d_hwndXY = GetSafeHwnd();
    return 0;
}

extern "C" float FUN_00449a20(const float *v)
{
    return v[2] + v[1] + v[0];
}

float fDiff(float f1, float f2)
{
  if (f1 > f2)
    return f1 - f2;
  else
    return f2 - f1;
}

bool CXYWnd::ClipMode()
{
    return g_bClipMode;
}

bool CXYWnd::RogueClipMode()
{
    return g_bRogueClipMode;
}

bool CXYWnd::PointMode()
{
    return g_bPointMode;
}

void CXYWnd::SetPointMode(bool b)
{
    g_bPointMode = b;
    if (!b)
        g_nPointCount = 0;
}

void CXYWnd::OnKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags)
{
    reinterpret_cast<CXYWndMainProjection *>(g_pParentWnd)->OnKeyDown(nChar, nRepCnt, nFlags);
}

void CXYWnd::FUN_0044bc50(const char *name, int id)
{
    for (XYWndNode *node = field_e8.next; node; node = node->next)
    {
        if (node->field_00 == id)
        {
            node->field_04 = name;
            return;
        }
    }
    XYWndNode *tail = &field_e8;
    while (tail->next)
        tail = tail->next;
    tail->next = new XYWndNode(id, name);
}

void CXYWnd::FUN_0044be20()
{
    CString strActive;
    CString strName;
    if (m_mnuDrop.GetSafeHmenu())
        return;
    {
        m_mnuDrop.CreatePopupMenu();
        int nID = 0x5910;

        HMENU hSelect = ::CreateMenu();
        ::AppendMenu(hSelect, MF_STRING, 0x80d8, "Select Complete Tall");
        ::AppendMenu(hSelect, MF_STRING, 0x80d7, "Select Partial Tall");
        ::AppendMenu(hSelect, MF_STRING, 0x80da, "Select Touching");
        ::AppendMenu(hSelect, MF_STRING, 0x80f0, "Select Inside");
        ::AppendMenu(hSelect, MF_STRING, 0x816c, "Select Targetname");
        m_mnuDrop.AppendMenu(MF_POPUP, (UINT)hSelect, "Select");

        HMENU hPrefab = ::CreateMenu();
        ::AppendMenu(hPrefab, MF_STRING, 0x8195, "Enter Prefab");
        ::AppendMenu(hPrefab, MF_STRING, 0x8196, "Leave Prefab");
        m_mnuDrop.AppendMenu(MF_POPUP, (UINT)hPrefab, "Prefab");
        m_mnuDrop.AppendMenu(MF_SEPARATOR, nID++, "");

        m_mnuDrop.AppendMenu(MF_STRING, 0x810b, "Ungroup Entity");
        m_mnuDrop.AppendMenu(MF_STRING, 0x8113, "Make Structural");
        m_mnuDrop.AppendMenu(MF_STRING, 0x8112, "Make Detail");
        m_mnuDrop.AppendMenu(MF_STRING, 196, "Make Weapon Clip");
        m_mnuDrop.AppendMenu(MF_STRING, 197, "Make Non-Colliding");
        m_mnuDrop.AppendMenu(MF_SEPARATOR, nID++, "");

        m_mnuDrop.AppendMenu(MF_STRING, 0x81c7, "Make Split Coplanar Geo");
        m_mnuDrop.AppendMenu(MF_STRING, 0x81c8, "Make Don't Split Coplanar Geo");
        m_mnuDrop.AppendMenu(MF_SEPARATOR, nID++, "");

        HMENU menu = NULL;
        for (eclass_t *e = dword_012334dc; e; e = e->next)
        {
            strName = e->name;
            int n_ = strName.Find("_");
            if (n_ > 0)
            {
                CString strLeft = strName.Left(n_);
                CString strRight = strName.Right(strName.GetLength() - n_ - 1);
                if (strLeft == strActive)
                {
#line 1264
                    assert(menu);
                    FUN_0044bc50(strName, nID);
                    ::AppendMenu(menu, MF_STRING, nID++, strRight);
                }
                else
                {
                    if (menu)
                        m_mnuDrop.AppendMenu(MF_POPUP, (UINT)menu, strActive);
                    strActive = strLeft;
                    FUN_0044bc50(strName, nID);
                    menu = ::CreateMenu();
                    ::AppendMenu(menu, MF_STRING, nID++, strRight);
                }
            }
            else
            {
                if (menu)
                {
                    m_mnuDrop.AppendMenu(MF_POPUP, (UINT)menu, strActive);
                    menu = NULL;
                }
                strActive = "";
                m_mnuDrop.AppendMenu(MF_STRING, nID++, strName);
            }
        }
    }
}

void CXYWnd::HandleDrop()
{
    if (dword_01233b64->m_bRightClick)
    {
        if (!m_mnuDrop.GetSafeHmenu())
            FUN_0044be20();
        CPoint ptMouse;
        GetCursorPos(&ptMouse);
        m_mnuDrop.TrackPopupMenu(TPM_RIGHTBUTTON, ptMouse.x, ptMouse.y, this);
    }
}


void CXYWnd::XY_Init()
{
    m_vOrigin[0] = 0;
    m_vOrigin[1] = 20;
    m_vOrigin[2] = 46;
    m_fScale = 1;
}

void CXYWnd::SnapToPoint(int x, int y, float point[3])
{
    if (dword_01233b64->m_bNoClamp)
        XY_ToPoint(x, y, point);
    else
        XY_ToGridPoint(x, y, point);
}

void CXYWnd::XY_ToPoint(int x, int y, float point[3])
{
    float fx = x;
    float fy = y;
    float fw = m_nWidth;
    float fh = m_nHeight;
    if (m_nViewType == XY)
    {
        point[0] = m_vOrigin[0] + (fx - fw / 2) / m_fScale;
        point[1] = m_vOrigin[1] + (fy - fh / 2) / m_fScale;
    }
    else
    {
        if (m_nViewType == YZ)
            point[1] = m_vOrigin[1] + (fx - fw / 2) / m_fScale;
        else
            point[0] = m_vOrigin[0] + (fx - fw / 2) / m_fScale;
        point[2] = m_vOrigin[2] + (fy - fh / 2) / m_fScale;
    }
}

void CXYWnd::XY_ToGridPoint(int x, int y, float point[3])
{
    if (m_nViewType == XY)
    {
        point[0] = m_vOrigin[0] + (x - m_nWidth / 2) / m_fScale;
        point[1] = m_vOrigin[1] + (y - m_nHeight / 2) / m_fScale;
        point[0] = floor(point[0] / g_qeglobals.d_gridsize + 0.5) * g_qeglobals.d_gridsize;
        point[1] = floor(point[1] / g_qeglobals.d_gridsize + 0.5) * g_qeglobals.d_gridsize;
    }
    else if (m_nViewType == YZ)
    {
        point[1] = m_vOrigin[1] + (x - m_nWidth / 2) / m_fScale;
        point[2] = m_vOrigin[2] + (y - m_nHeight / 2) / m_fScale;
        point[1] = floor(point[1] / g_qeglobals.d_gridsize + 0.5) * g_qeglobals.d_gridsize;
        point[2] = floor(point[2] / g_qeglobals.d_gridsize + 0.5) * g_qeglobals.d_gridsize;
    }
    else
    {
        point[0] = m_vOrigin[0] + (x - m_nWidth / 2) / m_fScale;
        point[2] = m_vOrigin[2] + (y - m_nHeight / 2) / m_fScale;
        point[0] = floor(point[0] / g_qeglobals.d_gridsize + 0.5) * g_qeglobals.d_gridsize;
        point[2] = floor(point[2] / g_qeglobals.d_gridsize + 0.5) * g_qeglobals.d_gridsize;
    }
}

// Pick-ray start and direction for a view point (the head of Q3 XY_MouseDown).
void CXYWnd::FUN_0044c5c0(int x, int y, float origin[3], float dir[3])
{
    XY_ToPoint(x, y, origin);
    dir[0] = 0;
    dir[1] = 0;
    dir[2] = 0;
    if (m_nViewType == XY)
    {
        origin[2] = 131072;
        dir[2] = -1;
    }
    else if (m_nViewType == YZ)
    {
        origin[0] = 131072;
        dir[0] = -1;
    }
    else
    {
        origin[1] = 131072;
        dir[1] = -1;
    }
}

void CXYWnd::XY_MouseUp(int x, int y, int buttons)
{
    Drag_MouseUp(buttons);
    if (!m_bPress_selection)
        g_nUpdateBits = -1;
    m_nButtonstate = 0;
    while (ShowCursor(TRUE) < 0)
        ;
}

BOOL CXYWnd::DragDelta(int x, int y, float move[3])
{
    float xvec[3];
    float yvec[3];
    float delta[3];
    int i;

    xvec[0] = 1.0f / m_fScale;
    xvec[1] = xvec[2] = 0;
    yvec[1] = 1.0f / m_fScale;
    yvec[0] = yvec[2] = 0;

    for (i = 0; i < 3; i++)
    {
        delta[i] = (x - m_nPressx) * xvec[i] + (y - m_nPressy) * yvec[i];
        if (!dword_01233b64->m_bNoClamp)
            delta[i] = (float)(floor(delta[i] / g_qeglobals.d_gridsize + 0.5) * g_qeglobals.d_gridsize);
    }
    move[0] = delta[0] - m_vPressdelta[0];
    move[1] = delta[1] - m_vPressdelta[1];
    move[2] = delta[2] - m_vPressdelta[2];
    m_vPressdelta[0] = delta[0];
    m_vPressdelta[1] = delta[1];
    m_vPressdelta[2] = delta[2];

    if (move[0] || move[1] || move[2])
        return TRUE;
    return FALSE;
}

float (&CXYWnd::GetOrigin())[3]
{
    return m_vOrigin;
}

void CXYWnd::SetOrigin(float org[3])
{
    m_vOrigin[0] = org[0];
    m_vOrigin[1] = org[1];
    m_vOrigin[2] = org[2];
}

void FUN_00452ae0()
{
    g_bSwitch = !g_bSwitch;
    g_nUpdateBits |= 0x102;
}

void CXYWnd::FUN_00452c30()
{
    int nDim1 = (m_nViewType == YZ) ? 1 : 0;
    int nDim2 = (m_nViewType == XY) ? 1 : 2;
    m_vOrigin[nDim1] = 0;
    m_vOrigin[nDim2] = 0;
}

void CXYWnd::VectorCopyXY(float in[3], float out[3])
{
    if (m_nViewType == XY)
    {
        out[0] = in[0];
        out[1] = in[1];
    }
    else if (m_nViewType == XZ)
    {
        out[0] = in[0];
        out[2] = in[2];
    }
    else
    {
        out[1] = in[1];
        out[2] = in[2];
    }
}

bool CXYWnd::RotateMode()
{
    return g_bRotateMode;
}

bool CXYWnd::ScaleMode()
{
    return g_bScaleMode;
}

void CXYWnd::SetScaleMode(bool bMode)
{
    g_bScaleMode = bMode;
    RedrawWindow(NULL, NULL, RDW_INVALIDATE | RDW_ERASE | RDW_UPDATENOW);
}

// Retail one-byte RET bodies verified with MSVC 7.1. Original entry-point ownership/signatures remain provisional.
extern "C" void FUN_00452e20() {}

float (&CXYWnd::RotateOrigin())[3]
{
    return g_vRotateOrigin;
}

float (&CXYWnd::Rotation())[3]
{
    return g_vRotation;
}

void CXYWnd::OnKeyUp(UINT nChar, UINT nRepCnt, UINT nFlags)
{
    reinterpret_cast<CXYWndMainProjection *>(g_pParentWnd)->OnKeyUp(nChar);
}

void CXYWnd::OnNcCalcSize(BOOL bCalcValidRects, NCCALCSIZE_PARAMS *lpncsp)
{
    Default();
}

void CXYWnd::OnKillFocus(CWnd *pNewWnd)
{
    CWnd::OnKillFocus(pNewWnd);
    SendMessage(WM_NCACTIVATE, FALSE, 0);
}

void CXYWnd::OnSetFocus(CWnd *pOldWnd)
{
    CWnd::OnSetFocus(pOldWnd);
    SendMessage(WM_NCACTIVATE, TRUE, 0);
}

void CXYWnd::OnClose()
{
    Default();
}

BOOL CXYWnd::AreaSelectOK()
{
    if (g_bRotateMode)
        return false;
    return !g_bScaleMode;
}

BOOL CXYWnd::OnMouseWheel(UINT nFlags, short zDelta, CPoint pt)
{
    return reinterpret_cast<CXYWndMainProjection *>(g_pParentWnd)->OnMouseWheel(nFlags, zDelta, pt);
}

void CXYWnd::OnSysKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags)
{
    reinterpret_cast<CXYWndMainProjection *>(g_pParentWnd)->OnKeyDown(nChar, nRepCnt, nFlags);
}

extern "C" float FUN_004533d0(const float *a, const float *b)
{
    return a[1] * b[1] + a[0] * b[0];
}

extern "C" void FUN_004533e0(int *p)
{
    p[0] = 0;
    p[1] = 0;
    p[2] = 0;
    p[3] = 0;
}

XYWndNode::XYWndNode(int id, const char *name)
{
    next = NULL;
    field_00 = id;
    field_04 = name;
}

extern "C" void FUN_004535f0() {}
extern "C" void FUN_00453600() {}

XYWndNode::XYWndNode()
{
    field_00 = 0;
    next = NULL;
}
