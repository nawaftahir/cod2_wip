#include "stdafx.h"
#include "PatchDialog.h"
#include "win_main.h"

extern float dword_1128DC4;
extern int g_nUpdateBits;

void Patch_NaturalizeSelected(bool bDetails, bool bCycleCap, float fScaleS, float fScaleT);
void Brush_FitTexture(float fS, float fT, int nZero);
patchMesh_t* SinglePatchSelected();



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
	ON_NOTIFY(UDN_DELTAPOS, 0x4e3, OnDeltaposSpin)
	ON_NOTIFY(UDN_DELTAPOS, 0x4e0, OnDeltaposSpin)
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
	Brush_FitTexture(1.0f, 1.0f, 0);
	g_nUpdateBits = -1;
}

void CPatchDialog::OnBtnPatchnatural()
{
	Patch_NaturalizeSelected(0, 0, dword_1128DC4, dword_1128DC4);
	g_nUpdateBits = -1;
}


void CPatchDialog::OnSelchangeComboType()
{
}

void CPatchDialog::OnOK()
{
	m_Patch = NULL;
	CDialog::OnOK();
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

void CPatchDialog::UpdateInfo()
{
	GetPatchInfo();
}

