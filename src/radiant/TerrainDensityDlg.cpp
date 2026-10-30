#include "stdafx.h"

class CTerrainDensityDlg : public CDialog
{
public:
	enum { IDD = 186 };
	CTerrainDensityDlg(CWnd* pParent = NULL);

	CComboBox m_wndHeight;
	CComboBox m_wndWidth;

protected:
	virtual void DoDataExchange(CDataExchange* pDX);
	virtual BOOL OnInitDialog();
	// OnOK awaits the real mesh generator.
	virtual void OnOK();

	DECLARE_MESSAGE_MAP()
};

CTerrainDensityDlg::CTerrainDensityDlg(CWnd* pParent)
	: CDialog(CTerrainDensityDlg::IDD, pParent)
{
}

void CTerrainDensityDlg::DoDataExchange(CDataExchange* pDX)
{
	DDX_Control(pDX, 0x501, m_wndHeight);
	DDX_Control(pDX, 0x500, m_wndWidth);
}

BEGIN_MESSAGE_MAP(CTerrainDensityDlg, CDialog)
END_MESSAGE_MAP()

int s_nLastWidthSel = 1;
int s_nLastHeightSel = 1;

BOOL CTerrainDensityDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	m_wndWidth.SetCurSel(s_nLastWidthSel);
	m_wndHeight.SetCurSel(s_nLastHeightSel);

	return TRUE;
}
