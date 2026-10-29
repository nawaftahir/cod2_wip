#include <afxwin.h>

class CNameDlg : public CDialog
{
public:
	CNameDlg(const char *pName, CWnd* pParent = NULL);

	enum { IDD = 178 };
	CString m_strCaption;
	CString m_strName;

protected:
	virtual void DoDataExchange(CDataExchange* pDX);
	virtual void OnOK();
	virtual BOOL OnInitDialog();

	DECLARE_MESSAGE_MAP()
};

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
