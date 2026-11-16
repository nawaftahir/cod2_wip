#pragma once

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

protected:
	virtual void DoDataExchange(CDataExchange* pDX);
	virtual void OnOK();
	virtual BOOL OnInitDialog();

	DECLARE_MESSAGE_MAP()
};
