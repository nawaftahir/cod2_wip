/* CoD2Radiant MFC application reconstruction, partial.
 * Class outline and message map based on Q3Radiant Radiant.cpp
 * (id Software GPL-2.0-or-later) with the CoD2 registry key and no
 * OpenGL loader. Global lifetime and RTTI are not claimed.
 */
#include "stdafx.h"
#include <shellapi.h>
#include <direct.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "PrefsDlg.h"

class CMainFrame : public CFrameWnd
{
public:
    CMainFrame();
    void RoutineProcessing();
private:
    char field_pad[0x7e8 - sizeof(CFrameWnd)];
};

extern CMainFrame *g_pParentWnd;
extern CPrefsDlg *dword_01233b64;
extern CString g_strAppPath;
extern bool g_bBuildList;
extern int dword_011298f0;
extern char byte_011298f4[];
extern char byte_01141f78[];
extern char *FUN_0046cb10(const char *s);
void AddSlash(CString &strPath);
void FS_Shutdown(int closemfp);
void Hunk_Shutdown();
void Dvar_Shutdown();

/* renderer export table at 0x59c300; only slot 0 and the module handle are used here */
struct rendererExports_t { void (__cdecl *shutdown)(int); int pad[126]; };
extern rendererExports_t dword_0059c300;
extern HMODULE dword_0059c4fc;

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


BOOL CRadiantApp::InitInstance()
{
    char RadiantPath[_MAX_PATH];
    _getcwd(byte_01141f78, 1024);
    GetModuleFileName(NULL, RadiantPath, _MAX_PATH);

    CFileFind Finder;
    Finder.FindFile(RadiantPath);
    Finder.FindNextFile();
    CString Root = Finder.GetRoot();
    CString IniPath = Root + "\\REGISTRY.INI";
    Finder.FindNextFile();
    if (Finder.FindFile(IniPath))
    {
        Finder.FindNextFile();
        free((void *)m_pszProfileName);
        m_pszProfileName = FUN_0046cb10(Finder.GetFilePath());
        int i = 0;
        CString key;
        HKEY hkResult;
        DWORD dwDisp;
        DWORD type;
        char iBuf[3];
        do
        {
            sprintf(iBuf, "%d", i);
            key = "Software\\iw\\CoD2Radiant\\IniPrefs" + CString(iBuf);
            if (RegOpenKeyEx(HKEY_CURRENT_USER, key, 0, KEY_ALL_ACCESS, &hkResult) != ERROR_SUCCESS)
            {
                strcpy(byte_011298f4, key.GetBuffer(0));
                RegCreateKeyEx(HKEY_CURRENT_USER, key, 0, NULL, REG_OPTION_NON_VOLATILE,
                    KEY_ALL_ACCESS, NULL, &hkResult, &dwDisp);
                RegSetValueEx(hkResult, "RadiantName", 0, REG_SZ,
                    reinterpret_cast<CONST BYTE *>(RadiantPath), strlen(RadiantPath) + 1);
                RegCloseKey(hkResult);
                break;
            }
            else
            {
                char RadiantAux[_MAX_PATH];
                unsigned long size = _MAX_PATH;
                RegQueryValueEx(hkResult, "RadiantName", 0, &type,
                    reinterpret_cast<BYTE *>(RadiantAux), &size);
                RegCloseKey(hkResult);
                if (!strcmp(RadiantAux, RadiantPath))
                {
                    strcpy(byte_011298f4, key.GetBuffer(0));
                    break;
                }
            }
            i++;
        } while (1);
        dword_011298f0 = 1;
    }
    else
    {
        SetRegistryKey("iw\\CoD2Radiant");
        dword_011298f0 = 0;
    }

    LoadStdProfileSettings(4);
    dword_01233b64->LoadPrefs();

    CString strTemp = m_lpCmdLine;
    strTemp.MakeLower();
    if (strTemp.Find("builddefs") >= 0)
        g_bBuildList = true;

    CMainFrame *pMainFrame = new CMainFrame;
    if (!pMainFrame->LoadFrame(214))
        return FALSE;

    pMainFrame->SetIcon(LoadIcon(MAKEINTRESOURCE(111)), FALSE);
    if (pMainFrame->m_hAccelTable)
        ::DestroyAcceleratorTable(pMainFrame->m_hAccelTable);
    pMainFrame->LoadAccelTable(MAKEINTRESOURCE(146));

    m_pMainWnd = pMainFrame;
    pMainFrame->ShowWindow(m_nCmdShow);
    pMainFrame->UpdateWindow();

    free((void *)m_pszHelpFilePath);
    CString strHelp = g_strAppPath;
    AddSlash(strHelp);
    strHelp += "Q3RManual.chm";
    m_pszHelpFilePath = FUN_0046cb10(strHelp);
    return TRUE;
}

int CRadiantApp::ExitInstance()
{
    if (dword_0059c300.shutdown)
    {
        dword_0059c300.shutdown(1);
        FreeLibrary(dword_0059c4fc);
        memset(&dword_0059c300, 0, 0x1fc);
        Hunk_Shutdown();
    }
    FS_Shutdown(0);
    Dvar_Shutdown();
    return CWinApp::ExitInstance();
}

BOOL CRadiantApp::OnIdle(LONG lCount)
{
    if (g_pParentWnd)
        g_pParentWnd->RoutineProcessing();
    return CWinApp::OnIdle(lCount);
}

void CRadiantApp::OnHelp()
{
    ShellExecute(m_pMainWnd->GetSafeHwnd(), "open", m_pszHelpFilePath,
                 NULL, NULL, SW_SHOW);
}
