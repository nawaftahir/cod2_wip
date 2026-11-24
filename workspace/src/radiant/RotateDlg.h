#pragma once

#include "stdafx.h"

class CRotateDlg : public CDialog
{
public:
	CRotateDlg(CWnd* pParent = NULL);

	enum { IDD = 112 };
	CSpinButtonCtrl m_wndSpin3;
	CSpinButtonCtrl m_wndSpin2;
	CSpinButtonCtrl m_wndSpin1;
	CString m_strX;
	CString m_strY;
	CString m_strZ;

protected:
	virtual void DoDataExchange(CDataExchange* pDX);
	virtual void OnOK();
	afx_msg void OnApply();
	virtual BOOL OnInitDialog();
	afx_msg void OnDeltaposSpin1(NMHDR* pNMHDR, LRESULT* pResult);
	afx_msg void OnDeltaposSpin2(NMHDR* pNMHDR, LRESULT* pResult);
	afx_msg void OnDeltaposSpin3(NMHDR* pNMHDR, LRESULT* pResult);
	void ApplyNoPaint();

	DECLARE_MESSAGE_MAP()
};
