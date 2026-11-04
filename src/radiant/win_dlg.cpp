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
