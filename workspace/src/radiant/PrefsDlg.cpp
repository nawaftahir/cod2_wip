#include "stdafx.h"
#include "PrefsDlg.h"
#include "MainFrm.h"

#define PREF_SECTION      "Prefs"
#define INTERNAL_SECTION  "Internals"

extern CMainFrame *g_pParentWnd;
extern unsigned dword_0123348c;
void Undo_SetMaxSize(int size);

CPrefsDlg::CPrefsDlg(CWnd *pParent /*=NULL*/)
	: CDialog(CPrefsDlg::IDD, pParent)
{
	m_nMouse = 1;
	m_nView = 0;
	m_bLoadLast = FALSE;
	m_bFace = FALSE;
	m_bRightClick = FALSE;
	m_bAutoSave = TRUE;
	m_bNewApplyHandling = FALSE;
	m_strAutoSave = _T("5");
	m_bLoadLastMap = FALSE;
	m_bTextureWindow = FALSE;
	m_bSnapShots = FALSE;
	m_fTinySize = 0.5f;
	m_bCleanTiny = FALSE;
	m_nStatusSize = 10;
	m_bCamXYUpdate = FALSE;
	field_218 = 0;
	m_strWhatGame = _T("CoD");
	m_bALTEdge = FALSE;
	m_bTextureBar = FALSE;
	m_bSnapTToGrid = FALSE;
	m_bLinkSelect = FALSE;
	m_bXZVis = FALSE;
	m_bYZVis = FALSE;
	m_bZVis = FALSE;
	m_bSizePaint = FALSE;
	m_bCullSkies = TRUE;
	m_nDropHeight = 28;
	m_bNoClamp = FALSE;
	m_strUserPath = _T("");
	m_nVehArrowSize = 128;
	m_nSplayDistance = 128;
	m_nRotation = 0;
	m_nFarplane = 0x2000;
	m_nTolerantWeldThreshold = 24;
	m_nVehArrowTime = 1000;
	m_bChaseMouse = FALSE;
	m_bTextureScrollbar = TRUE;
	m_bThickLines = FALSE;
	m_bColoredEnts = FALSE;
	m_bTolerantWeld = FALSE;
	m_bVertSnapModel = FALSE;
	m_bVertSnapBrush = FALSE;
	m_bVertSnapPrefab = FALSE;
	m_bModelSelection = FALSE;
	m_b2dTextured = FALSE;
	m_b2dMeshTextured = FALSE;
	m_nScaleBase = 100;
	m_nScaleRange = 30;
	m_fModelOrgSize = 4.0f;
	m_bSelectCurves = TRUE;
	m_nEntityShowState = 0;
	m_nTextureScale = 2;
	m_bSwitchClip = FALSE;
	m_bSelectWholeEntities = TRUE;
	m_nUndoLevels = 64;
}

void CPrefsDlg::DoDataExchange(CDataExchange *pDX)
{
	CDialog::DoDataExchange(pDX);
	DDX_Control(pDX, 1091, m_wndUndoSpin);
	DDX_Control(pDX, 1098, m_wndFontSpin);
	DDX_Control(pDX, 1219, m_wndCamSpeed);
	DDX_Control(pDX, 1079, m_wndSpin);
	DDX_Radio(pDX, 1003, m_nMouse);
	DDX_Radio(pDX, 1006, m_nView);
	DDX_Check(pDX, 1021, m_bLoadLast);
	DDX_Check(pDX, 1040, m_bFace);
	DDX_Check(pDX, 1042, m_bRightClick);
	DDX_Check(pDX, 1023, m_bAutoSave);
	DDX_Text(pDX, 1065, m_strAutoSave);
	DDX_Check(pDX, 1024, m_bLoadLastMap);
	DDX_Check(pDX, 1045, m_bTextureWindow);
	DDX_Check(pDX, 1094, m_bSnapShots);
	DDX_Text(pDX, 1201, m_nStatusSize);
	DDV_MinMaxInt(pDX, m_nStatusSize, 2, 14);
	DDX_Check(pDX, 1223, m_bCamXYUpdate);
	DDX_Check(pDX, 1538, m_bCameraUseWheel);
	DDX_Check(pDX, 1246, m_bALTEdge);
	DDX_Check(pDX, 1047, m_bTextureBar);
	DDX_Check(pDX, 1051, m_bSnapTToGrid);
	DDX_Check(pDX, 1085, m_bLinkSelect);
	DDX_Check(pDX, 1084, m_bSizePaint);
	DDX_Check(pDX, 1517, m_bCullSkies);
	DDX_Check(pDX, 1255, m_bNoClamp);
	DDX_Text(pDX, 1026, m_strUserPath);
	DDX_Text(pDX, 1204, m_nRotation);
	DDX_Text(pDX, 1027, m_nFarplane);
	DDX_Text(pDX, 1456, m_nTolerantWeldThreshold);
	DDX_Text(pDX, 1480, m_nVehArrowTime);
	DDX_Text(pDX, 1481, m_nVehArrowSize);
	DDX_Text(pDX, 1457, m_nSplayDistance);
	DDX_Text(pDX, 1459, m_nDropHeight);
	DDX_Check(pDX, 1249, m_bChaseMouse);
	DDX_Check(pDX, 1054, m_bTextureScrollbar);
	DDX_Check(pDX, 1486, m_bThickLines);
	DDX_Check(pDX, 1420, m_bColoredEnts);
	DDX_Check(pDX, 1423, m_b2dTextured);
	DDX_Check(pDX, 1424, m_b2dMeshTextured);
	DDX_Text(pDX, 1208, m_nUndoLevels);
	DDX_Text(pDX, 1026, m_strUserPath);
	DDV_MinMaxInt(pDX, m_nUndoLevels, 1, 64);
	DDX_Text(pDX, 1461, m_nScaleBase);
	DDX_Text(pDX, 1463, m_nScaleRange);
	DDX_Text(pDX, 1559, m_fModelOrgSize);
}

BEGIN_MESSAGE_MAP(CPrefsDlg, CDialog)
	ON_BN_CLICKED(1029, OnBtnBrowseuserini)
END_MESSAGE_MAP()

BOOL CPrefsDlg::OnInitDialog()
{
	CDialog::OnInitDialog();
	m_wndSpin.SetRange(1, 60);
	m_wndCamSpeed.SetRange(10, 1600);
	m_wndCamSpeed.SetPos(m_nMoveSpeed);
	m_wndFontSpin.SetRange(4, 24);
	m_wndUndoSpin.SetRange(1, 64);
	GetDlgItem(1255)->EnableWindow(TRUE);
	return TRUE;
}

void CPrefsDlg::OnOK()
{
	m_nMoveSpeed = m_wndCamSpeed.GetPos();
	m_nAngleSpeed = (float)m_nMoveSpeed * 0.50;
	SavePrefs();
	if (g_pParentWnd)
		g_pParentWnd->FUN_00419560();
	dword_0123348c = (unsigned)-1;
	Undo_SetMaxSize(m_nUndoLevels);
	CDialog::OnOK();
}

void CPrefsDlg::LoadPrefs()
{
	CString strBuff;
	m_nMouse = AfxGetApp()->GetProfileInt(PREF_SECTION, "MouseButtons", 1);
	m_nMouseButtons = (m_nMouse != 0) ? 3 : 2;
	m_nView = AfxGetApp()->GetProfileInt(PREF_SECTION, "QE4StyleWindows", 0);
	m_bTextureLock = AfxGetApp()->GetProfileInt(PREF_SECTION, "TextureLock", 1);
	m_bRotateLock = AfxGetApp()->GetProfileInt(PREF_SECTION, "RotateLock", 1);
	m_bLightmapLock = AfxGetApp()->GetProfileInt(PREF_SECTION, "LightmapLock", 0);
	m_strLastProject = AfxGetApp()->GetProfileString(PREF_SECTION, "LastProject", "");
	m_strLastMap = AfxGetApp()->GetProfileString(PREF_SECTION, "LastMap", "");
	m_bLoadLast = AfxGetApp()->GetProfileInt(PREF_SECTION, "LoadLast", 1);
	m_bRunBefore = AfxGetApp()->GetProfileInt(INTERNAL_SECTION, "RunBefore", 0);
	m_bCameraMode = AfxGetApp()->GetProfileInt(PREF_SECTION, "CameraMode", 1);
	m_bCameraMasked = AfxGetApp()->GetProfileInt(PREF_SECTION, "CameraMasked", 1);
	m_bFace = AfxGetApp()->GetProfileInt(PREF_SECTION, "NewFaceGrab", 1);
	m_bRightClick = AfxGetApp()->GetProfileInt(PREF_SECTION, "NewRightClick", 1);
	m_bAutoSave = AfxGetApp()->GetProfileInt(PREF_SECTION, "Autosave", 1);
	m_bNewApplyHandling = AfxGetApp()->GetProfileInt(PREF_SECTION, "ApplyDismissesSurface", 0);
	m_bLoadLastMap = AfxGetApp()->GetProfileInt(PREF_SECTION, "LoadLastMap", 0);
	m_bTextureWindow = AfxGetApp()->GetProfileInt(PREF_SECTION, "NewTextureWindowStuff", 0);
	m_bCleanTiny = AfxGetApp()->GetProfileInt(PREF_SECTION, "CleanTinyBrushes", 0);
	strBuff = AfxGetApp()->GetProfileString(PREF_SECTION, "CleanTinyBrusheSize", "0.5");
	m_fTinySize = atof(strBuff);
	m_nAutoSave = AfxGetApp()->GetProfileInt(PREF_SECTION, "AutosaveMinutes", 5);
	m_strAutoSave.Format("%i", m_nAutoSave);
	m_bSnapShots = AfxGetApp()->GetProfileInt(PREF_SECTION, "Snapshots", 0);
	m_nStatusSize = AfxGetApp()->GetProfileInt(PREF_SECTION, "StatusPointSize", 10);
	m_nMoveSpeed = AfxGetApp()->GetProfileInt(PREF_SECTION, "MoveSpeed", 350);
	m_nAngleSpeed = AfxGetApp()->GetProfileInt(PREF_SECTION, "AngleSpeed", 150);
	m_bCamXYUpdate = AfxGetApp()->GetProfileInt(PREF_SECTION, "CamXYUpdate", 0);
	m_bCubicClipping = AfxGetApp()->GetProfileInt(PREF_SECTION, "CubicClipping", 1);
	m_nCubicScale = AfxGetApp()->GetProfileInt(PREF_SECTION, "CubicScale", 13);
	m_bALTEdge = AfxGetApp()->GetProfileInt(PREF_SECTION, "ALTEdgeDrag", 1);
	m_bTextureBar = AfxGetApp()->GetProfileInt(PREF_SECTION, "UseTextureBar", 0);
	m_strWhatGame = AfxGetApp()->GetProfileString(PREF_SECTION, "WhichGame", "CoD");
	m_bSnapTToGrid = AfxGetApp()->GetProfileInt(PREF_SECTION, "SnapT", 0);
	m_bLinkSelect = AfxGetApp()->GetProfileInt(PREF_SECTION, "LinkSelect", 0);
	m_bXZVis = AfxGetApp()->GetProfileInt(PREF_SECTION, "XZVIS", 0);
	m_bYZVis = AfxGetApp()->GetProfileInt(PREF_SECTION, "YZVIS", 0);
	m_bZVis = AfxGetApp()->GetProfileInt(PREF_SECTION, "ZVIS", 1);
	m_bSizePaint = AfxGetApp()->GetProfileInt(PREF_SECTION, "SizePainting", 1);
	m_bCullSkies = AfxGetApp()->GetProfileInt(PREF_SECTION, "CullSkies", 1);
	m_nDropHeight = AfxGetApp()->GetProfileInt(PREF_SECTION, "DropHeight", 28);
	m_bNoClamp = AfxGetApp()->GetProfileInt(PREF_SECTION, "NoClamp", 0);
	m_bDropModel = AfxGetApp()->GetProfileInt(PREF_SECTION, "DropModel", 0);
	m_bOrientModel = AfxGetApp()->GetProfileInt(PREF_SECTION, "OrientModel", 0);
	m_strScriptGroup = AfxGetApp()->GetProfileString(PREF_SECTION, "ScriptGroupKey", "script_group");
	m_strUserPath = AfxGetApp()->GetProfileString(PREF_SECTION, "UserINIPath", "");
	m_nRotation = AfxGetApp()->GetProfileInt(PREF_SECTION, "Rotation", 45);
	m_nFarplane = AfxGetApp()->GetProfileInt(PREF_SECTION, "Farplane", 8192);
	m_nTolerantWeldThreshold = AfxGetApp()->GetProfileInt(PREF_SECTION, "TolerantWeldThreshold", 24);
	m_nVehArrowTime = AfxGetApp()->GetProfileInt(PREF_SECTION, "VehArrowTime", 1000);
	m_nVehArrowSize = AfxGetApp()->GetProfileInt(PREF_SECTION, "VehArrowSize", 128);
	m_nSplayDistance = AfxGetApp()->GetProfileInt(PREF_SECTION, "SplayDistance", 128);
	m_bChaseMouse = AfxGetApp()->GetProfileInt(PREF_SECTION, "ChaseMouse", 1);
	m_nEntityShowState = AfxGetApp()->GetProfileInt(PREF_SECTION, "EntityShow", 0);
	m_nTextureScale = AfxGetApp()->GetProfileInt(PREF_SECTION, "TextureScale", 50);
	m_bTextureScrollbar = AfxGetApp()->GetProfileInt(PREF_SECTION, "TextureScrollbar", 1);
	m_bSwitchClip = AfxGetApp()->GetProfileInt(PREF_SECTION, "SwitchClipKey", 1);
	m_bSelectWholeEntities = AfxGetApp()->GetProfileInt(PREF_SECTION, "SelectWholeEntitiesKey", 1);
	m_bThickLines = AfxGetApp()->GetProfileInt(PREF_SECTION, "ThickLines", 0);
	m_bColoredEnts = AfxGetApp()->GetProfileInt(PREF_SECTION, "ColoredEnts", 0);
	m_bTolerantWeld = AfxGetApp()->GetProfileInt(PREF_SECTION, "TolerantWeld", 0);
	m_bVertSnapModel = AfxGetApp()->GetProfileInt(PREF_SECTION, "VertSnapModel", 0);
	m_bVertSnapBrush = AfxGetApp()->GetProfileInt(PREF_SECTION, "VertSnapBrush", 0);
	m_bVertSnapPrefab = AfxGetApp()->GetProfileInt(PREF_SECTION, "VertSnapPrefab", 0);
	m_bModelSelection = AfxGetApp()->GetProfileInt(PREF_SECTION, "ModelSelection", 0);
	m_b2dTextured = AfxGetApp()->GetProfileInt(PREF_SECTION, "2dTextured", 0);
	m_b2dMeshTextured = AfxGetApp()->GetProfileInt(PREF_SECTION, "2dMeshTextured", 0);
	m_nUndoLevels = AfxGetApp()->GetProfileInt(PREF_SECTION, "UndoLevels", 10);
	m_bPatchWireframe = AfxGetApp()->GetProfileInt(PREF_SECTION, "PatchWireframe", 0);
	m_bPatchWeld = AfxGetApp()->GetProfileInt(PREF_SECTION, "PatchWeld", 1);
	m_bPatchDrillDown = AfxGetApp()->GetProfileInt(PREF_SECTION, "PatchDrillDown", 1);
	m_bEntitiesOff = AfxGetApp()->GetProfileInt(PREF_SECTION, "EntitiesOff", 0);
	m_bSkyBrushOff = AfxGetApp()->GetProfileInt(PREF_SECTION, "SkyBrushOff", 0);
	m_bDrawToggle = AfxGetApp()->GetProfileInt(PREF_SECTION, "DrawToggle", 0);
	m_nScaleBase = AfxGetApp()->GetProfileInt(PREF_SECTION, "ScaleBase", 100);
	m_nScaleRange = AfxGetApp()->GetProfileInt(PREF_SECTION, "ScaleRange", 30);
	m_bCameraUseWheel = AfxGetApp()->GetProfileInt(PREF_SECTION, "CameraUseWheel", 1);
	m_fModelOrgSize = AfxGetApp()->GetProfileInt(PREF_SECTION, "ModelOrgSize", 4);
	if (!m_bRunBefore)
		SavePrefs();
}

void CPrefsDlg::SavePrefs()
{
	if (GetSafeHwnd())
		UpdateData(TRUE);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "MouseButtons", m_nMouse);
	m_nMouseButtons = (m_nMouse != 0) ? 3 : 2;
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "QE4StyleWindows", m_nView);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "TextureLock", m_bTextureLock);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "RotateLock", m_bRotateLock);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "LightmapLock", m_bLightmapLock);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "LoadLast", m_bLoadLast);
	AfxGetApp()->WriteProfileString(PREF_SECTION, "LastProject", m_strLastProject);
	AfxGetApp()->WriteProfileString(PREF_SECTION, "LastMap", m_strLastMap);
	AfxGetApp()->WriteProfileInt(INTERNAL_SECTION, "RunBefore", m_bRunBefore);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "CameraMode", m_bCameraMode);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "CameraMasked", m_bCameraMasked);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "NewFaceGrab", m_bFace);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "NewRightClick", m_bRightClick);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "Autosave", m_bAutoSave);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "LoadLastMap", m_bLoadLastMap);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "NewTextureWindowStuff", m_bTextureWindow);
	m_nAutoSave = atoi(m_strAutoSave);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "AutosaveMinutes", m_nAutoSave);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "Snapshots", m_bSnapShots);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "StatusPointSize", m_nStatusSize);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "CamXYUpdate", m_bCamXYUpdate);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "MoveSpeed", m_nMoveSpeed);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "AngleSpeed", m_nAngleSpeed);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "CubicClipping", m_bCubicClipping);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "CubicScale", m_nCubicScale);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "ALTEdgeDrag", m_bALTEdge);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "UseTextureBar", m_bTextureBar);
	AfxGetApp()->WriteProfileString(PREF_SECTION, "WhichGame", m_strWhatGame);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "SnapT", m_bSnapTToGrid);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "LinkSelect", m_bLinkSelect);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "XZVIS", m_bXZVis);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "YZVIS", m_bYZVis);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "ZVIS", m_bZVis);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "SizePainting", m_bSizePaint);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "CullSkies", m_bCullSkies);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "DropHeight", m_nDropHeight);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "NoClamp", m_bNoClamp);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "DropModel", m_bDropModel);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "OrientModel", m_bOrientModel);
	AfxGetApp()->WriteProfileString(PREF_SECTION, "ScriptGroupKey", m_strScriptGroup);
	AfxGetApp()->WriteProfileString(PREF_SECTION, "UserINIPath", m_strUserPath);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "Rotation", m_nRotation);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "Farplane", m_nFarplane);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "TolerantWeldThreshold", m_nTolerantWeldThreshold);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "VehArrowTime", m_nVehArrowTime);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "VehArrowSize", m_nVehArrowSize);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "SplayDistance", m_nSplayDistance);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "ModelSelection", m_bModelSelection);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "ChaseMouse", m_bChaseMouse);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "EntityShow", m_nEntityShowState);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "TextureScale", m_nTextureScale);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "TextureScrollbar", m_bTextureScrollbar);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "SwitchClipKey", m_bSwitchClip);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "SelectWholeEntitiesKey", m_bSelectWholeEntities);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "ThickLines", m_bThickLines);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "ColoredEnts", m_bColoredEnts);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "TolerantWeld", m_bTolerantWeld);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "VertSnapModel", m_bVertSnapModel);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "VertSnapBrush", m_bVertSnapBrush);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "VertSnapPrefab", m_bVertSnapPrefab);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "ModelSelection", m_bModelSelection);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "2dTextured", m_b2dTextured);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "2dMeshTextured", m_b2dMeshTextured);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "UndoLevels", m_nUndoLevels);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "PatchWireframe", m_bPatchWireframe);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "PatchWeld", m_bPatchWeld);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "PatchDrillDown", m_bPatchDrillDown);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "DrawToggle", m_bDrawToggle);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "EntitiesOff", m_bEntitiesOff);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "SkyBrushOff", m_bSkyBrushOff);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "CameraUseWheel", m_bCameraUseWheel);
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "ModelOrgSize", (int)m_fModelOrgSize);
	if (m_nScaleBase <= 1)
		m_nScaleBase = 100;
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "ScaleBase", m_nScaleBase);
	if (m_nScaleBase - m_nScaleRange <= 0)
		m_nScaleRange = m_nScaleBase - 1;
	AfxGetApp()->WriteProfileInt(PREF_SECTION, "ScaleRange", m_nScaleRange);
}

void CPrefsDlg::OnBtnBrowseuserini()
{
	UpdateData(TRUE);
	CFileDialog dlg(TRUE, NULL, NULL, OFN_HIDEREADONLY | OFN_OVERWRITEPROMPT, "INI files (*.ini)|*.ini||", this);
	if (dlg.DoModal() == IDOK)
	{
		m_strUserPath = dlg.GetPathName();
		UpdateData(FALSE);
	}
}

void __fastcall FUN_0043b4f0(CPrefsDlg *dlg)
{
	dlg->SavePrefs();
}
