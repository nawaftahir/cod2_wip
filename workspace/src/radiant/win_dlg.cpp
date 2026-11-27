#include "stdafx.h"
#include "../universal/assertive.h"
#include "../universal/com_math.h"
struct epair_t;
struct brushdef_t { brushdef_t *oprev; brushdef_t *onext; unsigned char pad08[0x18]; float mins[3]; float maxs[3]; };
struct entity_t { unsigned char pad00[8]; brushdef_t brushes; unsigned char pad40[0x64 - 0x40]; epair_t *epairs; };
struct entityInst_t;
struct brush_t { brush_t *prev; brush_t *next; entityInst_t *owner; brush_t *onext; brush_t *oprev; brushdef_t *def; };
struct entityInst_t { entityInst_t *prev; entityInst_t *next; entity_t *def; brush_t brushes; };
struct QEGlobals_t { int d_showgrid; int d_gridsize; int d_num_entities; entity_t *d_project_entity; float d_new_brush_bottom_z; float d_new_brush_top_z; HINSTANCE d_hInstance; HGLRC d_hglrcBase; HDC d_hdcBase; HWND d_hwndMain; };
class CXYWnd { public: unsigned char pad00[0x70]; float m_vOrigin[3]; protected: friend BOOL CALLBACK FUN_00476110(HWND, UINT, WPARAM, LPARAM); void PositionView(); };
struct CamWndView { unsigned char pad00[0x60]; float origin[3]; };
struct MainFrameView { unsigned char pad00[0x788]; CXYWnd *m_pXYWnd; CamWndView *m_pCamWnd; };
class CPrefsDlg { public: unsigned char pad00[0x2ec]; CString field_2ec; void SavePrefs(); };
extern QEGlobals_t g_qeglobals; extern HWND dword_010bcd70; extern CString dword_012345c0;
extern entityInst_t entityInsts; extern entityInst_t *world_entity; extern brush_t selected_brushes;
extern MainFrameView *dword_01233488; extern int g_nUpdateBits; extern CPrefsDlg *dword_01233b64;
char *ValueForKey(epair_t *&e, const char *key); void FUN_00465bf0(entity_t *e, const char *key, const char *value);
int FUN_0046d680(const char *file); void Sys_Printf(const char *text, ...);
void FUN_0046f0b0(brush_t *brush, bool bComplete, bool bStatus, bool bPositionView);
void FUN_00470c50(float *mid); void FUN_00470ce0(float *origin, float *matrix, int bSnap, int nAxis, float fDeg, bool bFlip);
void FUN_0045c6b0(); void Brush_MakeSidedCone(int sides); void Brush_MakeSidedSphere(int sides); void Brush_MakeSided(int sides);
BOOL CALLBACK FUN_00476aa0(HWND hwndDlg, UINT msg, WPARAM wParam, LPARAM lParam);
bool g_bDoCone = false; bool g_bDoSphere = false;
BOOL CALLBACK ProjectDlgProc(HWND hwndDlg, UINT uMsg, WPARAM wParam, LPARAM lParam)
{
    char value[1024];
    switch (uMsg)
    {
    case WM_INITDIALOG:
        SetDlgItemText(hwndDlg, 0x4f1, ValueForKey(g_qeglobals.d_project_entity->epairs, "basepath"));
        SetDlgItemText(hwndDlg, 0x4fa, ValueForKey(g_qeglobals.d_project_entity->epairs, "mapspath"));
        SetDlgItemText(hwndDlg, 0x4e5, ValueForKey(g_qeglobals.d_project_entity->epairs, "entitypath"));
        SetDlgItemText(hwndDlg, 0x4ec, ValueForKey(g_qeglobals.d_project_entity->epairs, "game"));
        SetDlgItemText(hwndDlg, 0x4f9, ValueForKey(g_qeglobals.d_project_entity->epairs, "basegame"));
        return TRUE;
    case WM_COMMAND:
        switch (LOWORD(wParam))
        {
        case IDOK:
            GetDlgItemText(hwndDlg, 0x4f1, value, 1024);
            FUN_00465bf0(g_qeglobals.d_project_entity, "basepath", value);
            GetDlgItemText(hwndDlg, 0x4fa, value, 1024);
            FUN_00465bf0(g_qeglobals.d_project_entity, "mapspath", value);
            GetDlgItemText(hwndDlg, 0x4e5, value, 1024);
            FUN_00465bf0(g_qeglobals.d_project_entity, "entitypath", value);
            GetDlgItemText(hwndDlg, 0x4ec, value, 1024);
            FUN_00465bf0(g_qeglobals.d_project_entity, "game", value);
            GetDlgItemText(hwndDlg, 0x4f9, value, 1024);
            FUN_00465bf0(g_qeglobals.d_project_entity, "basegame", value);
            EndDialog(hwndDlg, 1);
            FUN_0046d680(dword_012345c0);
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






static void SelectBrush(int entitynum, int brushnum)
{
    assert(entityInsts.next == world_entity);
    entityInst_t *selectedEntityInst = entityInsts.next;
    for (; selectedEntityInst != &entityInsts; selectedEntityInst = selectedEntityInst->next)
    {
        if (!entitynum)
            goto found_ent;
        entitynum--;
    }
    Sys_Printf("Couldn't select brush by number: no such entity.\n");
    {
        const char *status = "No such entity.";
        goto set_status;
    found_ent:
        brushdef_t *bdef = selectedEntityInst->def->brushes.onext;
        for (; bdef != &selectedEntityInst->def->brushes; bdef = bdef->onext)
        {
            if (!brushnum)
                goto found_brush;
            brushnum--;
        }
        Sys_Printf("Couldn't select brush by number: no such brush in entity.\n");
        SendMessage(dword_010bcd70, WM_USER + 1, 0, (LPARAM)"No such brush.");
        return;

    found_brush:
        brush_t *selectedBrushInst = selectedEntityInst->brushes.onext;
















        for (; ; selectedBrushInst = selectedBrushInst->onext)
        {
            assert(selectedBrushInst != &(selectedEntityInst->brushes));
            if (selectedBrushInst->def == bdef)
                break;
        }

        FUN_0046f0b0(selectedBrushInst, false, true, false);
        g_nUpdateBits = -1;
        if (dword_01233488->m_pXYWnd)
        {
            for (int i = 0; i < 3; i++)
                dword_01233488->m_pXYWnd->m_vOrigin[i] = (bdef->mins[i] + bdef->maxs[i]) * 0.5f;
        }
        status = "Selected.";
    set_status:
        SendMessage(dword_010bcd70, WM_USER + 1, 0, (LPARAM)status);
    }
}












static void GetSelectionIndex(int *ent, int *brush)
{
    *ent = 0; *brush = 0;
    brush_t *selectedBrushInst = selected_brushes.next;
    if (selectedBrushInst == &selected_brushes)
        return;


    assert(entityInsts.next == world_entity);


    entityInst_t *iterEntityInst = entityInsts.next;
    for (; ; iterEntityInst = iterEntityInst->next)
    {
        assert(iterEntityInst != &entityInsts);
        if (iterEntityInst == selectedBrushInst->owner)
            break;
        (*ent)++;
    }

    brushdef_t *iterBrushDef = selectedBrushInst->owner->def->brushes.onext;







    for (; ; iterBrushDef = iterBrushDef->onext)
    {
        assert(iterBrushDef != &(selectedBrushInst->owner->def->brushes));
        if (iterBrushDef == selectedBrushInst->def)
            break;
        (*brush)++;
    }
}

BOOL CALLBACK FindBrushDlgProc(HWND hwndDlg, UINT uMsg, WPARAM wParam, LPARAM lParam)
{
    char entstr[256];
    char brushstr[256];
    int ent, brush;

    switch (uMsg)
    {
    case WM_INITDIALOG:
        GetSelectionIndex(&ent, &brush);
        sprintf(entstr, "%i", ent);
        sprintf(brushstr, "%i", brush);
        SetWindowText(GetDlgItem(hwndDlg, 0x4cf), entstr);
        SetWindowText(GetDlgItem(hwndDlg, 0x4c9), brushstr);
        SetFocus(GetDlgItem(hwndDlg, 0x4cf));
        return FALSE;

    case WM_COMMAND:
        switch (LOWORD(wParam))
        {
        case IDOK:
            GetWindowText(GetDlgItem(hwndDlg, 0x4cf), entstr, 255);
            GetWindowText(GetDlgItem(hwndDlg, 0x4c9), brushstr, 255);
            SelectBrush(atoi(entstr), atoi(brushstr));
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

extern "C" void FUN_00417e00(unsigned v);

BOOL CALLBACK FUN_00476110(HWND hwndDlg, UINT uMsg, WPARAM wParam, LPARAM lParam)
{
    char sz[128];
    CString str;

    switch (uMsg)
    {
    case WM_INITDIALOG:
        SetFocus(GetDlgItem(hwndDlg, 0x589));
        return FALSE;

    case WM_COMMAND:
        switch (LOWORD(wParam))
        {
        case IDOK:
            GetWindowText(GetDlgItem(hwndDlg, 0x589), sz, 128);
            str = sz;
            if (str.GetLength() > 0)
            {
                float x, y, z;
                dword_01233488->m_pCamWnd->origin[0] = 0.0f;
                dword_01233488->m_pCamWnd->origin[1] = 0.0f;
                dword_01233488->m_pCamWnd->origin[2] = 0.0f;
                if (sscanf(str, "%f, %f, %f", &x, &y, &z) == 3)
                {
                    dword_01233488->m_pCamWnd->origin[0] = x;
                    dword_01233488->m_pCamWnd->origin[1] = y;
                    dword_01233488->m_pCamWnd->origin[2] = z;
                }
                if (sscanf(str, "(%f, %f, %f)", &x, &y, &z) == 3)
                {
                    dword_01233488->m_pCamWnd->origin[0] = x;
                    dword_01233488->m_pCamWnd->origin[1] = y;
                    dword_01233488->m_pCamWnd->origin[2] = z;
                }
                if (sscanf(str, "%f %f %f", &x, &y, &z) == 3)
                {
                    dword_01233488->m_pCamWnd->origin[0] = x;
                    dword_01233488->m_pCamWnd->origin[1] = y;
                    dword_01233488->m_pCamWnd->origin[2] = z;
                }
                if (sscanf(str, "(%f %f %f)", &x, &y, &z) == 3)
                {
                    dword_01233488->m_pCamWnd->origin[0] = x;
                    dword_01233488->m_pCamWnd->origin[1] = y;
                    dword_01233488->m_pCamWnd->origin[2] = z;
                }
                dword_01233488->m_pXYWnd->PositionView();
                FUN_00417e00(5);
            }
            EndDialog(hwndDlg, 1);
            return TRUE;

        case IDCANCEL:
            EndDialog(hwndDlg, 0);
            return TRUE;
        }
    }
    return FALSE;
}

/* CoD2-specific Go to position dialog (184), target callback 0x00476110. */
void FUN_004763c0(void)
{
    DialogBox(g_qeglobals.d_hInstance, (LPCSTR)184, g_qeglobals.d_hwndMain, FUN_00476110);
}

void SinCosDegrees(float deg, float *s, float *c);
void AxisClear(float axis[3][3]);

#define ROTATE_AXIS_INLINE(axisVal, degVal) \
    do { \
        vec3_t mid; float matrix[3][3]; float s, c; \
        FUN_00470c50(mid); float deg = -(degVal); SinCosDegrees(deg, &s, &c); AxisClear(matrix); \
        if ((axisVal) == 0) { matrix[1][1] = c; matrix[1][2] = -s; matrix[2][1] = s; matrix[2][2] = c; } \
        else if ((axisVal) == 1) { matrix[0][0] = c; matrix[0][2] = s; matrix[2][0] = -s; matrix[2][2] = c; } \
        else { matrix[0][0] = c; matrix[0][1] = -s; matrix[1][0] = s; matrix[1][1] = c; } \
        FUN_00470ce0(mid, matrix[0], 1, (axisVal), deg, false); \
        g_nUpdateBits = -1; \
    } while (0)

BOOL CALLBACK RotateDlgProc(HWND hwndDlg, UINT uMsg, WPARAM wParam, LPARAM lParam)
{
    char str[256];
    float v;

    switch (uMsg)
    {
    case WM_INITDIALOG:
        SetFocus(GetDlgItem(hwndDlg, 0x4cf));
        return FALSE;

    case WM_COMMAND:
        switch (LOWORD(wParam))
        {
        case IDOK:
            GetWindowText(GetDlgItem(hwndDlg, 0x4d4), str, 255);
            v = (float)atof(str);
            if (v)
                ROTATE_AXIS_INLINE(0, v);

            GetWindowText(GetDlgItem(hwndDlg, 0x478), str, 255);
            v = (float)atof(str);
            if (v)
                ROTATE_AXIS_INLINE(1, v);

            GetWindowText(GetDlgItem(hwndDlg, 0x473), str, 255);
            v = (float)atof(str);
            if (v)
                ROTATE_AXIS_INLINE(2, v);

            EndDialog(hwndDlg, 1);
            return TRUE;

        case IDCANCEL:
            EndDialog(hwndDlg, 0);
            return TRUE;
        }
    }
    return FALSE;
}

void DoRotate(void)
{
    DialogBox(g_qeglobals.d_hInstance, (LPCSTR)112, g_qeglobals.d_hwndMain, RotateDlgProc);
}

BOOL CALLBACK SidesDlgProc(HWND hwndDlg, UINT uMsg, WPARAM wParam, LPARAM lParam)
{
    char sz[256];

    switch (uMsg)
    {
    case WM_INITDIALOG:
        SetFocus(GetDlgItem(hwndDlg, 1233));
        return FALSE;
    case WM_COMMAND:
        switch (LOWORD(wParam))
        {
        case IDOK:
            GetWindowText(GetDlgItem(hwndDlg, 1233), sz, 255);
            if (g_bDoCone)
                Brush_MakeSidedCone(atoi(sz));
            else if (g_bDoSphere)
                Brush_MakeSidedSphere(atoi(sz));
            else
                Brush_MakeSided(atoi(sz));
            EndDialog(hwndDlg, 1);
            return FALSE;
        case IDCANCEL:
            EndDialog(hwndDlg, 0);
            return FALSE;
        }
    }
    return FALSE;
}

void DoSides(bool bCone, bool bSphere, bool bTorus)
{
    g_bDoCone = bCone;
    g_bDoSphere = bSphere;
    DialogBox(g_qeglobals.d_hInstance, (LPCSTR)113, g_qeglobals.d_hwndMain, SidesDlgProc);
}

BOOL CALLBACK FUN_00476840(HWND hwndDlg, UINT uMsg, WPARAM wParam, LPARAM lParam)
{
    char sz[256];
    CString str;
    const char *k;

    switch (uMsg)
    {
    case WM_INITDIALOG:
    {
        HWND h = GetDlgItem(hwndDlg, 0x5a1);
        SetDlgItemText(hwndDlg, 0x5a1, dword_01233b64->field_2ec);
        SetFocus(h);
        return FALSE;
    }

    case WM_COMMAND:
        switch (LOWORD(wParam))
        {
        case IDOK:
            GetWindowText(GetDlgItem(hwndDlg, 0x5a1), sz, 255);
            str = sz;
            if (str.GetLength() > 0)
            {
                dword_01233b64->field_2ec = sz;
                dword_01233b64->SavePrefs();
                FUN_0045c6b0();
                g_nUpdateBits = -1;
            }
            EndDialog(hwndDlg, 1);
            return FALSE;

        case IDCANCEL:
            EndDialog(hwndDlg, 0);
            return FALSE;

        case 0x5a2:
            k = "script_health"; goto apply_k;
        case 0x5a7:
            k = "script_killspawner"; goto apply_k;
        case 0x5a9:
            k = "script_mg42"; goto apply_k;
        case 0x5ab:
            k = "script_moveoverride"; goto apply_k;
        case 0x5ac:
            k = "script_emptyspawner"; goto apply_k;
        case 0x5ad:
            k = "script_sharetarget"; goto apply_k;
        case 0x5ae:
            k = "script_flanker"; goto apply_k;
        case 0x5b0:
            k = "script_escape";
        apply_k:
            dword_01233b64->field_2ec = k;
            dword_01233b64->SavePrefs();
            FUN_0045c6b0();
            g_nUpdateBits = -1;
            EndDialog(hwndDlg, 1);
            return FALSE;
        }
    }
    return FALSE;
}

void FUN_00476a80(void)
{
    DialogBox(g_qeglobals.d_hInstance, (LPCSTR)217, g_qeglobals.d_hwndMain, FUN_00476840);
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

// CoD2 dialog (225), target callback 0x00476d70.
void FUN_00476db0(void)
{
    DialogBox(g_qeglobals.d_hInstance, (LPCSTR)225, g_qeglobals.d_hwndMain, FUN_00476d70);
}
