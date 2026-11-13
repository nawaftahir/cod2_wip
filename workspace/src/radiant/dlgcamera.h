#pragma once

#include "stdafx.h"

class CDlgCamera : public CDialog
{
public:
	CDlgCamera(CWnd* pParent = NULL);

	void setupFromCamera();

	enum { IDD = 181 };
	CScrollBar m_wndSegments;
	CListBox m_wndEvents;
	CComboBox m_wndSplines;
	CString m_strName;
	float m_fSeconds;
	BOOL m_trackCamera;
	int m_numSegments;
	int m_currentSegment;
	CString m_strType;
	int m_editPoints;

protected:
	virtual void DoDataExchange(CDataExchange* pDX);

	afx_msg void OnBtnAddevent();
	afx_msg void OnFileOpen();
	afx_msg void OnFileSave();

	DECLARE_MESSAGE_MAP()
};
