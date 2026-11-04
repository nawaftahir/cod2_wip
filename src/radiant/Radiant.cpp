/* CoD2Radiant MFC application reconstruction, partial.
 * Class outline and message map based on Q3Radiant Radiant.cpp
 * (id Software GPL-2.0-or-later); the three game routines below match
 * CoD2 retail. Remaining virtual methods, global lifetime, RTTI and
 * InitInstance are intentionally not claimed.
 */
#include "stdafx.h"
#include <shellapi.h>

class CRadiantApp : public CWinApp
{
public:
    CRadiantApp();
    virtual BOOL InitInstance();
    virtual int ExitInstance();
    virtual BOOL OnIdle(LONG count);
protected:
    afx_msg void OnHelp();
    DECLARE_MESSAGE_MAP()
};
BEGIN_MESSAGE_MAP(CRadiantApp, CWinApp)
    ON_COMMAND(ID_HELP, OnHelp)
    ON_COMMAND(ID_FILE_NEW, CWinApp::OnFileNew)
    ON_COMMAND(ID_FILE_OPEN, CWinApp::OnFileOpen)
    ON_COMMAND(ID_FILE_PRINT_SETUP, CWinApp::OnFilePrintSetup)
END_MESSAGE_MAP()

CRadiantApp::CRadiantApp() {}

void CRadiantApp::OnHelp()
{
    ShellExecute(m_pMainWnd->GetSafeHwnd(), "open", m_pszHelpFilePath,
                 NULL, NULL, SW_SHOW);
}
