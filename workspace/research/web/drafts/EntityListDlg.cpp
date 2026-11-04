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
    afx_msg void OnSelect();
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

// Q3Radiant (GPL-2.0-or-later) source candidate: 0x0040ccb0 / 21 bytes.
// This depends on the real OnSelect body, not an artificial stub.
void CEntityListDlg::OnDblclkTreeEntity(NMHDR *pNMHDR, LRESULT *pResult)
{
    OnSelect();
    *pResult = 0;
}
