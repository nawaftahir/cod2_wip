#include "stdafx.h"

#include "NewProjDlg.h"

CNewProjDlg::CNewProjDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CNewProjDlg::IDD, pParent)
{
	m_strName = _T("");
}

void CNewProjDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	DDX_Text(pDX, 1033, m_strName);
}

BEGIN_MESSAGE_MAP(CNewProjDlg, CDialog)
END_MESSAGE_MAP()
