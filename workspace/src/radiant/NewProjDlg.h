#pragma once

#include "stdafx.h"

class CNewProjDlg : public CDialog
{
public:
	CNewProjDlg(CWnd* pParent = NULL);

	enum { IDD = 131 };
	CString m_strName;

protected:
	virtual void DoDataExchange(CDataExchange* pDX);

	DECLARE_MESSAGE_MAP()
};
