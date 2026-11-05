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

// Retail one-byte RET bodies verified with MSVC 7.1. Original entry-point ownership/signatures remain provisional.
extern "C" void FUN_0040cca0() {}
