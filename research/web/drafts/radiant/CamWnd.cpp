#include "stdafx.h"
#include <stddef.h>
#include <string.h>

struct CameraState
{
    int width;
    int height;
    int timing;
    float origin[3];
    float angles[3];
    int drawMode;
    float color[3];
    float forward[3];
    float right[3];
    float up[3];
    float vup[3];
    float vpn[3];
    float vright[3];
};

class CXYWnd;
class CCamWnd : public CWnd
{
    DECLARE_DYNCREATE(CCamWnd)
public:
    CCamWnd();
    virtual ~CCamWnd();
    void SetXYFriend(CXYWnd *window);
    void Cam_Init();
    CXYWnd *m_pXYFriend;
    CameraState m_Camera;
    int m_nCambuttonstate;
    CPoint m_ptButton;
    CPoint m_ptCursor;
    CPoint m_ptLastCursor;
    // Retail storage between cursor state and the clip flag; fields remain undecoded.
    unsigned char field_0ec[0x30];
    bool m_bClipMode;
    int field_120;
    int field_124;
    bool field_128;
    // Retail storage before the culling vectors; fields remain undecoded.
    unsigned char field_12c[12];
    float cullNormals[2][3];
    int cullIndices[2][3];
protected:
    virtual BOOL PreCreateWindow(CREATESTRUCT &create);
    void OriginalMouseDown(UINT flags, CPoint point);
    void OriginalMouseUp(UINT flags, CPoint point);
    void Cam_MouseDown(int x, int y, int buttons);
    void Cam_MouseUp(int x, int y, int buttons);
    void Cam_MouseMoved(int x, int y, int buttons);
    afx_msg void OnKeyDown(UINT key, UINT repeat, UINT flags);
    afx_msg void OnPaint();
    afx_msg void OnClose();
    afx_msg void OnMouseMove(UINT flags, CPoint point);
    afx_msg void OnLButtonDown(UINT flags, CPoint point);
    afx_msg void OnLButtonUp(UINT flags, CPoint point);
    afx_msg void OnMButtonDown(UINT flags, CPoint point);
    afx_msg void OnMButtonUp(UINT flags, CPoint point);
    afx_msg void OnRButtonDown(UINT flags, CPoint point);
    afx_msg void OnRButtonUp(UINT flags, CPoint point);
    afx_msg int OnCreate(LPCREATESTRUCT create);
    afx_msg void OnSize(UINT type, int width, int height);
    afx_msg void OnKeyUp(UINT key, UINT repeat, UINT flags);
    afx_msg BOOL OnMouseWheel(UINT flags, short delta, CPoint point);
    afx_msg void OnSysKeyDown(UINT key, UINT repeat, UINT flags);
    DECLARE_MESSAGE_MAP()
};

typedef char CameraStateSize[(sizeof(CameraState) == 0x7c) ? 1 : -1];
typedef char CamWindowSize[(sizeof(CCamWnd) == 0x168) ? 1 : -1];
typedef char CamStateOffset[(offsetof(CCamWnd, m_Camera) == 0x54) ? 1 : -1];
typedef char CamLastCursorOffset[(offsetof(CCamWnd, m_ptLastCursor) == 0xe4) ? 1 : -1];
typedef char CamClipOffset[(offsetof(CCamWnd, m_bClipMode) == 0x11c) ? 1 : -1];
typedef char CamCullOffset[(offsetof(CCamWnd, cullNormals) == 0x138) ? 1 : -1];

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

void CCamWnd::SetXYFriend(CXYWnd *window)
{
    m_pXYFriend = window;
}

void CCamWnd::OnClose()
{
    Default();
}



void CCamWnd::OnLButtonDown(UINT flags, CPoint point)
{
    m_ptLastCursor = point;
    OriginalMouseDown(flags, point);
}



void CCamWnd::OnMButtonDown(UINT flags, CPoint point)
{
    OriginalMouseDown(flags, point);
}



void CCamWnd::OnRButtonDown(UINT flags, CPoint point)
{
    OriginalMouseDown(flags, point);
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

// Isolated trial of one-byte retail no-op code paths; signatures unconfirmed.
extern "C" void FUN_00407550() {}
extern "C" void FUN_004077c0() {}
