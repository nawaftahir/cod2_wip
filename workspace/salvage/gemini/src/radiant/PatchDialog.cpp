// Preserved candidate for PatchDialog.cpp (23 of 28 functions matched, 5 blocked on LTCG/expr)
#include <afxwin.h>
#include <afxcmn.h>

#pragma optimize("y", off)

extern float dword_1128DC4;
extern int g_nUpdateBits;
extern volatile int dword_1128D94;

void Patch_NaturalizeSelected(int bDetails, int nZero, float fScaleS, float fScaleT);
void Patch_FitTexturing(float fS, float fT, int nZero);
void __cdecl Patch_SetTexturing(float fX, float fY, int mode);

struct texdef_t
{
	int unk0;
	float scale[2];
	float shift[2];
	float rotate;
	int unk18;
};

void Patch_SetTextureInfo(texdef_t *ptd);

struct drawVert_t
{
	float xyz[3];
	float st[3][2];
	char pad[20];
};

struct patchMesh_t
{
	int width;
	int height;
	char pad_08[0x1c];
	drawVert_t ctrl[16][16];
	char pad_3824[8];
	unsigned short dirtyCount;
};

patchMesh_t* SinglePatchSelected();

BOOL LoadRegistryInfo(const char *pszName, void *pvBuf, long *plSize);
BOOL SaveRegistryInfo(const char *pszName, void *pvBuf, long lSize);

class CTextureLayout : public CDialog
{
public:
	CTextureLayout(CWnd* pParent = NULL);

	enum { IDD = 159 };
	float m_fX;
	float m_fY;
	int m_nOrientation;
	CSpinButtonCtrl m_wndSpinX;
	CSpinButtonCtrl m_wndSpinY;
};

class CPatchDialog : public CDialog
{
public:
	CPatchDialog(CWnd* pParent = NULL);

	patchMesh_t* m_Patch;
	CSpinButtonCtrl m_wndVShift;
	CSpinButtonCtrl m_wndVScale;
	CSpinButtonCtrl m_wndRotate;
	CSpinButtonCtrl m_wndHShift;
	CSpinButtonCtrl m_wndHScale;
	CComboBox m_wndType;
	CComboBox m_wndRows;
	CComboBox m_wndCols;
	CString m_strName;
	float m_fS;
	float m_fT;
	float m_fX;
	float m_fY;
	float m_fZ;
	float m_fHScale;
	float m_fHShift;
	float m_fRotate;
	float m_fVScale;
	float m_fVShift;

	void GetPatchInfo();
	void SetPatchInfo();
	void UpdateInfo();
	void UpdateRowColInfo();
	void UpdateSpinners(bool bUp, int nID);

	virtual void DoDataExchange(CDataExchange* pDX);
	virtual BOOL OnInitDialog();
	virtual void OnOK();

	afx_msg void OnBtnPatchdetails();
	afx_msg void OnBtnPatchfit();
	afx_msg void OnBtnPatchnatural();
	afx_msg void OnBtnPatchreset();
	afx_msg void OnSelchangeComboCol();
	afx_msg void OnSelchangeComboRow();
	afx_msg void OnSelchangeComboType();
	afx_msg void OnDeltaposSpin(NMHDR* pNMHDR, LRESULT* pResult);
	afx_msg void OnDestroy();
	afx_msg void OnApply();

	DECLARE_MESSAGE_MAP()
};

CPatchDialog g_PatchDialog;

CPatchDialog::CPatchDialog(CWnd* pParent)
	: CDialog(0xac, pParent)
{
	m_strName = _T("");
	m_fS = 0.0f;
	m_fT = 0.0f;
	m_fX = 0.0f;
	m_fY = 0.0f;
	m_fZ = 0.0f;
	m_Patch = NULL;
	m_fHScale = 0.05f;
	m_fHShift = 0.05f;
	m_fVScale = 0.05f;
	m_fVShift = 0.05f;
	m_fRotate = 45.0f;
}

void CPatchDialog::DoDataExchange(CDataExchange* pDX)
{
	DDX_Control(pDX, 0x4e3, m_wndVShift);
	DDX_Control(pDX, 0x4e6, m_wndVScale);
	DDX_Control(pDX, 0x4eb, m_wndRotate);
	DDX_Control(pDX, 0x4e0, m_wndHShift);
	DDX_Control(pDX, 0x4e9, m_wndHScale);
	DDX_Control(pDX, 0x517, m_wndType);
	DDX_Control(pDX, 0x515, m_wndRows);
	DDX_Control(pDX, 0x516, m_wndCols);
	DDX_Text(pDX, 0x409, m_strName);
	DDX_Text(pDX, 0x44e, m_fS);
	DDX_Text(pDX, 0x452, m_fT);
	DDX_Text(pDX, 0x441, m_fX);
	DDX_Text(pDX, 0x476, m_fY);
	DDX_Text(pDX, 0x47b, m_fZ);
	DDX_Text(pDX, 0x4bb, m_fHScale);
	DDX_Text(pDX, 0x4ab, m_fHShift);
	DDX_Text(pDX, 0x4c1, m_fRotate);
	DDX_Text(pDX, 0x4bd, m_fVScale);
	DDX_Text(pDX, 0x4ac, m_fVShift);
}

BEGIN_MESSAGE_MAP(CPatchDialog, CDialog)
	ON_BN_CLICKED(0x502, OnBtnPatchdetails)
	ON_BN_CLICKED(0x506, OnBtnPatchfit)
	ON_BN_CLICKED(0x504, OnBtnPatchnatural)
	ON_BN_CLICKED(0x503, OnBtnPatchreset)
	ON_CBN_SELCHANGE(0x516, OnSelchangeComboCol)
	ON_CBN_SELCHANGE(0x515, OnSelchangeComboRow)
	ON_CBN_SELCHANGE(0x517, OnSelchangeComboType)
	ON_NOTIFY(UDN_DELTAPOS, 0x4e9, OnDeltaposSpin)
	ON_NOTIFY(UDN_DELTAPOS, 0x4eb, OnDeltaposSpin)
	ON_NOTIFY(UDN_DELTAPOS, 0x4e6, OnDeltaposSpin)
	ON_NOTIFY(UDN_DELTAPOS, 0x4e0, OnDeltaposSpin)
	ON_NOTIFY(UDN_DELTAPOS, 0x4e3, OnDeltaposSpin)
	ON_WM_DESTROY()
	ON_BN_CLICKED(3, OnApply)
END_MESSAGE_MAP()

void CPatchDialog::OnBtnPatchdetails()
{
	Patch_NaturalizeSelected(1, 0, dword_1128DC4, dword_1128DC4);
	g_nUpdateBits = -1;
}

void CPatchDialog::OnBtnPatchfit()
{
	Patch_FitTexturing(1.0f, 1.0f, 0);
	g_nUpdateBits = -1;
}

void CPatchDialog::OnBtnPatchnatural()
{
	Patch_NaturalizeSelected(0, 0, dword_1128DC4, dword_1128DC4);
	g_nUpdateBits = -1;
}

#pragma auto_inline(off)
void CPatchDialog::OnBtnPatchreset()
{
	CTextureLayout dlg;
	if (dlg.DoModal() == IDOK)
	{
		Patch_SetTexturing(dlg.m_fX, dlg.m_fY, dlg.m_nOrientation);
	}
	g_nUpdateBits = -1;
}
#pragma auto_inline(on)

void CPatchDialog::OnSelchangeComboCol()
{
	UpdateRowColInfo();
}

void CPatchDialog::OnSelchangeComboRow()
{
	UpdateRowColInfo();
}

void CPatchDialog::OnSelchangeComboType()
{
}

void CPatchDialog::OnOK()
{
	m_Patch = NULL;
	CDialog::OnOK();
}

void CPatchDialog::OnDeltaposSpin(NMHDR* pNMHDR, LRESULT* pResult)
{
	NM_UPDOWN* pNMUpDown = (NM_UPDOWN*)pNMHDR;
	UpdateSpinners(pNMUpDown->iDelta > 0, pNMUpDown->hdr.idFrom);
	*pResult = 0;
}

BOOL CPatchDialog::OnInitDialog()
{
	CDialog::OnInitDialog();

	m_wndHScale.SetRange(0, 1000);
	m_wndVScale.SetRange(0, 1000);
	m_wndHShift.SetRange(0, 1000);
	m_wndVShift.SetRange(0, 1000);
	m_wndRotate.SetRange(0, 1000);

	GetPatchInfo();

	return TRUE;
}

void CPatchDialog::GetPatchInfo()
{
	m_Patch = SinglePatchSelected();
	if (m_Patch != NULL)
	{
		CString str;
		int i;
		m_wndRows.ResetContent();
		for (i = 0; i < m_Patch->height; i++)
		{
			str.Format("%i", i);
			m_wndRows.AddString(str);
		}
		m_wndRows.SetCurSel(0);

		m_wndCols.ResetContent();
		for (i = 0; i < m_Patch->width; i++)
		{
			str.Format("%i", i);
			m_wndCols.AddString(str);
		}
		m_wndCols.SetCurSel(0);
	}
	UpdateRowColInfo();
}

void CPatchDialog::SetPatchInfo()
{
}

void DoPatchInspector()
{
	if (g_PatchDialog.GetSafeHwnd() == NULL)
	{
		g_PatchDialog.Create(0xac, NULL);
		CRect rct;
		long lSize = sizeof(rct);
		if (LoadRegistryInfo("Radiant::PatchWindow", &rct, &lSize))
		{
			g_PatchDialog.SetWindowPos(NULL, rct.left, rct.top, 0, 0, SWP_NOSIZE);
		}
	}
	g_PatchDialog.ShowWindow(SW_SHOW);
	g_PatchDialog.GetPatchInfo();
}

void UpdatePatchInspector()
{
	if (g_PatchDialog.GetSafeHwnd() != NULL)
	{
		g_PatchDialog.UpdateInfo();
	}
}

void CPatchDialog::OnDestroy()
{
	if (GetSafeHwnd())
	{
		CRect rct;
		::GetWindowRect(m_hWnd, &rct);
		SaveRegistryInfo("Radiant::PatchWindow", &rct, sizeof(rct));
	}
	CDialog::OnDestroy();
}

void CPatchDialog::UpdateRowColInfo()
{
	m_fX = m_fY = m_fZ = m_fS = m_fT = 0.0f;

	if (m_Patch != NULL)
	{
		int r = m_wndRows.GetCurSel();
		int c = m_wndCols.GetCurSel();
		if (r >= 0 && r < m_Patch->height && c >= 0 && c < m_Patch->width)
		{
			m_fX = m_Patch->ctrl[c][r].xyz[0];
			m_fY = m_Patch->ctrl[c][r].xyz[1];
			m_fZ = m_Patch->ctrl[c][r].xyz[2];
			int idx = (c * 16 + r) * 7;
			m_fS = *(float *)((char *)&m_Patch->ctrl[0][0].st + (dword_1128D94 + idx) * 8);
			m_fT = *(float *)((char *)&m_Patch->ctrl[0][0].st + (idx + dword_1128D94) * 8 + 4);
		}
	}
	UpdateData(FALSE);
}

void CPatchDialog::UpdateInfo()
{
	GetPatchInfo();
}

void CPatchDialog::OnApply()
{
	UpdateData(TRUE);
	if (m_Patch != NULL)
	{
		int r = m_wndRows.GetCurSel();
		int c = m_wndCols.GetCurSel();
		if (r >= 0 && r < m_Patch->height && c >= 0 && c < m_Patch->width)
		{
			m_Patch->ctrl[c][r].xyz[0] = m_fX;
			m_Patch->ctrl[c][r].xyz[1] = m_fY;
			m_Patch->ctrl[c][r].xyz[2] = m_fZ;
			*(float *)((char *)&m_Patch->ctrl[0][0].st + (dword_1128D94 + (c * 16 + r) * 7) * 8) = m_fS;
			*(float *)((char *)&m_Patch->ctrl[0][0].st + ((c * 16 + r) * 7 + dword_1128D94) * 8 + 4) = m_fT;
			m_Patch->dirtyCount++;
			g_nUpdateBits = -1;
		}
	}
}

void CPatchDialog::UpdateSpinners(bool bUp, int nID)
{
	texdef_t td;
	td.rotate = 0.0f;
	td.scale[1] = 0.0f;
	td.scale[0] = 0.0f;
	td.shift[1] = 0.0f;
	td.shift[0] = 0.0f;

	UpdateData(TRUE);

	if (nID == 0x4eb)
	{
		if (bUp)
			td.rotate = m_fRotate;
		else
			td.rotate = -m_fRotate;
	}
	else if (nID == 0x4e9)
	{
		if (bUp)
			td.scale[0] = 1.0f - m_fHScale;
		else
			td.scale[0] = 1.0f + m_fHScale;
	}
	else if (nID == 0x4e6)
	{
		if (bUp)
			td.scale[1] = 1.0f - m_fVScale;
		else
			td.scale[1] = 1.0f + m_fVScale;
	}
	else if (nID == 0x4e0)
	{
		if (bUp)
			td.shift[0] = m_fHShift;
		else
			td.shift[0] = -m_fHShift;
	}
	else if (nID == 0x4e3)
	{
		if (bUp)
			td.shift[1] = m_fVShift;
		else
			td.shift[1] = -m_fVShift;
	}

	Patch_SetTextureInfo(&td);
	g_nUpdateBits |= 1;
}

#pragma optimize("y", on)
