/*
 * About dialog callback reconstructed from the GPL-2.0-or-later
 * Quake III Radiant WIN_DLG.CPP reference and CoD2 retail control flow.
 * Research candidate only until the linked executable referee confirms it.
 */
#include "stdafx.h"

/* Original Q3Radiant QEGlobals_t prefix through the dialog-host HWND.
   The full CoD2 layout and storage identity remain under review. */
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
};

extern QEGlobals_t g_qeglobals;


BOOL CALLBACK AboutDlgProc(HWND hwndDlg, UINT uMsg, WPARAM wParam, LPARAM lParam)
{
    switch (uMsg)
    {
    case WM_INITDIALOG:
        return TRUE;

    case WM_CLOSE:
        EndDialog(hwndDlg, 1);
        return TRUE;

    case WM_COMMAND:
        if (LOWORD(wParam) == IDOK)
            EndDialog(hwndDlg, 1);
        return TRUE;
    }
    return FALSE;
}

// Unnamed dialog callback at retail 0x00476d70; exact ownership pending.
BOOL CALLBACK FUN_00476d70(HWND hwndDlg, UINT uMsg, WPARAM wParam, LPARAM lParam)
{
    switch (uMsg)
    {
    case WM_INITDIALOG:
        return FALSE;

    case WM_COMMAND:
        switch (LOWORD(wParam))
        {
        case IDOK:
            EndDialog(hwndDlg, 1);
            break;

        case IDCANCEL:
            EndDialog(hwndDlg, 0);
            return FALSE;
        }
        break;
    }
    return FALSE;
}

void DoAbout(void)
{
    DialogBox(g_qeglobals.d_hInstance, (LPCSTR)114, g_qeglobals.d_hwndMain, AboutDlgProc);
}
