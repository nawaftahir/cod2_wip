#include "stdafx.h"

class CDialogThick : public CDialog
{
public:
	CDialogThick(CWnd* pParent = NULL);

	enum { IDD = 164 };
	BOOL	m_bSeams;
	int		m_nAmount;

protected:
	virtual void DoDataExchange(CDataExchange* pDX);

	DECLARE_MESSAGE_MAP()
};

CDialogThick::CDialogThick(CWnd* pParent /*=NULL*/)
	: CDialog(CDialogThick::IDD, pParent)
{
	m_bSeams = TRUE;
	m_nAmount = 8;
}

void CDialogThick::DoDataExchange(CDataExchange* pDX)
{
	DDX_Check(pDX, 1288, m_bSeams);
	DDX_Text(pDX, 1290, m_nAmount);
}

BEGIN_MESSAGE_MAP(CDialogThick, CDialog)
END_MESSAGE_MAP()
