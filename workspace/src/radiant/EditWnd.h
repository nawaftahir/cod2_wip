#pragma once

#include "stdafx.h"

class CEditWnd : public CEdit
{
	DECLARE_DYNCREATE(CEditWnd)
public:
	CEditWnd();
	virtual ~CEditWnd();

protected:
	virtual BOOL PreCreateWindow(CREATESTRUCT& cs);

	DECLARE_MESSAGE_MAP()
};
