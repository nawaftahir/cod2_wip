/*
 * About dialog callback reconstructed from the GPL-2.0-or-later
 * Quake III Radiant WIN_DLG.CPP reference and CoD2 retail control flow.
 * Research candidate only until the linked executable referee confirms it.
 */
#include "stdafx.h"
#include <stdio.h>
#include <stdlib.h>

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



/* Win32 callbacks are defined in the original WIN_DLG.CPP.
   Their bodies remain unimplemented pending separate retail proofs. */
BOOL CALLBACK ProjectDlgProc(HWND hwndDlg, UINT msg, WPARAM wParam, LPARAM lParam);
BOOL CALLBACK RotateDlgProc(HWND hwndDlg, UINT msg, WPARAM wParam, LPARAM lParam);
BOOL CALLBACK SidesDlgProc(HWND hwndDlg, UINT msg, WPARAM wParam, LPARAM lParam);
BOOL CALLBACK FindBrushDlgProc(HWND hwndDlg, UINT msg, WPARAM wParam, LPARAM lParam);
BOOL CALLBACK FUN_00476110(HWND hwndDlg, UINT msg, WPARAM wParam, LPARAM lParam);
BOOL CALLBACK FUN_00476aa0(HWND hwndDlg, UINT msg, WPARAM wParam, LPARAM lParam);

bool g_bDoCone = false;
bool g_bDoSphere = false;

/* Research source from the Q3Radiant project-settings event flow.
 * CoD2's retail dialog 153 contains basepath, mapspath, entitypath,
 * fs_game, fs_basegame controls. Globals/callee identities need CI proof.
 */
extern char *ValueForKey(void *entity, const char *key);
extern void SetKeyValue(void *entity, const char *key, const char *value);
extern void QE_SaveProject(const char *name);
extern char g_strProject[];

BOOL CALLBACK ProjectDlgProc(HWND hwndDlg, UINT uMsg, WPARAM wParam, LPARAM lParam)
{
    char value[1024];
    switch (uMsg)
    {
    case WM_INITDIALOG:
        SetDlgItemText(hwndDlg, 1265, ValueForKey(g_qeglobals.d_project_entity, "basepath"));
        SetDlgItemText(hwndDlg, 1274, ValueForKey(g_qeglobals.d_project_entity, "mapspath"));
        SetDlgItemText(hwndDlg, 1253, ValueForKey(g_qeglobals.d_project_entity, "entitypath"));
        SetDlgItemText(hwndDlg, 1260, ValueForKey(g_qeglobals.d_project_entity, "fs_game"));
        SetDlgItemText(hwndDlg, 1273, ValueForKey(g_qeglobals.d_project_entity, "fs_basegame"));
        return TRUE;

    case WM_COMMAND:
        switch (LOWORD(wParam))
        {
        case IDOK:
            GetDlgItemText(hwndDlg, 1265, value, 1024);
            SetKeyValue(g_qeglobals.d_project_entity, "basepath", value);
            GetDlgItemText(hwndDlg, 1274, value, 1024);
            SetKeyValue(g_qeglobals.d_project_entity, "mapspath", value);
            GetDlgItemText(hwndDlg, 1253, value, 1024);
            SetKeyValue(g_qeglobals.d_project_entity, "entitypath", value);
            GetDlgItemText(hwndDlg, 1260, value, 1024);
            SetKeyValue(g_qeglobals.d_project_entity, "fs_game", value);
            GetDlgItemText(hwndDlg, 1273, value, 1024);
            SetKeyValue(g_qeglobals.d_project_entity, "fs_basegame", value);
            EndDialog(hwndDlg, 1);
            QE_SaveProject(g_strProject);
            return TRUE;

        case IDCANCEL:
            EndDialog(hwndDlg, 0);
            return TRUE;
        }
    }
    return FALSE;
}

void DoProjectSettings(void)
{
    DialogBox(g_qeglobals.d_hInstance, (LPCSTR)153, g_qeglobals.d_hwndMain, ProjectDlgProc);
}

/* CoD2-specific Go to position dialog (184), target callback 0x00476110. */
void FUN_004763c0(void)
{
    DialogBox(g_qeglobals.d_hInstance, (LPCSTR)184, g_qeglobals.d_hwndMain, FUN_00476110);
}

void DoRotate(void)
{
    DialogBox(g_qeglobals.d_hInstance, (LPCSTR)112, g_qeglobals.d_hwndMain, RotateDlgProc);
}


void Brush_MakeSidedCone(int sides);
void Brush_MakeSidedSphere(int sides);
void Brush_MakeSided(int sides);

/* Q3Radiant side-count callback, CoD2 retail control ID 1233. */
BOOL CALLBACK SidesDlgProc(HWND hwndDlg, UINT uMsg, WPARAM wParam, LPARAM lParam)
{
    char str[256];
    HWND h;

    switch (uMsg)
    {
    case WM_INITDIALOG:
        h = GetDlgItem(hwndDlg, 1233);
        SetFocus(h);
        return FALSE;

    case WM_COMMAND:
        switch (LOWORD(wParam))
        {
        case IDOK:
            GetWindowText(GetDlgItem(hwndDlg, 1233), str, 255);
            if (g_bDoCone)
                Brush_MakeSidedCone(atoi(str));
            else if (g_bDoSphere)
                Brush_MakeSidedSphere(atoi(str));
            else
                Brush_MakeSided(atoi(str));
            EndDialog(hwndDlg, 1);
            break;

        case IDCANCEL:
            EndDialog(hwndDlg, 0);
            break;
        }
    default:
        return FALSE;
    }
}

void DoSides(bool bCone, bool bSphere, bool bTorus)
{
    g_bDoCone = bCone;
    g_bDoSphere = bSphere;
    DialogBox(g_qeglobals.d_hInstance, (LPCSTR)113, g_qeglobals.d_hwndMain, SidesDlgProc);
}


void GetSelectionIndex(int *ent, int *brush);
void SelectBrush(int entitynum, int brushnum);

/* Q3Radiant's Find brush callback, CoD2 retail IDs 1231 / 1225. */
BOOL CALLBACK FindBrushDlgProc(HWND hwndDlg, UINT uMsg, WPARAM wParam, LPARAM lParam)
{
    char entstr[256];
    char brushstr[256];
    HWND h;
    int ent, brush;

    switch (uMsg)
    {
    case WM_INITDIALOG:
        GetSelectionIndex(&ent, &brush);
        sprintf(entstr, "%i", ent);
        sprintf(brushstr, "%i", brush);
        SetWindowText(GetDlgItem(hwndDlg, 1231), entstr);
        SetWindowText(GetDlgItem(hwndDlg, 1225), brushstr);
        h = GetDlgItem(hwndDlg, 1231);
        SetFocus(h);
        return FALSE;

    case WM_COMMAND:
        switch (LOWORD(wParam))
        {
        case IDOK:
            GetWindowText(GetDlgItem(hwndDlg, 1231), entstr, 255);
            GetWindowText(GetDlgItem(hwndDlg, 1225), brushstr, 255);
            SelectBrush(atol(entstr), atol(brushstr));
            EndDialog(hwndDlg, 1);
            return TRUE;
        case IDCANCEL:
            EndDialog(hwndDlg, 0);
            return TRUE;
        }
    }
    return FALSE;
}

void DoFind(void)
{
    DialogBox(g_qeglobals.d_hInstance, (LPCSTR)110, g_qeglobals.d_hwndMain, FindBrushDlgProc);
}


/* CoD2 Maya export dialog (224), target callback 0x00476aa0. */
void FUN_00476ce0(void)
{
    DialogBox(g_qeglobals.d_hInstance, (LPCSTR)224, g_qeglobals.d_hwndMain, FUN_00476aa0);
}

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

/* Additional retail modal launcher; resource identity under investigation. */
void FUN_00476db0(void)
{
    DialogBox(g_qeglobals.d_hInstance, (LPCSTR)225, g_qeglobals.d_hwndMain, FUN_00476d70);
}
