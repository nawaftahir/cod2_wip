// win_qe3.cpp: Win32 helpers of the editor. Bodies from Q3Radiant WIN_QE3.CPP, byte-identical to retail.
#include "stdafx.h"
#include <time.h>
#include "../universal/assertive.h"

struct QEGlobals_t
{
    int d_showgrid;
    int d_gridsize;
    int d_num_entities;
    void *d_project_entity;
    float d_new_brush_bottom_z;
    float d_new_brush_top_z;
    HINSTANCE d_hInstance;
    HGLRC d_hglrcBase;
    HDC d_hdcBase;
    HWND d_hwndMain;
    HWND d_hwndCamera;
    HWND d_hwndEdit;
};
extern QEGlobals_t g_qeglobals;

extern int modified;
extern char currentmap[];
void ConvertDOSToUnixName(char *dst, const char *src);
void Sys_Printf(const char *text, ...);
void Error(const char *error, ...);

bool FUN_0046ba10(void);
void FUN_0046b9b0(void);

HCURSOR waitcursor;

void Sys_SetTitle(char *text)
{
    SetWindowText(g_qeglobals.d_hwndMain, text);
}

void Sys_MarkMapModified(void)
{
    char title[1024];

    if (modified != 1)
    {
        modified = true;
        sprintf(title, "%s *", currentmap);
        ConvertDOSToUnixName(title, title);
        Sys_SetTitle(title);
    }
}

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

void Sys_GetCursorPos(int *x, int *y)
{
    POINT lpPoint;

    GetCursorPos(&lpPoint);
    *x = lpPoint.x;
    *y = lpPoint.y;
}

void Sys_SetCursorPos(int x, int y)
{
    SetCursorPos(x, y);
}

void Sys_Beep(void)
{
    MessageBeep(MB_ICONASTERISK);
}

char translateBuffer[0x10000];

// 0x0047a4f0
char *TranslateString(const char *string)
{
#line 83
    assert(string);
    int out = 0;
    int i = 0;
    for (; string[i]; i++)
    {
        if (out == 0x10000)
        {
            Error("TranslateString buffer exceeded");
            return 0;
        }
        if (string[i] == '\n')
        {
            translateBuffer[out++] = '\r';
            translateBuffer[out++] = '\n';
        }
        else
            translateBuffer[out++] = string[i];
    }
    translateBuffer[out] = 0;
    return translateBuffer;
}

void Sys_ClearPrintf(void)
{
    char text[4];
    text[0] = 0;

    SendMessage(g_qeglobals.d_hwndEdit, WM_SETTEXT, 0, (LPARAM)text);
}

void Sys_Printf(const char *text, ...)
{
    va_list argptr;
    char replaceText[5];
    char buf[32768];
    char *out;
    LRESULT result;
    DWORD oldPosS, oldPosE;

    va_start(argptr, text);
    vsprintf(buf, text, argptr);
    va_end(argptr);

    out = TranslateString(buf);

    result = SendMessage(g_qeglobals.d_hwndEdit, EM_GETLINECOUNT, 0, 0);
    if (result > 600)
    {
        replaceText[0] = '\0';

        SendMessage(g_qeglobals.d_hwndEdit, WM_SETREDRAW, (WPARAM)0, (LPARAM)0);
        SendMessage(g_qeglobals.d_hwndEdit, EM_GETSEL, (WPARAM)&oldPosS, (LPARAM)&oldPosE);
        SendMessage(g_qeglobals.d_hwndEdit, EM_SETSEL, 0, 500);
        SendMessage(g_qeglobals.d_hwndEdit, EM_REPLACESEL, (WPARAM)0, (LPARAM)replaceText);
        SendMessage(g_qeglobals.d_hwndEdit, EM_SETSEL, oldPosS, oldPosE);
        SendMessage(g_qeglobals.d_hwndEdit, WM_SETREDRAW, (WPARAM)1, (LPARAM)0);
    }

    SendMessage(g_qeglobals.d_hwndEdit, EM_REPLACESEL, 0, (LPARAM)out);
}

double Sys_DoubleTime(void)
{
    return clock() / 1000.0;
}

void PrintPixels(HDC hDC)
{
    int i;
    PIXELFORMATDESCRIPTOR p[64];

    printf("### flags color layer\n");
    for (i = 1; i < 64; i++)
    {
        if (!DescribePixelFormat(hDC, i, sizeof(p[0]), &p[i]))
            break;
        printf("%3i %5x %5i %5i\n", i,
               p[i].dwFlags,
               p[i].cColorBits,
               p[i].bReserved);
    }
    printf("%i modes\n", i - 1);
}

void Warning(const char *error, ...)
{
    va_list argptr;
    char text[1024];
    int err;

    err = GetLastError();

    va_start(argptr, error);
    vsprintf(text, error, argptr);
    va_end(argptr);

    Sys_Printf(text);
}

bool FUN_0047a840(void)
{
    if (MessageBox(g_qeglobals.d_hwndMain, "This will lose changes to the map", "warning", MB_OKCANCEL) == IDCANCEL)
        return false;
    return true;
}

bool ConfirmModified(void)
{
    if (!modified)
        return true;

    if (MessageBox(g_qeglobals.d_hwndMain, "This will lose changes to the map", "warning", MB_OKCANCEL) == IDCANCEL)
        return false;
    return true;
}

bool FUN_0047a890(void)
{
    if (FUN_0046ba10())
    {
        if (MessageBox(g_qeglobals.d_hwndMain, "This will lose changes to the map", "warning", MB_OKCANCEL) == IDCANCEL)
            return false;
    }
    FUN_0046b9b0();
    return true;
}

void AddSlash(CString &strPath)
{
    if (strPath.GetLength() > 0)
    {
        if (strPath.GetAt(strPath.GetLength() - 1) != '\\')
        {
            strPath += '\\';
        }
    }
}

