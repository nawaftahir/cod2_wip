#pragma once

#include "stdafx.h"

class CCameraTargetDlg : public CDialog
{
public:
    CCameraTargetDlg(CWnd *parent = NULL);
    int m_nType;
    CString m_strName;
protected:
    virtual void DoDataExchange(CDataExchange *dx);
    afx_msg void OnPopupNewcameraFixed();
    DECLARE_MESSAGE_MAP()
};
