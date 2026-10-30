#include "EditWnd.h"

class CRADEditWnd : public CWnd
{
public:
	CRADEditWnd();
	virtual ~CRADEditWnd();

	CEdit* GetEditWnd() { return &m_wndEdit; }

protected:
	CEditWnd m_wndEdit;

	afx_msg int OnCreate(LPCREATESTRUCT lpCreateStruct);
	afx_msg void OnSize(UINT nType, int cx, int cy);

	DECLARE_MESSAGE_MAP()
};

CRADEditWnd::CRADEditWnd()
{
}

CRADEditWnd::~CRADEditWnd()
{
}

BEGIN_MESSAGE_MAP(CRADEditWnd, CWnd)
	ON_WM_CREATE()
	ON_WM_SIZE()
END_MESSAGE_MAP()

int CRADEditWnd::OnCreate(LPCREATESTRUCT lpCreateStruct)
{
	if (CWnd::OnCreate(lpCreateStruct) == -1)
		return -1;

	CRect rctClient;
	GetClientRect(rctClient);
	m_wndEdit.Create(0x50200084, rctClient, this, 101);
	return 0;
}

void CRADEditWnd::OnSize(UINT nType, int cx, int cy)
{
	CWnd::OnSize(nType, cx, cy);
	CRect rctClient;
	GetClientRect(rctClient);
	m_wndEdit.SetWindowPos(NULL, rctClient.left, rctClient.top, rctClient.Width(), rctClient.Height(), SWP_SHOWWINDOW);
}
