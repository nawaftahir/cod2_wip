#pragma once

#include "stdafx.h"

class CPatchDensityDlg : public CDialog
{
public:
	enum { IDD = 157 };
	CPatchDensityDlg(CWnd* pParent = NULL);

	CComboBox m_wndWidth;
	CComboBox m_wndHeight;

protected:
	virtual void DoDataExchange(CDataExchange* pDX);
	virtual BOOL OnInitDialog();
	// OnOK awaits the real mesh generator.
	virtual void OnOK();

	DECLARE_MESSAGE_MAP()
};
