#include <afxwin.h>

class CNewProjDlg : public CDialog
{
public:
	CNewProjDlg(CWnd* pParent = NULL);

	enum { IDD = 131 };
	CString m_strName;

protected:
	virtual void DoDataExchange(CDataExchange* pDX);

	DECLARE_MESSAGE_MAP()
};

CNewProjDlg::CNewProjDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CNewProjDlg::IDD, pParent)
{
	m_strName = _T("");
}

void CNewProjDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	DDX_Text(pDX, 1033, m_strName);
}

BEGIN_MESSAGE_MAP(CNewProjDlg, CDialog)
END_MESSAGE_MAP()
