#pragma once

#include "stdafx.h"

class CDialogThick : public CDialog
{
public:
	CDialogThick(CWnd* pParent = NULL);

	enum { IDD = 164 };
	BOOL	m_bSeams;
	int		m_nAmount;

protected:
	virtual void DoDataExchange(CDataExchange* pDX);

	DECLARE_MESSAGE_MAP()
};
