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
    afx_msg void OnSelchangedTreeEntity(NMHDR *pNMHDR, LRESULT *pResult);
    afx_msg void FUN_0040c8f0();
    afx_msg void FUN_0040ccb0(NMHDR *pNMHDR, LRESULT *pResult);
    DECLARE_MESSAGE_MAP()
};

struct entlist_epair_t
{
    entlist_epair_t *next;
    char *key;
    char *value;
};

struct entlist_eclass_t
{
    unsigned char pad[4];
    char *name;
};

struct entlist_entity_def_t
{
    unsigned char pad[0x50];
    entlist_eclass_t *eclass;
    unsigned char pad2[0x10];
    entlist_epair_t *epairs;
};

struct entlist_entity_s
{
    entlist_entity_s *prev;
    entlist_entity_s *next;
    entlist_entity_def_t *def;
};

extern entlist_entity_s entities;

/* Entity-owned brush list as read by retail 0x0040c8f0: head at entity +0xc, next link at brush +0xc. */
struct brush_t;
struct entlist_brush_t
{
    entlist_brush_t *prev;
    entlist_brush_t *next;
    entlist_brush_t *oprev;
    entlist_brush_t *onext;
};
struct entlist_owner_t
{
    void *prev;
    void *next;
    void *pad8;
    entlist_brush_t brushes;
};
extern int g_nUpdateBits;
void FUN_0046fbe0(bool bDeselectFaces);
void FUN_0046f0b0(brush_t *brush, bool bComplete, bool bStatus, bool bPositionView);

BEGIN_MESSAGE_MAP(CEntityListDlg, CDialog)
    ON_COMMAND(2, FUN_0040c8f0)
    ON_NOTIFY(TVN_SELCHANGED, 1022, OnSelchangedTreeEntity)
    ON_NOTIFY(NM_DBLCLK, 1022, FUN_0040ccb0)
END_MESSAGE_MAP()

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

BOOL CEntityListDlg::OnInitDialog()
{
    CDialog::OnInitDialog();

    CMapStringToPtr mapEntity;
    HTREEITEM hParent;
    HTREEITEM hChild;

    for (entlist_entity_s *pEntity = entities.next; pEntity != &entities; pEntity = pEntity->next)
    {
        hParent = NULL;
        if (mapEntity.Lookup(pEntity->def->eclass->name, reinterpret_cast<void *&>(hParent)) == FALSE)
        {
            hParent = m_treeEntity.InsertItem(pEntity->def->eclass->name);
            mapEntity.SetAt(pEntity->def->eclass->name, reinterpret_cast<void *>(hParent));
        }
        hChild = m_treeEntity.InsertItem(pEntity->def->eclass->name, hParent);
        m_treeEntity.SetItemData(hChild, reinterpret_cast<DWORD>(pEntity));
    }

    CRect rct;
    m_lstEntity.GetClientRect(rct);
    m_lstEntity.InsertColumn(0, "Key", LVCFMT_LEFT, rct.Width() / 2);
    m_lstEntity.InsertColumn(1, "Value", LVCFMT_LEFT, rct.Width() / 2);
    m_lstEntity.DeleteColumn(2);
    UpdateData(FALSE);

    return TRUE;
}

void CEntityListDlg::OnSelchangedTreeEntity(NMHDR *pNMHDR, LRESULT *pResult)
{
    NM_TREEVIEW *pNMTreeView = (NM_TREEVIEW *)pNMHDR;
    HTREEITEM hItem = m_treeEntity.GetSelectedItem();
    m_lstEntity.DeleteAllItems();
    if (hItem)
    {
        CString strList;
        entlist_entity_s *pEntity = reinterpret_cast<entlist_entity_s *>(m_treeEntity.GetItemData(hItem));
        if (pEntity)
        {
            for (entlist_epair_t *pEpair = pEntity->def->epairs; pEpair; pEpair = pEpair->next)
            {
                if (strlen(pEpair->key) > 8)
                    strList.Format("%s\t%s", pEpair->key, pEpair->value);
                else
                    strList.Format("%s\t\t%s", pEpair->key, pEpair->value);
                int nParent = m_lstEntity.InsertItem(0, pEpair->key);
                m_lstEntity.SetItem(nParent, 1, LVIF_TEXT, pEpair->value, 0, 0, 0, reinterpret_cast<DWORD>(pEntity));
            }
        }
    }
    *pResult = 0;
}

// Retail one-byte RET bodies verified with MSVC 7.1. Original entry-point ownership/signatures remain provisional.
extern "C" void FUN_0040cca0() {}

// Retail 0x0040c8f0: select every brush of the entity chosen in the tree.
void CEntityListDlg::FUN_0040c8f0()
{
    HTREEITEM hItem = m_treeEntity.GetSelectedItem();
    if (hItem == NULL)
    {
        g_nUpdateBits = -1;
        return;
    }
    entlist_owner_t *pEntity = reinterpret_cast<entlist_owner_t *>(m_treeEntity.GetItemData(hItem));
    if (pEntity != NULL)
    {
        FUN_0046fbe0(true);
        for (entlist_brush_t *b = pEntity->brushes.onext; b != &pEntity->brushes; b = b->onext)
            FUN_0046f0b0(reinterpret_cast<brush_t *>(b), true, true, true);
    }
    g_nUpdateBits = -1;
}

// Retail 0x0040ccb0: notify handler that runs the selection above.
void CEntityListDlg::FUN_0040ccb0(NMHDR *pNMHDR, LRESULT *pResult)
{
    FUN_0040c8f0();
    *pResult = 0;
}
