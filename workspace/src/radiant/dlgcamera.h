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
	virtual BOOL OnInitDialog();

	afx_msg void OnBtnAddevent();
	afx_msg void OnBtnAddtarget();
	afx_msg void OnSelchangeComboSplines();
	afx_msg void OnDestroy();
	afx_msg void OnApply();
	afx_msg void OnFileOpen();
	afx_msg void OnFileSave();
	afx_msg void FUN_00409de0();
	afx_msg void FUN_00409e00();
	afx_msg void FUN_00409f70();
	afx_msg void FUN_00409f80();
	afx_msg void FUN_0040a9b0();
	afx_msg void FUN_0040a9c0();
	afx_msg void FUN_0040a9d0();
	afx_msg void FUN_0040a9e0();
	afx_msg void FUN_0040aa10();

	DECLARE_MESSAGE_MAP()
};
