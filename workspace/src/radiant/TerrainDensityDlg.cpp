#include "stdafx.h"

#include "TerrainDensityDlg.h"
/* Layout projections verified by retail loads at 0x0043ee1d-0x0043ee29 (same as PatchDensityDlg). */
class CMainFrame;
struct CTerrainDensityXYProjection
{
    unsigned char inheritedAndViewFields[0xf4];
    int m_nViewType;
};
struct CTerrainDensityMainProjection
{
    unsigned char inheritedAndFrameFields[0x7e0];
    CTerrainDensityXYProjection *m_pActiveXY;
};
extern CMainFrame *g_pParentWnd;
extern int g_nUpdateBits;
struct brush_t;
extern brush_t *FUN_004296f0(int nWidth, int nHeight, int nOrientation, bool bDeleteSource, bool bOverride);

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

// Retail 0x0043edd0: build a terrain mesh from the chosen size (selection index + 2) and remember both indexes.
void CTerrainDensityDlg::OnOK()
{
    int w = m_wndWidth.GetCurSel() + 2;
    int h = m_wndHeight.GetCurSel() + 2;
    if (w >= 2 && w <= 15 && h >= 2 && h <= 15)
    {
        const CTerrainDensityMainProjection *frame =
            reinterpret_cast<const CTerrainDensityMainProjection *>(g_pParentWnd);
        FUN_004296f0(w, h, frame->m_pActiveXY->m_nViewType, true, false);
        g_nUpdateBits = -1;
    }
    s_nLastWidthSel = w - 2;
    s_nLastHeightSel = h - 2;
    CDialog::OnOK();
}
