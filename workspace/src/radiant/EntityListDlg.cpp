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
    afx_msg void OnSelchangedTreeEntity(NMHDR *pNMHDR, LRESULT *pResult);
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

BEGIN_MESSAGE_MAP(CEntityListDlg, CDialog)
    ON_NOTIFY(TVN_SELCHANGED, 1022, OnSelchangedTreeEntity)
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
