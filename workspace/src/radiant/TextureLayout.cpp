#include "stdafx.h"
#include "TextureLayout.h"

CTextureLayout::CTextureLayout(CWnd* pParent /*=NULL*/)
	: CDialog(CTextureLayout::IDD, pParent)
{
	m_fX = 4.0f;
	m_fY = 4.0f;
	m_nOrientation = 0;
}

void CTextureLayout::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	DDX_Text(pDX, 1089, m_fX);
	DDX_Text(pDX, 1142, m_fY);
	DDX_Radio(pDX, 1449, m_nOrientation);
	DDX_Control(pDX, 1453, m_wndSpinX);
	DDX_Control(pDX, 1455, m_wndSpinY);
}

BEGIN_MESSAGE_MAP(CTextureLayout, CDialog)
END_MESSAGE_MAP()

void CTextureLayout::OnOK()
{
	CDialog::OnOK();
}

BOOL CTextureLayout::OnInitDialog()
{
	CDialog::OnInitDialog();
	m_wndSpinX.SetRange(-1000, 1000);
	m_wndSpinY.SetRange(-1000, 1000);
	return TRUE;
}
