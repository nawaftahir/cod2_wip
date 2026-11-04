// Isolated retail trial for CTextureBar.
// Layout and DDX IDs are grounded in CoD2Radiant 1.0 decompilation;
// method bodies follow the Q3Radiant ancestor where target evidence agrees.
#include "stdafx.h"

class CTextureBar : public CDialogBar
{
public:
    CTextureBar();

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

// Preserve the already accepted one-byte retail body until its class-method
// identity can be promoted without rewriting an existing ledger row.
extern "C" void FUN_0043f420() {}
