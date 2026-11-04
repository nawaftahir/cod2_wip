/* MFC dialog shell from the Quake III Radiant ancestral source, adapted to
 * retail CoD2 dialog ID 129 and the target's two control offsets.
 * The callbacks and metadata are NOT yet reconstructed here.
 */
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
    afx_msg void OnSelect();
    afx_msg void OnSelchangedTreeEntity(NMHDR *pNMHDR, LRESULT *pResult);
    afx_msg void OnDblclkListInfo();
    DECLARE_MESSAGE_MAP()
    afx_msg void OnDblclkTreeEntity(NMHDR *pNMHDR, LRESULT *pResult);
};

CEntityListDlg::CEntityListDlg(CWnd *pParent)
    : CDialog(CEntityListDlg::IDD, pParent)
{
}

void CEntityListDlg::DoDataExchange(CDataExchange *pDX)
{
    CDialog::DoDataExchange(pDX);
    DDX_Control(pDX, 1025, m_lstEntity);
    DDX_Control(pDX, 1022, m_treeEntity);
}

// Q3Radiant message routing. CoD2 resource 129 pins Select=2, Tree=1022.
BEGIN_MESSAGE_MAP(CEntityListDlg, CDialog)
    ON_BN_CLICKED(2, OnSelect)
    ON_NOTIFY(TVN_SELCHANGED, 1022, OnSelchangedTreeEntity)
    ON_NOTIFY(NM_DBLCLK, 1022, OnDblclkTreeEntity)
END_MESSAGE_MAP()

// The exact one-byte no-op body is already present in the canonical ledger
// under provisional FUN_0040cca0; original ownership remains to be bound.
void CEntityListDlg::OnDblclkListInfo()
{
}

// Q3Radiant (GPL-2.0-or-later) source candidate: 0x0040ccb0 / 21 bytes.
// This depends on the real OnSelect body, not an artificial stub.
void CEntityListDlg::OnDblclkTreeEntity(NMHDR *pNMHDR, LRESULT *pResult)
{
    OnSelect();
    *pResult = 0;
}
