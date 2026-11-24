#include "stdafx.h"

#include "TerrainDensityDlg.h"

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
