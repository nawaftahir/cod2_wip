#include "stdafx.h"

class CCapDialog : public CDialog
{
public:
	enum { IDD = 161 };
	CCapDialog(CWnd* pParent = NULL);
	int m_nCap;

protected:
	virtual void DoDataExchange(CDataExchange* pDX);

	DECLARE_MESSAGE_MAP()
};

CCapDialog::CCapDialog(CWnd* pParent /*=NULL*/)
	: CDialog(CCapDialog::IDD, pParent)
{
	m_nCap = 0;
}

void CCapDialog::DoDataExchange(CDataExchange* pDX)
{
	DDX_Radio(pDX, 1285, m_nCap);
}

BEGIN_MESSAGE_MAP(CCapDialog, CDialog)
END_MESSAGE_MAP()

int FUN_00408010(const char *text)
{
    return (int)strlen(text);
}
