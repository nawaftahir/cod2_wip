
#include "stdafx.h"
#include "dlgcamera.h"
#include "DlgEvent.h"
#include "NameDlg.h"
#include "CameraTargetDlg.h"

#include "../universal/splines/q_shared.h"
#include "../universal/splines/splines.h"

struct QEGlobals_t
{
	unsigned char pad_00[0x8070];
	int d_num_move_points;
	unsigned char pad_8074[0x6cba0 - 0x8074];
	idPointListInterface *selectObject;
};

extern QEGlobals_t g_qeglobals;
extern idCameraDef *g_splineList;
extern int g_nUpdateBits;
extern int DAT_011298b0;
extern int DAT_011298b4;
extern int DAT_010c2d7c;
class CMainFrame;
extern CMainFrame *dword_01233488;
extern "C" void FUN_0041b190(CMainFrame *self);
void FUN_0042beb0();
int SaveRegistryInfo(const char *name, void *data, long size);
BOOL LoadRegistryInfo(const char *pszName, void *pvBuf, long *plSize);

CDlgCamera g_dlgCamera;

CDlgCamera::CDlgCamera(CWnd* pParent /*=NULL*/)
	: CDialog(CDlgCamera::IDD, pParent)
{
	m_strName = _T("");
	m_fSeconds = 0.0f;
	m_trackCamera = TRUE;
	m_numSegments = 0;
	m_currentSegment = 0;
	m_strType = _T("");
	m_editPoints = 0;
}

void CDlgCamera::DoDataExchange(CDataExchange* pDX)
{
	DDX_Control(pDX, 1353, m_wndSegments);
	DDX_Control(pDX, 1299, m_wndEvents);
	DDX_Control(pDX, 1352, m_wndSplines);
	DDX_Text(pDX, 1351, m_strName);
	DDX_Text(pDX, 1354, m_fSeconds);
	DDX_Check(pDX, 1358, m_trackCamera);
	DDX_Text(pDX, 1360, m_numSegments);
	DDX_Text(pDX, 1355, m_currentSegment);
	DDX_Text(pDX, 1375, m_strType);
	DDX_Radio(pDX, 1370, m_editPoints);
}

BEGIN_MESSAGE_MAP(CDlgCamera, CDialog)
	ON_BN_CLICKED(1356, OnBtnAddevent)
	ON_BN_CLICKED(1076, OnBtnAddtarget)
	ON_BN_CLICKED(1357, FUN_00409de0)
	ON_CBN_DBLCLK(1352, FUN_00409e00)
	ON_CBN_SELCHANGE(1352, OnSelchangeComboSplines)
	ON_LBN_SELCHANGE(1299, FUN_00409f70)
	ON_LBN_DBLCLK(1299, FUN_00409f80)
	ON_WM_DESTROY()
	ON_BN_CLICKED(119, OnApply)
	ON_WM_HSCROLL()
	ON_COMMAND(ID_FILE_OPEN, OnFileOpen)
	ON_COMMAND(ID_FILE_SAVE, OnFileSave)
	ON_BN_CLICKED(122, FUN_0040a9b0)
	ON_BN_CLICKED(1373, FUN_0040a9c0)
	ON_BN_CLICKED(1377, FUN_0040a9d0)
	ON_BN_CLICKED(1370, FUN_0040a9e0)
	ON_BN_CLICKED(1372, FUN_0040aa10)
END_MESSAGE_MAP()

void FUN_00409930()
{
	if (g_dlgCamera.GetSafeHwnd() == NULL)
	{
		g_dlgCamera.Create(CDlgCamera::IDD);
		CRect rct;
		LONG lSize = sizeof(rct);
		if (LoadRegistryInfo("Radiant::CameraInspector", &rct, &lSize))
		{
			g_dlgCamera.SetWindowPos(NULL, rct.left, rct.top, 0, 0, SWP_NOSIZE | SWP_SHOWWINDOW);
		}
		g_nUpdateBits = -1;
	}
	g_dlgCamera.ShowWindow(SW_SHOW);
	g_dlgCamera.setupFromCamera();
}

void CDlgCamera::OnBtnAddevent()
{
	CDlgEvent dlg;
	if (dlg.DoModal() == IDOK)
	{
		long n = (m_wndSegments.GetScrollPos() / 4) * 1000;
		g_splineList->addEvent((idCameraEvent::eventType)(dlg.m_event + 1), dlg.m_strParm, n);
		setupFromCamera();
	}
}

void CDlgCamera::OnBtnAddtarget()
{
	CCameraTargetDlg dlg;
	if (dlg.DoModal() == IDOK)
	{
		g_splineList->addTarget(dlg.m_strName, (idCameraPosition::positionType)dlg.m_nType);
		setupFromCamera();
		m_wndSplines.SetCurSel(g_splineList->numTargets());
		OnSelchangeComboSplines();
		UpdateData(TRUE);
		int old = DAT_011298b0;
		DAT_011298b0 = 8;
		if (old == 0xb)
			FUN_0041b190(dword_01233488);
		else if (old == 0xa)
			FUN_0042beb0();
	}
}

void CDlgCamera::OnSelchangeComboSplines()
{
	UpdateData(TRUE);
	int old = DAT_011298b0;
	int mode = (m_editPoints == 0) ? 9 : 8;
	DAT_011298b0 = mode;
	if (mode == 0xb || old == 0xb)
		FUN_0041b190(dword_01233488);
	if (mode != 0xa && old == 0xa)
		FUN_0042beb0();
	DAT_010c2d7c = 0;
	g_qeglobals.d_num_move_points = 0;
	int i = m_wndSplines.GetCurSel();
	if (i > 0)
	{
		g_splineList->setActiveTarget(i - 1);
		g_qeglobals.selectObject = g_splineList->getActiveTarget(i - 1);
		g_splineList->startEdit(false);
	}
	else
	{
		g_splineList->startEdit(true);
		g_qeglobals.selectObject = g_splineList->getPositionObj();
	}
	m_wndSegments.SetScrollRange(0, g_splineList->getTotalTime() * 4.0);
	g_nUpdateBits = -1;
}

void CDlgCamera::setupFromCamera()
{
	if (m_wndSplines.GetSafeHwnd())
	{
		int i;
		idStr str;
		m_strName = g_splineList->getName();
		m_strType = g_splineList->getPositionObj()->typeStr();
		m_wndSplines.ResetContent();
		m_wndSplines.AddString("Path");
		for (i = 0; i < g_splineList->numTargets(); i++)
		{
			m_wndSplines.AddString(g_splineList->getActiveTarget(i)->getName());
		}
		m_wndSplines.SetCurSel(0);
		m_fSeconds = g_splineList->getBaseTime();
		m_wndSegments.SetScrollRange(0, g_splineList->getTotalTime() * 4.0);
		m_wndEvents.ResetContent();
		for (i = 0; i < g_splineList->numEvents(); i++)
		{
			str = va("%s\t%s", idCameraEvent::eventStr[g_splineList->getEvent(i)->getType()], g_splineList->getEvent(i)->getParam());
			m_wndEvents.AddString(str);
		}
	}
	g_splineList->startEdit(true);
	UpdateData(FALSE);
}

void CDlgCamera::OnDestroy()
{
	if (GetSafeHwnd())
	{
		CRect rct;
		GetWindowRect(rct);
		SaveRegistryInfo("Radiant::CameraInspector", &rct, sizeof(rct));
	}
	CDialog::OnDestroy();
	g_nUpdateBits = -1;
}

void CDlgCamera::OnApply()
{
	UpdateData(TRUE);
	g_splineList->setBaseTime(m_fSeconds);
	g_splineList->setName(m_strName);
	g_splineList->buildCamera();
	m_wndSegments.SetScrollRange(0, g_splineList->getTotalTime() * 4.0);
}

// Camera window fields this file touches (retail: MainFrame +0x78c, camera origin +0x60, angles +0x6c).
struct CamWndCameraView
{
	unsigned char pad_00[0x60];
	float origin[3];
	float angles[3];
};
struct MainFrameCamView
{
	unsigned char pad_00[0x78c];
	CamWndCameraView *camWnd;
};

void CDlgCamera::OnHScroll(UINT nSBCode, UINT nPos, CScrollBar *pScrollBar)
{
	CDialog::OnHScroll(nSBCode, nPos, pScrollBar);
	int max = g_splineList->getTotalTime() * 4;
	if (max == 0)
	{
		max = 1;
	}
	int n = pScrollBar->GetScrollPos();
	switch (nSBCode)
	{
	case SB_LINEUP:
		n--;
		break;
	case SB_LINEDOWN:
		n++;
		break;
	case SB_PAGEUP:
		n -= (float)max * 0.10;
		break;
	case SB_PAGEDOWN:
		n += (float)max * 0.10;
		break;
	case SB_THUMBPOSITION:
		n = nPos;
		break;
	case SB_THUMBTRACK:
		n = nPos;
	}
	pScrollBar->SetScrollPos(n);
	if (m_trackCamera)
	{
		float p = (float)n / max;
		p *= g_splineList->getTotalTime() * 1000;
		g_splineList->startCamera(0);
		g_splineList->buildCamera();
		float dir[3];
		float fov;
		CamWndCameraView *cam = ((MainFrameCamView *)dword_01233488)->camWnd;
		g_splineList->getCameraInfo(p, cam->origin, dir, &fov);
		cam->angles[1] = atan2(dir[1], dir[0]) * 180 / 3.14159;
		cam->angles[0] = asin(dir[2]) * 180 / 3.14159;
	}
	UpdateData(FALSE);
	g_nUpdateBits |= 3;
}

void CDlgCamera::OnFileOpen()
{
	CNameDlg dlg("Open Camera File");
	if (dlg.DoModal() == IDOK)
	{
		g_splineList->clear();
		g_qeglobals.selectObject = g_splineList->getPositionObj();
		g_splineList->load(va("cameras/%s.camera", (const char *)dlg.m_strName));
		setupFromCamera();
		g_nUpdateBits = -1;
	}
}

void CDlgCamera::OnFileSave()
{
	CNameDlg dlg("Save Camera File");
	if (dlg.DoModal() == IDOK)
	{
		g_splineList->save(va("cameras/%s.camera", (const char *)dlg.m_strName));
	}
}

// One-byte RET functions verified against retail; ownership/signatures provisional.
extern "C" void FUN_00409df0() {}
void CDlgCamera::FUN_00409de0() {}
void CDlgCamera::FUN_00409e00() {}
void CDlgCamera::FUN_00409f70() {}
void CDlgCamera::FUN_00409f80() {}
void CDlgCamera::FUN_0040a9b0() {}
void CDlgCamera::FUN_0040a9c0() {}
void CDlgCamera::FUN_0040a9d0() {}

BOOL CDlgCamera::OnInitDialog()
{
	CDialog::OnInitDialog();
	setupFromCamera();
	return TRUE;
}

void FUN_0040a3d0()
{
	g_dlgCamera.ShowWindow(SW_HIDE);
	int old = DAT_011298b0;
	DAT_011298b0 = 0;
	if (old == 0xb)
		FUN_0041b190(dword_01233488);
	else if (old == 0xa)
		FUN_0042beb0();
	DAT_011298b4 = 0;
	g_splineList->stopEdit();
	g_nUpdateBits = -1;
}

void CDlgCamera::FUN_0040a9e0()
{
	UpdateData(TRUE);
	int old = DAT_011298b0;
	DAT_011298b0 = 9;
	if (old == 0xb)
		FUN_0041b190(dword_01233488);
	else if (old == 0xa)
		FUN_0042beb0();
}

void CDlgCamera::FUN_0040aa10()
{
	UpdateData(TRUE);
	int old = DAT_011298b0;
	DAT_011298b0 = 8;
	if (old == 0xb)
		FUN_0041b190(dword_01233488);
	else if (old == 0xa)
		FUN_0042beb0();
}

// Additional retail-matched short accessors and returns. Signatures are provisional.
extern "C" int __fastcall FUN_0040abb0(const int *value) { return *value; }
extern "C" int __fastcall FUN_0040ac50(const int *value) { return *value; }
extern "C" int __fastcall FUN_0040b1b0(const int *value) { return value[11]; }
extern "C" float __fastcall FUN_0040b1e0(const float *value) { return value[23]; }
extern "C" float __fastcall FUN_0040b320(const float *value) { return value[22]; }
extern "C" int FUN_0040b500() {return 0;}
extern "C" void __stdcall FUN_0040b510(int a0) {  }
extern "C" void __stdcall FUN_0040b520(int a0, int a1, int a2) {  }
extern "C" void __stdcall FUN_0040b530(int a0) {  }
extern "C" int __stdcall FUN_0040b540(int a0) { return 0; }
extern "C" int __fastcall FUN_0040b770(const int *value) { return *value; }
extern "C" int __stdcall FUN_0040b840(int a0) { return 0; }
extern "C" void __stdcall FUN_0040b870(int a0) {  }
extern "C" int __fastcall FUN_0040bc50(const int *value) { return value[7]; }
