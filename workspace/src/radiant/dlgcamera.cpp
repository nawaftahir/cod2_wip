
#include "stdafx.h"
#include "dlgcamera.h"
#include "DlgEvent.h"
#include "NameDlg.h"

class idPointListInterface;

class idCameraEvent
{
public:
	enum eventType
	{
		EVENT_NA = 0x00,
		EVENT_WAIT,
		EVENT_TARGETWAIT,
		EVENT_SPEED,
		EVENT_TARGET,
		EVENT_SNAPTARGET,
		EVENT_FOV,
		EVENT_CMD,
		EVENT_TRIGGER,
		EVENT_STOP,
		EVENT_CAMERA,
		EVENT_FADEOUT,
		EVENT_FADEIN,
		EVENT_FEATHER,
		EVENT_COUNT
	};
};

class idCameraDef
{
public:
	void clear();
	idPointListInterface *getPositionObj();
	bool load(const char *filename);
	bool save(const char *filename);
	void addEvent(idCameraEvent::eventType t, const char *param, long time);
};

struct QEGlobals_t
{
	idPointListInterface *selectObject;
};

extern QEGlobals_t g_qeglobals;
extern idCameraDef *g_splineList;
extern int g_nUpdateBits;
extern char *va(const char *format, ...);

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
	ON_COMMAND(ID_FILE_OPEN, OnFileOpen)
	ON_COMMAND(ID_FILE_SAVE, OnFileSave)
END_MESSAGE_MAP()

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
extern "C" void FUN_00409de0() {}
extern "C" void FUN_00409df0() {}
extern "C" void FUN_00409e00() {}
extern "C" void FUN_00409f70() {}
extern "C" void FUN_00409f80() {}
extern "C" void FUN_0040a9b0() {}
extern "C" void FUN_0040a9c0() {}
extern "C" void FUN_0040a9d0() {}
extern "C" void FUN_0040b850() {}

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
extern "C" void __stdcall FUN_0040b860(int a0) {  }
extern "C" void __stdcall FUN_0040b870(int a0) {  }
extern "C" void __stdcall FUN_0040bae0(int a0) {  }
extern "C" int __fastcall FUN_0040bc50(const int *value) { return value[7]; }
