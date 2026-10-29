#include <afxwin.h>

class CEditWnd : public CEdit
{
	DECLARE_DYNCREATE(CEditWnd)
public:
	CEditWnd();
	virtual ~CEditWnd();

protected:
	virtual BOOL PreCreateWindow(CREATESTRUCT& cs);

	DECLARE_MESSAGE_MAP()
};

IMPLEMENT_DYNCREATE(CEditWnd, CWnd)

CEditWnd::CEditWnd()
{
}

CEditWnd::~CEditWnd()
{
}

BEGIN_MESSAGE_MAP(CEditWnd, CEdit)
END_MESSAGE_MAP()

BOOL CEditWnd::PreCreateWindow(CREATESTRUCT& cs)
{
	cs.style = 0x50200084;
	cs.lpszClass = "EDIT";
	return CWnd::PreCreateWindow(cs);
}
