#include "stdafx.h"

class CCommandsDlg : public CDialog
{
public:
    enum { IDD = 0x84 };
    CCommandsDlg(CWnd *pParent = NULL);
    CListBox m_lstCommands;

protected:
    virtual void DoDataExchange(CDataExchange *pDX);
    DECLARE_MESSAGE_MAP()
};

CCommandsDlg::CCommandsDlg(CWnd *pParent)
    : CDialog(CCommandsDlg::IDD, pParent)
{
}

void CCommandsDlg::DoDataExchange(CDataExchange *pDX)
{
    DDX_Control(pDX, 0x40c, m_lstCommands);
}

BEGIN_MESSAGE_MAP(CCommandsDlg, CDialog)
END_MESSAGE_MAP()
