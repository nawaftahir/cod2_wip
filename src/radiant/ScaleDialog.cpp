#include "stdafx.h"

class CScaleDialog : public CDialog
{
public:
	CScaleDialog(CWnd* pParent = NULL);

	enum { IDD = 145 };
	float	m_fZ;
	float	m_fX;
	float	m_fY;

protected:
	virtual void DoDataExchange(CDataExchange* pDX);

	DECLARE_MESSAGE_MAP()
};

CScaleDialog::CScaleDialog(CWnd* pParent /*=NULL*/)
	: CDialog(CScaleDialog::IDD, pParent)
{
	m_fZ = 1.0f;
	m_fX = 1.0f;
	m_fY = 1.0f;
}

void CScaleDialog::DoDataExchange(CDataExchange* pDX)
{
	DDX_Text(pDX, 1147, m_fZ);
	DDX_Text(pDX, 1089, m_fX);
	DDX_Text(pDX, 1142, m_fY);
}

BEGIN_MESSAGE_MAP(CScaleDialog, CDialog)
END_MESSAGE_MAP()
