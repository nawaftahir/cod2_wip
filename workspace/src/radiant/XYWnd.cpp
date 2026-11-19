// XYWnd.cpp: top-down/side 2D editor view. Q3Radiant XYWnd.cpp layout, retail order.
#include "stdafx.h"
#include <stddef.h>
#include <string.h>
#include <math.h>
#include "PrefsDlg.h"
#include "../universal/assertive.h"
#include "radiant_wnd.h"

#define W_XY 2

enum { YZ, XZ, XY };

struct brushdef_t;
struct brush_t
{
    brush_t *prev;
    brush_t *next;
    struct entityInst_t *owner;
    unsigned char pad0c[8];
    brushdef_t *def;
    unsigned char pad18[0xe];
    unsigned char hiddenBrush;
};

// Q3Radiant qeglobals_t view: the fields this file reads (base 0x10bcd28).
struct XYQEGlobals
{
    int d_showgrid;
    int d_gridsize;
    unsigned char pad0a[8];
    float d_new_brush_bottom[3];
    float d_new_brush_top[3];
    unsigned char pad0b[4];
    HWND d_hwndMain;
    unsigned char pad1[0x10];
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
class CClipPoint;
extern CClipPoint *g_pMovingClip;
extern brush_t g_brClipboard;
extern brush_t g_brUndo;

void FUN_0047a760(const char *format, ...);
void FUN_004592f0(brush_t *b);
void Brush_Free(brush_t *b);
extern brush_t g_brFrontSplits;
extern brush_t g_brBackSplits;
void FUN_00459210(brush_t *b, brush_t *list);
void Drag_MouseUp(int buttons);

// The three CMainFrame methods called through g_pParentWnd (same projection as TexWnd.cpp).
class CMainFrame
{
public:
    void OnKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags);
    void FUN_00417cf0();
    void SetStatusText(int nPane, const char *pText)
    {
        if (pText && nPane <= 5 && nPane > 0)
        {
            m_strStatus[nPane] = pText;
            FUN_00417cf0();
        }
    }

    unsigned char pad_00[0x7a4];
    CString m_strStatus[6];
};
void __stdcall FUN_004137d0(CMainFrame *self, UINT nChar);
struct CXYWndMainProjection
{
    BOOL OnMouseWheel(UINT nFlags, short zDelta, CPoint pt);
};
extern CMainFrame *g_pParentWnd;

// Q3Radiant CClipPoint: one placed point of the clip, point or path tools.
class CClipPoint
{
public:
    void Reset();
    void UpdatePointPtr();
    void SetPointPtr(float *p);
    void Set(bool b);

    float m_ptClip[3];
    float *m_pVec3;
    CPoint m_ptScreen;
    bool m_bSet;
};
typedef char ClipPointSize[(sizeof(CClipPoint) == 0x1c) ? 1 : -1];
extern CClipPoint g_PointPoints[512];
extern CClipPoint g_Clip1;
extern CClipPoint g_Clip2;
extern CClipPoint g_Clip3;
extern CClipPoint *g_pMovingPoint;
extern float tdp[3];
extern CString g_strStatus;
extern int pressx;
extern int pressy;

extern CPrefsDlg *dword_01233b64;
struct eclass_t
{
    eclass_t *next;
    char *name;
};
extern eclass_t *dword_012334dc;



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
    ON_WM_LBUTTONDOWN()
    ON_WM_MBUTTONDOWN()
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

// 0x00449800: Q3Radiant WXY_Print.
void WXY_Print()
{
    PRINTDLG pd;
    DOCINFO di;

    memset(&pd, 0, sizeof(pd));
    pd.lStructSize = sizeof(pd);
    pd.hwndOwner = g_qeglobals.d_hwndXY;
    pd.Flags = PD_RETURNDC;
    pd.hInstance = 0;
    if (!PrintDlg(&pd) || !pd.hDC)
    {
        MessageBox(g_qeglobals.d_hwndMain, "Could not PrintDlg()", "QE4 Print Error", MB_ICONERROR);
        return;
    }

    memset(&di, 0, sizeof(di));
    di.cbSize = sizeof(di);
    di.lpszDocName = "QE4";
    if (StartDoc(pd.hDC, &di) <= 0)
    {
        MessageBox(g_qeglobals.d_hwndMain, "Could not StartDoc()", "QE4 Print Error", MB_ICONERROR);
        return;
    }

    if (StartPage(pd.hDC) <= 0)
    {
        MessageBox(g_qeglobals.d_hwndMain, "Could not StartPage()", "QE4 Print Error", MB_ICONERROR);
        return;
    }

    {
        RECT r;
        GetWindowRect(g_qeglobals.d_hwndXY, &r);
        int bmwidth = r.right - r.left;
        int bmheight = r.bottom - r.top;
        int pwidth = GetDeviceCaps(pd.hDC, PHYSICALWIDTH) - GetDeviceCaps(pd.hDC, PHYSICALOFFSETX);
        int pheight = GetDeviceCaps(pd.hDC, PHYSICALHEIGHT) - GetDeviceCaps(pd.hDC, PHYSICALOFFSETY);
        HDC hdcXY = GetDC(g_qeglobals.d_hwndXY);
        StretchBlt(pd.hDC, 0, 0, pwidth, pheight, hdcXY, 0, 0, bmwidth, bmheight, SRCCOPY);
        ReleaseDC(g_qeglobals.d_hwndXY, hdcXY);
    }

    if (EndPage(pd.hDC) <= 0)
    {
        MessageBox(g_qeglobals.d_hwndMain, "QE4 Print Error", "Could not EndPage()", MB_ICONERROR);
        return;
    }

    if (EndDoc(pd.hDC) <= 0)
    {
        MessageBox(g_qeglobals.d_hwndMain, "QE4 Print Error", "Could not EndDoc()", MB_ICONERROR);
        return;
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

// retail calls it from OnLButtonDown 0x449c12
#pragma auto_inline(off)
// 0x00449a30: Q3Radiant CXYWnd::DropClipPoint.
void CXYWnd::DropClipPoint(UINT nFlags, CPoint point)
{
    CRect rctZ;
    GetClientRect(rctZ);
    if (g_pMovingClip)
    {
        SetCapture();
        SnapToPoint(point.x, rctZ.Height() - 1 - point.y, g_pMovingClip->m_ptClip);
    }
    else
    {
        float *pPt = NULL;
        if (g_Clip1.m_bSet == false)
        {
            pPt = g_Clip1.m_ptClip;
            g_Clip1.Set(true);
            g_Clip1.m_ptScreen = point;
        }
        else if (g_Clip2.m_bSet == false)
        {
            pPt = g_Clip2.m_ptClip;
            g_Clip2.Set(true);
            g_Clip2.m_ptScreen = point;
        }
        else if (g_Clip3.m_bSet == false)
        {
            pPt = g_Clip3.m_ptClip;
            g_Clip3.Set(true);
            g_Clip3.m_ptScreen = point;
        }
        else
        {
            RetainClipMode(true);
            pPt = g_Clip1.m_ptClip;
            g_Clip1.Set(true);
            g_Clip1.m_ptScreen = point;
        }
        SnapToPoint(point.x, rctZ.Height() - 1 - point.y, pPt);
    }
    g_nUpdateBits |= 0x102;
}
#pragma auto_inline(on)

// 0x00449b80: Q3Radiant CXYWnd::AddPointPoint.
void FUN_00449b80(float *pVec)
{
    g_PointPoints[g_nPointCount].Set(true);
    g_PointPoints[g_nPointCount].m_ptClip[0] = pVec[0];
    g_PointPoints[g_nPointCount].m_ptClip[1] = pVec[1];
    g_PointPoints[g_nPointCount].m_ptClip[2] = pVec[2];
    g_PointPoints[g_nPointCount].SetPointPtr(pVec);
    g_nPointCount++;
    g_nUpdateBits |= 0x102;
}

extern HWND dword_010bcd54;
// Only the active XY window slot of CMainFrame is used here.
struct CMainFrameXYView
{
    unsigned char pad[0x7e0];
    CXYWnd *m_pActiveXY;
};

// 0x00449bd0: Q3Radiant CXYWnd::OnLButtonDown.
void CXYWnd::OnLButtonDown(UINT nFlags, CPoint point)
{
    CMainFrameXYView *frame = reinterpret_cast<CMainFrameXYView *>(g_pParentWnd);
    if (frame->m_pActiveXY)
        frame->m_pActiveXY->m_bActive = false;
    frame->m_pActiveXY = this;
    if (this)
        m_bActive = true;
    if (ClipMode() && !RogueClipMode())
        DropClipPoint(nFlags, point);
    else
        OriginalButtonDown(nFlags, point);
}

// 0x00449c40
void CXYWnd::OnMButtonDown(UINT nFlags, CPoint point)
{
    OriginalButtonDown(nFlags, point);
}

// 0x00449c60: Q3Radiant CleanList.
void CleanList(brush_t *list)
{
    brush_t *b = list->next;
    while (b != NULL && b != list)
    {
        brush_t *next = b->next;
        Brush_Free(b);
        b = next;
    }
}

// 0x00449ff0: moves every brush of a list into another list.
void FUN_00449ff0(brush_t *to, brush_t *from)
{
    brush_t *b = from->next;
    while (b != NULL && b != from)
    {
        brush_t *next = b->next;
        FUN_004592f0(b);
        FUN_00459210(b, to);
        b = next;
    }
}

// 0x0044a030: Q3Radiant CXYWnd::OnRButtonDown.
void CXYWnd::OnRButtonDown(UINT nFlags, CPoint point)
{
    CMainFrameXYView *frame = reinterpret_cast<CMainFrameXYView *>(g_pParentWnd);
    if (frame->m_pActiveXY)
        frame->m_pActiveXY->m_bActive = false;
    frame->m_pActiveXY = this;
    if (this)
        m_bActive = true;
    m_ptDown = point;
    m_bRButtonDown = true;
    if (dword_01233b64->m_nMouseButtons == 3 && (GetKeyState(VK_CONTROL) & 0x8000))
    {
        if (!ClipMode())
        {
            SetClipMode(true);
            g_bRogueClipMode = true;
        }
        DropClipPoint(nFlags, point);
        return;
    }
    OriginalButtonDown(nFlags, point);
}

// 0x0044a0d0: Q3Radiant CXYWnd::OnLButtonUp.
void CXYWnd::OnLButtonUp(UINT nFlags, CPoint point)
{
    if (ClipMode())
    {
        if (g_pMovingClip)
        {
            ReleaseCapture();
            g_pMovingClip = NULL;
        }
    }
    OriginalButtonUp(nFlags, point);
}

// 0x0044a130
void CXYWnd::OnMButtonUp(UINT nFlags, CPoint point)
{
    OriginalButtonUp(nFlags, point);
}

// 0x0044a170: Q3Radiant CXYWnd::OnRButtonUp.
void CXYWnd::OnRButtonUp(UINT nFlags, CPoint point)
{
    m_bRButtonDown = false;
    if (point == m_ptDown)
    {
        bool bGo = true;
        if (GetKeyState(VK_MENU) & 0x8000)
            bGo = false;
        if (GetKeyState(VK_CONTROL) & 0x8000)
            bGo = false;
        if (GetKeyState(VK_SHIFT) & 0x8000)
            bGo = false;
        if (bGo)
            HandleDrop();
    }
    OriginalButtonUp(nFlags, point);
}

// 0x0044a210: Q3Radiant CXYWnd::OriginalButtonDown.
void CXYWnd::OriginalButtonDown(UINT nFlags, CPoint point)
{
    CRect rctZ;
    GetClientRect(rctZ);
    SetWindowPos(&wndTop, 0, 0, 0, 0, SWP_NOMOVE | SWP_NOSIZE);
    if (::GetTopWindow(dword_010bcd54) != GetSafeHwnd())
        ::BringWindowToTop(GetSafeHwnd());
    SetFocus();
    SetCapture();
    XY_MouseDown(point.x, rctZ.Height() - 1 - point.y, nFlags);
    m_nScrollFlags = nFlags;
}

// 0x0044a2a0: Q3Radiant CXYWnd::OriginalButtonUp.
void CXYWnd::OriginalButtonUp(UINT nFlags, CPoint point)
{
    CRect rctZ;
    GetClientRect(rctZ);
    XY_MouseUp(point.x, rctZ.Height() - 1 - point.y, nFlags);
    if (!(nFlags & (MK_LBUTTON | MK_RBUTTON | MK_MBUTTON)))
        ReleaseCapture();
}

float fDiff(float f1, float f2)
{
  if (f1 > f2)
    return f1 - f2;
  else
    return f2 - f1;
}

// 0x0044a2f0: Q3Radiant CXYWnd::OnMouseMove.
void CXYWnd::OnMouseMove(UINT nFlags, CPoint point)
{
    m_ptDown.x = 0;
    m_ptDown.y = 0;

    if (dword_01233b64->m_bChaseMouse == TRUE && GetCapture() == this
        && (point.x < 32.0f || point.y < 32.0f || point.x > m_nWidth - 32.0f || point.y > m_nHeight - 32.0f))
    {
        m_ptDragAdj.x = 0;
        m_ptDragAdj.y = 0;
        if (point.x < 0 || point.y < 0 || point.x > m_nWidth || point.y > m_nHeight)
        {
            int dx = 0;
            int dy = 0;
            if (point.x < 0)
                dx = -point.x;
            else if (point.x > m_nWidth)
                dx = m_nWidth - point.x;
            if (point.y < 0)
                dy = -point.y;
            else if (point.y > m_nHeight)
                dy = m_nHeight - point.y;
            point.x += dx;
            point.y += dy;
            CPoint cursor;
            GetCursorPos(&cursor);
            SetCursorPos(cursor.x + dx, cursor.y + dy);
        }
        if (point.x < 32.0f)
            m_ptDragAdj.x = (int)(32.0f - point.x);
        else if (point.x > m_nWidth - 32.0f)
            m_ptDragAdj.x = (int)(m_nWidth - 32.0f - point.x);
        if (point.y < 32.0f)
            m_ptDragAdj.y = (int)(32.0f - point.y);
        else if (point.y > m_nHeight - 32.0f)
            m_ptDragAdj.y = (int)(m_nHeight - 32.0f - point.y);
        if (m_nTimerID == -1)
        {
            m_nTimerID = SetTimer(100, 50, NULL);
            m_ptDrag = point;
            m_ptDragTotal.x = 0;
            m_ptDragTotal.y = 0;
        }
        return;
    }
    if (m_nTimerID != -1)
    {
        KillTimer(m_nTimerID);
        pressx -= m_ptDragTotal.x;
        pressy += m_ptDragTotal.y;
        m_nTimerID = -1;
    }

    bool bCrossHair = false;
    if (m_bRButtonDown)
    {
        XY_MouseMoved(point.x, m_nHeight - 1 - point.y, nFlags);
    }
    else
    {
        tdp[0] = tdp[1] = tdp[2] = 0;
        SnapToPoint(point.x, m_nHeight - 1 - point.y, tdp);

        g_strStatus.Format("x:: %.1f  y:: %.1f  z:: %.1f", tdp[0], tdp[1], tdp[2]);
        g_pParentWnd->SetStatusText(1, g_strStatus);

        if (!PointMode())
        {
            if (!ClipMode())
            {
                XY_MouseMoved(point.x, m_nHeight - 1 - point.y, nFlags);
            }
            else if (g_pMovingClip && GetCapture() == this)
            {
                bCrossHair = true;
                SnapToPoint(point.x, m_nHeight - 1 - point.y, g_pMovingClip->m_ptClip);
                g_nUpdateBits |= 0x102;
            }
            else
            {
                g_pMovingClip = NULL;
                int nDim1 = (m_nViewType == YZ) ? 1 : 0;
                int nDim2 = (m_nViewType == XY) ? 1 : 2;
                if (g_Clip1.m_bSet)
                {
                    if (fDiff(g_Clip1.m_ptClip[nDim1], tdp[nDim1]) < 3 && fDiff(g_Clip1.m_ptClip[nDim2], tdp[nDim2]) < 3)
                    {
                        bCrossHair = true;
                        g_pMovingClip = &g_Clip1;
                    }
                }
                if (g_Clip2.m_bSet)
                {
                    if (fDiff(g_Clip2.m_ptClip[nDim1], tdp[nDim1]) < 3 && fDiff(g_Clip2.m_ptClip[nDim2], tdp[nDim2]) < 3)
                    {
                        bCrossHair = true;
                        g_pMovingClip = &g_Clip2;
                    }
                }
                if (g_Clip3.m_bSet)
                {
                    if (fDiff(g_Clip3.m_ptClip[nDim1], tdp[nDim1]) < 3 && fDiff(g_Clip3.m_ptClip[nDim2], tdp[nDim2]) < 3)
                    {
                        g_pMovingClip = &g_Clip3;
                        SetCursor(LoadCursor(NULL, IDC_CROSS));
                        return;
                    }
                }
                if (!bCrossHair)
                    XY_MouseMoved(point.x, m_nHeight - 1 - point.y, nFlags);
            }
        }
        else if (g_pMovingPoint && GetCapture() == this)
        {
            bCrossHair = true;
            SnapToPoint(point.x, m_nHeight - 1 - point.y, g_pMovingPoint->m_ptClip);
            g_pMovingPoint->UpdatePointPtr();
            g_nUpdateBits |= 0x102;
        }
        else
        {
            g_pMovingPoint = NULL;
            int nDim1 = (m_nViewType == YZ) ? 1 : 0;
            int nDim2 = (m_nViewType == XY) ? 1 : 2;
            for (int n = 0; n < g_nPointCount; n++)
            {
                if (fDiff(g_PointPoints[n].m_ptClip[nDim1], tdp[nDim1]) < 3 && fDiff(g_PointPoints[n].m_ptClip[nDim2], tdp[nDim2]) < 3)
                {
                    bCrossHair = true;
                    g_pMovingPoint = &g_PointPoints[n];
                }
            }
        }
    }
    SetCursor(LoadCursor(NULL, bCrossHair ? IDC_CROSS : IDC_ARROW));
}

// 0x0044abc0 / 0x0044abf0: Q3Radiant CXYWnd::RetainClipMode / SetClipMode.
void CXYWnd::RetainClipMode(bool bMode)
{
    bool bSave = g_bRogueClipMode;
    SetClipMode(bMode);
    g_bRogueClipMode = (bMode == true) ? bSave : false;
}

void CXYWnd::SetClipMode(bool bMode)
{
    g_bClipMode = bMode;
    g_bRogueClipMode = false;
    if (bMode)
    {
        g_Clip1.Reset();
        g_Clip2.Reset();
        g_Clip3.Reset();
        CleanList(&g_brFrontSplits);
        CleanList(&g_brBackSplits);
    }
    else
    {
        if (g_pMovingClip)
        {
            ReleaseCapture();
            g_pMovingClip = NULL;
        }
        CleanList(&g_brFrontSplits);
        CleanList(&g_brBackSplits);
        g_nUpdateBits |= 0x102;
    }
    g_brFrontSplits.next = &g_brFrontSplits;
    g_brBackSplits.next = &g_brBackSplits;
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
    g_pParentWnd->OnKeyDown(nChar, nRepCnt, nFlags);
}

XYWndNode *CXYWnd::FUN_0044bc30(int id)
{
    for (XYWndNode *node = field_e8.next; node; node = node->next)
    {
        if (node->field_00 == id)
            return node;
    }
    return NULL;
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

// view of splines.h idPointListInterface (vtable only)
class idPointListInterface
{
public:
    virtual ~idPointListInterface() {}
    virtual int numPoints() { return 0; }
    virtual void addPoint(const float x, const float y, const float z) {}
    virtual void addPoint(const float *v) {}
};
extern brush_t selected_brushes;
extern int dword_011298b0;
extern idPointListInterface *dword_011298b4;
extern int dword_010bcd2c;
extern int dword_005909f8;
extern bool byte_012334b8;
extern bool byte_012334ba;
extern float dword_0109c528[3];
extern float dword_01139e54[2];
void Sys_GetCursorPos(int *x, int *y);
void FUN_0046e4a0();
void FUN_00470c50(float *mid);
void FUN_0046fd50(float *move, int snap);
void FUN_0046fe50();
void FUN_004433b0();
void Undo_GeneralStart(char *op);
void Undo_AddBrushList(brush_t *list);
void FUN_00443f80(brush_t *list);
void Undo_End();
void FUN_0046fbe0(int b);
void FUN_0046f0b0(brush_t *b, int a, int c, int d);
void FUN_0046ddc0();
float FUN_00407800(float y, float x);
struct XYPlane
{
    float normal[3];
    double dist;
    int type;
};
void FUN_0044c620(int a0, int a1, int a2, int a3, XYPlane *planes);
void FUN_00460fe0(void (*cb)(int, int, int, int, XYPlane *), int x, int y, float *right, float *up, float *origin, float *dir);
void FUN_004623e0(int buttons, int x, int y, float *origin, float *dir);
struct XYWorldEntity
{
    unsigned char pad[8];
    void *field_08;
};
extern XYWorldEntity *dword_012334ec;
extern bool g_bCrossHairs;
extern bool byte_0112993c;
extern bool byte_0112993d;
brush_t *FUN_00457ce0(void *owner, void *texdef);
void FUN_00457dd0(float *mins, float *maxs, brush_t *b, int flag);
void FUN_0045a220(brush_t *b, int flag);
void FUN_00475350();
void Sys_MarkMapModified();
void FUN_004671b0(brush_t *b, void *entity);
brush_t *FUN_00458440(brush_t *b, void *owner);
void FUN_0045b310(brushdef_t *def, float *mins, float *maxs);
extern unsigned char texdef_01128da8[];
void Sys_Printf(const char *fmt, ...);
struct CMainFrameCamProjection
{
    unsigned char pad[0x78c];
    CCamWnd *m_pCamWnd;
};

// 0x0044c620: drag-select volume callback, four side planes from the rectangle corners.
static void PlaneFromEdge(XYPlane *pl, const float *dir, const float *a, const float *b)
{
    float edge[3];
    edge[0] = a[0] - b[0];
    edge[1] = a[1] - b[1];
    edge[2] = a[2] - b[2];
    pl->normal[0] = edge[1] * dir[2] - edge[2] * dir[1];
    pl->normal[1] = edge[2] * dir[0] - edge[0] * dir[2];
    pl->normal[2] = edge[0] * dir[1] - edge[1] * dir[0];
    pl->dist = a[0] * pl->normal[0] + a[2] * pl->normal[2] + a[1] * pl->normal[1];
    pl->type = -1;
}

void FUN_0044c620(int a0, int a1, int a2, int a3, XYPlane *planes)
{
    float origin[4][3];
    float dir[3];
    int lo0 = (a0 < a2) ? a0 : a2;
    int hi0 = a0 - lo0 + a2;
    int lo1 = (a1 < a3) ? a1 : a3;
    int hi1 = a1 - lo1 + a3;
    CXYWnd *xy = reinterpret_cast<CMainFrameXYView *>(g_pParentWnd)->m_pActiveXY;

    if (xy->m_nViewType == 1)
    {
        xy->FUN_0044c5c0(lo1, lo0, origin[0], dir);
        xy->FUN_0044c5c0(lo1, hi0, origin[1], dir);
        xy->FUN_0044c5c0(hi1, hi0, origin[2], dir);
        xy->FUN_0044c5c0(hi1, lo0, origin[3], dir);
    }
    else
    {
        xy->FUN_0044c5c0(lo1, lo0, origin[0], dir);
        xy->FUN_0044c5c0(hi1, lo0, origin[1], dir);
        xy->FUN_0044c5c0(hi1, hi0, origin[2], dir);
        xy->FUN_0044c5c0(lo1, hi0, origin[3], dir);
    }
    PlaneFromEdge(&planes[0], dir, origin[0], origin[3]);
    PlaneFromEdge(&planes[1], dir, origin[1], origin[0]);
    PlaneFromEdge(&planes[2], dir, origin[2], origin[1]);
    PlaneFromEdge(&planes[3], dir, origin[3], origin[2]);
}

// 0x0044c8a0: Q3Radiant CXYWnd::XY_MouseDown plus the CoD2 alt-click move/clone paths.
void CXYWnd::XY_MouseDown(int x, int y, int buttons)
{
    float point[3];
    float origin[3], dir[3], right[3], up[3];
    int nMouseButton = dword_01233b64->m_nMouseButtons == 2 ? MK_RBUTTON : MK_MBUTTON;

    m_nButtonstate = buttons;
    m_nPressx = x;
    m_nPressy = y;
    m_vPressdelta[0] = 0;
    m_vPressdelta[1] = 0;
    m_vPressdelta[2] = 0;

    FUN_0044c5c0(x, y, origin, dir);
    XY_ToPoint(x, y, point);

    float fScale = 1 / m_fScale;
    if (m_nViewType == 2)
    {
        right[0] = fScale;
        right[1] = 0;
        right[2] = 0;
        up[0] = 0;
        up[1] = fScale;
        up[2] = 0;
    }
    else if (m_nViewType == 0)
    {
        right[1] = fScale;
        right[2] = 0;
        right[0] = 0;
        up[0] = 0;
        up[2] = fScale;
        up[1] = 0;
    }
    else
    {
        right[0] = fScale;
        right[2] = 0;
        right[1] = 0;
        up[0] = 0;
        up[2] = fScale;
        up[1] = 0;
    }

    m_bPress_selection = (selected_brushes.next != &selected_brushes);
    GetCursorPos(&m_ptCursor);

    if (buttons == (MK_CONTROL | nMouseButton) && (GetAsyncKeyState(VK_MENU) & 0x8000))
    {
        if (selected_brushes.next == &selected_brushes)
            return;
        FUN_0046e4a0();
        float mid[3], dst[3], move[3];
        FUN_00470c50(mid);
        dst[0] = mid[0];
        dst[1] = mid[1];
        dst[2] = mid[2];
        SnapToPoint(x, y, dst);
        move[0] = dst[0] - mid[0];
        move[1] = dst[1] - mid[1];
        move[2] = dst[2] - mid[2];
        FUN_0046fd50(move, 0);
        g_nUpdateBits = -1;
        return;
    }

    if ((GetAsyncKeyState(VK_MENU) & 0x8000) && (buttons == (MK_LBUTTON | MK_CONTROL) || buttons == (MK_SHIFT | nMouseButton))
        && dword_011298b0 != 4)
    {
        if (selected_brushes.next == &selected_brushes)
            return;
        FUN_0046e4a0();
        brush_t *single = NULL;
        if (buttons & MK_SHIFT)
        {
            if (selected_brushes.next->next != &selected_brushes)
            {
                Sys_Printf("can only alt + shift + middle click if a single brush is selected\n");
                return;
            }
            single = selected_brushes.next;
        }
        float mid[3], dst[3], move[3];
        FUN_00470c50(mid);
        int save = dword_010bcd2c;
        dword_010bcd2c = 0;
        FUN_0046fe50();
        dword_010bcd2c = save;
        FUN_004433b0();
        Undo_GeneralStart("duplicate");
        Undo_AddBrushList(&selected_brushes);
        dst[0] = mid[0];
        dst[1] = mid[1];
        dst[2] = mid[2];
        SnapToPoint(x, y, dst);
        move[0] = dst[0] - mid[0];
        move[1] = dst[1] - mid[1];
        move[2] = dst[2] - mid[2];
        FUN_0046fd50(move, 0);
        if (single)
        {
#line 1614
            assert(selected_brushes.next != &selected_brushes);
            brush_t *clone = selected_brushes.next;
            FUN_0046fbe0(1);
            FUN_0046f0b0(single, 1, 0, 0);
            FUN_0046f0b0(clone, 1, 0, 0);
            FUN_0046ddc0();
        }
        FUN_00443f80(&selected_brushes);
        Undo_End();
        g_nUpdateBits = -1;
        return;
    }

    if (buttons == MK_LBUTTON || buttons == (MK_LBUTTON | MK_SHIFT) || buttons == (MK_LBUTTON | MK_CONTROL)
        || buttons == (MK_LBUTTON | MK_CONTROL | MK_SHIFT)
        || ((buttons == MK_RBUTTON || buttons == (MK_RBUTTON | MK_SHIFT)) && (GetAsyncKeyState(VK_MENU) & 0x8000)))
    {
        if (dword_011298b0 == 8)
        {
            XY_ToGridPoint(x, y, point);
            if (dword_011298b4)
                dword_011298b4->addPoint(point[0], point[1], point[2]);
            return;
        }
        int nView = (m_nViewType == 2) ? 2 : (m_nViewType == 0) ? 0x400 : 0x200;
        byte_012334b8 = (nView == dword_005909f8);
        dword_005909f8 = nView;
        FUN_00460fe0(FUN_0044c620, x, y, right, up, origin, dir);
        return;
    }

    CMainFrameCamProjection *frame = reinterpret_cast<CMainFrameCamProjection *>(g_pParentWnd);
    if (m_nButtonstate == (MK_CONTROL | nMouseButton))
    {
        VectorCopyXY(point, frame->m_pCamWnd->m_Camera.origin);
        g_nUpdateBits |= 5;
    }

    if ((dword_01233b64->m_nMouseButtons == 3 && m_nButtonstate == MK_MBUTTON)
        || (dword_01233b64->m_nMouseButtons == 2 && m_nButtonstate == (MK_SHIFT | MK_CONTROL | MK_RBUTTON)))
    {
        CameraState &cam = frame->m_pCamWnd->m_Camera;
        point[0] -= cam.origin[0];
        point[1] -= cam.origin[1];
        point[2] -= cam.origin[2];
        int n1 = (m_nViewType == 2) ? 1 : 2;
        int n2 = (m_nViewType == 0) ? 1 : 0;
        int nAngle = (m_nViewType == 2) ? 1 : 0;
        if (point[n1] || point[n2])
        {
            cam.angles[nAngle] = FUN_00407800(point[n1], point[n2]) * (180 / 3.14159265358979323846f);
            g_nUpdateBits |= 0x104;
        }
    }

    if (m_nButtonstate == (MK_SHIFT | nMouseButton))
    {
        if (RotateMode() || byte_012334ba)
        {
            SnapToPoint(x, y, point);
            VectorCopyXY(point, g_vRotateOrigin);
            if (byte_012334ba)
            {
                dword_0109c528[0] = point[0];
                dword_0109c528[1] = point[1];
                dword_0109c528[2] = point[2];
            }
            g_nUpdateBits |= 2;
            return;
        }
        SnapToPoint(x, y, point);
        if (m_nViewType == 2)
        {
            dword_01139e54[0] = point[0];
            dword_01139e54[1] = point[1];
        }
        else if (m_nViewType == 0)
        {
            dword_01139e54[0] = point[1];
            dword_01139e54[1] = point[2];
        }
        else
        {
            dword_01139e54[0] = point[0];
            dword_01139e54[1] = point[2];
        }
        g_nUpdateBits |= 0xc;
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

// 0x0044d0c0: Q3Radiant CXYWnd::NewBrushDrag.
void CXYWnd::NewBrushDrag(int x, int y)
{
    float mins[3], maxs[3], junk[3];
    int i;
    float temp;

    if (!DragDelta(x, y, junk))
        return;

    int nDim = (m_nViewType == XY) ? 2 : (m_nViewType == YZ) ? 0 : 1;

    SnapToPoint(m_nPressx, m_nPressy, mins);
    mins[nDim] = g_qeglobals.d_gridsize * ((int)(g_qeglobals.d_new_brush_bottom[nDim] / g_qeglobals.d_gridsize));
    SnapToPoint(x, y, maxs);
    maxs[nDim] = g_qeglobals.d_gridsize * ((int)(g_qeglobals.d_new_brush_top[nDim] / g_qeglobals.d_gridsize));
    if (maxs[nDim] <= mins[nDim])
        maxs[nDim] = mins[nDim] + g_qeglobals.d_gridsize;

    for (i = 0; i < 3; i++)
    {
        if (mins[i] == maxs[i])
            return;
        if (mins[i] > maxs[i])
        {
            temp = mins[i];
            mins[i] = maxs[i];
            maxs[i] = temp;
        }
    }

    if (selected_brushes.next == &selected_brushes)
    {
        brush_t *n = FUN_00457ce0(NULL, texdef_01128da8);
        FUN_00457dd0(mins, maxs, n, 0);
        if (!n)
            return;
        FUN_0045a220(n, 1);
        if (dword_011298b0 == 1 || dword_011298b0 == 2)
            FUN_00475350();
        Sys_MarkMapModified();
        (*(unsigned short *)((char *)n + 0x42))++;
        FUN_004671b0(n, dword_012334ec->field_08);
        FUN_00459210(FUN_00458440(n, dword_012334ec), &selected_brushes);
    }
    else
    {
        FUN_0045b310(selected_brushes.next->def, mins, maxs);
    }

    float vSize[3];
    vSize[0] = maxs[0] - mins[0];
    vSize[1] = maxs[1] - mins[1];
    vSize[2] = maxs[2] - mins[2];
    g_strStatus.Format("Size X:: %.1f  Y:: %.1f  Z:: %.1f", vSize[0], vSize[1], vSize[2]);
    g_pParentWnd->SetStatusText(2, g_strStatus);
    g_nUpdateBits |= 3;
}

// 0x0044d320: Q3Radiant CXYWnd::XY_MouseMoved.
void CXYWnd::XY_MouseMoved(int x, int y, int buttons)
{
    float point[3];
    float origin[3], dir[3];

    if (!m_nButtonstate)
    {
        if (g_bCrossHairs)
        {
            ::ShowCursor(FALSE);
            g_nUpdateBits |= 6;
            ::ShowCursor(TRUE);
        }
        return;
    }

    if (m_nButtonstate == MK_LBUTTON && !m_bPress_selection && dword_011298b0 == 0)
    {
        NewBrushDrag(x, y);
        return;
    }

    if (!(m_nButtonstate & MK_LBUTTON) && (m_nButtonstate != (MK_RBUTTON | MK_SHIFT) || !(GetAsyncKeyState(VK_MENU) & 0x8000)))
    {
        int nMouseButton = dword_01233b64->m_nMouseButtons == 2 ? MK_RBUTTON : MK_MBUTTON;
        CMainFrameCamProjection *frame = reinterpret_cast<CMainFrameCamProjection *>(g_pParentWnd);

        if (dword_011298b0 == 10 && m_nButtonstate == MK_RBUTTON && (GetAsyncKeyState(VK_MENU) & 0x8000))
        {
            FUN_0044c5c0(x, y, origin, dir);
            FUN_004623e0(buttons, x, y, origin, dir);
            g_nUpdateBits |= 0x10c;
            return;
        }

        if (m_nButtonstate == (MK_CONTROL | nMouseButton) && !(GetAsyncKeyState(VK_MENU) & 0x8000))
        {
            SnapToPoint(x, y, point);
            VectorCopyXY(point, frame->m_pCamWnd->m_Camera.origin);
            g_nUpdateBits |= 5;
            return;
        }

        if (m_nButtonstate == (MK_SHIFT | nMouseButton))
        {
            if (RotateMode() || byte_012334ba)
            {
                SnapToPoint(x, y, point);
                VectorCopyXY(point, g_vRotateOrigin);
                if (byte_012334ba)
                {
                    dword_0109c528[0] = point[0];
                    dword_0109c528[1] = point[1];
                    dword_0109c528[2] = point[2];
                }
                g_nUpdateBits |= 2;
                return;
            }
            SnapToPoint(x, y, point);
            if (m_nViewType == XY)
            {
                dword_01139e54[0] = point[0];
                dword_01139e54[1] = point[1];
            }
            else if (m_nViewType == YZ)
            {
                dword_01139e54[0] = point[1];
                dword_01139e54[1] = point[2];
            }
            else
            {
                dword_01139e54[0] = point[0];
                dword_01139e54[1] = point[2];
            }
            g_nUpdateBits |= 0xc;
            return;
        }

        if ((dword_01233b64->m_nMouseButtons == 3 && m_nButtonstate == MK_MBUTTON)
            || (dword_01233b64->m_nMouseButtons == 2 && m_nButtonstate == (MK_SHIFT | MK_CONTROL | MK_RBUTTON)))
        {
            CameraState &cam = frame->m_pCamWnd->m_Camera;
            SnapToPoint(x, y, point);
            point[0] -= cam.origin[0];
            point[1] -= cam.origin[1];
            point[2] -= cam.origin[2];
            int n1 = (m_nViewType == XY) ? 1 : 2;
            int n2 = (m_nViewType == YZ) ? 1 : 0;
            int nAngle = (m_nViewType == XY) ? 1 : 0;
            if (point[n1] || point[n2])
            {
                cam.angles[nAngle] = FUN_00407800(point[n1], point[n2]) * (180 / 3.14159265358979323846f);
                g_nUpdateBits |= 0x104;
            }
            return;
        }

        if (m_nButtonstate == MK_RBUTTON)
        {
            int cx, cy;
            Sys_GetCursorPos(&cx, &cy);
            if (cx != m_ptCursor.x || cy != m_ptCursor.y)
            {
                int nDim1 = (m_nViewType == YZ) ? 1 : 0;
                int nDim2 = (m_nViewType == XY) ? 1 : 2;
                m_vOrigin[nDim1] -= (cx - m_ptCursor.x) / m_fScale;
                m_vOrigin[nDim2] += (cy - m_ptCursor.y) / m_fScale;
                SetCursorPos(m_ptCursor.x, m_ptCursor.y);
                ::ShowCursor(FALSE);
                g_nUpdateBits |= 6;
            }
        }
        return;
    }

    if (!byte_0112993c && !byte_0112993d)
    {
        FUN_0044c5c0(x, y, origin, dir);
        FUN_004623e0(buttons, x, y, origin, dir);
        g_nUpdateBits |= 0x10c;
        return;
    }
    switch (dword_011298b0)
    {
    case 14:
    case 15:
    case 16:
    case 17:
        byte_0112993c = false;
        byte_0112993d = false;
        break;
    default:
        if (buttons != 5 && buttons != 13)
        {
            if (buttons != 9 || !(GetAsyncKeyState(VK_MENU) & 0x8000))
            {
                byte_0112993c = false;
                byte_0112993d = false;
                return;
            }
        }
        XY_MouseDown(x, y, buttons);
    }
}

bool FUN_0044f630(brushdef_t *b);

#line 2572
bool FUN_0044f5d0(brush_t *b)
{
    assert(b);
    if (b->hiddenBrush)
        return true;
    return FUN_0044f630(b->def);
}

// views of the editor structs this routine reads (offsets from retail accesses)
struct xyEclass_t { unsigned char pad00[4]; char *name; unsigned char pad08[0x1c]; float color[4]; };
struct xyEntity_t { unsigned char pad00[0x50]; xyEclass_t *eclass; };
struct entityInst_t { unsigned char pad00[8]; xyEntity_t *def; };
struct xyFace_t { unsigned char pad00[0x78]; int contents; };
struct xyBrushdef_t { unsigned char pad00[0x3c]; xyFace_t *faces; unsigned char pad40; unsigned char field_41; };
extern float color_01129798[4];
extern float color_011297e8[4];
extern float color_011297f8[4];
extern float color_01129818[4];
extern float color_01129828[4];
extern float color_01129838[4];
extern float color_01129858[4];
extern float color_01129868[4];
extern void (*FUN_0059c468)(const float *inColor, unsigned int *outColor);
bool FUN_0045d090(const brushdef_t *b, float *color, const float *defaultColor);

#define Vector4Copy(a, b) ((b)[0] = (a)[0], (b)[1] = (a)[1], (b)[2] = (a)[2], (b)[3] = (a)[3])

void FUN_00451c00(brush_t *b, unsigned int *outColor)
{
    float color[4];
    xyEclass_t *eclass = b->owner->def->eclass;
    if (_stricmp(eclass->name, "worldspawn"))
    {
        if (!_stricmp(eclass->name, "func_group"))
            Vector4Copy(color_01129818, color);
        else if (!_stricmp(eclass->name, "func_cullgroup"))
            Vector4Copy(color_01129828, color);
        else if (!_stricmp(eclass->name, "misc_model"))
            Vector4Copy(color_01129858, color);
        else
        {
            Vector4Copy(eclass->color, color);
            FUN_0045d090(b->def, color, eclass->color);
        }
    }
    else
    {
        xyBrushdef_t *def = (xyBrushdef_t *)b->def;
        int contents = def->faces->contents;
        if ((contents & 0x2080) == 0x2080)
            Vector4Copy(color_01129838, color);
        else if ((contents & 0x8000004) == 0x8000004)
            Vector4Copy(color_01129868, color);
        else if (contents & 0x8000000)
            Vector4Copy(color_011297e8, color);
        else if (!def->field_41)
            Vector4Copy(color_01129798, color);
        else
            Vector4Copy(color_011297f8, color);
    }
    (*FUN_0059c468)(color, outColor);
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

// Q3Radiant CXYWnd::SetViewType; CMainFrame+0x7a0 = current layout style (1 = QE4)
void CXYWnd::SetViewType(int n)
{
    m_nViewType = n;
    if (*(int *)((char *)g_pParentWnd + 0x7a0) == 1)
    {
        CString str = "YZ Side";
        if (m_nViewType == XY)
            str = "XY Top";
        else if (m_nViewType == XZ)
            str = "XZ Front";
        SetWindowText(str);
    }
}

// Q3Radiant CXYWnd::Redraw.
void CXYWnd::Redraw(unsigned int nBits)
{
    m_nUpdateBits = nBits;
    RedrawWindow(NULL, NULL, RDW_INVALIDATE | RDW_UPDATENOW);
    m_nUpdateBits = W_XY;
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
    FUN_004137d0(g_pParentWnd, nChar);
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
    g_pParentWnd->OnKeyDown(nChar, nRepCnt, nFlags);
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

void CClipPoint::Reset()
{
    m_ptClip[0] = m_ptClip[1] = m_ptClip[2] = 0;
    m_bSet = false;
    m_pVec3 = NULL;
}

void CClipPoint::UpdatePointPtr()
{
    float *p = m_pVec3;
    if (p)
    {
        p[0] = m_ptClip[0];
        p[1] = m_ptClip[1];
        p[2] = m_ptClip[2];
    }
}

void CClipPoint::SetPointPtr(float *p)
{
    m_pVec3 = p;
}

void CClipPoint::Set(bool b)
{
    m_bSet = b;
}

extern "C" void FUN_004535f0() {}
extern "C" void FUN_00453600() {}

XYWndNode::XYWndNode()
{
    field_00 = 0;
    next = NULL;
}
