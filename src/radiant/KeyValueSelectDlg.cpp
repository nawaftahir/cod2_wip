#include "stdafx.h"

#include "entityw.h"

class CKeyValueSelectDlg : public CDialog
{
public:
	CKeyValueSelectDlg(CWnd* pParent = NULL);

	enum { IDD = 188 };
	CString m_strValue;
	CString m_strKey;
	BOOL m_bKeySub;
	BOOL m_bValSub;

protected:
	virtual void DoDataExchange(CDataExchange* pDX);

	DECLARE_MESSAGE_MAP()
};

CKeyValueSelectDlg::CKeyValueSelectDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CKeyValueSelectDlg::IDD, pParent)
{
	char szKey[4096];
	char szValue[4096];

	::SendMessageA(hwndEnt[EntKeyField], WM_GETTEXT, 4095, (LPARAM)szKey);
	::SendMessageA(hwndEnt[EntValueField], WM_GETTEXT, 4095, (LPARAM)szValue);

	m_strValue = szValue;
	m_strKey = szKey;
	m_bKeySub = FALSE;
	m_bValSub = FALSE;
}

void CKeyValueSelectDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	DDX_Text(pDX, 1433, m_strValue);
	DDX_Text(pDX, 1432, m_strKey);
	DDX_Check(pDX, 1434, m_bKeySub);
	DDX_Check(pDX, 1435, m_bValSub);
}

BEGIN_MESSAGE_MAP(CKeyValueSelectDlg, CDialog)
END_MESSAGE_MAP()
