#pragma once

#include "stdafx.h"

class CScaleDialog : public CDialog
{
public:
	CScaleDialog(CWnd* pParent = NULL);

	enum { IDD = 145 };
	float	m_fZ;
	float	m_fX;
	float	m_fY;

protected:
	virtual void DoDataExchange(CDataExchange* pDX);

	DECLARE_MESSAGE_MAP()
};
