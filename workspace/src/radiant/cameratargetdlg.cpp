#include "stdafx.h"
#include <stddef.h>

class CCameraTargetDlg : public CDialog
{
public:
    CCameraTargetDlg(CWnd *parent = NULL);
    int m_nType;
    CString m_strName;
protected:
    virtual void DoDataExchange(CDataExchange *dx);
    afx_msg void OnPopupNewcameraFixed();
    DECLARE_MESSAGE_MAP()
};

typedef char CameraTargetSize[(sizeof(CCameraTargetDlg) == 0x78) ? 1 : -1];
typedef char CameraTargetTypeOffset[(offsetof(CCameraTargetDlg, m_nType) == 0x70) ? 1 : -1];
typedef char CameraTargetNameOffset[(offsetof(CCameraTargetDlg, m_strName) == 0x74) ? 1 : -1];

CCameraTargetDlg::CCameraTargetDlg(CWnd *parent) : CDialog(183, parent)
{
    m_nType = 0;
    m_strName = "";
}

void CCameraTargetDlg::DoDataExchange(CDataExchange *dx)
{
    CDialog::DoDataExchange(dx);
    DDX_Radio(dx, 1367, m_nType);
    DDX_Text(dx, 1033, m_strName);
}

BEGIN_MESSAGE_MAP(CCameraTargetDlg, CDialog)
    ON_COMMAND(0x80b3, OnPopupNewcameraFixed)
END_MESSAGE_MAP()

void CCameraTargetDlg::OnPopupNewcameraFixed()
{
}
