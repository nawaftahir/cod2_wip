#pragma once

// CTexEdit and CTexWnd: layout from retail (CTexWnd 0x100 bytes, CRuntimeClass size at 0x549428).
// Shapes follow Q3Radiant TexWnd.h / TexEdit.h.
class CTexWnd;

class CTexEdit : public CEdit {
public:
    CTexEdit();
    virtual ~CTexEdit();
    CTexWnd *m_pTexWnd;
    CFont m_Font;
protected:
    afx_msg HBRUSH CtlColor(CDC *dc, UINT type);
    afx_msg void OnChange();
    afx_msg int OnCreate(LPCREATESTRUCT cs);
    DECLARE_MESSAGE_MAP()
};

class CTexWnd : public CWnd {
    DECLARE_DYNCREATE(CTexWnd)
public:
    CTexWnd();
    void UpdateFilter(const char *pFilter);
    virtual ~CTexWnd();
protected:
    virtual BOOL PreCreateWindow(CREATESTRUCT &cs);
    CTexEdit m_wndFilter;
    CButton m_wndShaders;
    bool m_bNeedRange;
    afx_msg int OnCreate(LPCREATESTRUCT lpCreateStruct);
    afx_msg void OnSize(UINT nType, int cx, int cy);
    afx_msg void OnParentNotify(UINT message, LPARAM lParam);
    afx_msg void OnTimer(UINT nIDEvent);
    afx_msg void OnKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags);
    afx_msg void OnKeyUp(UINT nChar, UINT nRepCnt, UINT nFlags);
    afx_msg void OnPaint();
    afx_msg void OnVScroll(UINT nSBCode, UINT nPos, CScrollBar *pScrollBar);
    afx_msg BOOL OnMouseWheel(UINT nFlags, short zDelta, CPoint pt);
    DECLARE_MESSAGE_MAP()
};
