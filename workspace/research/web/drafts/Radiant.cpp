/* CRadiantApp MFC shell reconstructed from Q3Radiant ancestry and
 * compared against the CoD2 retail application independently.
 * Structural reference: id Software Q3Radiant Radiant.cpp (GPL-2.0-or-later).
 * All methods remain trial-only until individually matched.
 */
#include "stdafx.h"
#include <shellapi.h>
class CRadiantApp : public CWinApp {
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
extern void QGL_Shutdown();
int CRadiantApp::ExitInstance()
{
    QGL_Shutdown();
    return CWinApp::ExitInstance();
}
class CMainFrame {public: void RoutineProcessing();};
extern CMainFrame *g_pParentWnd;
BOOL CRadiantApp::OnIdle(LONG count)
{
    if (g_pParentWnd)
        g_pParentWnd->RoutineProcessing();
    return CWinApp::OnIdle(count);
}
void CRadiantApp::OnHelp()
{
    ShellExecute(m_pMainWnd->GetSafeHwnd(), "open", m_pszHelpFilePath,
                 NULL, NULL, SW_SHOW);
}
