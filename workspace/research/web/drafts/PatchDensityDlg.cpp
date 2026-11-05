/* Lane 3 scratch candidate; NOT verified or used as canonical source.
 * Retail: 0x004243c0 / 148 bytes.
 * Ancestor: id-Software/Quake-III-Arena q3radiant/PatchDensityDlg.cpp,
 * commit dbe4ddb10315479fc00086f08e25d968b4b43c49 (GPL-2.0-or-later).
 * CoD2 evidence: OnInitDialog reads the two saved selection globals,
 * and 0x0042442c calls Patch_GenericMesh at 0x004293f0.
 *
 * Remaining dependencies (do not fake): the real CMainFrame/CXYWnd
 * declarations for g_pParentWnd->ActiveXY()->GetViewType(),
 * Patch_GenericMesh and its actual signature and caller context,
 * Sys_UpdateWindows/W_ALL. The generator is currently absent from
 * workspace/src/radiant/Pmesh.cpp. Therefore this candidate is not
 * ready for compilation, a ledger row, or any byte-match claim.
 *
 * The selection writes below are a CoD2-informed HYPOTHESIS, not
 * a confirmed decompilation of 0x4243c0. Obtain retail disassembly
 * before accepting this implementation.
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

/* Q3 ancestor has seven odd control-point dimensions (3..15).
 * CoD2 table address/ownership have not yet been confirmed.
 * This candidate stays scratch until the retail data reference is checked.
 */
static const int s_patchDimensions[7] = { 3, 5, 7, 9, 11, 13, 15 };

void CPatchDensityDlg::OnOK()
{
    const int widthSelection = m_wndWidth.GetCurSel();
    const int heightSelection = m_wndHeight.GetCurSel();

    // Inferred from the retained selections loaded by OnInitDialog.
    s_patchLastWidthSelection = widthSelection;
    s_patchLastHeightSelection = heightSelection;

    if (widthSelection >= 0 && widthSelection <= 6 &&
        heightSelection >= 0 && heightSelection <= 6)
    {
        Patch_GenericMesh(s_patchDimensions[widthSelection],
                          s_patchDimensions[heightSelection],
                          g_pParentWnd->ActiveXY()->GetViewType());
        Sys_UpdateWindows(W_ALL);
    }

    CDialog::OnOK();
}
