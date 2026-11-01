/*
===========================================================================
Copyright (C) 1999-2005 Id Software, Inc.

This file is derived from the Quake III Arena q3radiant FindTextureDlg
implementation under GPL-2.0-or-later, with CoD2-specific behavior recovered
from the retail CoD2Radiant.exe.
===========================================================================
*/

#include "stdafx.h"
#include "FindTextureDlg.h"
#include "win_main.h"

extern void FindReplaceTextures(const char *find, const char *replace,
                                bool selectedOnly, bool force, bool recurse);

CFindTextureDlg g_TexFindDlg;
CFindTextureDlg& g_dlgFind = g_TexFindDlg;
static bool g_bFindActive = true;

void CFindTextureDlg::updateTextures(const char *p)
{
	if (isOpen())
	{
		if (g_bFindActive)
		{
			setFindStr(p);
		}
		else
		{
			setReplaceStr(p);
		}
	}
}

CFindTextureDlg::CFindTextureDlg(CWnd *pParent /*=NULL*/)
	: CDialog(CFindTextureDlg::IDD, pParent)
{
	m_bSelectedOnly = FALSE;
	m_strFind = _T("");
	m_strReplace = _T("");
	m_bForce = FALSE;
	m_bLive = TRUE;
}

void CFindTextureDlg::DoDataExchange(CDataExchange *pDX)
{
	CDialog::DoDataExchange(pDX);
	DDX_Check(pDX, 1105, m_bSelectedOnly);
	DDX_Text(pDX, 1097, m_strFind);
	DDX_Text(pDX, 1101, m_strReplace);
	DDX_Check(pDX, 1109, m_bForce);
	DDX_Check(pDX, 1525, m_bRecurse);
	DDX_Check(pDX, 123, m_bLive);
}

BEGIN_MESSAGE_MAP(CFindTextureDlg, CDialog)
	ON_BN_CLICKED(3, OnBtnApply)
	ON_EN_SETFOCUS(1097, OnSetfocusEditFind)
	ON_EN_SETFOCUS(1101, OnSetfocusEditReplace)
END_MESSAGE_MAP()

void CFindTextureDlg::OnBtnApply()
{
	UpdateData(TRUE);
	CRect rct;
	GetWindowRect(rct);
	SaveRegistryInfo("Radiant::TextureFindWindow", &rct, sizeof(rct));
	FindReplaceTextures(m_strFind, m_strReplace, m_bSelectedOnly != FALSE,
	                    m_bForce != FALSE, m_bRecurse != FALSE);
}

void CFindTextureDlg::OnOK()
{
	UpdateData(TRUE);
	CRect rct;
	GetWindowRect(rct);
	SaveRegistryInfo("Radiant::TextureFindWindow", &rct, sizeof(rct));
	FindReplaceTextures(m_strFind, m_strReplace, m_bSelectedOnly != FALSE,
	                    m_bForce != FALSE, m_bRecurse != FALSE);
	CDialog::OnOK();
}

void CFindTextureDlg::show()
{
	if (g_dlgFind.GetSafeHwnd() == NULL || IsWindow(g_dlgFind.GetSafeHwnd()) == FALSE)
	{
		g_dlgFind.Create(CFindTextureDlg::IDD);
		g_dlgFind.ShowWindow(SW_SHOW);
	}
	else
	{
		g_dlgFind.ShowWindow(SW_SHOW);
	}

	CRect rct;
	LONG lSize = sizeof(rct);
	if (LoadRegistryInfo("Radiant::TextureFindWindow", &rct, &lSize))
	{
		g_dlgFind.SetWindowPos(NULL, rct.left, rct.top, 0, 0,
		                       SWP_NOSIZE | SWP_SHOWWINDOW);
	}
}

bool CFindTextureDlg::isOpen()
{
	if (g_dlgFind.GetSafeHwnd() == NULL ||
	    ::IsWindowVisible(g_dlgFind.GetSafeHwnd()) == FALSE)
	{
		return 0;
	}
	return 1;
}

void CFindTextureDlg::setFindStr(const char *p)
{
	g_dlgFind.UpdateData(TRUE);
	if (g_dlgFind.m_bLive)
	{
		g_dlgFind.m_strFind = p;
		g_dlgFind.UpdateData(FALSE);
	}
}

void CFindTextureDlg::setReplaceStr(const char *p)
{
	g_dlgFind.UpdateData(TRUE);
	if (g_dlgFind.m_bLive)
	{
		g_dlgFind.m_strReplace = p;
		g_dlgFind.UpdateData(FALSE);
	}
}

void CFindTextureDlg::OnCancel()
{
	CRect rct;
	GetWindowRect(rct);
	SaveRegistryInfo("Radiant::TextureFindWindow", &rct, sizeof(rct));
	CDialog::OnCancel();
}

BOOL CFindTextureDlg::DestroyWindow()
{
	return CDialog::DestroyWindow();
}

void CFindTextureDlg::OnSetfocusEditFind()
{
	g_bFindActive = true;
}

void CFindTextureDlg::OnSetfocusEditReplace()
{
	g_bFindActive = false;
}
