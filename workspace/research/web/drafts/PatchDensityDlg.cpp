/* Lane 3 RETAIL-BASED scratch candidate; NOT linked or verified.
 * Retail at 0x004243c0/148 bytes and MFC class inventory.
 * Quake III ancestor: GPL-2.0-or-later, id Software.
 */
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

/* Target instructions at 0x004243c0, 148 bytes:
 * - GetCurSel via USER32 SendMessageA(CB_GETCURSEL) twice;
 * - only generate on indices 0..6;
 * - Patch_GenericMesh takes odd dimensions from the writable table
 *   at 0x5909dc, active XY view type, delete=true, override=false;
 * - mark editor window updates via g_nUpdateBits = -1;
 * - ALWAYS retain both selection indices, even on the invalid path;
 * - tail-call CDialog::OnOK.
 *
 * This translation unit cannot compile independently without the
 * owner-reviewed CMainFrame/CXYWnd declarations and real mesh generator.
 * Retain as unverified source research; no accepted bytes.
 */
extern int g_nUpdateBits;
int g_nXLat[7] = { 3, 5, 7, 9, 11, 13, 15 };

void CPatchDensityDlg::OnOK()
{
    const int widthSelection = m_wndWidth.GetCurSel();
    const int heightSelection = m_wndHeight.GetCurSel();

    if (widthSelection >= 0 && widthSelection <= 6 &&
        heightSelection >= 0 && heightSelection <= 6)
    {
        Patch_GenericMesh(g_nXLat[widthSelection], g_nXLat[heightSelection],
                          g_pParentWnd->ActiveXY()->GetViewType(), true, false);
        g_nUpdateBits = -1;
    }

    s_patchLastWidthSelection = widthSelection;
    s_patchLastHeightSelection = heightSelection;
    CDialog::OnOK();
}
