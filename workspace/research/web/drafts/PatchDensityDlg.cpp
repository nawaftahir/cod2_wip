#include "stdafx.h"

/* Layout projections verified by retail loads at 0x00424405-0x00424411.
 * Q3Radiant calls g_pParentWnd->ActiveXY()->GetViewType().
 * The member offsets are derived from the CoD2 retail code, not guessed.
 */
class CMainFrame;
struct CPatchDensityXYProjection
{
    unsigned char inheritedAndViewFields[0xf4];
    int m_nViewType;
};
struct CPatchDensityMainProjection
{
    unsigned char inheritedAndFrameFields[0x7e0];
    CPatchDensityXYProjection *m_pActiveXY;
};
extern CMainFrame *g_pParentWnd;
extern int g_nUpdateBits;
struct brush_t;
extern brush_t *Patch_GenericMesh(int width, int height, int viewType,
                                  bool deleteSource, bool overrideDimensions);
int g_nXLat[7] = {3, 5, 7, 9, 11, 13, 15};


class CPatchDensityDlg : public CDialog
{
public:
	enum { IDD = 157 };
	CPatchDensityDlg(CWnd* pParent = NULL);
    virtual ~CPatchDensityDlg() {}

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


/* Retail 0x004243c0: preserves both last selection indexes whether
 * or not patch generation is possible. The 0x4293f0 mesh generator
 * is a separate (still unfinished) function in this lane.
 */
void CPatchDensityDlg::OnOK()
{
    int nWidth = m_wndWidth.GetCurSel();
    int nHeight = m_wndHeight.GetCurSel();
    if (nWidth >= 0 && nWidth <= 6 && nHeight >= 0 && nHeight <= 6)
    {
        const CPatchDensityMainProjection *frame =
            reinterpret_cast<const CPatchDensityMainProjection *>(g_pParentWnd);
        int viewType = frame->m_pActiveXY->m_nViewType;
        Patch_GenericMesh(g_nXLat[nWidth], g_nXLat[nHeight], viewType, true, false);
        g_nUpdateBits = -1;
    }
    s_patchLastWidthSelection = nWidth;
    s_patchLastHeightSelection = nHeight;
    CDialog::OnOK();
}

BOOL CPatchDensityDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	m_wndWidth.SetCurSel(s_patchLastWidthSelection);
	m_wndHeight.SetCurSel(s_patchLastHeightSelection);

	return TRUE;
}
