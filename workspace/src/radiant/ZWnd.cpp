#include "stdafx.h"
#include <math.h>
#include <string.h>
#include "radiant_wnd.h"

#define COLOR_GRIDBACK 1
#define QE3_STYLE (WS_OVERLAPPED | WS_CLIPCHILDREN | WS_CLIPSIBLINGS | WS_VISIBLE | WS_CHILD)
#define QE3_CHILDSTYLE (QE3_STYLE | WS_CAPTION | WS_THICKFRAME | WS_MINIMIZEBOX | WS_MAXIMIZEBOX)

struct z_t
{
	int cursory;
	int cursorx;
	int width;
	int height;
	int timing;
	float origin[3];
	float scale;
};

struct ZWndSavedInfo_t
{
	float colors[12][4];
};

struct ZWndGlobals_t
{
	int d_showgrid;
	int d_gridsize;
	unsigned char pad0[0x3c];
	HWND d_hwndZ;
	unsigned char pad1[0x6c998];
	ZWndSavedInfo_t d_savedinfo;
};

#include "refexport.h"












class CMainFrame
{
public:
    void OnKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags);
    BOOL OnMouseWheel(UINT nFlags, short zDelta, CPoint pt);
};
void __stdcall FUN_004137d0(CMainFrame *self, UINT nChar);
struct CZWndMainProjection
{
	void UpdateStatusBar();

	void SetStatusText(int nPane, const char *pText)
	{
		if (pText && nPane <= 5 && nPane > 0)
		{
			m_strStatus[nPane] = pText;
			UpdateStatusBar();
		}
	}

	unsigned char pad[0x7a4];
	CString m_strStatus[6];
};

extern z_t z;
extern ZWndGlobals_t g_qeglobals;

extern CMainFrame *g_pParentWnd;

extern int g_hunkTempSyncEnabled;
extern int g_hunkTempLowWater;
extern int g_hunkTempHighWater;

void Z_MouseDown(int x, int y, int buttons);
void Z_MouseMoved(int x, int y, int buttons);
void Z_Draw(void);
void Drag_MouseUp(int buttons);
void Error(const char *fmt, ...);


IMPLEMENT_DYNCREATE(CZWnd, CWnd)

CZWnd::CZWnd()
{
}

CZWnd::~CZWnd()
{
}

BEGIN_MESSAGE_MAP(CZWnd, CWnd)
	ON_WM_CREATE()
	ON_WM_DESTROY()
	ON_WM_KEYDOWN()
	ON_WM_LBUTTONDOWN()
	ON_WM_MBUTTONDOWN()
	ON_WM_RBUTTONDOWN()
	ON_WM_PAINT()
	ON_WM_GETMINMAXINFO()
	ON_WM_MOUSEMOVE()
	ON_WM_SIZE()
	ON_WM_NCCALCSIZE()
	ON_WM_KILLFOCUS()
	ON_WM_SETFOCUS()
	ON_WM_CLOSE()
	ON_WM_LBUTTONUP()
	ON_WM_MBUTTONUP()
	ON_WM_RBUTTONUP()
	ON_WM_KEYUP()
	ON_WM_MOUSEWHEEL()
	ON_WM_SYSKEYDOWN()
END_MESSAGE_MAP()

int CZWnd::OnCreate(LPCREATESTRUCT lpCreateStruct)
{
	if (CWnd::OnCreate(lpCreateStruct) == -1)
		return -1;

	g_qeglobals.d_hwndZ = GetSafeHwnd();
	return 0;
}

void CZWnd::OnLButtonDown(UINT nFlags, CPoint point)
{
	SetFocus();
	SetCapture();
	CRect rect;
	GetClientRect(&rect);
	Z_MouseDown(point.x, rect.Height() - 1 - point.y, nFlags);
}

void CZWnd::OnMButtonDown(UINT nFlags, CPoint point)
{
	SetFocus();
	SetCapture();
	CRect rect;
	GetClientRect(&rect);
	Z_MouseDown(point.x, rect.Height() - 1 - point.y, nFlags);
}

void CZWnd::OnRButtonDown(UINT nFlags, CPoint point)
{
	SetFocus();
	SetCapture();
	CRect rect;
	GetClientRect(&rect);
	Z_MouseDown(point.x, rect.Height() - 1 - point.y, nFlags);
}

void CZWnd::OnMouseMove(UINT nFlags, CPoint point)
{
	CRect rect;
	GetClientRect(&rect);
	float fz = z.origin[2] + ((rect.Height() - 1 - point.y) - (z.height / 2)) / z.scale;
	fz = floor(fz / g_qeglobals.d_gridsize + 0.5) * g_qeglobals.d_gridsize;
	CString strStatus;
	strStatus.Format("Z:: %.1f", fz);
	reinterpret_cast<CZWndMainProjection *>(g_pParentWnd)->SetStatusText(1, strStatus);
	Z_MouseMoved(point.x, rect.Height() - 1 - point.y, nFlags);
}

void CZWnd::OnKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags)
{
	g_pParentWnd->OnKeyDown(nChar, nRepCnt, nFlags);
}

void CZWnd::OnPaint()
{
	PAINTSTRUCT ps;
	if (re.BeginWindow && re.BeginWindow(g_qeglobals.d_hwndZ))
	{
		CDC::FromHandle(::BeginPaint(m_hWnd, &ps));
		re.BeginScene();
		re.ClearScreen(7, g_qeglobals.d_savedinfo.colors[COLOR_GRIDBACK], 1.0f, 0);
		Z_Draw();
		re.EndScene();
		re.EndWindow(g_qeglobals.d_hwndZ);
		if (g_hunkTempSyncEnabled)
			g_hunkTempHighWater = g_hunkTempLowWater;
		::EndPaint(m_hWnd, &ps);
	}
}

void CZWnd::OnGetMinMaxInfo(MINMAXINFO *lpMMI)
{
	lpMMI->ptMinTrackSize.x = 40;
}

void CZWnd::OnSize(UINT nType, int cx, int cy)
{
	CWnd::OnSize(nType, cx, cy);
	CRect rctZ;
	GetClientRect(&rctZ);
	z.width = rctZ.right;
	z.height = rctZ.bottom;
	if (z.width < 10)
		z.width = 10;
	if (z.height < 10)
		z.height = 10;
	if (re.ResizeWindow)
		re.ResizeWindow(g_qeglobals.d_hwndZ, z.width, z.height);
	Invalidate(TRUE);
}

void CZWnd::OnNcCalcSize(BOOL bCalcValidRects, NCCALCSIZE_PARAMS *lpncsp)
{
	CWnd::OnNcCalcSize(bCalcValidRects, lpncsp);
}

void CZWnd::OnKillFocus(CWnd *pNewWnd)
{
	CWnd::OnKillFocus(pNewWnd);
	SendMessage(WM_NCACTIVATE, FALSE, 0);
}

void CZWnd::OnSetFocus(CWnd *pOldWnd)
{
	CWnd::OnSetFocus(pOldWnd);
	SendMessage(WM_NCACTIVATE, TRUE, 0);
}

void CZWnd::OnClose()
{
	CWnd::OnClose();
}

void CZWnd::OnLButtonUp(UINT nFlags, CPoint point)
{
	CRect rect;
	GetClientRect(&rect);
	Drag_MouseUp(nFlags);
	if (!(nFlags & (MK_LBUTTON | MK_RBUTTON | MK_MBUTTON)))
		::ReleaseCapture();
}

void CZWnd::OnMButtonUp(UINT nFlags, CPoint point)
{
	CRect rect;
	GetClientRect(&rect);
	Drag_MouseUp(nFlags);
	if (!(nFlags & (MK_LBUTTON | MK_RBUTTON | MK_MBUTTON)))
		::ReleaseCapture();
}

void CZWnd::OnRButtonUp(UINT nFlags, CPoint point)
{
	CRect rect;
	GetClientRect(&rect);
	Drag_MouseUp(nFlags);
	if (!(nFlags & (MK_LBUTTON | MK_RBUTTON | MK_MBUTTON)))
		::ReleaseCapture();
}

BOOL CZWnd::PreCreateWindow(CREATESTRUCT& cs)
{
	WNDCLASS wc;
	if (!::GetClassInfo(AfxGetInstanceHandle(), "QZ", &wc))
	{
		memset(&wc, 0, sizeof(wc));
		wc.style = CS_NOCLOSE;
		wc.lpszClassName = "QZ";
		wc.hCursor = ::LoadCursor(NULL, IDC_ARROW);
		wc.lpfnWndProc = ::DefWindowProc;
		if (!AfxRegisterClass(&wc))
			Error("CZWnd RegisterClass: failed");
	}

	cs.lpszClass = "QZ";
	cs.lpszName = "Z";
	if (cs.style != QE3_CHILDSTYLE)
		cs.style = QE3_STYLE;

	return CWnd::PreCreateWindow(cs);
}

void CZWnd::OnKeyUp(UINT nChar, UINT nRepCnt, UINT nFlags)
{
	FUN_004137d0(g_pParentWnd, nChar);
}

BOOL CZWnd::OnMouseWheel(UINT nFlags, short zDelta, CPoint pt)
{
	return g_pParentWnd->OnMouseWheel(nFlags, zDelta, pt);
}

void CZWnd::OnSysKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags)
{
	g_pParentWnd->OnKeyDown(nChar, nRepCnt, nFlags);
}
