// win_qe3.cpp: Win32 helpers of the editor. Bodies from Q3Radiant WIN_QE3.CPP, byte-identical to retail.
#include <windows.h>
#include <time.h>

// only the field this file uses; the rest of the globals struct lives elsewhere
struct qeglobals_t
{
    HWND d_hwndEdit;
};
extern qeglobals_t g_qeglobals;

HCURSOR waitcursor;

void Sys_BeginWait(void)
{
    waitcursor = SetCursor(LoadCursor(NULL, IDC_WAIT));
}

void Sys_EndWait(void)
{
    if (waitcursor)
    {
        SetCursor(waitcursor);
        waitcursor = NULL;
    }
}

void Sys_ClearPrintf(void)
{
    char text[4];
    text[0] = 0;

    SendMessage(g_qeglobals.d_hwndEdit, WM_SETTEXT, 0, (LPARAM)text);
}

double Sys_DoubleTime(void)
{
    return clock() / 1000.0;
}
