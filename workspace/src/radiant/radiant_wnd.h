#pragma once

// Window classes of the editor views. Layouts from retail (CCamWnd 0x168, CXYWnd 0x120, CZWnd 0x58),
// unknown members stay field_XX / padding. CTexWnd and CEditWnd come from their own headers.
#include "stdafx.h"
#include <stddef.h>
#include "TexWnd.h"
#include "EditWnd.h"

class CXYWnd;

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

class CCamWnd : public CWnd
{
    DECLARE_DYNCREATE(CCamWnd)
public:
    CCamWnd();
    virtual ~CCamWnd();
    void SetXYFriend(CXYWnd *window);
    void Cam_Init();
    void FUN_00403ce0(int x, int y, float *dir);
    CXYWnd *m_pXYFriend;
    CameraState m_Camera;
    int m_nCambuttonstate;
    CPoint m_ptButton;
    CPoint m_ptCursor;
    CPoint m_ptLastCursor;
    // Retail storage between cursor state and the clip flag; fields remain undecoded.
    float m_vCull1[3];
    float m_vCull2[3];
    int m_nCullv1[3];
    int m_nCullv2[3];
    bool m_bClipMode;
    int field_120;
    int field_124;
    bool field_128;
    // Retail storage before the culling vectors; fields remain undecoded.
    float field_12c[3];
    float cullNormals[2][3];
    int cullIndices[2][3];
protected:
    virtual BOOL PreCreateWindow(CREATESTRUCT &create);
    void OriginalMouseDown(UINT flags, CPoint point);
    void OriginalMouseUp(UINT flags, CPoint point);
    void Cam_MouseDown(int x, int y, int buttons);
    void Cam_MouseUp(int x, int y, int buttons);
    void InitCull();
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
    XYWndNode *FUN_0044bc30(int id);
    void Redraw(unsigned int nBits);
    void XY_Init();
    void SnapToPoint(int x, int y, float point[3]);
    void XY_ToPoint(int x, int y, float point[3]);
    void XY_ToGridPoint(int x, int y, float point[3]);
    void FUN_0044c5c0(int x, int y, float origin[3], float dir[3]);
    void FUN_00452c30();
    void VectorCopyXY(float in[3], float out[3]);
    void SetViewType(int n);
    bool ClipMode();
    bool RogueClipMode();
    bool PointMode();
    void SetPointMode(bool b);
    void SetClipMode(bool bMode);
    void RetainClipMode(bool bMode);
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

class CZWnd : public CWnd
{
	DECLARE_DYNCREATE(CZWnd)

public:
	CZWnd();

public:
	virtual ~CZWnd();

	HDC m_hDC;
	HGLRC m_hRC;

protected:
	virtual BOOL PreCreateWindow(CREATESTRUCT& cs);

protected:
	afx_msg int OnCreate(LPCREATESTRUCT lpCreateStruct);
	afx_msg void OnKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags);
	afx_msg void OnLButtonDown(UINT nFlags, CPoint point);
	afx_msg void OnMButtonDown(UINT nFlags, CPoint point);
	afx_msg void OnRButtonDown(UINT nFlags, CPoint point);
	afx_msg void OnPaint();
	afx_msg void OnGetMinMaxInfo(MINMAXINFO *lpMMI);
	afx_msg void OnMouseMove(UINT nFlags, CPoint point);
	afx_msg void OnSize(UINT nType, int cx, int cy);
	afx_msg void OnNcCalcSize(BOOL bCalcValidRects, NCCALCSIZE_PARAMS *lpncsp);
	afx_msg void OnKillFocus(CWnd *pNewWnd);
	afx_msg void OnSetFocus(CWnd *pOldWnd);
	afx_msg void OnClose();
	afx_msg void OnLButtonUp(UINT nFlags, CPoint point);
	afx_msg void OnMButtonUp(UINT nFlags, CPoint point);
	afx_msg void OnRButtonUp(UINT nFlags, CPoint point);
	afx_msg void OnKeyUp(UINT nChar, UINT nRepCnt, UINT nFlags);
	afx_msg BOOL OnMouseWheel(UINT nFlags, short zDelta, CPoint pt);
	afx_msg void OnSysKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags);

	DECLARE_MESSAGE_MAP()
};

typedef char ZWndSize[(sizeof(CZWnd) == 0x58) ? 1 : -1];
