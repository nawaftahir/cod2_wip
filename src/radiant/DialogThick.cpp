#include "stdafx.h"

#include "DialogThick.h"

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
