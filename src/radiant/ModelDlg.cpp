/* Source trial of CModelDlg's retail constructor at 0x00422f10.
 * The original 0xe5 dialog ID is directly established in the retail
 * constructor. Additional handlers/metadata remain to be reconstructed.
 */
#include "stdafx.h"

class CModelDlg : public CDialog
{
public:
    enum { IDD = 229 };
    CModelDlg(CWnd *pParent = NULL);
};

CModelDlg::CModelDlg(CWnd *pParent) : CDialog(IDD, pParent)
{
}
