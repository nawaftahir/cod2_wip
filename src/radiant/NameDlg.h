#pragma once

#include "stdafx.h"

class CNameDlg : public CDialog
{
public:
	CNameDlg(const char *pName, CWnd* pParent = NULL);

	enum { IDD = 178 };
	CString m_strCaption;
	CString m_strName;

protected:
	virtual void DoDataExchange(CDataExchange* pDX);
	virtual void OnOK();
	virtual BOOL OnInitDialog();

	DECLARE_MESSAGE_MAP()
};
