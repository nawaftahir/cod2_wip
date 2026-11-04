#pragma once
#include "Pmesh.h"

class CPatchDialog : public CDialog
{
	patchMesh_t* m_Patch;
public:
	CPatchDialog(CWnd* pParent = NULL);
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
	void UpdateSpinners(bool bUp, int nID);

protected:
	void UpdateRowColInfo();
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

typedef char PatchDialogSize[(sizeof(CPatchDialog)==0x320)?1:-1];
