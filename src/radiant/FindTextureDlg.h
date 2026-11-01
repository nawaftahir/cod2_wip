#pragma once

#include <afxwin.h>

class CFindTextureDlg : public CDialog
{
public:
	static void setReplaceStr(const char *p);
	static void setFindStr(const char *p);
	static bool isOpen();
	static void show();
	static void updateTextures(const char *p);
	CFindTextureDlg(CWnd *pParent = NULL);

	enum { IDD = 147 };
	BOOL m_bSelectedOnly;
	CString m_strFind;
	CString m_strReplace;
	BOOL m_bForce;
	BOOL m_bRecurse;
	BOOL m_bLive;

	virtual BOOL DestroyWindow();

protected:
	virtual void DoDataExchange(CDataExchange *pDX);
	afx_msg void OnBtnApply();
	virtual void OnOK();
	virtual void OnCancel();
	afx_msg void OnSetfocusEditFind();
	afx_msg void OnSetfocusEditReplace();

	DECLARE_MESSAGE_MAP()
};
