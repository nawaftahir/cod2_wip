#pragma once

#include "stdafx.h"

class CDlgEvent : public CDialog
{
public:
	CDlgEvent(CWnd* pParent = NULL);

	enum { IDD = 182 };
	CString m_strParm;
	int m_event;

protected:
	virtual void DoDataExchange(CDataExchange* pDX);

	DECLARE_MESSAGE_MAP()
};
