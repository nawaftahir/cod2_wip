#pragma once

#include "stdafx.h"

class CEntityListDlg : public CDialog
{
public:
    enum { IDD = 129 };
    CEntityListDlg(CWnd *pParent = NULL);
    CListCtrl m_lstEntity;
    CTreeCtrl m_treeEntity;
protected:
    virtual void DoDataExchange(CDataExchange *pDX);
    virtual BOOL OnInitDialog();
    afx_msg void OnSelchangedTreeEntity(NMHDR *pNMHDR, LRESULT *pResult);
    afx_msg void FUN_0040c8f0();
    afx_msg void FUN_0040ccb0(NMHDR *pNMHDR, LRESULT *pResult);
    DECLARE_MESSAGE_MAP()
};
