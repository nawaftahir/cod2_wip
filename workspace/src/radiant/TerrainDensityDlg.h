#pragma once

#include "stdafx.h"

class CTerrainDensityDlg : public CDialog
{
public:
	enum { IDD = 186 };
	CTerrainDensityDlg(CWnd* pParent = NULL);

	CComboBox m_wndHeight;
	CComboBox m_wndWidth;

protected:
	virtual void DoDataExchange(CDataExchange* pDX);
	virtual BOOL OnInitDialog();
	virtual void OnOK();

	DECLARE_MESSAGE_MAP()
};
