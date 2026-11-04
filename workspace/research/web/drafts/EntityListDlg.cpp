/* MFC dialog shell from the Quake III Radiant ancestral source, adapted to
 * retail CoD2 dialog ID 129 and the target's two control offsets.
 * The callbacks and metadata are NOT yet reconstructed here.
 */
#include "stdafx.h"
#include <stddef.h>

/* Target 0x0040c8f0 shows the owning entity brush-list header at +0xc,
 * with its onext link at +0x18. Q3Radiant uses the same onext +0xc
 * within brush_t, but has a shorter entity prefix. Only this observed
 * partial view is used, not a guessed complete entity or brush layout.
 */
struct brush_t {
    void *prev;
    void *next;
    void *oprev;
    brush_t *onext;
};
struct entity_t {
    void *opaque_prefix[3];
    brush_t brushes;
};
typedef char entity_brush_offset[(offsetof(entity_t, brushes) == 0x0c) ? 1 : -1];
typedef char brush_onext_offset[(offsetof(brush_t, onext) == 0x0c) ? 1 : -1];

// Source names and ordinary signatures from Q3 SELECT.H; implementations
// and actual CoD2 linker bindings belong to the separate select.cpp TU.
extern void Select_Deselect(bool bDeselectFaces);
extern void Select_Brush(brush_t *brush, bool bComplete, bool bStatus);
extern int g_nUpdateBits;

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


// Target 0x0040c8f0 / 116 B. Unlike Q3's single-brush selection,
// retail iterates each entity-owned brush before invalidating all windows.
// All pointer offsets above come from retail; call identities still require
// the real selection TU and current /GL caller context before MATCH credit.
void CEntityListDlg::OnSelect()
{
    HTREEITEM hItem = m_treeEntity.GetSelectedItem();
    if (hItem)
    {
        entity_t *pEntity = reinterpret_cast<entity_t *>(m_treeEntity.GetItemData(hItem));
        if (pEntity)
        {
            Select_Deselect(true);
            for (brush_t *brush = pEntity->brushes.onext;
                 brush != &pEntity->brushes; brush = brush->onext)
            {
                Select_Brush(brush, true, true);
            }
        }
    }
    g_nUpdateBits = -1;
}

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
