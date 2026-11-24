#pragma once

#include "stdafx.h"

class CCommandsDlg : public CDialog
{
public:
    enum { IDD = 0x84 };
    CCommandsDlg(CWnd *pParent = NULL);
    CListBox m_lstCommands;

protected:
    virtual void DoDataExchange(CDataExchange *pDX);
    virtual BOOL OnInitDialog();
    DECLARE_MESSAGE_MAP()
};
