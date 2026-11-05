// SurfaceDlg.cpp: placeholder, no function reconstructed yet. Code goes here in retail order.

// Retail one-byte RET bodies verified with MSVC 7.1. Original entry-point ownership/signatures remain provisional.
extern "C" void FUN_0043e910() {}

#include "stdafx.h"

class CSurfaceDlg : public CDialog
{
protected:
	afx_msg int OnCreate(LPCREATESTRUCT lpCreateStruct);
};

int CSurfaceDlg::OnCreate(LPCREATESTRUCT lpCreateStruct)
{
	if (CDialog::OnCreate(lpCreateStruct) == -1)
		return -1;

	return 0;
}
