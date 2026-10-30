#include "stdafx.h"

class CLstToolBar : public CToolBar
{
public:
	CLstToolBar();
	virtual ~CLstToolBar();

protected:
	afx_msg void OnParentNotify(UINT message, LPARAM lParam);

	DECLARE_MESSAGE_MAP()
};

CLstToolBar::CLstToolBar()
{
}

CLstToolBar::~CLstToolBar()
{
}

BEGIN_MESSAGE_MAP(CLstToolBar, CToolBar)
	ON_WM_PARENTNOTIFY()
END_MESSAGE_MAP()

void CLstToolBar::OnParentNotify(UINT message, LPARAM lParam)
{
	CToolBar::OnParentNotify(message, lParam);
}
