// XYWnd.cpp: top-down/side 2D editor view. Q3Radiant XYWnd.cpp layout, retail order.
#include "stdafx.h"
#include <stddef.h>
#include <string.h>
#include <math.h>
#include "PrefsDlg.h"
#include "../universal/assertive.h"
#include "radiant_wnd.h"
#include "../universal/com_math.h"

#define W_XY 2

enum { YZ, XZ, XY };

struct brushdef_t;
struct brush_t
{
    brush_t *prev;
    brush_t *next;
    struct entityInst_t *owner;
    brush_t *onext;
    int pad10;
    brushdef_t *def;
    int pad18;
    int pad1c;
    void *patch;
    short pad24;
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



struct xyEclass_t
{
    unsigned char pad00[4];
    char *name;
    int field_08;
    float mins[3];
    float maxs[3];
    float color[4];
    unsigned char pad34[0x124];
    char *modelName;
    unsigned char pad15c[4];
    unsigned flags;
};
struct xyEntity_t
{
    unsigned char pad00[0x50];
    xyEclass_t *eclass;
    xyEclass_t *modelClass;
    unsigned char pad58[0xc];
    void *epairs;
};
struct entityInst_t
{
    entityInst_t *prev;
    entityInst_t *next;
    xyEntity_t *def;
    brush_t brushes;
};
struct XYShader
{
    unsigned char pad00[4];
    char *name;
    unsigned char pad08[1];
    unsigned char flagsByte9;
    unsigned char pad0a[6];
    unsigned flags10;
    unsigned char pad14[8];
    unsigned contents;
    unsigned flags20;
};
struct XYFace
{
    unsigned char pad00[0x24];
    XYShader *shader;
    unsigned char pad28[0x78 - 0x28];
    int contents;
    unsigned char pad7c[0xa0 - 0x7c];
    void *w;
    unsigned color;
};
struct xypatch_t
{
    unsigned char pad00[0x10];
    int type;
};
struct brushdef_t
{
    unsigned char pad00[8];
    xyEntity_t *owner;
    unsigned char pad0c[0x14];
    float mins[3];
    float maxs[3];
    int numFaces;
    XYFace *faces;
    unsigned char pad40[4];
    xypatch_t *patch;
    bool FUN_0044f530(int mask);
    bool FUN_0044f560(int mask);
};

#include "refexport.h"













struct XYVert
{
    float xyz[3];
    unsigned color;
};
extern float region_mins[3];
extern float region_maxs[3];
extern float g_colors[32][4];
extern signed char byte_01129890;
extern int dword_011298c4;
extern void *dword_011298c8;
bool FUN_00453410(const float *a, const float *b);

typedef float vec3_t[3];
struct qtexture_s
{
    unsigned char pad00[0x14];
    int width;
    int height;
};
struct GfxPointVertex { float xyz[3]; unsigned char color[4]; };
extern void (*FUN_0059c468)(const float *inColor, unsigned int *outColor);
extern brush_t selected_brushes;
extern int dword_011298b0;
extern int dword_0123348c;
extern unsigned char texdef_01128da8[];
struct XYWorldEntity
{
    unsigned char pad[8];
    void *field_08;
};
extern XYWorldEntity *dword_012334ec;
struct entity_t;
struct texdef_t;
struct eclass_t;
void Sys_Printf(const char *fmt, ...);
void Sys_MarkMapModified();
void Undo_GeneralStart(char *op);
struct selbrush_t; void Undo_AddBrushList(selbrush_t *list);
void FUN_00443f80(selbrush_t *list);
void FUN_004433b0();
void Undo_End();
void FUN_0046fbe0(bool b);
void FUN_0046f0b0(brush_t *brush, bool bComplete, bool bStatus, bool bPositionView);
void FUN_00475350();
brushdef_t *Brush_CreateFromTexdef(eclass_t *eclass, const texdef_t *td);
void FUN_00457dd0(const vec3_t mins, const vec3_t maxs, brushdef_t *def, int flag);
void FUN_0045a220(brushdef_t *b, bool snap);
void FUN_004671b0(brushdef_t *b, entity_t *owner);
brush_t *FUN_00458440(brushdef_t *def, entity_t *owner);

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
    ON_WM_RBUTTONDOWN()
    ON_WM_LBUTTONUP()
    ON_WM_MBUTTONUP()
    ON_WM_RBUTTONUP()
    ON_WM_MOUSEMOVE()
    ON_WM_PAINT()
    ON_WM_KEYDOWN()
    ON_WM_SIZE()
    ON_WM_DESTROY()
    ON_WM_TIMER()
    ON_WM_KEYUP()
    ON_WM_NCCALCSIZE()
    ON_WM_KILLFOCUS()
    ON_WM_SETFOCUS()
    ON_WM_CLOSE()
    ON_WM_MOUSEWHEEL()
    ON_WM_SYSKEYDOWN()
    ON_COMMAND_RANGE(0x5910, 0x80b4, OnEntityCreate)
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

// Q3Radiant face_t view for the clip plane (same tag and size 0xa8 as brush.cpp).
struct face_t
{
    float planepts[3][3];
    struct { qtexture_s *radMat; float scale[2]; float shift[2]; float rotate; float crossterm; } texdef[2];
    unsigned char pad5c[0xa8 - 0x5c];
};
extern brush_t active_brushes;
extern CClipPoint g_Clip1, g_Clip2, g_Clip3;
struct CPatchDialog : public CDialog { void GetPatchInfo(); };
extern CPatchDialog g_PatchDialog;
qtexture_s * __fastcall FUN_00440840(char *name);
void FUN_00455cf0(brushdef_t *in, const face_t *f, brushdef_t **front, brushdef_t **back);
// 0x00449c90: Q3Radiant CXYWnd::ProduceSplitLists
void FUN_00449c90(void)
{
    bool bFixed = false;
    bool bPatches = false;
    brush_t *pBrush = selected_brushes.next;
    while (pBrush != &selected_brushes)
    {
        brush_t *pNext = pBrush->next;
        if (!pBrush->patch)
        {
            if (pBrush->owner->def->eclass->field_08 != 0)
            {
                if (!bFixed)
                {
                    bFixed = true;
                    Sys_Printf("Deslecting fixed size entities for clip operation.\n");
                }
                FUN_004592f0(pBrush);
                FUN_00459210(pBrush, &active_brushes);
            }
        }
        else
        {
            if (!bPatches)
            {
                bPatches = true;
                Sys_Printf("Deslecting patches for clip operation.\n");
            }
            FUN_004592f0(pBrush);
            FUN_00459210(pBrush, &active_brushes);
            if (g_PatchDialog.GetSafeHwnd())
                g_PatchDialog.GetPatchInfo();
        }
        pBrush = pNext;
    }
    bool clipMode = g_bClipMode;
    CleanList(&g_brBackSplits);
    CleanList(&g_brFrontSplits);
    g_brBackSplits.next = &g_brBackSplits;
    g_brFrontSplits.next = &g_brFrontSplits;
    if (!clipMode || !g_Clip1.m_bSet || !g_Clip2.m_bSet)
        return;
    for (pBrush = selected_brushes.next; pBrush != NULL && pBrush != &selected_brushes; pBrush = pBrush->next)
    {
        face_t face;
        memset(&face, 0, sizeof(face));
        brushdef_t *back = NULL;
        brushdef_t *front = NULL;
        qtexture_s *caulk = FUN_00440840("caulk");
        face.texdef[0].radMat = caulk;
        face.texdef[0].scale[0] = (float)caulk->width * 0.25f;
        face.texdef[0].scale[1] = (float)caulk->height * 0.25f;
        qtexture_s *gray = FUN_00440840("lightmap_gray");
        face.texdef[1].radMat = gray;
        face.texdef[1].scale[0] = (float)gray->width * 16.0f;
        face.texdef[1].scale[1] = (float)gray->height * 16.0f;
        for (int i = 0; i < 3; i++)
        {
            face.planepts[0][i] = g_Clip1.m_ptClip[i];
            face.planepts[1][i] = g_Clip2.m_ptClip[i];
            face.planepts[2][i] = g_Clip3.m_ptClip[i];
        }
        if (!g_Clip3.m_bSet)
        {
            int viewType = reinterpret_cast<CMainFrameXYView *>(g_pParentWnd)->m_pActiveXY->m_nViewType;
            face.planepts[2][0] = g_Clip1.m_ptClip[0];
            face.planepts[2][1] = g_Clip1.m_ptClip[1];
            face.planepts[2][2] = g_Clip1.m_ptClip[2];
            if (viewType == XY)
                face.planepts[2][2] = g_Clip1.m_ptClip[2] + 32.0f;
            else if (viewType == XZ)
                face.planepts[2][1] = g_Clip1.m_ptClip[1] + 32.0f;
            else
                face.planepts[2][0] = g_Clip1.m_ptClip[0] + 32.0f;
        }
        FUN_00455cf0(pBrush->def, &face, &back, &front);
        if (front)
            FUN_00459210(FUN_00458440(front, (entity_t *)pBrush->owner), &g_brFrontSplits);
        if (back)
            FUN_00459210(FUN_00458440(back, (entity_t *)pBrush->owner), &g_brBackSplits);
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

extern bool (*FUN_0059c440)(void *);
extern void (*FUN_0059c3ac)(void);
extern void (*FUN_0059c3b0)(void);
extern void (*FUN_0059c444)(void *);
extern void *dword_010bcd68;
extern int dword_01233514;
extern int dword_01147dd0, dword_01147dd4;
extern unsigned char byte_012334d8;
extern float color_01129718[4];
extern void (*FUN_0059c3c4)(int, const float *, float, int);

extern int dword_011298c4;
struct orientation_t;
extern orientation_t dword_01129950;
extern float color_011297c8[4];
extern int FUN_0045d9a0(face_t *f, int a, unsigned *color, int b, int vertCount, int maxCount, GfxPointVertex *verts);
void FUN_0040c590(const float *in, float *out, int nDim1, int nDim2, int nDim3, float scale, int width, int height);
void OrientationPosToWorld(const orientation_t *orient, const float *pos, float *out);

// 0x0044ad80: cross lines through the mouse point (Q3Radiant g_bCrossHairs block of OnPaint)
void CXYWnd::DrawCrosshairs()
{
    float color[4] = { 0.2f, 0.9f, 0.2f, 0.8f };
    unsigned packed;
    (*FUN_0059c468)(color, &packed);
    int nDim1 = (m_nViewType == YZ) ? 1 : 0;
    int nDim2 = (m_nViewType == XY) ? 1 : 2;
    GfxPointVertex v[4];
    for (int i = 0; i < 4; i++)
    {
        v[i].xyz[0] = tdp[0];
        v[i].xyz[1] = tdp[1];
        v[i].xyz[2] = tdp[2];
        *(unsigned *)v[i].color = packed;
    }
    v[0].xyz[nDim1] = -131072.0f;
    v[1].xyz[nDim1] = 131072.0f;
    v[2].xyz[nDim2] = -131072.0f;
    v[3].xyz[nDim2] = 131072.0f;
    re.AddLines(2, 1, v);
}

// 0x0044ae60: clip points, their numbers and the split brushes in the XY view
void CXYWnd::DrawClipPoints()
{
    unsigned packed;
    GfxPointVertex v[3];
    int n = 0;
    (*FUN_0059c468)(color_011297c8, &packed);
    if (g_Clip1.m_bSet)
    {
        OrientationPosToWorld(&dword_01129950, g_Clip1.m_ptClip, v[n].xyz);
        *(unsigned *)v[n].color = packed;
        n++;
    }
    if (g_Clip2.m_bSet)
    {
        OrientationPosToWorld(&dword_01129950, g_Clip2.m_ptClip, v[n].xyz);
        *(unsigned *)v[n].color = packed;
        n++;
        if (n == 3)
        {
            re.DrawPoints(n, 4, v);
            n = 0;
        }
    }
    if (g_Clip3.m_bSet)
    {
        OrientationPosToWorld(&dword_01129950, g_Clip3.m_ptClip, v[n].xyz);
        *(unsigned *)v[n].color = packed;
        n++;
        if (n == 3)
        {
            re.DrawPoints(n, 4, v);
            n = 0;
        }
    }
    if (n)
        re.DrawPoints(n, 4, v);

    int nDim1 = (m_nViewType == YZ) ? 1 : 0;
    int nDim2 = (m_nViewType == XY) ? 1 : 2;
    int nDim3 = 3 - nDim2 - nDim1;
    float right[3], up[3], pos[3], at[3];
    right[nDim1] = 1.0f / m_fScale;
    right[nDim2] = 0;
    right[nDim3] = 0;
    up[nDim1] = 0;
    up[nDim2] = -1.0f / m_fScale;
    up[nDim3] = 0;
    if (g_Clip1.m_bSet)
    {
        at[0] = g_Clip1.m_ptClip[0] + 2.0f;
        at[1] = g_Clip1.m_ptClip[1] + 2.0f;
        at[2] = g_Clip1.m_ptClip[2] + 2.0f;
        FUN_0040c590(at, pos, nDim1, nDim2, nDim3, m_fScale, m_nWidth, m_nHeight);
        re.DrawText("1", dword_011298c4, pos, right, up, color_011297c8);
    }
    if (g_Clip2.m_bSet)
    {
        at[0] = g_Clip2.m_ptClip[0] + 2.0f;
        at[1] = g_Clip2.m_ptClip[1] + 2.0f;
        at[2] = g_Clip2.m_ptClip[2] + 2.0f;
        FUN_0040c590(at, pos, nDim1, nDim2, nDim3, m_fScale, m_nWidth, m_nHeight);
        re.DrawText("2", dword_011298c4, pos, right, up, color_011297c8);
    }
    if (g_Clip3.m_bSet)
    {
        at[0] = g_Clip3.m_ptClip[0] + 2.0f;
        at[1] = g_Clip3.m_ptClip[1] + 2.0f;
        at[2] = g_Clip3.m_ptClip[2] + 2.0f;
        FUN_0040c590(at, pos, nDim1, nDim2, nDim3, m_fScale, m_nWidth, m_nHeight);
        re.DrawText("3", dword_011298c4, pos, right, up, color_011297c8);
    }
    if (!g_Clip1.m_bSet || !g_Clip2.m_bSet)
        return;
    FUN_00449c90();
    bool sw = (m_nViewType == XZ) ? !g_bSwitch : g_bSwitch;
    brush_t *pList = sw ? &g_brFrontSplits : &g_brBackSplits;
    static const float splitColor[4] = { 1.0f, 0.0f, 1.0f, 1.0f };
    (*FUN_0059c468)(splitColor, &packed);
    GfxPointVertex lines[200];
    int count = 0;
    for (brush_t *brush = pList->next; brush != NULL && brush != pList; brush = brush->next)
    {
        for (int faceIndex = 0; faceIndex < brush->def->numFaces; faceIndex++)
        {
#line 932
            assert(brush->def->faces[faceIndex].w);
            count = FUN_0045d9a0((face_t *)&brush->def->faces[faceIndex], -1, &packed, 1, count, 3, lines);
        }
    }
    if (count)
        re.AddLines(count / 2, 1, lines);
}

// 0x0044b2a0
void CXYWnd::OnPaint()
{
    PAINTSTRUCT ps;
    if (FUN_0059c440 && FUN_0059c440(dword_010bcd68))
    {
        BeginPaint(&ps);
        (*FUN_0059c3ac)();
        (*FUN_0059c3c4)(7, color_01129718, 1.0f, 0);
        XY_Draw();
        if (byte_012334d8)
            DrawCrosshairs();
        if (g_bClipMode)
            DrawClipPoints();
        (*FUN_0059c3b0)();
        (*FUN_0059c444)(dword_010bcd68);
        if (dword_01233514)
            dword_01147dd4 = dword_01147dd0;
        EndPaint(&ps);
    }
}

void CXYWnd::OnKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags)
{
    g_pParentWnd->OnKeyDown(nChar, nRepCnt, nFlags);
}

// retail assert with the first flag set (CreateEntityFromName)
#define xy_assert1(expr) \
    do { \
        static bool s_assertDisable; \
        if (!(expr) && !s_assertDisable) \
        { \
            switch (FUN_0047d980(#expr, __FILE__, __LINE__, 1, 1)) \
            { \
            case 0: \
                DebugBreak(); \
                break; \
            case 2: \
                s_assertDisable = true; \
                break; \
            } \
        } \
    } while (0)

struct entity_t;
struct texdef_t;
eclass_t *FUN_00464770(int hasBrushes, const char *name);
entity_t *FUN_00466d80(eclass_t *ec);
void FUN_00467510(entity_t *e);
void FUN_00465bf0(entity_t *e, const char *key, const char *value);
bool FUN_00469740(entity_t *e);
void FUN_00469690(CString &name);
void FUN_00441c50(char *name);
void FUN_00477580(int iType);
void FUN_00444110(entity_t *ent);
void Undo_AddEntity(entity_t *e);
void FUN_004675e0(eclass_t *ec, brushdef_t *def);
brushdef_t *BrushDef_Create(const vec3_t mins, const vec3_t maxs, eclass_t *eclass, const texdef_t *td);
extern HWND dword_010bcd60;
struct XYWorldEntity;

// 0x0044b380: Q3Radiant CreateEntityFromName
void CreateEntityFromName(const char *name)
{
    if (!_stricmp(name, "worldspawn"))
    {
        MessageBox(dword_010bcd54, "Can't create an entity with worldspawn.", "info", 0);
        return;
    }
    eclass_t *pecNew = FUN_00464770(0, name);
    xyEclass_t *ec = (xyEclass_t *)pecNew;
    Undo_AddBrushList((selbrush_t *)&selected_brushes);
    entityInst_t *petNew = (entityInst_t *)FUN_00466d80(pecNew);
    if (petNew)
    {
        FUN_00467510((entity_t *)petNew->def);
        brush_t *b = petNew->brushes.onext;
#line 1042
        xy_assert1(b != &petNew->brushes);
        xy_assert1(b->owner->def == b->def->owner);
        FUN_0046fbe0(1);
        FUN_0046f0b0(b, 1, 1, 0);
        if (FUN_00469740((entity_t *)petNew->def))
        {
            CString strExport;
            FUN_00469690(strExport);
            FUN_00465bf0((entity_t *)petNew->def, "export", strExport);
        }
        if (_stricmp(name, "misc_model") && _stricmp(name, "misc_prefab") && _stricmp(name, "script_model") && _stricmp(name, "script_vehicle"))
        {
            if (ec->flags & 0x40)
            {
                FUN_00465bf0((entity_t *)petNew->def, "radius", "256");
                FUN_00465bf0((entity_t *)petNew->def, "height", "128");
            }
            else if (ec->flags & 0x80)
                FUN_00465bf0((entity_t *)petNew->def, "radius", "256");
            else if (!_stricmp(name, "trigger_multiple") || !_stricmp(name, "trigger_damage") || !_stricmp(name, "trigger_once") ||
                     !_stricmp(name, "trigger_hurt") || !_stricmp(name, "trigger_lookat") || !_stricmp(name, "trigger_use") ||
                     !_stricmp(name, "trigger_use_touch"))
                FUN_00441c50("trigger");
            else if (!_stricmp(name, "trigger_friendlychain"))
                FUN_00441c50("aitrig");
            else if (!_stricmp(name, "info_volume"))
                FUN_00441c50("volume");
        }
        else
        {
            FUN_00477580(0x80);
            PostMessage(dword_010bcd60, WM_COMMAND, 0x50e, 0);
        }
        FUN_00444110((entity_t *)petNew->def);
    }
    else
    {
        brush_t *b = selected_brushes.next;
        if (b == &selected_brushes || b->next != &selected_brushes)
            MessageBox(dword_010bcd54, "Failed to create entity.", "info", 0);
        else
        {
#line 999
            xy_assert1(b->owner->def == b->def->owner);
            entityInst_t *owner = b->owner;
            if ((void *)owner == (void *)dword_012334ec || owner->def->eclass->field_08 == 0 || ec->field_08 == 0)
                MessageBox(dword_010bcd54, "Failed to create entity.", "info", 0);
            else
            {
                Undo_AddEntity((entity_t *)owner->def);
                const float *bmins = (const float *)((char *)b->def + 0x20);
                float origin[3], mins[3], maxs[3];
                origin[0] = bmins[0] - ec->mins[0];
                origin[1] = bmins[1] - ec->mins[1];
                origin[2] = bmins[2] - ec->mins[2];
                mins[0] = origin[0] + ec->mins[0];
                mins[1] = origin[1] + ec->mins[1];
                mins[2] = origin[2] + ec->mins[2];
                maxs[0] = origin[0] + ec->maxs[0];
                maxs[1] = origin[1] + ec->maxs[1];
                maxs[2] = origin[2] + ec->maxs[2];
                owner->def->eclass = ec;
                FUN_00465bf0((entity_t *)owner->def, "classname", name);
                brushdef_t *nb = BrushDef_Create(mins, maxs, pecNew, (const texdef_t *)((char *)ec + 0x34));
                FUN_004671b0(nb, (entity_t *)owner);
                if (FUN_00469740((entity_t *)b->owner->def))
                {
                    CString strExport;
                    FUN_00469690(strExport);
                    FUN_00465bf0((entity_t *)b->owner->def, "export", strExport);
                }
                FUN_0045a220(nb, 1);
                if (dword_011298b0 == 1 || dword_011298b0 == 2)
                    FUN_00475350();
                Sys_MarkMapModified();
                ((short *)nb)[0x42 / 2]++;
                entity_t *own = (entity_t *)b->owner;
                Brush_Free(b);
                brush_t *nbi = FUN_00458440(nb, own);
#line 1025
                xy_assert1(nbi->owner->def == nbi->def->owner);
                FUN_00459210(nbi, &active_brushes);
                FUN_0046f0b0(nbi, 1, 1, 0);
                FUN_004675e0(pecNew, nb);
#line 1029
                assert(selected_brushes.next->def == nb && selected_brushes.prev->def == nb);
            }
        }
    }
    FUN_00443f80((selbrush_t *)&selected_brushes);
}

// 0x0044b9b0: Q3Radiant CreateEntityBrush, a 32 unit placeholder brush at the click
brush_t *CreateEntityBrush(int height, int x, CXYWnd *pWnd)
{
    float mins[3], maxs[3];
    pWnd->SnapToPoint(x, height, mins);
    pWnd->SnapToPoint(x + 32, height + 32, maxs);
    int nDim = (pWnd->m_nViewType == XY) ? 2 : (pWnd->m_nViewType == YZ) ? 0 : 1;
    mins[nDim] = g_qeglobals.d_gridsize * ((int)(g_qeglobals.d_new_brush_bottom[nDim] / g_qeglobals.d_gridsize));
    maxs[nDim] = g_qeglobals.d_gridsize * ((int)(g_qeglobals.d_new_brush_top[nDim] / g_qeglobals.d_gridsize));
    if (maxs[nDim] <= mins[nDim])
        maxs[nDim] = mins[nDim] + g_qeglobals.d_gridsize;
    for (int i = 0; i < 3; i++)
    {
        if (mins[i] == maxs[i])
            maxs[i] += 16.0f;
        if (mins[i] > maxs[i])
        {
            float temp = mins[i];
            mins[i] = maxs[i];
            maxs[i] = temp;
        }
    }
    brushdef_t *n = Brush_CreateFromTexdef(NULL, (const texdef_t *)texdef_01128da8);
    FUN_00457dd0(mins, maxs, n, 0);
    if (!n)
        return NULL;
    FUN_0045a220(n, true);
    if (dword_011298b0 == 1 || dword_011298b0 == 2)
        FUN_00475350();
    Sys_MarkMapModified();
    (*(unsigned short *)((char *)n + 0x42))++;
    FUN_004671b0(n, (entity_t *)dword_012334ec->field_08);
    brush_t *b = FUN_00458440(n, (entity_t *)dword_012334ec);
    FUN_00459210(b, &selected_brushes);
    return b;
}

// 0x0044bb80: Q3Radiant CreateRightClickEntity
void FUN_0044bb80(CXYWnd *pWnd, const char *name, int x, int y)
{
    CRect rect;
    pWnd->GetClientRect(rect);
    if (((xyEclass_t *)FUN_00464770(0, name))->field_08 != 0)
    {
        brush_t *b = selected_brushes.next;
        if (b != &selected_brushes && !_stricmp(b->owner->def->eclass->name, "worldspawn"))
        {
            Sys_Printf("Can not create a fixed size entity with brushes selected\n");
            return;
        }
    }
    FUN_004433b0();
    Undo_GeneralStart("create entity");
    if (selected_brushes.next == &selected_brushes)
        CreateEntityBrush(rect.Height() - 1 - y, x, pWnd);
    CreateEntityFromName(name);
    Undo_End();
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

// 0x0044bd30: right-click menu entry creates the entity named by the item
void CXYWnd::OnEntityCreate(UINT nID)
{
    if (!m_mnuDrop.m_hMenu)
        return;
    CString strItem;
    m_mnuDrop.GetMenuString(nID, strItem, MF_BYCOMMAND);
    const char *name;
    XYWndNode *node = FUN_0044bc30(nID);
    if (node)
        name = node->field_04;
    else
        name = strItem;
    FUN_0044bb80(this, name, m_ptDown.x, m_ptDown.y);
    dword_0123348c = -1;
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
struct selbrush_t; void Undo_AddBrushList(selbrush_t *list);
void FUN_00443f80(selbrush_t *list);
void Undo_End();
void FUN_0046f0b0(brush_t *brush, bool bComplete, bool bStatus, bool bPositionView);
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
extern bool g_bCrossHairs;
extern bool byte_0112993c;
extern bool byte_0112993d;
void FUN_00475350();
void Sys_MarkMapModified();
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
        Undo_AddBrushList((selbrush_t *)&selected_brushes);
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
        FUN_00443f80((selbrush_t *)&selected_brushes);
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
        brushdef_t *n = Brush_CreateFromTexdef(NULL, (const texdef_t *)texdef_01128da8);
        FUN_00457dd0(mins, maxs, n, 0);
        if (!n)
            return;
        FUN_0045a220(n, true);
        if (dword_011298b0 == 1 || dword_011298b0 == 2)
            FUN_00475350();
        Sys_MarkMapModified();
        (*(unsigned short *)((char *)n + 0x42))++;
        FUN_004671b0(n, (entity_t *)dword_012334ec->field_08);
        FUN_00459210(FUN_00458440(n, (entity_t *)dword_012334ec), &selected_brushes);
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


static int XYAddLine(XYVert *verts, int n, int d1, int d2, int d3, float x0, float y0, float x1, float y1, float z, unsigned color)
{
    verts[n].xyz[d1] = x0;
    verts[n].xyz[d2] = y0;
    verts[n].xyz[d3] = z;
    verts[n].color = color;
    verts[n + 1].xyz[d1] = x1;
    verts[n + 1].xyz[d2] = y1;
    verts[n + 1].xyz[d3] = z;
    verts[n + 1].color = color;
    return n + 2;
}

// 0x0044d7e0: coordinate grid with minor/major lines and labels
void CXYWnd::XY_DrawGrid()
{
    XYVert verts[1024];
    char text[32];
    unsigned color;
    float x, y;

    int nDim1 = (m_nViewType == YZ) ? 1 : 0;
    int nDim2 = (m_nViewType == XY) ? 1 : 2;
    int nDim3 = 3 - nDim1 - nDim2;
    float w = (float)(m_nWidth / 2) / m_fScale;
    float h = (float)(m_nHeight / 2) / m_fScale;

    float xb = m_vOrigin[nDim1] - w;
    if (!(xb >= region_mins[nDim1]))
        xb = region_mins[nDim1];
    xb = (float)floor(xb / 64.0f) * 64.0f;
    float xe = w + m_vOrigin[nDim1];
    if (!(xe <= region_maxs[nDim1]))
        xe = region_maxs[nDim1];
    xe = (float)ceil(xe / 64.0f) * 64.0f;
    float yb = m_vOrigin[nDim2] - h;
    if (!(yb >= region_mins[nDim2]))
        yb = region_mins[nDim2];
    yb = (float)floor(yb / 64.0f) * 64.0f;
    float ye = h + m_vOrigin[nDim2];
    if (!(ye <= region_maxs[nDim2]))
        ye = region_maxs[nDim2];
    ye = (float)ceil(ye / 64.0f) * 64.0f;

    int step = (int)(6.4 / m_fScale);
    if (step >= 64)
    {
        int s = 1;
        do
            s <<= 1;
        while (s < step);
        step = s;
    }
    else
        step = 64;

    if (g_qeglobals.d_showgrid)
    {
        int n = 0;
        if (!(m_fScale <= 0.1f) && !((float)g_qeglobals.d_gridsize * m_fScale < 4.0f) && !FUN_00453410(g_colors[1], g_colors[2]))
        {
            re.ColorToBytes(g_colors[2], &color);
            for (x = xb; x < xe; x += (float)g_qeglobals.d_gridsize)
                if (((int)x & 63) != 0)
                    n = XYAddLine(verts, n, nDim1, nDim2, nDim3, x, yb, x, ye, -131072.0f, color);
            for (y = yb; y < ye; y += (float)g_qeglobals.d_gridsize)
                if (((int)y & 63) != 0)
                    n = XYAddLine(verts, n, nDim1, nDim2, nDim3, xb, y, xe, y, -131072.0f, color);
        }
        re.ColorToBytes(g_colors[3], &color);
        if (!(xb > xe))
            for (x = xb; x <= xe; x += (float)step)
                n = XYAddLine(verts, n, nDim1, nDim2, nDim3, x, yb, x, ye, -131072.0f, color);
        if (!(yb > ye))
            for (y = yb; y <= ye; y += (float)step)
                n = XYAddLine(verts, n, nDim1, nDim2, nDim3, xb, y, xe, y, -131072.0f, color);
        re.AddLines(n / 2, 1, verts);
    }

    if (byte_01129890 < 0)
        return;

    float right[3] = {0, 0, 0};
    float up[3] = {0, 0, 0};
    float pos[3], pos2[3];
    up[nDim2] = -1.0f / m_fScale;
    right[nDim1] = -1.0f / m_fScale;
    pos[nDim2] = h + m_vOrigin[nDim2] - 1.0f / m_fScale;
    pos[nDim3] = 0;
    for (x = xb; x < xe; x += (float)step)
    {
        sprintf(text, "%.0f", x);
        pos[nDim1] = x;
        float ox = (m_nWidth & 1) ? 0.0f : (float)(0.5 / m_fScale);
        float oy = (m_nHeight & 1) ? 0.0f : (float)(0.5 / m_fScale);
        pos2[nDim1] = ox + x;
        pos2[nDim2] = oy + pos[nDim2];
        pos2[nDim3] = pos[nDim3];
        re.DrawText(text, dword_011298c4, pos2, right, up, g_colors[8]);
    }

    right[0] = 0;
    right[1] = 0;
    right[2] = 0;
    up[0] = 0;
    up[1] = 0;
    up[2] = 0;
    right[nDim1] = 1.0f / m_fScale;
    up[nDim2] = -1.0f / m_fScale;
    pos[nDim1] = m_vOrigin[nDim1] - w + 1.0f / m_fScale;
    pos[nDim3] = 0;
    for (y = yb; y < ye; y += (float)step)
    {
        sprintf(text, "%.0f", y);
        pos[nDim2] = 1.0f / m_fScale + y;
        float ox = (m_nWidth & 1) ? 0.0f : (float)(0.5 / m_fScale);
        float oy = (m_nHeight & 1) ? 0.0f : (float)(0.5 / m_fScale);
        pos2[nDim1] = ox + pos[nDim1];
        pos2[nDim2] = pos[nDim2] + oy;
        pos2[nDim3] = pos[nDim3];
        re.DrawText(text, dword_011298c4, pos2, right, up, g_colors[8]);
    }

    const char *name = "XY Top";
    if (m_nViewType != XY)
    {
        name = "XZ Front";
        if (m_nViewType != XZ)
            name = "YZ Side";
    }
    pos[nDim1] = m_vOrigin[nDim1] - w + 35.0f / m_fScale;
    pos[nDim2] = h + m_vOrigin[nDim2] - 20.0f / m_fScale;
    float ox = (m_nWidth & 1) ? 0.0f : (float)(0.5 / m_fScale);
    float oy = (m_nHeight & 1) ? 0.0f : (float)(0.5 / m_fScale);
    pos2[nDim1] = ox + pos[nDim1];
    pos2[nDim2] = pos[nDim2] + oy;
    pos2[nDim3] = pos[nDim3];
    re.DrawText(name, dword_011298c4, pos2, right, up, g_colors[m_bActive ? 13 : 8]);
}

// 0x0044e4b0: 1024-unit block grid with "%i,%i" block labels (Q3 XY_DrawBlockGrid)
void CXYWnd::XY_DrawBlockGrid()
{
    XYVert verts[1024];
    char text[32];
    unsigned color;
    float x, y;

    int nDim1 = (m_nViewType == YZ) ? 1 : 0;
    int nDim2 = (m_nViewType == XY) ? 1 : 2;
    int nDim3 = 3 - nDim1 - nDim2;
    int w = (int)((float)m_nWidth * (0.5f / m_fScale));
    int h = (int)((float)m_nHeight * (0.5f / m_fScale));

    float xb = m_vOrigin[nDim1] - (float)w;
    if (!(xb >= region_mins[nDim1]))
        xb = region_mins[nDim1];
    xb = (float)floor(xb / 1024.0f) * 1024.0f;
    float xe = (float)w + m_vOrigin[nDim1];
    if (!(xe <= region_maxs[nDim1]))
        xe = region_maxs[nDim1];
    xe = (float)ceil(xe / 1024.0f) * 1024.0f;
    float yb = m_vOrigin[nDim2] - (float)h;
    if (!(yb >= region_mins[nDim2]))
        yb = region_mins[nDim2];
    yb = (float)floor(yb / 1024.0f) * 1024.0f;
    float ye = (float)h + m_vOrigin[nDim2];
    if (!(ye <= region_maxs[nDim2]))
        ye = region_maxs[nDim2];
    ye = (float)ceil(ye / 1024.0f) * 1024.0f;

    re.ColorToBytes(g_colors[7], &color);
    int n = 0;
    if (xb < xe)
        for (x = xb; x <= xe; x += 1024.0f)
            n = XYAddLine(verts, n, nDim1, nDim2, nDim3, x, yb, x, ye, 131072.0f, color);
    if (yb < ye)
        for (y = yb; y <= ye; y += 1024.0f)
            n = XYAddLine(verts, n, nDim1, nDim2, nDim3, xb, y, xe, y, 131072.0f, color);
    if (n)
        re.AddLines(n / 2, 2, verts);

    float right[3] = {0, 0, 0};
    float up[3] = {0, 0, 0};
    float pos[3], pos2[3];
    right[nDim1] = 1.0f / m_fScale;
    up[nDim2] = -1.0f / m_fScale;
    for (x = xb; x < xe; x += 1024.0f)
    {
        for (y = yb; y < ye; y += 1024.0f)
        {
            int ybi = (int)(y / 1024.0f - 0.4999999990686774);
            int xbi = (int)(x / 1024.0f - 0.4999999990686774);
            sprintf(text, "%i,%i", xbi, ybi);
            pos[nDim1] = x + 512.0f;
            pos[nDim2] = y + 512.0f;
            pos[nDim3] = 131072.0f;
            float ox = (m_nWidth & 1) ? 0.0f : (float)(0.5 / m_fScale);
            float oy = (m_nHeight & 1) ? 0.0f : (float)(0.5 / m_fScale);
            pos2[nDim1] = ox + pos[nDim1];
            pos2[nDim2] = oy + pos[nDim2];
            pos2[nDim3] = 131072.0f;
            re.DrawText(text, dword_011298c4, pos2, right, up, g_colors[7]);
        }
    }
}

extern float g_vRotateOrigin[3];
extern float color_0053dc94[4];

static void XYDrawQuad(const float *c, const float *a, const float *b, unsigned color)
{
    float xyzw[4][4];
    float normal[4][3];
    float st[4][2];
    unsigned colors[4];
    unsigned short indices[6] = {1, 0, 2, 2, 0, 3};
    xyzw[0][0] = c[0] - b[0] - 0.0f;
    xyzw[0][1] = c[1] - b[1] - a[0];
    xyzw[0][2] = c[2] - 0.0f - a[1];
    xyzw[1][0] = c[0] + b[0] - 0.0f;
    xyzw[1][1] = c[1] + b[1] - a[0];
    xyzw[1][2] = c[2] + 0.0f - a[1];
    xyzw[2][0] = c[0] + b[0] + 0.0f;
    xyzw[2][1] = c[1] + b[1] + a[0];
    xyzw[2][2] = c[2] + 0.0f + a[1];
    xyzw[3][0] = c[0] - b[0] + 0.0f;
    xyzw[3][1] = c[1] - b[1] + a[0];
    xyzw[3][2] = c[2] + 0.0f + a[1];
    for (int i = 0; i < 4; i++)
    {
        xyzw[i][3] = 1.0f;
        normal[i][0] = 0;
        normal[i][1] = 0;
        normal[i][2] = 1.0f;
        st[i][0] = 0;
        st[i][1] = 0;
        colors[i] = color;
    }
    re.DrawTris(dword_011298c8, 3, 6, indices, 4, xyzw, normal, colors, st);
}

// 0x0044eb10: small quad and point at the rotate origin
void CXYWnd::DrawRotateIcon()
{
    float fillColor[4] = {0.8f, 0.1f, 0.9f, 0.25f};
    float pointColor[4] = {1.0f, 0.2f, 1.0f, 1.0f};
    float c[3], a[2], b[2];
    unsigned color;
    XYVert point;

    if (m_nViewType != XY)
    {
        a[0] = 0;
        if (m_nViewType != YZ)
        {
            c[2] = g_vRotateOrigin[2];
            c[0] = g_vRotateOrigin[0];
            c[1] = 131072.0f;
            a[1] = 4.0f;
            b[0] = 4.0f;
            b[1] = 0;
        }
        else
        {
            c[1] = g_vRotateOrigin[1];
            c[0] = 131072.0f;
            c[2] = g_vRotateOrigin[2];
            a[1] = 4.0f;
            b[0] = 0;
            b[1] = 4.0f;
        }
    }
    else
    {
        c[0] = g_vRotateOrigin[0];
        c[1] = g_vRotateOrigin[1];
        c[2] = 131072.0f;
        a[0] = 4.0f;
        a[1] = 0;
        b[0] = 4.0f;
        b[1] = 0;
    }
    re.ColorToBytes(fillColor, &color);
    XYDrawQuad(c, a, b, color);
    point.xyz[0] = c[0];
    point.xyz[1] = c[1];
    point.xyz[2] = c[2];
    re.ColorToBytes(pointColor, &point.color);
    re.DrawPoints(1, 1, &point);
}

// 0x0044eea0: camera position marker with view direction
void CXYWnd::DrawCameraIcon()
{
    XYVert verts[14];
    unsigned color;
    int d1, d2;
    float angle;
    CCamWnd *cam = reinterpret_cast<CMainFrameCamProjection *>(g_pParentWnd)->m_pCamWnd;

    if (m_nViewType != XY)
    {
        angle = cam->m_Camera.angles[0];
        d1 = (m_nViewType == YZ) ? 1 : 0;
        d2 = 2;
    }
    else
    {
        angle = cam->m_Camera.angles[1];
        d1 = 0;
        d2 = 1;
    }
    float p[3];
    p[0] = cam->m_Camera.origin[0];
    p[1] = cam->m_Camera.origin[1];
    p[2] = cam->m_Camera.origin[2];
    float a = (angle + 45.0f) * 0.017453292f;
    p[3 - d1 - d2] = 131072.0f;
    float s = sin(a);
    float cs = cos(a);

    for (int i = 0; i < 14; i++)
    {
        verts[i].xyz[0] = p[0];
        verts[i].xyz[1] = p[1];
        verts[i].xyz[2] = p[2];
    }
    verts[0].xyz[d1] -= 16.0f;
    verts[1].xyz[d2] += 8.0f;
    verts[2] = verts[1];
    verts[3].xyz[d1] += 16.0f;
    verts[4] = verts[3];
    verts[5].xyz[d2] -= 8.0f;
    verts[6] = verts[5];
    verts[7].xyz[d1] -= 16.0f;
    verts[8] = verts[7];
    verts[9] = verts[3];
    verts[10].xyz[d1] += cs * 48.0f;
    verts[10].xyz[d2] += s * 48.0f;
    verts[12].xyz[d1] += s * 48.0f;
    verts[12].xyz[d2] -= cs * 48.0f;
    re.ColorToBytes(color_0053dc94, &color);
    for (int i = 0; i < 14; i++)
        verts[i].color = color;
    re.AddLines(7, 1, verts);
}

// 0x0044f1a0: Z view marker at the z window position (XY view only)
void CXYWnd::DrawZIcon()
{
    if (m_nViewType != XY)
        return;
    float x = dword_01139e54[0];
    float y = dword_01139e54[1];
    unsigned color;
    float c[3] = {x, y, 131072.0f};
    float a[2] = {8.0f, 8.0f};
    float b[2] = {8.0f, 8.0f};
    XYVert verts[14];

    re.ColorToBytes(color_0053dc94, &color);
    XYDrawQuad(c, a, b, color);
    float xn = x - 8.0f, xp = x + 8.0f, yn = y - 8.0f, yp = y + 8.0f;
    int n = 0;
    n = XYAddLine(verts, n, 0, 1, 2, xn, yn, xp, yn, 131072.0f, color);
    n = XYAddLine(verts, n, 0, 1, 2, xp, yn, xp, yp, 131072.0f, color);
    n = XYAddLine(verts, n, 0, 1, 2, xp, yp, xn, yp, 131072.0f, color);
    n = XYAddLine(verts, n, 0, 1, 2, xn, yp, xn, yn, 131072.0f, color);
    xn = x - 4.0f;
    xp = x + 4.0f;
    yn = y - 4.0f;
    yp = y + 4.0f;
    n = XYAddLine(verts, n, 0, 1, 2, xn, yp, xp, yp, 131072.0f, color);
    n = XYAddLine(verts, n, 0, 1, 2, xp, yp, xn, yn, 131072.0f, color);
    n = XYAddLine(verts, n, 0, 1, 2, xn, yn, xp, yn, 131072.0f, color);
    re.AddLines(7, 1, verts);
}

// 0x0044f530: every face has a surface flag in the mask (flag word at +0x20)
bool brushdef_t::FUN_0044f530(int mask)
{
    for (int i = 0; i < numFaces; i++)
    {
        if (!(faces[i].shader->flags20 & mask))
            return false;
    }
    return true;
}

// 0x0044f560: any face has a content flag in the mask
bool brushdef_t::FUN_0044f560(int mask)
{
    for (int i = 0; i < numFaces; i++)
    {
        if (faces[i].shader->contents & mask)
            return true;
    }
    return false;
}

// 0x0044f590: any face has a surface flag byte in the mask
bool FUN_0044f590(brushdef_t *b, int flag)
{
    for (int i = 0; i < b->numFaces; i++)
    {
        if (b->faces[i].shader->flagsByte9 & flag)
            return true;
    }
    return false;
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

extern int g_filterFlags;
extern int g_filterFlags2;
extern entityInst_t *g_pWorldEntity;
bool FUN_00465d80(xyEntity_t *e, const char *key);
extern int dword_01128d90;
extern int dword_01244d74;
extern CString g_strFilter;
struct xyEntity_t;
struct epair_t;
char *ValueForKey(epair_t *&e, const char *key);
bool FUN_00465e10(xyEntity_t *e, const char *key, const char *value);
void I_strncpyz(char *dst, const char *src, int size);

static bool AllFacesNameContain(brushdef_t *d, const char *s)
{
    int i = 0;
    while (i < d->numFaces && strstr(d->faces[i].shader->name, s))
        i++;
    return i == d->numFaces;
}

// 0x0044f630: true when the brush is hidden by the view filters
bool FUN_0044f630(brushdef_t *b)
{
    char buf[1024];
    char token[1024];
#line 2589
    assert(b);
    if (!b->owner)
        return true;
    if (dword_01128d90 == 1 && !b->owner->eclass->field_08 && !FUN_0044f590(b, 2))
        return true;
    const char *name = b->faces[0].shader->name;
    int i;
    if (g_filterFlags & 0x2000)
    {
        for (i = 0; i < b->numFaces; i++)
        {
            if (!strstr(b->faces[i].shader->name, "caulk") && !strstr(b->faces[i].shader->name, "nodraw_decal"))
                break;
        }
        if (i == b->numFaces)
            return true;
    }
    if (g_filterFlags & 0x8000000)
    {
        bool all = true;
        for (i = 0; i < b->numFaces; i++)
        {
            if (!(b->faces[i].shader->flags20 & 0x800))
            {
                all = false;
                break;
            }
        }
        if (all)
            return true;
    }
    if (g_filterFlags < 0)
    {
        bool all = true;
        for (i = 0; i < b->numFaces; i++)
        {
            if (!(b->faces[i].shader->flags20 & 0x1000000))
            {
                all = false;
                break;
            }
        }
        if (all)
            return true;
    }
    if (g_filterFlags2 & 0x200)
    {
        for (i = 0; i < b->numFaces; i++)
        {
            if (!strstr(b->faces[i].shader->name, "bcs"))
                break;
        }
        if (i == b->numFaces)
            return true;
        if (FUN_00465e10(b->owner, "targetname", "trigger_location"))
            return true;
        if (FUN_00465e10(b->owner, "targetname", "trigger_landmark"))
            return true;
    }
    if (g_filterFlags2 & 0x800)
    {
        for (i = 0; i < b->numFaces; i++)
        {
            if (!strstr(b->faces[i].shader->name, "escort"))
                break;
        }
        if (i == b->numFaces)
            return true;
        if (FUN_00465e10(b->owner, "targetname", "escortchain"))
            return true;
    }
    if (g_filterFlags2 & 0x1000)
    {
        for (i = 0; i < b->numFaces; i++)
        {
            if (!strstr(b->faces[i].shader->name, "kill"))
                break;
        }
        if (i == b->numFaces)
            return true;
    }
    if (g_filterFlags2 & 0x2000)
    {
        for (i = 0; i < b->numFaces; i++)
        {
            if (!strstr(b->faces[i].shader->name, "spawner_trigger"))
                break;
        }
        if (i == b->numFaces)
            return true;
        if (FUN_00465e10(b->owner, "targetname", "flood_and_secure"))
            return true;
        if (FUN_00465e10(b->owner, "targetname", "flood_spawner"))
            return true;
    }
    if (g_filterFlags2 & 0x4000)
    {
        for (i = 0; i < b->numFaces; i++)
        {
            if (!strstr(b->faces[i].shader->name, "stopspawn"))
                break;
        }
        if (i == b->numFaces)
            return true;
        if (FUN_00465e10(b->owner, "targetname", "friendly_spawn"))
            return true;
    }
    if (g_filterFlags2 & 0x8000)
    {
        for (i = 0; i < b->numFaces; i++)
        {
            if (!strstr(b->faces[i].shader->name, "aitrig"))
                break;
        }
        if (i == b->numFaces)
            return true;
        if (FUN_00465e10(b->owner, "classname", "trigger_friendlychain"))
            return true;
    }
    if (g_filterFlags2 & 0x10000)
    {
        for (i = 0; i < b->numFaces; i++)
        {
            if (!strstr(b->faces[i].shader->name, "ambient"))
                break;
        }
        if (i == b->numFaces)
            return true;
        if (FUN_00465e10(b->owner, "targetname", "ambient"))
            return true;
        if (FUN_00465e10(b->owner, "targetname", "ambient_volume"))
            return true;
    }
    if (g_filterFlags & 0x1000)
    {
        if (strstr(name, "hint") || strstr(name, "skip"))
            return true;
    }
    if (g_filterFlags2 & 0x100)
    {
        if (strstr(name, "goal_volume"))
            return true;
    }
    if (g_filterFlags2 & 8)
    {
        for (i = 0; i < b->numFaces; i++)
        {
            if (b->faces[i].shader->flags10 & dword_01244d74)
                return true;
        }
        if (strstr(name, "decal"))
            return true;
    }
    if (g_filterFlags2 & 0x400)
    {
        for (i = 0; i < b->numFaces; i++)
        {
            if (b->faces[i].shader->flags10 & dword_01244d74)
                return false;
            if (strstr(b->faces[i].shader->name, "decal"))
                return false;
        }
        return true;
    }
    if (g_filterFlags & 0x20)
    {
        if (strstr(name, "clip"))
            return true;
    }
    if (g_filterFlags & 8)
    {
        for (i = 0; i < b->numFaces; i++)
        {
            if (b->faces[i].shader->flags20 & 0x20)
                return true;
            if ((b->faces[i].shader->contents & 0x1f00000) == 0x1400000)
                return true;
        }
    }
    if (g_filterFlags & 0x40)
    {
        if ((b->faces[0].contents & 0x8002084) == 0x8000000)
            return true;
    }
    if (g_filterFlags & 0x2000000)
    {
        if (b->faces[0].contents & 0x2080)
            return true;
    }
    if (g_filterFlags2 & 0x10)
    {
        if ((b->faces[0].contents & 0x8000004) == 0x8000004)
            return true;
    }
    if (g_filterFlags & 0x20000000)
    {
        if (b->owner == g_pWorldEntity->def || !strncmp(b->owner->eclass->name, "func_group", 10))
        {
            if (b->faces[0].contents & 0x28000000)
                return true;
        }
    }
    if (g_filterFlags & 0x80)
    {
        if (b->patch && b->patch->type != 0x40)
            return true;
    }
    if (g_filterFlags & 0x8000)
    {
        if (b->patch && b->patch->type == 0x40)
            return true;
    }
    if (g_filterFlags & 0x10000000)
    {
        if (b->faces[0].shader->flags20 & 0x20000000)
            return true;
    }
    if (g_filterFlags2 & 2)
    {
        if (b->FUN_0044f560(0x80000000))
            return true;
    }
    if (b->owner == g_pWorldEntity->def || !strcmp(b->owner->eclass->name, "func_group"))
    {
        if ((g_filterFlags & 0x10) && !(b->faces[0].contents & 0x8000000) && !b->patch && !strstr(name, "portal"))
            return true;
        return false;
    }
    if (g_filterFlags & 2)
    {
        if (strcmp(b->owner->eclass->name, "func_group") && strcmp(b->owner->eclass->name, "light"))
            return true;
    }
    if (g_filterFlags & 0x40000000)
    {
        if (strcmp(b->owner->eclass->name, "func_group") && strcmp(b->owner->eclass->name, "misc_model") && strcmp(b->owner->eclass->name, "misc_prefab"))
        {
            if (b->owner->modelClass || b->owner->eclass->modelName || FUN_00465d80(b->owner, "model"))
                return true;
        }
    }
    if (g_filterFlags & 0x10000)
    {
        if (!strncmp(b->owner->eclass->name, "ammo", 4) || !strncmp(b->owner->eclass->name, "item", 4))
            return true;
    }
    if (g_filterFlags & 0x40000)
    {
        if (!strncmp(b->owner->eclass->name, "info", 4))
            return true;
    }
    if (g_filterFlags & 0x80000)
    {
        if (!strcmp(b->owner->eclass->name, "misc_model"))
            return true;
    }
    if (g_filterFlags & 0x100000)
    {
        if (!strncmp(b->owner->eclass->name, "weapon", 6))
            return true;
    }
    if (g_filterFlags & 0x200000)
    {
        if (!strncmp(b->owner->eclass->name, "func", 4))
            return true;
    }
    if (g_filterFlags & 0x800000)
    {
        if (!strncmp(b->owner->eclass->name, "trigger", 7))
            return true;
    }
    if (g_filterFlags & 0x20000)
    {
        if (!strncmp(b->owner->eclass->name, "ai", 2) || !strncmp(b->owner->eclass->name, "actor", 5))
            return true;
    }
    if (g_filterFlags & 0x1000000)
    {
        if (!strncmp(b->owner->eclass->name, "misc", 4))
            return true;
    }
    if (g_filterFlags2 & 4)
    {
        if ((b->owner->eclass->flags & 0x20) && strcmp(b->owner->eclass->name, "node_pathnode"))
            return true;
    }
    if (g_filterFlags2 & 1)
    {
        if (!strcmp(b->owner->eclass->name, "node_pathnode"))
            return true;
    }
    const char *src = g_strFilter;
    char *dst = buf;
    while ((*dst++ = *src++))
        ;
    if (g_strFilter.GetLength() > 0)
    {
        char *tok = strtok(buf, ",;");
        while (tok)
        {
            while (*tok == ' ')
                tok++;
            if (!strstr(tok, ":"))
            {
                if (strstr(b->owner->eclass->name, tok))
                    return true;
            }
            else
            {
                I_strncpyz(token, tok, sizeof(token));
                char *colon = strstr(token, ":");
                if (colon)
                {
                    *colon++ = 0;
                    if (FUN_00465e10(b->owner, token, colon))
                        return true;
                }
            }
            tok = strtok(NULL, ",;");
        }
    }
    if (g_filterFlags & 1)
    {
        if (!strncmp(b->owner->eclass->name, "light", 5))
            return b->owner->eclass->flags & 1;
    }
    if (g_filterFlags & 4)
        return (b->owner->eclass->flags >> 2) & 1;
    return false;
}

// views of the editor structs this routine reads (offsets from retail accesses)
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
bool FUN_0045d090(const brushdef_t *b, float *color, const float *defaultColor);

int R_Add3DLine(GfxPointVertex *verts, const float *p1, const float *p2, const void *color, int width, int vertCount, int maxVertCount);
float Vec3Normalize(float *v);
extern entityInst_t entities;
int FUN_0046d710(int *out, const char *s);

static void BrushCenter(const brush_t *b, float *c)
{
    const float *m = (const float *)((const char *)b->def + 0x20);
    c[0] = (m[0] + m[3]) * 0.5f;
    c[1] = (m[1] + m[4]) * 0.5f;
    c[2] = (m[2] + m[5]) * 0.5f;
}

static void EntityColor(entityInst_t *e, brush_t *b, unsigned *out)
{
    float color[4];
    const float *c = e->def->eclass->color;
    color[0] = c[0];
    color[1] = c[1];
    color[2] = c[2];
    color[3] = 1.0f;
    FUN_0045d090(b->def, color, color);
    (*FUN_0059c468)(color, out);
}

// 0x004501f0: draws arrows from every entity to the entities its "target" names
void ConnectEntitiesByTargetname(void)
{
    const char *names[0x8000];
    entityInst_t *named[0x8000];
    GfxPointVertex verts[0x552];
    unsigned color;
    int count = 0;
    int n = 0;
    int numLines = 0;

    if (*(unsigned char *)0x1129888 & 4)
        return;
    for (entityInst_t *e = (entityInst_t *)entities.next; e != &entities && n != 0x8000; e = (entityInst_t *)e->next)
    {
        const char *name = ValueForKey(*(epair_t **)((char *)e->def + 100), "targetname");
        names[n] = name;
        if (*name && e->brushes.onext != &e->brushes)
            named[n++] = e;
    }
    count = n;
    for (entityInst_t *e = (entityInst_t *)entities.next; e != &entities; e = (entityInst_t *)e->next)
    {
        const char *target = ValueForKey(*(epair_t **)((char *)e->def + 100), "target");
#line 3091
        assert(target);
        if (!*target)
            continue;
        brush_t *b = e->brushes.onext;
        if (b == &e->brushes)
            continue;
        if (FUN_0044f5d0(b))
            continue;
        bool found = false;
        for (int i = 0; i < count; i++)
        {
            if (strcmp(names[i], target))
                continue;
            entityInst_t *te = named[i];
            brush_t *tb = te->brushes.onext;
            found = true;
            if (FUN_0044f5d0(tb))
                continue;
            float a[3], c[3], d[3], arrow[6];
            BrushCenter(b, c);
            BrushCenter(tb, a);
            d[0] = c[0] - a[0];
            d[1] = c[1] - a[1];
            d[2] = c[2] - a[2];
            float len = Vec3Normalize(d);
            float px = d[0] * 8.0f;
            float py = d[1] * 8.0f;
            arrow[0] = px - py;
            arrow[1] = px + py;
            arrow[3] = px + py;
            arrow[4] = py - px;
#line 3124
            assert(tb->owner && tb->owner == te);
            EntityColor(te, tb, &color);
            numLines = R_Add3DLine(verts, a, c, &color, 1, numLines, 0x552);
            int steps = 1 - (int)(len / -256.0f);
            for (int s = 0; s < steps; s++)
            {
                float t = ((float)s + 0.5f) * len / (float)steps;
                float m[3], w[3];
                m[0] = t * d[0] + a[0];
                m[1] = t * d[1] + a[1];
                m[2] = d[2] * t + a[2];
                w[0] = m[0] + arrow[0];
                w[1] = m[1] + arrow[1];
                w[2] = m[2];
                float v[3] = { m[0] + arrow[3], m[1] + arrow[4], m[2] };
                numLines = R_Add3DLine(verts, m, w, &color, 1, numLines, 0x552);
                numLines = R_Add3DLine(verts, m, v, &color, 1, numLines, 0x552);
            }
        }
        if (!found)
        {
            float a[3], c[3];
            BrushCenter(b, a);
            for (int i = 0; i < 3; i++)
                c[i] = (float)rand() / 32768.0f * 150.0f + a[i] - 75.0f;
            float col[4];
            col[0] = (float)rand() / 32768.0f;
            col[1] = (float)rand() / 32768.0f;
            col[2] = (float)rand() / 32768.0f;
            col[3] = 1.0f;
            (*FUN_0059c468)(col, &color);
            numLines = R_Add3DLine(verts, a, c, &color, 1, numLines, 0x552);
        }
    }
    if (numLines)
        (*(void (**)(int, int, GfxPointVertex *))0x59c460)(numLines / 2, 1, verts);
}

// 0x004509a0: draws arrows from every entity to the entities its "script_linkTo" names
void ConnectEntitiesByScriptLinkName(void)
{
    int names[0x8000];
    entityInst_t *named[0x8000];
    GfxPointVertex verts[0x552];
    unsigned color;
    int linkTo[32];
    int n = 0;
    int numLines = 0;

    if (*(unsigned char *)0x1129888 & 4)
        return;
    for (entityInst_t *e = (entityInst_t *)entities.next; e != &entities && n != 0x8000; e = (entityInst_t *)e->next)
    {
        int id = atol(ValueForKey(*(epair_t **)((char *)e->def + 100), "script_linkName"));
        names[n] = id;
        if (id && e->brushes.onext != &e->brushes)
            named[n++] = e;
    }
    for (entityInst_t *e = (entityInst_t *)entities.next; e != &entities; e = (entityInst_t *)e->next)
    {
        const char *tokens = ValueForKey(*(epair_t **)((char *)e->def + 100), "script_linkTo");
#line 3214
        assert(tokens);
        if (!*tokens)
            continue;
        brush_t *b = e->brushes.onext;
        if (b == &e->brushes)
            continue;
        if (FUN_0044f5d0(b))
            continue;
        int numLinks = FUN_0046d710(linkTo, tokens);
        for (int i = 0; i < n; i++)
        {
            int j = 0;
            while (j < numLinks && linkTo[j] != names[i])
                j++;
            if (j >= numLinks)
                continue;
            entityInst_t *te = named[i];
            brush_t *tb = te->brushes.onext;
            if (FUN_0044f5d0(tb))
                continue;
            float from[3], to[3];
            BrushCenter(b, from);
            BrushCenter(tb, to);
#line 3248
            assert(tb->owner && tb->owner == te);
            EntityColor(te, tb, &color);
            numLines = R_Add3DLine(verts, to, from, &color, 1, numLines, 0x552);
        }
    }
    if (numLines)
        (*(void (**)(int, int, GfxPointVertex *))0x59c460)(numLines / 2, 1, verts);
}

extern const char *dword_00591bbc[3];
extern const char *dword_00591bc8;
extern float g_vecArrow[4];
extern unsigned char byte_0124a216;

static void XYLabel(CXYWnd *wnd, const char *fmt, float value, int d1, int d2, int d3, const float *at, const float *right, const float *up)
{
    char text[64];
    float pos[3];
    sprintf(text, fmt, (double)value);
    pos[d1] = at[d1];
    pos[d2] = at[d2];
    pos[d3] = 2048.0f;
    re.DrawText(text, dword_011298c4, pos, right, up, g_colors[1]);
}

// 0x00450d90: arrowhead between two points plus the length labels
void DrawConnectionArrow(int nDim1, int nDim2, CXYWnd *wnd, const float *p1, const float *p2)
{
    int nDim3 = 3 - nDim2 - nDim1;
    float d[3], head[4][3], line[8][3];
    unsigned color;
    float right[3], up[3], pos[3];
    float scale = wnd->m_fScale;

    d[0] = p2[0] - p1[0];
    d[1] = p2[1] - p1[1];
    d[2] = p2[2] - p1[2];
    (*FUN_0059c468)(g_colors[0], &color);

    float w = 6.0f / scale;
    float h = 10.0f / scale;
    for (int i = 0; i < 8; i++)
        line[i][nDim3] = 2048.0f;
    line[0][nDim2] = p1[nDim2];
    line[0][nDim1] = p1[nDim1] - w;
    line[1][nDim2] = p1[nDim2];
    line[1][nDim1] = p1[nDim1] - h;
    line[2][nDim2] = p1[nDim2];
    line[2][nDim1] = p1[nDim1] - h;
    line[3][nDim2] = p2[nDim2] + w;
    line[3][nDim1] = p1[nDim1] - h;
    line[4][nDim2] = p2[nDim2] + w;
    line[4][nDim1] = p1[nDim1] - w;
    line[5][nDim2] = p2[nDim2] + h;
    line[5][nDim1] = p1[nDim1];
    line[6][nDim2] = p2[nDim2] + h;
    line[6][nDim1] = p2[nDim1];
    line[7][nDim2] = p2[nDim2] + w;
    line[7][nDim1] = p2[nDim1];
    (void)head;
    re.AddLines(4, 1, line);

    right[nDim1] = 1.0f / scale;
    right[nDim2] = 0;
    right[nDim3] = 0;
    up[nDim1] = 0;
    up[nDim2] = -1.0f / scale;
    up[nDim3] = 0;
    pos[nDim1] = (p1[nDim1] + p2[nDim1]) * 0.5f;
    pos[nDim2] = p1[nDim2] - 24.0f / scale;
    pos[nDim3] = 2048.0f;
    XYLabel(wnd, dword_00591bbc[nDim1], d[nDim1], nDim1, nDim2, nDim3, pos, right, up);
    pos[nDim1] = 16.0f / scale + p2[nDim1];
    pos[nDim2] = (p1[nDim2] + p2[nDim2]) * 0.5f;
    XYLabel(wnd, dword_00591bbc[nDim2], d[nDim2], nDim1, nDim2, nDim3, pos, right, up);
    pos[nDim1] = 4.0f / scale + p1[nDim1];
    pos[nDim2] = 8.0f / scale + p2[nDim2];
    XYLabel(wnd, dword_00591bc8, p2[nDim2], nDim1, nDim2, nDim3, pos, right, up);
}

// 0x00451230: circle of lines around a light, in the plane the view shows
void CXYWnd::DrawLightRadiusIcon(const float *center, int width, float radius, int segments, unsigned *color)
{
    GfxPointVertex verts[0x400];
    float a[3], b[3], prev[3], cur[3];
    int n = 0;

    switch (m_nViewType)
    {
    case YZ:
        a[0] = 0; a[1] = radius; a[2] = 0;
        b[0] = 0; b[1] = 0; b[2] = radius;
        break;
    case XZ:
        a[0] = radius; a[1] = 0; a[2] = 0;
        b[0] = 0; b[1] = 0; b[2] = radius;
        break;
    case XY:
        a[0] = radius; a[1] = 0; a[2] = 0;
        b[0] = 0; b[1] = radius; b[2] = 0;
        break;
    }
    float step = 6.2831855f / (float)segments;
    float s, c;
    FastSinCos(step, &s, &c);
    float sn = 0;
    float cs = 1.0f;
    prev[0] = b[0] + center[0];
    prev[1] = b[1] + center[1];
    prev[2] = b[2] + center[2];
    for (int i = 0; i < segments; i++)
    {
        float ns = cs * s + sn * c;
        cs = cs * c - sn * s;
        sn = ns;
        cur[0] = a[0] * sn + center[0] + b[0] * cs;
        cur[1] = a[1] * sn + center[1] + b[1] * cs;
        cur[2] = a[2] * sn + center[2] + b[2] * cs;
        n = R_Add3DLine(verts, prev, cur, color, width, n, 0x400);
        prev[0] = cur[0];
        prev[1] = cur[1];
        prev[2] = cur[2];
    }
    if (n)
        re.AddLines(n / 2, width, verts);
}

// 0x00451470: light radius circle from the "radius" key
void CXYWnd::DrawLight_Radius(brush_t *b, int width, unsigned *color)
{
    float center[3];
    BrushCenter(b, center);
#line 3412
    assert(b->owner->def == b->def->owner);
    atof(ValueForKey(*(epair_t **)((char *)b->owner->def + 100), "light"));
    float radius = (float)atof(ValueForKey(*(epair_t **)((char *)b->owner->def + 100), "radius"));
    DrawLightRadiusIcon(center, width, radius, 32, color);
}

// 0x00451550: light radius circle in the light's own "_color"
void CXYWnd::DrawLight_Color(brush_t *b, int width)
{
    float rgb[4] = { 0.2f, 0.5f, 0.35f, 1.0f };
    float center[3];
    float c[3];
    unsigned color;
    const char *colorString = ValueForKey(*(epair_t **)((char *)b->owner->def + 100), "_color");
#line 3435
    assert(colorString);
    if (sscanf(colorString, "%f %f %f", &c[0], &c[1], &c[2]) == 3)
    {
        rgb[0] = c[0];
        rgb[1] = c[1];
        rgb[2] = c[2];
    }
    (*FUN_0059c468)(rgb, &color);
    BrushCenter(b, center);
#line 3443
    assert(b->owner->def == b->def->owner);
    float radius = (float)atof(ValueForKey(*(epair_t **)((char *)b->owner->def + 100), "radius"));
    if (radius != 0.0f)
        DrawLightRadiusIcon(center, width, radius, 32, &color);
}

// 0x004516e0: box showing the light's extent in the side views
void CXYWnd::DrawLight_Box(const float *center, unsigned *color, int width, float radius, float up, float down, int segments)
{
    GfxPointVertex verts[8];
    float pts[6][3];
    int n = 0;
#line 3468
    assert(m_nViewType == XY || m_nViewType == XZ || m_nViewType == YZ);
    if (m_nViewType == XY)
    {
        DrawLightRadiusIcon(center, width, radius, segments, color);
        return;
    }
    for (int i = 0; i < 6; i++)
    {
        pts[i][0] = center[0];
        pts[i][1] = center[1];
        pts[i][2] = center[2];
    }
    int d = m_nViewType != XZ;
    pts[3][d] -= radius;
    pts[1][d] += radius;
    pts[2][d] += radius;
    pts[0][d] -= radius;
    pts[5][2] += down;
    pts[1][2] += down;
    pts[4][2] += up;
    pts[0][2] += up;
    n = R_Add3DLine(verts, pts[0], pts[3], color, width, n, 8);
    n = R_Add3DLine(verts, pts[2], pts[1], color, width, n, 8);
    n = R_Add3DLine(verts, pts[4], pts[5], color, width, n, 8);
    if (n)
        re.AddLines(n / 2, width, verts);
}

// 0x00451920: cone light drawn as a box of the "height" key
void CXYWnd::DrawLight_ConeHeight(brush_t *b, int width, unsigned *color)
{
    float center[3];
#line 3513
    assert(b->owner->def == b->def->owner);
    float radius = (float)atof(ValueForKey(*(epair_t **)((char *)b->owner->def + 100), "radius"));
    if (radius <= 0.0f)
        return;
    xyEntity_t *def = b->owner->def;
    float height;
    if ((signed char)((char *)def->eclass)[352] < 0)
        height = 32.0f;
    else
    {
        height = (float)atof(ValueForKey(*(epair_t **)((char *)def + 100), "height"));
        if (!(height > 0.0f))
            height = 80.0f;
    }
    const float *org = (const float *)((char *)def + 0x58);
    center[0] = org[0];
    center[1] = org[1];
    center[2] = org[2] + ((float *)def->eclass)[5];
    DrawLight_Box(center, color, width, radius, 0.0f, height, 32);
}

// 0x00451a40: classname label next to a light in the side views
void DrawLight_Classname(int nView, brush_t *b, float scale, int color)
{
#line 3552
    assert(nView == XY || nView == XZ || nView == YZ);
    if ((*(unsigned char *)0x1129890 & 0x20) || !b->owner || b->owner == (entityInst_t *)&entities)
        return;
#line 3563
    assert(b->owner->def == b->def->owner);
    entityInst_t *e = b->owner;
    if (b != e->brushes.onext)
        return;
#line 3567
    assert(b->owner->def == b->def->owner);
    const char *name = ValueForKey(*(epair_t **)((char *)e->def + 100), "classname");
    float pos[3], right[3], up[3];
    int d1 = nView == YZ;
    int d2 = (nView != XY) + 1;
    int d3 = 3 - d2 - d1;
    pos[d1] = ((const float *)((char *)b->def + 0x20))[d1] + 4.0f;
    pos[d2] = ((const float *)((char *)b->def + 0x20))[d2] + 4.0f;
    pos[d3] = 2048.0f;
    right[d1] = 1.0f / scale;
    right[d2] = 0;
    right[d3] = 0;
    up[d1] = 0;
    up[d2] = -1.0f / scale;
    up[d3] = 0;
    re.DrawText(name, dword_011298c4, pos, right, up, (const float *)color);
}

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

// 0x00451e00: view axes and the visible world rectangle of the 2D view
void CXYWnd::FUN_00451e00()
{
    float scale = 0.5f / m_fScale;
    field_a4 = (m_nViewType == YZ);
    field_a8 = (m_nViewType != XY) + 1;
    field_ac = 3 - field_a8 - field_a4;
    float hw = (float)m_nWidth * scale;
    float hh = (float)m_nHeight * scale;
    field_b0[0] = m_vOrigin[field_a4] - hw;
    field_b8[0] = hw + m_vOrigin[field_a4];
    field_b0[1] = m_vOrigin[field_a8] - hh;
    field_b8[1] = hh + m_vOrigin[field_a8];
    FUN_00451eb0();
}

extern orientation_t g_editorOrientation;
void OrientationPlaneToLocal(const orientation_t *orient, const float *plane, float *out);

// 0x00451eb0: the two view-axis planes in editor space, for culling brushes
void CXYWnd::FUN_00451eb0()
{
    float planes[2][4] = {};
    planes[0][field_a4] = 1.0f;
    planes[1][field_a8] = 1.0f;
    for (int i = 0; i < 2; i++)
    {
        float local[4];
        OrientationPlaneToLocal(&g_editorOrientation, planes[i], local);
        field_c0[i][0] = local[field_a4];
        field_c0[i][1] = local[field_a8];
        field_d0[i] = local[3] + field_b0[i];
        field_d8[i] = local[3] + field_b8[i];
    }
}

// 0x00451fe0: true when a brush box may touch the visible rectangle
bool CXYWnd::FUN_00451fe0(brush_t *b)
{
    const float *mins = (const float *)((char *)b->def + 0x20);
    const float *maxs = (const float *)((char *)b->def + 0x2c);
    for (int i = 0; i < 2; i++)
    {
        bool above = true;
        bool below = true;
        int k;
        for (k = 0; k < 4; k++)
        {
            float p1 = (k & 1) ? mins[field_a4] : maxs[field_a4];
            float p2 = (k & 2) ? mins[field_a8] : maxs[field_a8];
            float d = p1 * field_c0[i][0] + p2 * field_c0[i][1];
            if (d > field_d0[i])
            {
                if (!below)
                    break;
                above = false;
            }
            if (d < field_d8[i])
            {
                if (!above)
                    break;
                below = false;
            }
        }
        if (k == 4 && (above || below))
            return true;
    }
    return false;
}

extern brush_t active_brushes;
extern unsigned char byte_0109fe64;
extern int dword_011298b0;
extern int dword_011298dc, dword_011298e0, dword_011298e4, dword_011298e8;
extern void *dword_011298ec;
extern float color_011297a8[4];
extern float color_011297b8[4];
extern void (*FUN_0059c394)(const float *);
extern void (*FUN_0059c3c4)(int, const float *, float, int);
extern void (*FUN_0059c454)(const float *, const float (*)[3], float);
extern void (*FUN_0059c478)(void);
extern void (*FUN_0059c47c)(void);
extern float g_vSelectionColor[4];
void FUN_0040bff0(void);
void FUN_0040c210(void);
void FUN_0040c4a0(const float *quad);
void FUN_00436690(void);
void FUN_0045d7f0(brush_t *b, int view, int a, int b2, int c, int d, const unsigned *color, int width, int flag);
void FUN_0045f7e0(void);
void FUN_00450d90(int nDim1, int nDim2, CXYWnd *wnd, const float *p1, const float *p2);
void ExpandBounds(const float addedmins[3], const float addedmaxs[3], float mins[3], float maxs[3]);

// 0x004520d0: paints the whole 2D view
#line 3855
void CXYWnd::XY_Draw()
{
    if (!active_brushes.next)
        return;
    int nDim1 = (m_nViewType == YZ) ? 1 : 0;
    int nDim2 = (m_nViewType == XY) ? 1 : 2;
    int nDim3 = 3 - nDim1 - nDim2;
    float axes[3][3] = {};
    axes[0][nDim3] = 1.0f;
    axes[1][nDim1] = -1.0f;
    axes[2][nDim2] = 1.0f;
    (*FUN_0059c454)(m_vOrigin, axes, m_fScale);
    XY_DrawGrid();

    FUN_00451e00();

    int *frame = (int *)dword_01233b64;
    int lineWidthA = frame[160] ? 3 : 30;
    int lineWidthB = frame[161] ? 3 : 30;
    (*FUN_0059c478)();
    for (brush_t *b = active_brushes.next; b != &active_brushes; b = b->next)
    {
        const float *mn = (const float *)((char *)b->def + 0x20);
        if (mn[nDim1] > field_b8[0] || mn[nDim2] > field_b8[1])
            continue;
        if (FUN_0044f5d0(b))
            continue;
        unsigned color[4];
        FUN_00451c00(b, color);
        FUN_0045d7f0(b, m_nViewType, lineWidthA, 30, lineWidthB, 30, color, 1, 0);
        DrawLight_Classname(m_nViewType, b, m_fScale, (int)g_colors[2]);
    }
    FUN_0040bff0();
    (*FUN_0059c47c)();
    if (!(*(unsigned char *)0x1129890 & 0x40))
        XY_DrawBlockGrid();

    float col[4];
    if (!g_bRotateMode)
    {
        if (!byte_0109fe64)
        {
            col[0] = color_011297a8[0];
            col[1] = color_011297a8[1];
            col[2] = color_011297a8[3];
            col[3] = color_011297a8[2];
        }
        else
        {
            col[0] = 0.1f;
            col[1] = 0.8f;
            col[2] = 1.0f;
            col[3] = 0.1f;
        }
    }
    else
    {
        col[0] = 0.8f;
        col[1] = 0.1f;
        col[2] = 0.9f;
        col[3] = 1.0f;
    }
    unsigned color;
    (*FUN_0059c468)(col, &color);
    float selMins[3] = { 131072.0f, 131072.0f, 131072.0f };
    float selMaxs[3] = { -131072.0f, -131072.0f, -131072.0f };
    bool anyOrigin = false;
    (*FUN_0059c3c4)(2, (const float *)0x53dc54, 1.0f, 0);
    (*FUN_0059c478)();
    for (brush_t *b = selected_brushes.next; b != &selected_brushes; b = b->next)
    {
        int width = frame[153] != 0 ? 2 : 1;
        FUN_0045d7f0(b, m_nViewType, lineWidthA, 30, lineWidthB, 30, &color, width, 0);
        DrawLight_Classname(m_nViewType, b, m_fScale, (int)col);
        assert(b->owner->def == b->def->owner);
        xyEntity_t *ent = b->owner->def;
        unsigned flags = ent->eclass->flags;
        if (flags & 1)
            DrawLight_Radius(b, 1, &color);
        else if (flags & 0x20)
            DrawLight_ConeHeight(b, 1, &color);
        else if (flags & 0xc0)
            DrawLight_ConeHeight(b, width, &color);
        else
            DrawLight_Color(b, width);
        if (!anyOrigin)
        {
            if (b->owner->def)
                anyOrigin = true;
            if (frame[143])
                ExpandBounds((const float *)((char *)b->def + 0x20), (const float *)((char *)b->def + 0x2c), selMins, selMaxs);
        }
    }
    for (brush_t *b = active_brushes.next; b != &active_brushes; b = b->next)
    {
        const float *mn = (const float *)((char *)b->def + 0x20);
        if (mn[nDim1] > field_b8[0] || mn[nDim2] > field_b8[1])
            continue;
        xyEntity_t *ent = b->owner->def;
        if ((((char *)ent->eclass)[352] & 0xc0) == 0)
        {
            const char *name = ValueForKey(*(epair_t **)((char *)ent + 100), "targetname");
            if (!memcmp(name, "badplace", 9))
                DrawLight_Color(b, frame[153] != 0 ? 2 : 1);
            if (!memcmp(name, "heading", 8))
                DrawLight_Color(b, frame[153] != 0 ? 2 : 1);
        }
        else
        {
            unsigned c4[4];
            FUN_00451c00(b, c4);
            DrawLight_ConeHeight(b, 1, c4);
        }
    }
    (*FUN_0059c394)(color_011297b8);
    (*FUN_0059c47c)();
    (*FUN_0059c394)(NULL);
    if (frame[155])
        FUN_00436690();
    if (!anyOrigin && !g_bRotateMode && !byte_0109fe64 && selected_brushes.next != &selected_brushes && frame[143])
        FUN_00450d90(nDim1, nDim2, this, selMins, selMaxs);
    FUN_0040c210();

    if (dword_011298ec == (void *)0x44c620 && (dword_011298b0 == 5 || dword_011298b0 == 14 || dword_011298b0 == 15 || dword_011298b0 == 16 || dword_011298b0 == 17))
    {
        float p0[3], p1[3];
        int x0 = dword_011298dc < dword_011298e0 ? dword_011298dc : dword_011298e0;
        int x1 = dword_011298dc < dword_011298e0 ? dword_011298e0 : dword_011298dc;
        int y0 = dword_011298e4 < dword_011298e8 ? dword_011298e4 : dword_011298e8;
        int y1 = dword_011298e4 < dword_011298e8 ? dword_011298e8 : dword_011298e4;
        XY_ToPoint(x0, y0, p0);
        p0[nDim3] = 2048.0f;
        XY_ToPoint(x1, y1, p1);
        p1[nDim3] = 2048.0f;
        float quad[4][4];
        quad[0][nDim1] = p0[nDim1];
        quad[0][nDim2] = p0[nDim2];
        quad[0][nDim3] = 2048.0f;
        quad[0][3] = 1.0f;
        quad[1][nDim1] = p0[nDim1];
        quad[1][nDim2] = p1[nDim2];
        quad[1][nDim3] = 2048.0f;
        quad[1][3] = 1.0f;
        quad[2][nDim1] = p1[nDim1];
        quad[2][nDim2] = p1[nDim2];
        quad[2][nDim3] = 2048.0f;
        quad[2][3] = 1.0f;
        quad[3][nDim1] = p1[nDim1];
        quad[3][nDim2] = p0[nDim2];
        quad[3][nDim3] = 2048.0f;
        quad[3][3] = 1.0f;
        FUN_0040c4a0(&quad[0][0]);
    }
    DrawCameraIcon();
    DrawZIcon();
    if (g_bRotateMode)
        DrawRotateIcon();
    FUN_0045f7e0();
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


void FUN_00449c90(void);
void FUN_0046fb30(void);
extern int dword_0123348c;
extern bool g_bRogueClipMode;
extern void *dword_010bcd68;

// 0x00452930
void CXYWnd::OnSize(UINT nType, int cx, int cy)
{
    CWnd::OnSize(nType, cx, cy);
    CRect rect;
    GetClientRect(rect);
    m_nWidth = rect.Width();
    m_nHeight = rect.Height();
    if (re.ResizeWindow)
        re.ResizeWindow((HWND)dword_010bcd68, m_nWidth, m_nHeight);
    Invalidate(FALSE);
}

// 0x00452990
void CXYWnd::Clip()
{
    if (g_bClipMode)
    {
        brush_t hold;
        hold.next = &hold;
        FUN_00449c90();
        brush_t *pList;
        if (*(int *)((char *)dword_01233b64 + 0x2d8))
            pList = ((m_nViewType == XZ) ? g_bSwitch : !g_bSwitch) ? &g_brFrontSplits : &g_brBackSplits;
        else
            pList = ((m_nViewType == XZ) ? !g_bSwitch : g_bSwitch) ? &g_brFrontSplits : &g_brBackSplits;
        if (pList->next != pList)
        {
            FUN_00449ff0(&hold, pList);
            CleanList(&g_brFrontSplits);
            CleanList(&g_brBackSplits);
            FUN_0046fb30();
            FUN_00449ff0(&selected_brushes, &hold);
            if (RogueClipMode())
                RetainClipMode(false);
            else
                RetainClipMode(true);
            dword_0123348c = -1;
        }
    }
}

// 0x00452a60
void CXYWnd::SplitClip()
{
    FUN_00449c90();
    if (g_brFrontSplits.next != &g_brFrontSplits && g_brBackSplits.next != &g_brBackSplits)
    {
        FUN_0046fb30();
        FUN_00449ff0(&selected_brushes, &g_brFrontSplits);
        FUN_00449ff0(&selected_brushes, &g_brBackSplits);
        CleanList(&g_brFrontSplits);
        CleanList(&g_brBackSplits);
        if (RogueClipMode())
            RetainClipMode(false);
        else
            RetainClipMode(true);
    }
}

void FUN_00452ae0()
{
    g_bSwitch = !g_bSwitch;
    g_nUpdateBits |= 0x102;
}

extern int dword_010c4d84[];
extern float *dword_010c4d88[];
extern CMainFrame *dword_01233488;

// 0x00452b00: centres the view on the camera, the selection or the point list
void CXYWnd::PositionView()
{
    int nDim1 = (m_nViewType == YZ) ? 1 : 0;
    int nDim2 = (m_nViewType == XY) ? 1 : 2;
    int mode = dword_011298b0;
    if ((mode == 1 || mode == 4 || mode == 5 || mode == 6 || mode == 9) && dword_010c4d84[0] != 0)
    {
        m_vOrigin[nDim1] = 0;
        m_vOrigin[nDim2] = 0;
        for (int i = 0; i < dword_010c4d84[0]; i++)
        {
            m_vOrigin[nDim1] += dword_010c4d88[i][nDim1];
            m_vOrigin[nDim2] += dword_010c4d88[i][nDim2];
        }
        m_vOrigin[nDim1] /= (float)dword_010c4d84[0];
        m_vOrigin[nDim2] /= (float)dword_010c4d84[0];
    }
    else
    {
        m_vOrigin[nDim1] = ((float *)(*(char **)((char *)dword_01233488 + 0x78c) + 0x60))[nDim1];
        m_vOrigin[nDim2] = ((float *)(*(char **)((char *)dword_01233488 + 0x78c) + 0x60))[nDim2];
        for (brush_t *b = selected_brushes.next; b != &selected_brushes; b = b->next)
        {
            if (b->next == &selected_brushes)
            {
                m_vOrigin[nDim1] = (((float *)((char *)b->def + 0x20))[nDim1 + 3] + ((float *)((char *)b->def + 0x20))[nDim1]) * 0.5f;
                m_vOrigin[nDim2] = (((float *)((char *)b->def + 0x20))[nDim2 + 3] + ((float *)((char *)b->def + 0x20))[nDim2]) * 0.5f;
            }
        }
    }
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

void FUN_00470c00(float mid[3]);

// 0x00452d90
bool CXYWnd::SetRotateMode(bool bMode)
{
    if (bMode && selected_brushes.next != &selected_brushes)
    {
        g_bRotateMode = true;
        FUN_00470c00(g_vRotateOrigin);
        g_vRotation[0] = g_vRotation[1] = g_vRotation[2] = 0;
    }
    else
    {
        if (bMode)
            Sys_Printf("Need a brush selected to turn on Mouse Rotation mode\n");
        g_bRotateMode = false;
    }
    RedrawWindow(NULL, NULL, RDW_INVALIDATE | RDW_ERASE | RDW_UPDATENOW);
    return g_bRotateMode;
}

void CXYWnd::SetScaleMode(bool bMode)
{
    g_bScaleMode = bMode;
    RedrawWindow(NULL, NULL, RDW_INVALIDATE | RDW_ERASE | RDW_UPDATENOW);
}

// Retail one-byte RET bodies verified with MSVC 7.1. Original entry-point ownership/signatures remain provisional.
extern "C" void FUN_00452e20() {}

// RTTI .?AVAbstractFileWrapper@@; the slot 0 name is unknown, it is named after its first body 0x00467df0
class AbstractFileWrapper
{
public:
    virtual void FUN_00467df0(const char *fmt, ...) = 0;
};
// RTTI .?AVMemoryFileWrapper@@, vtable 0x0054ebb0
class MemoryFileWrapper : public AbstractFileWrapper
{
public:
    MemoryFileWrapper(CFile *file);
    void FUN_00467df0(const char *fmt, ...);
    CFile *m_file;
};
void FUN_0046adf0(CFile *file);
void Sys_Printf(const char *fmt, ...);
extern CMemFile g_Clipboard;

void CXYWnd::Copy()
{
    CWaitCursor WaitCursor;
    g_Clipboard.SetLength(0);
    FUN_0046adf0(&g_Clipboard);
    bool bClipped = false;
    UINT nClipboard = ::RegisterClipboardFormat("RadiantClippings");
    if (nClipboard > 0)
    {
        if (OpenClipboard())
        {
            ::EmptyClipboard();
            long lSize = g_Clipboard.GetLength();
            HANDLE h = ::GlobalAlloc(GMEM_ZEROINIT | GMEM_MOVEABLE | GMEM_DDESHARE, lSize + sizeof(long));
            if (h != NULL)
            {
                unsigned char *cp = reinterpret_cast<unsigned char *>(::GlobalLock(h));
                memcpy(cp, &lSize, sizeof(long));
                cp += sizeof(long);
                g_Clipboard.SeekToBegin();
                g_Clipboard.Read(cp, lSize);
                ::GlobalUnlock(h);
                ::SetClipboardData(nClipboard, h);
                ::CloseClipboard();
                bClipped = true;
            }
        }
    }
    if (!bClipped)
        Sys_Printf("Unable to register Windows clipboard formats, copy/paste between editors will not be possible");
}

// 0x00452f50: pastes the clipboard copy into the map
void Com_BeginParseSession(const char *filename);
void Com_EndParseSession(void);
void Com_SetSpaceDelimited(int spaceDelimited);
void Com_SetParseNegativeNumbers(int negativeNumbers);
void FUN_004699b0(const char **data, int flags);

void CXYWnd::Paste()
{
    CWaitCursor WaitCursor;
    UINT nClipboard = ::RegisterClipboardFormat("RadiantClippings");
    if (nClipboard > 0 && OpenClipboard())
    {
        if (::IsClipboardFormatAvailable(nClipboard))
        {
            HANDLE h = ::GetClipboardData(nClipboard);
            if (h)
            {
                g_Clipboard.SetLength(0);
                char *cp = reinterpret_cast<char *>(::GlobalLock(h));
                long n = *reinterpret_cast<long *>(cp);
                g_Clipboard.Write(cp + sizeof(long), n);
            }
            ::GlobalUnlock(h);
            ::CloseClipboard();
        }
    }
    if (g_Clipboard.GetLength() > 0)
    {
        g_Clipboard.SeekToBegin();
        long lSize = (long)g_Clipboard.GetLength();
        char *buf = new char[lSize + 1];
        g_Clipboard.Read(buf, lSize);
        buf[lSize] = 0;
        Com_BeginParseSession("paste from clipboard");
        Com_SetSpaceDelimited(0);
        Com_SetParseNegativeNumbers(1);
        const char *p = buf;
        FUN_004699b0(&p, 4);
        Com_EndParseSession();
        delete[] buf;
    }
}

float (&CXYWnd::RotateOrigin())[3]
{
    return g_vRotateOrigin;
}

float (&CXYWnd::Rotation())[3]
{
    return g_vRotation;
}

// 0x00453100: edge scrolling while a drag runs outside the view
void CXYWnd::OnTimer(UINT nIDEvent)
{
    int nDim1 = (m_nViewType == YZ) ? 1 : 0;
    int nDim2 = (m_nViewType == XY) ? 1 : 2;
    m_vOrigin[nDim1] -= m_ptDragAdj.x;
    m_vOrigin[nDim2] += m_ptDragAdj.y;
    g_nUpdateBits |= 3;
    m_ptDrag.x = (int)(m_ptDrag.x - m_ptDragAdj.x * m_fScale);
    m_ptDrag.y = (int)(m_ptDrag.y - m_ptDragAdj.y * m_fScale);
    m_ptDragTotal.x = (int)(m_ptDragTotal.x - m_ptDragAdj.x * m_fScale);
    m_ptDragTotal.y = (int)(m_ptDragTotal.y - m_ptDragAdj.y * m_fScale);
    XY_MouseMoved(m_ptDrag.x, m_nHeight - 1 - m_ptDrag.y, m_nScrollFlags);
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

extern "C" X87_FLOOR_FUNC(FUN_004533f0)

XYWndNode::XYWndNode(int id, const char *name)
{
    next = NULL;
    field_00 = id;
    field_04 = name;
}

void FUN_00453530(int *p)
{
    p[0] = 0;
    p[2] = 0;
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
