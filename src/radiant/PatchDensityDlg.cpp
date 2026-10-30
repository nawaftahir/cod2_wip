#include "stdafx.h"

class CPatchDensityDlg : public CDialog
{
public:
	enum { IDD = 157 };
	CPatchDensityDlg(CWnd* pParent = NULL);

	CComboBox m_wndWidth;
	CComboBox m_wndHeight;

protected:
	virtual void DoDataExchange(CDataExchange* pDX);
	virtual BOOL OnInitDialog();
	// OnOK awaits the real mesh generator.
	virtual void OnOK();

	DECLARE_MESSAGE_MAP()
};

int s_patchLastWidthSelection;
int s_patchLastHeightSelection;

CPatchDensityDlg::CPatchDensityDlg(CWnd* pParent)
	: CDialog(CPatchDensityDlg::IDD, pParent)
{
}

void CPatchDensityDlg::DoDataExchange(CDataExchange* pDX)
{
	DDX_Control(pDX, 0x500, m_wndWidth);
	DDX_Control(pDX, 0x501, m_wndHeight);
}

BEGIN_MESSAGE_MAP(CPatchDensityDlg, CDialog)
END_MESSAGE_MAP()

BOOL CPatchDensityDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	m_wndWidth.SetCurSel(s_patchLastWidthSelection);
	m_wndHeight.SetCurSel(s_patchLastHeightSelection);

	return TRUE;
}
