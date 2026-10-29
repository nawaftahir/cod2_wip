#include <afxwin.h>
#include <afxcmn.h>

class CRotateDlg : public CDialog
{
public:
	CRotateDlg(CWnd* pParent = NULL);

	enum { IDD = 112 };
	CSpinButtonCtrl m_wndSpin3;
	CSpinButtonCtrl m_wndSpin2;
	CSpinButtonCtrl m_wndSpin1;
	CString m_strX;
	CString m_strY;
	CString m_strZ;

protected:
	virtual void DoDataExchange(CDataExchange* pDX);
	virtual void OnOK();
	afx_msg void OnApply();
	virtual BOOL OnInitDialog();
	afx_msg void OnDeltaposSpin1(NMHDR* pNMHDR, LRESULT* pResult);
	afx_msg void OnDeltaposSpin2(NMHDR* pNMHDR, LRESULT* pResult);
	afx_msg void OnDeltaposSpin3(NMHDR* pNMHDR, LRESULT* pResult);
	void ApplyNoPaint();

	DECLARE_MESSAGE_MAP()
};

CRotateDlg::CRotateDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CRotateDlg::IDD, pParent)
{
	m_strX = _T("");
	m_strY = _T("");
	m_strZ = _T("");
}

void CRotateDlg::DoDataExchange(CDataExchange* pDX)
{
	DDX_Control(pDX, 1004, m_wndSpin3);
	DDX_Control(pDX, 1002, m_wndSpin2);
	DDX_Control(pDX, 1001, m_wndSpin1);
	DDX_Text(pDX, 1236, m_strX);
	DDX_Text(pDX, 1144, m_strY);
	DDX_Text(pDX, 1139, m_strZ);
}

BEGIN_MESSAGE_MAP(CRotateDlg, CDialog)
	ON_BN_CLICKED(3, OnApply)
	ON_NOTIFY(UDN_DELTAPOS, 1001, OnDeltaposSpin1)
	ON_NOTIFY(UDN_DELTAPOS, 1002, OnDeltaposSpin2)
	ON_NOTIFY(UDN_DELTAPOS, 1004, OnDeltaposSpin3)
END_MESSAGE_MAP()

void CRotateDlg::OnOK()
{
	OnApply();
	CDialog::OnOK();
}

BOOL CRotateDlg::OnInitDialog()
{
	CDialog::OnInitDialog();
	m_wndSpin1.SetRange(0, 359);
	m_wndSpin2.SetRange(0, 359);
	m_wndSpin3.SetRange(0, 359);
	return TRUE;
}

void CRotateDlg::ApplyNoPaint()
{
}
