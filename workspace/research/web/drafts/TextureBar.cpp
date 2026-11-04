// CTextureBar reconstruction grounded in CoD2Radiant 1.0 retail layout and DDX IDs.
// The implemented methods below are hosted-CI byte-identical; remaining handlers stay pending.
#include "stdafx.h"
#include <stdlib.h>

// Original Q3Radiant editor callback; implemented by the selection TU.
extern void Select_RotateTexture(int amount);

class CTextureBar : public CDialogBar
{
public:
    CTextureBar();
    void GetSurfaceAttributes();
    void SetSurfaceAttributes(); // actual method, body requires original face/texture state

    CSpinButtonCtrl m_spinRotate;
    CSpinButtonCtrl m_spinVScale;
    CSpinButtonCtrl m_spinVShift;
    CSpinButtonCtrl m_spinHScale;
    CSpinButtonCtrl m_spinHShift;
    int m_nHShift;
    int m_nHScale;
    int m_nRotate;
    int m_nVShift;
    int m_nVScale;
    int m_nRotateAmt;

protected:
    virtual void DoDataExchange(CDataExchange *pDX);
    afx_msg int OnCreate(LPCREATESTRUCT lpCreateStruct);
    afx_msg void OnBtnApplytexturestuff();
    afx_msg void OnSelectionPrint();
    afx_msg void OnDeltaposSpinHshift(NMHDR *, LRESULT *);
    afx_msg void OnDeltaposSpinVshift(NMHDR *, LRESULT *);
    afx_msg void OnDeltaposSpinHScale(NMHDR *, LRESULT *);
    afx_msg void OnDeltaposSpinVScale(NMHDR *, LRESULT *);
    afx_msg void OnDeltaposSpinRotate(NMHDR *, LRESULT *);
    DECLARE_MESSAGE_MAP()
};

CTextureBar::CTextureBar()
    : CDialogBar()
{
    m_nHShift = 0;
    m_nHScale = 0;
    m_nRotate = 0;
    m_nVShift = 0;
    m_nVScale = 0;
    m_nRotateAmt = 45;
}

void CTextureBar::DoDataExchange(CDataExchange *pDX)
{
    CDialogBar::DoDataExchange(pDX);
    DDX_Control(pDX, 0x4eb, m_spinRotate);
    DDX_Control(pDX, 0x4e6, m_spinVScale);
    DDX_Control(pDX, 0x4e3, m_spinVShift);
    DDX_Control(pDX, 0x4e9, m_spinHScale);
    DDX_Control(pDX, 0x4e0, m_spinHShift);
    DDX_Text(pDX, 0x4ab, m_nHShift);
    DDX_Text(pDX, 0x4bb, m_nHScale);
    DDX_Text(pDX, 0x4c1, m_nRotate);
    DDX_Text(pDX, 0x4ac, m_nVShift);
    DDX_Text(pDX, 0x4bd, m_nVScale);
    DDX_Text(pDX, 0x4ee, m_nRotateAmt);
}

int CTextureBar::OnCreate(LPCREATESTRUCT lpCreateStruct)
{
    if (CDialogBar::OnCreate(lpCreateStruct) == -1)
        return -1;
    return 0;
}

// Dialog 154 and the canonical DDX pin the spin/button IDs;
// the command ID for selection print still needs retail map evidence.
BEGIN_MESSAGE_MAP(CTextureBar, CDialogBar)
    ON_NOTIFY(UDN_DELTAPOS, 0x4e0, OnDeltaposSpinHshift)
    ON_NOTIFY(UDN_DELTAPOS, 0x4e3, OnDeltaposSpinVshift)
    ON_NOTIFY(UDN_DELTAPOS, 0x4e9, OnDeltaposSpinHScale)
    ON_NOTIFY(UDN_DELTAPOS, 0x4e6, OnDeltaposSpinVScale)
    ON_NOTIFY(UDN_DELTAPOS, 0x4eb, OnDeltaposSpinRotate)
    ON_WM_CREATE()
    ON_BN_CLICKED(3, OnBtnApplytexturestuff)
END_MESSAGE_MAP()

// Retail 0x0043f3c0 / 87 B: target uses the +0x244 rotate-amount
// member, the MFC UpdateData(TRUE) call and Select_RotateTexture.
// This source is copied in substance from the Q3 ancestor; it needs
// the real select.cpp method and GetSurfaceAttributes before CI acceptance.
void CTextureBar::OnDeltaposSpinRotate(NMHDR *pNMHDR, LRESULT *pResult)
{
    NM_UPDOWN *pNMUpDown = (NM_UPDOWN *)pNMHDR;
    *pResult = 0;
    UpdateData(TRUE);
    if (pNMUpDown->iDelta < 0)
        Select_RotateTexture(abs(m_nRotateAmt));
    else
        Select_RotateTexture(-abs(m_nRotateAmt));
    GetSurfaceAttributes();
}

void CTextureBar::OnSelectionPrint()
{
}

// Preserve the already accepted one-byte retail body until its class-method
// identity can be promoted without rewriting an existing ledger row.
extern "C" void FUN_0043f420() {}

// Q3Radiant ancestral handler: candidate for 0x0043f450 / 10 retail B.
// SetSurfaceAttributes still needs the real selection/face storage context.
void CTextureBar::OnBtnApplytexturestuff()
{
    SetSurfaceAttributes();
}
