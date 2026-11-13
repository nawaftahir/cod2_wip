#include "NameDlg.h"

CNameDlg::CNameDlg(const char *pName, CWnd* pParent /*=NULL*/)
	: CDialog(CNameDlg::IDD, pParent)
{
	m_strName = _T("");
	m_strCaption = pName;
}

void CNameDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	DDX_Text(pDX, 1033, m_strName);
}

BEGIN_MESSAGE_MAP(CNameDlg, CDialog)
END_MESSAGE_MAP()

void CNameDlg::OnOK()
{
	CDialog::OnOK();
}

BOOL CNameDlg::OnInitDialog()
{
	CDialog::OnInitDialog();
	SetWindowText(m_strCaption);
	return TRUE;
}
