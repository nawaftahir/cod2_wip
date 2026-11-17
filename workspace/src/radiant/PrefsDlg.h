#pragma once

#include "stdafx.h"

/* Field offsets are from retail. Names come from the registry key each field
 * is loaded from (Q3Radiant names where the key matches); field_<off> where
 * no key or reference proves a name. */
class CPrefsDlg : public CDialog
{
public:
	CPrefsDlg(CWnd *pParent = NULL);

	void LoadPrefs();
	void SavePrefs();

	enum { IDD = 127 };
	CSpinButtonCtrl m_wndUndoSpin;
	CSpinButtonCtrl m_wndFontSpin;
	CSliderCtrl m_wndCamSpeed;
	CSpinButtonCtrl m_wndSpin;
	int m_nMouse;
	int m_nView;
	BOOL m_bTextureLock;
	BOOL m_bLightmapLock;
	BOOL m_bLoadLast;
	BOOL m_bRunBefore;
	BOOL m_bCameraMode;
	BOOL m_bCameraMasked;
	BOOL m_bEntitiesOff;
	BOOL m_bSkyBrushOff;
	BOOL m_bDrawToggle;
	CString m_strLastProject;
	CString m_strLastMap;
	BOOL m_bFace;
	BOOL m_bRightClick;
	BOOL m_bAutoSave;
	BOOL m_bNewApplyHandling;
	CString m_strAutoSave;
	BOOL m_bLoadLastMap;
	BOOL m_bTextureWindow;
	BOOL m_bSnapShots;
	float m_fTinySize;
	int m_nDropHeight;
	BOOL m_bCleanTiny;
	int m_nStatusSize;
	BOOL m_bCamXYUpdate;
	int field_218;
	CString m_strWhatGame;
	BOOL m_bALTEdge;
	BOOL m_bTextureBar;
	BOOL m_bSnapTToGrid;
	BOOL m_bLinkSelect;
	BOOL m_bXZVis;
	BOOL m_bYZVis;
	BOOL m_bZVis;
	BOOL m_bSizePaint;
	BOOL m_bCullSkies;
	BOOL m_bRotateLock;
	BOOL m_bNoClamp;
	BOOL m_bDropModel;
	BOOL m_bOrientModel;
	CString m_strUserPath;
	int m_nRotation;
	BOOL m_bChaseMouse;
	BOOL m_bTextureScrollbar;
	BOOL m_bThickLines;
	BOOL m_bColoredEnts;
	BOOL m_bTolerantWeld;
	BOOL m_bVertSnapModel;
	BOOL m_bVertSnapBrush;
	BOOL m_bVertSnapPrefab;
	BOOL m_bModelSelection;
	BOOL m_b2dTextured;
	BOOL m_b2dMeshTextured;
	int m_nFarplane;
	int m_nTolerantWeldThreshold;
	int m_nVehArrowTime;
	int m_nVehArrowSize;
	int m_nSplayDistance;
	int m_nUndoLevels;
	int m_nScaleBase;
	int m_nScaleRange;
	int field_2a8;
	float m_fModelOrgSize;
	int m_nMouseButtons;
	int m_nAngleSpeed;
	int m_nMoveSpeed;
	int m_nAutoSave;
	bool m_bCubicClipping;
	int m_nCubicScale;
	BOOL m_bSelectCurves;
	int m_nEntityShowState;
	int m_nTextureScale;
	int field_2d4;
	BOOL m_bSwitchClip;
	BOOL m_bSelectWholeEntities;
	BOOL m_bPatchWireframe;
	bool m_bPatchWeld;
	bool m_bPatchDrillDown;
	BOOL m_bCameraUseWheel;
	CString m_strScriptGroup;
	CString field_2f0;

protected:
	virtual void DoDataExchange(CDataExchange *pDX);
	virtual BOOL OnInitDialog();
	virtual void OnOK();
	afx_msg void OnBtnBrowseuserini();

	DECLARE_MESSAGE_MAP()
};
