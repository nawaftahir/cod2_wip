/*
 * About dialog callback reconstructed from the GPL-2.0-or-later
 * Quake III Radiant WIN_DLG.CPP reference and CoD2 retail control flow.
 * Research candidate only until the linked executable referee confirms it.
 */
#include "stdafx.h"

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
