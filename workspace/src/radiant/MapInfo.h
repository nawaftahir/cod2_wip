#pragma once

#include "stdafx.h"

class CMapInfo : public CDialog
{
public:
	enum { IDD = 0x80 };
	CMapInfo(CWnd *pParent = NULL);
	CListBox m_lstEntity;

protected:
	virtual void DoDataExchange(CDataExchange *pDX);
	virtual BOOL OnInitDialog();
	void FUN_0041fa90(int id, int value);
	DECLARE_MESSAGE_MAP()
};
