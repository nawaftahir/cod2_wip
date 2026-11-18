#include "stdafx.h"
#include <stddef.h>
#include <string.h>
#include "radiant_wnd.h"
#include "../universal/com_math.h"


class CXYWnd;
class CMainFrame
{
public:
    void OnKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags);
};
void __stdcall FUN_004137d0(CMainFrame *self, UINT nChar);
struct orientation_t { float origin[3]; float axis[3][3]; };
extern orientation_t g_editorOrientation;
void OrientationPosToLocal(const orientation_t *orient, const float *pos, float *out);
void OrientationDirToLocal(const orientation_t *orient, const float *dir, float *out);
extern CMainFrame *g_pParentWnd;
extern HWND dword_010bcd58;

struct CCamWndMainProjection
{
    BOOL OnMouseWheel(UINT flags, short delta, CPoint point);
};

struct CamWndRefExport
{
    unsigned char pad[0x148];
    void (*ResizeWindow)(HWND window, int width, int height);
};
extern CamWndRefExport re;

class CCamWnd;
void __stdcall FUN_00405380(CCamWnd *camera);

struct plane_t
{
    float normal[3];
    double dist;
    int type;
};

struct CMainFrameCamView
{
    unsigned char pad[0x78c];
    CCamWnd *m_pCamWnd;
};


IMPLEMENT_DYNCREATE(CCamWnd, CWnd)

CCamWnd::CCamWnd()
{
    m_pXYFriend = NULL;
    memset(&m_Camera, 0, sizeof(m_Camera));
    m_bClipMode = false;
    field_120 = 0;
    field_124 = 0;
    field_128 = true;
    Cam_Init();
}

CCamWnd::~CCamWnd()
{
}

BEGIN_MESSAGE_MAP(CCamWnd, CWnd)
    ON_WM_KEYDOWN()
    ON_WM_PAINT()
    ON_WM_DESTROY()
    ON_WM_CLOSE()
    ON_WM_MOUSEMOVE()
    ON_WM_LBUTTONDOWN()
    ON_WM_LBUTTONUP()
    ON_WM_MBUTTONDOWN()
    ON_WM_MBUTTONUP()
    ON_WM_RBUTTONDOWN()
    ON_WM_RBUTTONUP()
    ON_WM_CREATE()
    ON_WM_SIZE()
    ON_WM_NCCALCSIZE()
    ON_WM_KILLFOCUS()
    ON_WM_SETFOCUS()
    ON_WM_KEYUP()
    ON_WM_MOUSEWHEEL()
    ON_WM_SYSKEYDOWN()
END_MESSAGE_MAP()

LRESULT CALLBACK CamWndProc(HWND window, UINT message, WPARAM wparam, LPARAM lparam)
{
    RECT rect;
    GetClientRect(window, &rect);
    switch (message)
    {
    case WM_KILLFOCUS:
    case WM_SETFOCUS:
        SendMessageA(window, WM_NCACTIVATE, message == WM_SETFOCUS, 0);
        return 0;
    case WM_NCCALCSIZE:
        DefWindowProcA(window, message, wparam, lparam);
        return WVR_REDRAW;
    }
    return DefWindowProcA(window, message, wparam, lparam);
}

void FUN_0047a760(const char *format, ...);

BOOL CCamWnd::PreCreateWindow(CREATESTRUCT &create)
{
    WNDCLASSA windowClass;
    HINSTANCE instance = AfxGetInstanceHandle();
    if (!::GetClassInfoA(instance, "QCamera", &windowClass))
    {
        memset(&windowClass, 0, sizeof(windowClass));
        windowClass.style = CS_NOCLOSE;
        windowClass.lpszClassName = "QCamera";
        windowClass.hCursor = LoadCursorA(NULL, IDC_ARROW);
        windowClass.lpfnWndProc = CamWndProc;
        if (!AfxRegisterClass(&windowClass))
            FUN_0047a760("CCamWnd RegisterClass: failed");
    }
    create.lpszClass = "QCamera";
    create.lpszName = "CAM";
    if (create.style != 0x56c70000)
        create.style = 0x56000000;
    return CWnd::PreCreateWindow(create);
}

void CCamWnd::OnKeyDown(UINT key, UINT repeat, UINT flags)
{
    g_pParentWnd->OnKeyDown(key, repeat, flags);
}

void CCamWnd::SetXYFriend(CXYWnd *window)
{
    m_pXYFriend = window;
}

void CCamWnd::OnClose()
{
    Default();
}

// Retail 0x004032a0: camera mouse movement and last-cursor tracking.
void CCamWnd::OnMouseMove(UINT flags, CPoint point)
{
    CRect rect;
    GetClientRect(rect);
    Cam_MouseMoved(point.x, rect.bottom - 1 - point.y, flags);
    m_ptLastCursor = point;
}



void CCamWnd::OnLButtonDown(UINT flags, CPoint point)
{
    m_ptLastCursor = point;
    OriginalMouseDown(flags, point);
}



void CCamWnd::OnLButtonUp(UINT flags, CPoint point)
{
    OriginalMouseUp(flags, point);
}

void CCamWnd::OnMButtonDown(UINT flags, CPoint point)
{
    OriginalMouseDown(flags, point);
}



void CCamWnd::OnMButtonUp(UINT flags, CPoint point)
{
    OriginalMouseUp(flags, point);
}

void CCamWnd::OnRButtonDown(UINT flags, CPoint point)
{
    OriginalMouseDown(flags, point);
}

void CCamWnd::OnRButtonUp(UINT flags, CPoint point)
{
    OriginalMouseUp(flags, point);
}

int CCamWnd::OnCreate(LPCREATESTRUCT create)
{
    if (Default() == -1)
        return -1;
    dword_010bcd58 = GetSafeHwnd();
    return 0;
}





// Retail 0x004034f0: shared release behavior behind three mouse-up handlers.
void CCamWnd::OriginalMouseUp(UINT flags, CPoint point)
{
    CRect rect;
    GetClientRect(rect);
    Cam_MouseUp(point.x, rect.bottom - 1 - point.y, flags);
    if (!(flags & (MK_LBUTTON | MK_RBUTTON | MK_MBUTTON)))
        ReleaseCapture();
}

void CCamWnd::OriginalMouseDown(UINT flags, CPoint point)
{
    CRect rect;
    GetClientRect(rect);
    SetFocus();
    SetCapture();
    Cam_MouseDown(point.x, rect.bottom - 1 - point.y, flags);
}

void CCamWnd::Cam_Init()
{
    m_Camera.timing = 0;
    m_Camera.origin[0] = 0;
    m_Camera.origin[1] = 20;
    m_Camera.origin[2] = 46;
    m_Camera.color[0] = 0.3f;
    m_Camera.color[1] = 0.3f;
    m_Camera.color[2] = 0.3f;
}

void __stdcall FUN_004035a0(CCamWnd *camera)
{
    vec3_t angles;
    VectorCopy(camera->m_Camera.angles, angles);
    angles[0] = -angles[0];
    AngleVectors(angles, camera->m_Camera.vpn, camera->m_Camera.vright, camera->m_Camera.vup);
    YawVectors(camera->m_Camera.angles[1], camera->m_Camera.forward, camera->m_Camera.right);
}

void CCamWnd::FUN_00403ce0(int x, int y, float *dir)
{
    float scale;
    if (m_Camera.height > m_Camera.width)
        scale = 2.0f / m_Camera.height;
    else
        scale = 2.0f / m_Camera.width;
    int dy = y - m_Camera.height / 2;
    int dx = x - m_Camera.width / 2;
    float u = dy * scale;
    float r = dx * scale;
    dir[0] = r * m_Camera.vright[0] + u * m_Camera.vup[0] + m_Camera.vpn[0];
    dir[1] = r * m_Camera.vright[1] + u * m_Camera.vup[1] + m_Camera.vpn[1];
    dir[2] = r * m_Camera.vright[2] + u * m_Camera.vup[2] + m_Camera.vpn[2];
    Vec3Normalize(dir);
}


void FUN_00403dc0(int x1, int y1, int x2, int y2, plane_t *planes)
{
    int xmin = x1 < x2 ? x1 : x2;
    int xmax = x1 - xmin + x2;
    int ymin = y1 < y2 ? y1 : y2;
    int ymax = y1 - ymin + y2;

    CCamWnd *cam = reinterpret_cast<CMainFrameCamView *>(g_pParentWnd)->m_pCamWnd;
    float origin[3];
    float pts[4][3];
    cam->FUN_00403ce0(xmin, ymin, pts[0]);
    cam->FUN_00403ce0(xmin, ymax, pts[1]);
    cam->FUN_00403ce0(xmax, ymax, pts[2]);
    cam->FUN_00403ce0(xmax, ymin, pts[3]);

    VectorCopy(cam->m_Camera.origin, origin);

    for (int i = 0; i < 4; i++)
    {
        Vec3Cross(pts[i], pts[(i + 3) % 4], planes[i].normal);
        planes[i].dist = DotProduct(planes[i].normal, origin);
        planes[i].type = -1;
    }
}

void FUN_00462760(int buttons);

void CCamWnd::Cam_MouseUp(int x, int y, int buttons)
{
    m_nCambuttonstate = 0;
    FUN_00462760(buttons);
    field_120 = 0;
    field_124 = 0;
    field_128 = true;
    while (ShowCursor(TRUE) < 0)
        ;
}

void CCamWnd::InitCull()
{
    m_vCull1[0] = m_Camera.vpn[0] - m_Camera.vright[0];
    m_vCull1[1] = m_Camera.vpn[1] - m_Camera.vright[1];
    m_vCull1[2] = m_Camera.vpn[2] - m_Camera.vright[2];
    m_vCull2[0] = m_Camera.vpn[0] + m_Camera.vright[0];
    m_vCull2[1] = m_Camera.vpn[1] + m_Camera.vright[1];
    m_vCull2[2] = m_Camera.vpn[2] + m_Camera.vright[2];

    for (int i = 0; i < 3; i++)
    {
        if (m_vCull1[i] > 0)
            m_nCullv1[i] = 3 + i;
        else
            m_nCullv1[i] = i;
        if (m_vCull2[i] > 0)
            m_nCullv2[i] = 3 + i;
        else
            m_nCullv2[i] = i;
    }

    FUN_00405380(this);
}

void __stdcall FUN_00405380(CCamWnd *camera)
{
    OrientationPosToLocal(&g_editorOrientation, camera->m_Camera.origin, camera->field_12c);
    OrientationDirToLocal(&g_editorOrientation, camera->m_vCull1, camera->cullNormals[0]);
    OrientationDirToLocal(&g_editorOrientation, camera->m_vCull2, camera->cullNormals[1]);
    for (int k = 0; k < 2; k++)
    {
        for (int i = 0; i < 3; i++)
        {
            if (camera->cullNormals[k][i] > 0)
                camera->cullIndices[k][i] = 3 + i;
            else
                camera->cullIndices[k][i] = i;
        }
    }
}

void CCamWnd::OnSize(UINT type, int cx, int cy)
{
    CWnd::OnSize(type, cx, cy);
    CRect rect;
    GetClientRect(rect);
    int width = rect.right;
    int height = rect.bottom;
    m_Camera.width = width;
    m_Camera.height = height;
    if (re.ResizeWindow)
        re.ResizeWindow(dword_010bcd58, width, height);
    Invalidate(FALSE);
}

// Retail one-byte RET bodies verified with MSVC 7.1. Original entry-point ownership/signatures remain provisional.
extern "C" void FUN_00407550() {}

void CCamWnd::OnKeyUp(UINT key, UINT repeat, UINT flags)
{
    FUN_004137d0(g_pParentWnd, key);
}

BOOL CCamWnd::OnMouseWheel(UINT flags, short delta, CPoint point)
{
    return reinterpret_cast<CCamWndMainProjection *>(g_pParentWnd)->OnMouseWheel(flags, delta, point);
}

void CCamWnd::OnSysKeyDown(UINT key, UINT repeat, UINT flags)
{
    g_pParentWnd->OnKeyDown(key, repeat, flags);
}

extern "C" void FUN_004077c0() {}
