#include "stdafx.h"

class CDlgEvent : public CDialog
{
public:
	CDlgEvent(CWnd* pParent = NULL);

	enum { IDD = 182 };
	CString m_strParm;
	int m_event;

protected:
	virtual void DoDataExchange(CDataExchange* pDX);

	DECLARE_MESSAGE_MAP()
};

CDlgEvent::CDlgEvent(CWnd* pParent /*=NULL*/)
	: CDialog(CDlgEvent::IDD, pParent)
{
	m_strParm = _T("");
	m_event = 0;
}

void CDlgEvent::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	DDX_Text(pDX, 1365, m_strParm);
	DDX_Radio(pDX, 1359, m_event);
}

BEGIN_MESSAGE_MAP(CDlgEvent, CDialog)
END_MESSAGE_MAP()
