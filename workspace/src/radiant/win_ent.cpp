#include "entityw.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "../universal/assertive.h"
#include "TexWnd.h"

HWND hwndEnt[EntLast];

// slots of hwndEnt used here (retail 0x11299b0 + 4 * slot)
#define EntList 0
#define EntComment 1
#define EntCheck1 2
#define EntProps 14
#define EntDir0 15
#define EntDir45 16
#define EntDir90 17
#define EntDir135 18
#define EntDir180 19
#define EntDir225 20
#define EntDir270 21
#define EntDir315 22
#define EntDirUp 23
#define EntDirDown 24
#define EntDelProp 25
#define EntKeyLabel 26
#define EntValueLabel 28
#define EntAssignModels 31
#define EntTab 32

struct epair_t
{
    epair_t *next;
    char *key;
    char *value;
};

struct eclass_t
{
    eclass_t *next;
    char *name;
    unsigned char pad08[0x48];
    char *comments;
    char flagnames[8][0x20];
};

struct entityBrush_t
{
    unsigned char pad00[0x40];
    unsigned char modelFailed;
};

struct entity_t
{
    unsigned char pad00[0x0c];
    entityBrush_t *onext;
    unsigned char pad10[0x40];
    eclass_t *eclass;
    void *md3Class;
    float origin[3];
    epair_t *epairs;
    unsigned short field68;
};

struct entityInst_t
{
    unsigned char pad00[8];
    entity_t *def;
};

struct brush_t
{
    brush_t *prev;
    brush_t *next;
    entityInst_t *owner;
};

extern brush_t selected_brushes;
extern entityInst_t *world_entity;
extern entity_t *edit_entity;
extern int multiple_entities;
extern entity_t *DAT_010bcd34;
void ConvertDOSToUnixName(char *dst, const char *src);
extern int g_nUpdateBits;
char *ValueForKey(epair_t *&e, const char *key);
char *TranslateString(const char *string);
void DeleteKey(epair_t *&e, const char *key);
void FUN_00465bf0(entity_t *e, const char *key, const char *value);
void FUN_004655f0(entity_t *e, const char *key);
void FUN_004657a0(entity_t *e, const char *key);
void FUN_004433b0();
void Undo_GeneralStart(char *operation);
void Undo_AddEntity(entity_t *ent);
void Undo_End();
void FUN_004777c0();
void FUN_00477e80();
extern HWND dword_010bcd58;
extern HWND dword_010bcd60;
extern WNDPROC dword_01129990;
extern WNDPROC dword_01129994;
extern eclass_t *dword_012334dc;
extern int inspector_mode;
extern int col;
extern HWND dword_010bcd54;
extern char *dword_01233488;
extern HWND dword_012485e4;
LRESULT CALLBACK FUN_00478b40(HWND hwnd, UINT uMsg, WPARAM wParam, LPARAM lParam);
void FUN_0047a760(const char *fmt, ...);
void FUN_00478220(int w, int h);
extern HINSTANCE dword_010bcd50;
extern HWND dword_010bcd5c;
extern HWND dword_010bcd64;
extern HWND dword_010bcd74;
extern CTabCtrl g_wndTabs;
extern int dword_01129998;
extern int dword_0112999c;
extern int rgIds[EntLast];
void FUN_004781f0(HWND e, int x, int y, int w, int h, HWND hwndPlacement, int swp);
bool FUN_004131d0(const char *pszName, HWND hwnd);
eclass_t *FUN_00464770(const char *name, int a);
entity_t *FUN_00466d80(eclass_t *ec);
void FUN_0046fbe0(bool a);
void FUN_0046f0b0(brush_t *brush, bool bComplete, bool bStatus, bool bPositionView);

int rgIds[EntLast] = {
    0x47f, 0x481, 0x414, 0x416, 0x418, 0x41a, 0x41c, 0x41f, 0x421, 0x423, 0x425,
    0x428, 0x42a, 0x42c, 0x484, 0x492, 0x490, 0x48e, 0x486, 0x488, 0x48a, 0x48c,
    0x494, 0x496, 0x498, 0x49e, 0x4c8, 0x4cd, 0x4cb, 0x47c, 0x4d7, 0x50e, 0};

// Q3Radiant Win_ent.cpp FieldWndProc shape
LRESULT CALLBACK FUN_00476dd0(HWND hwnd, UINT uMsg, WPARAM wParam, LPARAM lParam)
{
    switch (uMsg)
    {
    case WM_CHAR:
        if (LOWORD(wParam) == VK_TAB)
            return FALSE;
        if (LOWORD(wParam) == VK_RETURN)
            return FALSE;
        if (LOWORD(wParam) == VK_ESCAPE)
        {
            SetFocus(dword_010bcd58);
            return FALSE;
        }
        break;
    case WM_KEYDOWN:
        if (LOWORD(wParam) == VK_TAB)
        {
            if (hwnd == hwndEnt[EntKeyField])
            {
                SendMessage(hwndEnt[EntValueField], WM_SETTEXT, 0, (LPARAM)"");
                SetFocus(hwndEnt[EntValueField]);
            }
            else
                SetFocus(hwndEnt[EntKeyField]);
        }
        if (LOWORD(wParam) == VK_RETURN)
        {
            if (hwnd == hwndEnt[EntKeyField])
            {
                SendMessage(hwndEnt[EntValueField], WM_SETTEXT, 0, (LPARAM)"");
                SetFocus(hwndEnt[EntValueField]);
            }
            else
            {
                FUN_00477e80();
                SetFocus(dword_010bcd58);
            }
        }
        break;
    case WM_LBUTTONDOWN:
        SetFocus(hwnd);
        break;
    }
    return CallWindowProc(dword_01129994, hwnd, uMsg, wParam, lParam);
}

// Q3Radiant Win_ent.cpp EntityListWndProc shape
LRESULT CALLBACK FUN_00476ec0(HWND hwnd, UINT uMsg, WPARAM wParam, LPARAM lParam)
{
    switch (uMsg)
    {
    case WM_KEYDOWN:
        if (LOWORD(wParam) == VK_RETURN)
        {
            SendMessage(dword_010bcd60, WM_COMMAND, (LBN_DBLCLK << 16) + 0x47f, 0);
            return 0;
        }
        break;
    }
    return CallWindowProc(dword_01129990, hwnd, uMsg, wParam, lParam);
}

// Q3Radiant Win_ent.cpp GetEntityControls shape
void FUN_00476f10(HWND ghwnd)
{
    int i;

    for (i = 0; i < EntLast; i++)
    {
        if (i == EntList || i == EntProps || i == EntComment)
            continue;
        if (i == EntKeyField || i == EntValueField)
            continue;
        hwndEnt[i] = GetDlgItem(ghwnd, rgIds[i]);
        if (hwndEnt[i])
        {
            SetParent(hwndEnt[i], dword_010bcd60);
            SendMessage(hwndEnt[i], WM_SETFONT, (WPARAM)GetStockObject(DEFAULT_GUI_FONT), (LPARAM)TRUE);
        }
    }
    hwndEnt[EntList] = CreateWindow("listbox", NULL, 0x50a00503, 5, 5, 180, 99, dword_010bcd60, (HMENU)0x47f, dword_010bcd50, NULL);
    if (!hwndEnt[EntList])
        FUN_0047a760("CreateWindow failed");
    hwndEnt[EntProps] = CreateWindow("listbox", NULL, 0x50a00183, 5, 100, 180, 99, dword_010bcd60, (HMENU)0x484, dword_010bcd50, NULL);
    if (!hwndEnt[EntProps])
        FUN_0047a760("CreateWindow failed");
    hwndEnt[EntComment] = CreateWindow("edit", NULL, 0x50a00804, 5, 100, 180, 99, dword_010bcd60, (HMENU)0x481, dword_010bcd50, NULL);
    if (!hwndEnt[EntComment])
        FUN_0047a760("CreateWindow failed");
    hwndEnt[EntKeyField] = CreateWindow("edit", NULL, 0x50800080, 5, 100, 180, 99, dword_010bcd60, (HMENU)0x4cd, dword_010bcd50, NULL);
    if (!hwndEnt[EntKeyField])
        FUN_0047a760("CreateWindow failed");
    hwndEnt[EntValueField] = CreateWindow("edit", NULL, 0x50800080, 5, 100, 180, 99, dword_010bcd60, (HMENU)0x47c, dword_010bcd50, NULL);
    if (!hwndEnt[EntValueField])
        FUN_0047a760("CreateWindow failed");
    g_wndTabs.SubclassDlgItem(0x520, CWnd::FromHandle(ghwnd));
    hwndEnt[EntTab] = g_wndTabs.GetSafeHwnd();
    ::SetParent(g_wndTabs.GetSafeHwnd(), dword_010bcd60);
    g_wndTabs.InsertItem(4, "&Filters");
    if (*(int *)(dword_01233488 + 0x7a0) > 0 && *(int *)(dword_01233488 + 0x7a0) < 3)
    {
        dword_010bcd5c = CreateWindow("edit", NULL, 0x50a00804, 5, 100, 180, 99, dword_010bcd60, (HMENU)0x4a2, dword_010bcd50, NULL);
        if (!dword_010bcd5c)
            FUN_0047a760("CreateWindow failed");
        g_wndTabs.InsertItem(2, "C&onsole");
        g_wndTabs.InsertItem(1, "&Textures");
    }
    g_wndTabs.InsertItem(0, "E&ntities");
    g_wndTabs.ShowWindow(SW_SHOW);
    SendMessage(hwndEnt[EntList], WM_SETFONT, (WPARAM)GetStockObject(DEFAULT_GUI_FONT), (LPARAM)TRUE);
    SendMessage(hwndEnt[EntProps], WM_SETFONT, (WPARAM)GetStockObject(DEFAULT_GUI_FONT), (LPARAM)TRUE);
    SendMessage(hwndEnt[EntComment], WM_SETFONT, (WPARAM)GetStockObject(DEFAULT_GUI_FONT), (LPARAM)TRUE);
    SendMessage(hwndEnt[EntKeyField], WM_SETFONT, (WPARAM)GetStockObject(DEFAULT_GUI_FONT), (LPARAM)TRUE);
    SendMessage(hwndEnt[EntValueField], WM_SETFONT, (WPARAM)GetStockObject(DEFAULT_GUI_FONT), (LPARAM)TRUE);
    SendMessage(hwndEnt[EntTab], WM_SETFONT, (WPARAM)GetStockObject(DEFAULT_GUI_FONT), (LPARAM)TRUE);
    if (*(int *)(dword_01233488 + 0x7a0) > 0 && *(int *)(dword_01233488 + 0x7a0) < 3)
        SendMessage(dword_010bcd5c, WM_SETFONT, (WPARAM)GetStockObject(DEFAULT_GUI_FONT), (LPARAM)TRUE);
}

// Q3Radiant Win_ent.cpp FillClassList shape
void FUN_00477270()
{
    SendMessage(hwndEnt[EntList], LB_RESETCONTENT, 0, 0);
    for (eclass_t *pec = dword_012334dc; pec; pec = pec->next)
    {
        int iIndex = SendMessage(hwndEnt[EntList], LB_ADDSTRING, 0, (LPARAM)pec->name);
        SendMessage(hwndEnt[EntList], LB_SETITEMDATA, iIndex, (LPARAM)pec);
    }
}

// Q3Radiant Win_ent.cpp WEnt_Create shape
void FUN_004772c0(HINSTANCE hInstance)
{
    WNDCLASS wc;
    memset(&wc, 0, sizeof(wc));
    wc.style = CS_NOCLOSE;
    wc.lpfnWndProc = FUN_00478b40;
    wc.cbClsExtra = 0;
    wc.cbWndExtra = 0;
    wc.hInstance = hInstance;
    wc.hIcon = 0;
    wc.hCursor = LoadCursor(NULL, IDC_ARROW);
    wc.hbrBackground = (HBRUSH)GetStockObject(LTGRAY_BRUSH);
    wc.lpszMenuName = 0;
    wc.lpszClassName = "QENT";
    RegisterClass(&wc);
    DWORD style = *(int *)(dword_01233488 + 0x7a0) == 1 ? 0x6cf0000 : 0x6ce0000;
    dword_010bcd60 = CreateWindow("QENT", "Entity", style, 20, 20, 100, 480, dword_010bcd54, NULL, hInstance, NULL);
    if (!dword_010bcd60)
        FUN_0047a760("Couldn't create Entity window");
}

// Q3Radiant Win_ent.cpp CreateEntityWindow shape
BOOL FUN_00477390(HINSTANCE hInstance)
{
    inspector_mode = 0x80;
    FUN_004772c0(hInstance);
    HWND hwndEntityPalette = CreateDialog(hInstance, MAKEINTRESOURCE(106), dword_010bcd54, NULL);
    if (!hwndEntityPalette)
        FUN_0047a760("CreateDialog failed");
    FUN_00476f10(hwndEntityPalette);
    DestroyWindow(hwndEntityPalette);
    dword_01129994 = (WNDPROC)GetWindowLong(hwndEnt[EntKeyField], GWL_WNDPROC);
    SetWindowLong(hwndEnt[EntKeyField], GWL_WNDPROC, (LONG)FUN_00476dd0);
    SetWindowLong(hwndEnt[EntValueField], GWL_WNDPROC, (LONG)FUN_00476dd0);
    dword_01129990 = (WNDPROC)GetWindowLong(hwndEnt[EntList], GWL_WNDPROC);
    SetWindowLong(hwndEnt[EntList], GWL_WNDPROC, (LONG)FUN_00476ec0);
    FUN_00477270();
    FUN_004131d0("EntityWindowPlace", dword_010bcd60);
    ShowWindow(dword_010bcd60, SW_HIDE);
    HMENU hMenu = GetMenu(dword_010bcd54);
    int mode = *(int *)(dword_01233488 + 0x7a0);
    if (mode != 0 && mode != 3)
    {
        inspector_mode = 0x40;
        SetWindowText(dword_010bcd60, "Console");
        EnableMenuItem(hMenu, 0x810c, MF_DISABLED | MF_GRAYED);
        SendMessage(dword_012485e4, 0x130c, 3, 0);
        RECT rc;
        GetWindowRect(dword_010bcd60, &rc);
        FUN_00478220(rc.right - rc.left - 8, rc.bottom - rc.top - 20);
        SetWindowPos(dword_010bcd60, *(int *)(dword_01233488 + 0x7a0) == 1 ? HWND_TOP : HWND_TOPMOST, rc.left, rc.top, rc.right - rc.left, rc.bottom - rc.top, SWP_NOMOVE | SWP_NOSIZE);
        RedrawWindow(dword_010bcd60, NULL, NULL, RDW_INVALIDATE | RDW_ERASE | RDW_ALLCHILDREN | RDW_UPDATENOW | RDW_ERASENOW);
    }
    return TRUE;
}

// Q3Radiant Win_ent.cpp SetInspectorMode shape
void FUN_00477580(int iType)
{
    RECT rc;
    HMENU hMenu = GetMenu(dword_010bcd54);

    if ((*(int *)(dword_01233488 + 0x7a0) == 0 || *(int *)(dword_01233488 + 0x7a0) == 3) && (iType == 0x10 || iType == 0x40))
        return;
    if (iType == -1)
    {
        if (inspector_mode == 0x80)
            iType = 0x10;
        else if (inspector_mode == 0x10)
            iType = 0x40;
        else if (inspector_mode == 0x40)
            iType = 0x800;
        else
        {
            iType = 0x2000;
            if (inspector_mode != 0x800)
                iType = 0x80;
        }
    }
    inspector_mode = iType;
    switch (iType)
    {
    case 0x40:
        SetWindowText(dword_010bcd60, "Console");
        EnableMenuItem(hMenu, 0x810c, MF_DISABLED | MF_GRAYED);
        SendMessage(g_wndTabs.m_hWnd, 0x130c, 3, 0);
        break;
    case 0x10:
        SetWindowText(dword_010bcd60, "Textures");
        (*(CTexWnd **)(dword_01233488 + 0x790))->FocusEdit();
        EnableMenuItem(hMenu, 0x810c, MF_DISABLED | MF_GRAYED);
        SendMessage(g_wndTabs.m_hWnd, 0x130c, 2, 0);
        break;
    case 0x80:
        SetWindowText(dword_010bcd60, "Entity");
        EnableMenuItem(hMenu, 0x810c, MF_BYCOMMAND);
        SendMessage(g_wndTabs.m_hWnd, 0x130c, 0, 0);
        break;
    case 0x2000:
        SetWindowText(dword_010bcd60, "Filters");
        EnableMenuItem(hMenu, 0x810c, MF_DISABLED | MF_GRAYED);
        if (*(int *)(dword_01233488 + 0x7a0) > 0 && *(int *)(dword_01233488 + 0x7a0) < 3)
            SendMessage(g_wndTabs.m_hWnd, 0x130c, 1, 0);
        else
            SendMessage(g_wndTabs.m_hWnd, 0x130c, 1, 0);
        break;
    }
    GetWindowRect(dword_010bcd60, &rc);
    FUN_00478220(rc.right - rc.left - 8, rc.bottom - rc.top - 20);
    SetWindowPos(dword_010bcd60, *(int *)(dword_01233488 + 0x7a0) == 1 ? HWND_TOP : HWND_TOPMOST, rc.left, rc.top, rc.right - rc.left, rc.bottom - rc.top, SWP_NOMOVE | SWP_NOSIZE);
    RedrawWindow(dword_010bcd60, NULL, NULL, RDW_INVALIDATE | RDW_ERASE | RDW_ALLCHILDREN | RDW_UPDATENOW | RDW_ERASENOW);
}

// Q3Radiant Win_ent.cpp SetKeyValuePairs shape
void FUN_004777c0()
{
    if (!edit_entity)
        return;
    RECT rc;
    char sz[4096];
    GetWindowRect(hwndEnt[EntProps], &rc);
    SendMessage(hwndEnt[EntProps], LB_SETCOLUMNWIDTH, (rc.right - rc.left) / 2, 0);
    SendMessage(hwndEnt[EntProps], LB_RESETCONTENT, 0, 0);
    for (epair_t *ep = edit_entity->epairs; ep; ep = ep->next)
    {
        if (!strcmp(ep->key, "origin"))
            continue;
        if (strlen(ep->key) > 8)
            sprintf(sz, "%s\t%s", ep->key, ep->value);
        else
            sprintf(sz, "%s\t\t%s", ep->key, ep->value);
        SendMessage(hwndEnt[EntProps], LB_ADDSTRING, 0, (LPARAM)sz);
    }
    if (edit_entity->origin[0] != 0 || edit_entity->origin[1] != 0 || edit_entity->origin[2] != 0)
    {
        sprintf(sz, "origin\t\t%g %g %g", edit_entity->origin[0], edit_entity->origin[1], edit_entity->origin[2]);
        SendMessage(hwndEnt[EntProps], LB_ADDSTRING, 0, (LPARAM)sz);
    }
    g_nUpdateBits |= 3;
}

// Q3Radiant Win_ent.cpp SetSpawnFlags shape
void FUN_00477960()
{
    int flags = atol(ValueForKey(edit_entity->epairs, "spawnflags"));
    for (int i = 0; i < 12; i++)
        SendMessage(hwndEnt[EntCheck1 + i], BM_SETCHECK, (flags & (1 << i)) != 0, 0);
}

// 0x004779c0 (467 B)
void FUN_004779c0()
{
    char sz[32];
    int f = 0;

    for (int i = 0; i < 12; i++)
    {
        int v = SendMessage(hwndEnt[EntCheck1 + i], BM_GETCHECK, 0, 0);
        f |= v << i;
    }
    sprintf(sz, "%i", f);
    FUN_004433b0();
    Undo_GeneralStart("set spawnflags");
    if (multiple_entities)
    {
        for (brush_t *b = selected_brushes.next; b != &selected_brushes; b = b->next)
        {
            Undo_AddEntity(b->owner->def);
            FUN_00465bf0(b->owner->def, "spawnflags", sz);
        }
    }
    else
    {
        Undo_AddEntity(edit_entity);
        FUN_00465bf0(edit_entity, "spawnflags", sz);
    }
    FUN_004777c0();
    Undo_End();
}

// Q3Radiant Win_ent.cpp UpdateSel shape
int FUN_00477ba0(int iItem, eclass_t *pec)
{
#line 805
    assert(selected_brushes.prev);
    if (selected_brushes.prev == &selected_brushes)
    {
        edit_entity = world_entity->def;
        multiple_entities = 0;
    }
    else
    {
        edit_entity = selected_brushes.prev->owner->def;
        multiple_entities = selected_brushes.prev->prev != &selected_brushes;
    }
    if (iItem == -1)
    {
        pec = edit_entity->eclass;
        iItem = SendMessage(hwndEnt[EntList], LB_FINDSTRINGEXACT, -1, (LPARAM)pec->name);
    }
    if (iItem != -1)
        SendMessage(hwndEnt[EntList], LB_SETCURSEL, iItem, 0);
    if (!pec)
        return 1;
    SendMessage(hwndEnt[EntComment], WM_SETTEXT, 0, (LPARAM)TranslateString(pec->comments));
    for (int i = 0; i < 8; i++)
    {
        HWND hwnd = hwndEnt[EntCheck1 + i];
        if (pec->flagnames[i] && pec->flagnames[i][0])
        {
            EnableWindow(hwnd, TRUE);
            SendMessage(hwnd, WM_SETTEXT, 0, (LPARAM)pec->flagnames[i]);
        }
        else
        {
            SendMessage(hwnd, WM_SETTEXT, 0, (LPARAM)"");
            EnableWindow(hwnd, FALSE);
        }
    }
    FUN_00477960();
    FUN_004777c0();
    return 1;
}

int FUN_00477cf0()
{
    return FUN_00477ba0(-1, NULL);
}

// Q3Radiant Win_ent.cpp CreateEntity shape
void FUN_00477d00()
{
    char sz[1024];

    if (selected_brushes.next == &selected_brushes)
    {
        MessageBox(dword_010bcd54, "You must have a selected brush to create an entity", "info", 0);
        return;
    }
    HWND hwnd = hwndEnt[EntList];
    int i = SendMessage(hwndEnt[EntList], LB_GETCURSEL, 0, 0);
    if (i < 0)
    {
        MessageBox(dword_010bcd54, "You must have a selected class to create an entity", "info", 0);
        return;
    }
    SendMessage(hwnd, LB_GETTEXT, i, (LPARAM)sz);
    if (!_stricmp(sz, "worldspawn"))
    {
        MessageBox(dword_010bcd54, "Can't create an entity with worldspawn.", "info", 0);
        return;
    }
    eclass_t *pecNew = FUN_00464770(sz, 0);
    entity_t *petNew = FUN_00466d80(pecNew);
    if (petNew == NULL)
    {
        MessageBox(dword_010bcd54, "Failed to create entity.", "info", 0);
        return;
    }
    if (selected_brushes.next == &selected_brushes)
        edit_entity = world_entity->def;
    else
    {
        edit_entity = selected_brushes.next->owner->def;
        brush_t *brush = selected_brushes.next;
        FUN_0046fbe0(1);
        FUN_0046f0b0(brush, 1, 1, 0);
    }
    FUN_004777c0();
    g_nUpdateBits = -1;
}

// Q3Radiant Win_ent.cpp AddProp shape, with the undo calls
void FUN_00477e80()
{
    char key[4096];
    char value[4096];

    if (edit_entity == NULL)
        return;
    SendMessage(hwndEnt[EntKeyField], WM_GETTEXT, sizeof(key) - 1, (LPARAM)key);
    SendMessage(hwndEnt[EntValueField], WM_GETTEXT, sizeof(value) - 1, (LPARAM)value);
    FUN_004433b0();
    Undo_GeneralStart("set key value pair");
    if (multiple_entities)
    {
        for (brush_t *b = selected_brushes.next; b != &selected_brushes; b = b->next)
        {
            Undo_AddEntity(b->owner->def);
            FUN_00465bf0(b->owner->def, key, value);
        }
    }
    else
    {
        Undo_AddEntity(edit_entity);
        FUN_00465bf0(edit_entity, key, value);
    }
    FUN_004777c0();
    Undo_End();
}

// Q3Radiant Win_ent.cpp DelProp shape, with the undo calls
void FUN_00477f80()
{
    char sz[4096];

    if (edit_entity == NULL)
        return;
    SendMessage(hwndEnt[EntKeyField], WM_GETTEXT, sizeof(sz) - 1, (LPARAM)sz);
    FUN_004433b0();
    Undo_GeneralStart("delete key value pair");
    if (multiple_entities)
    {
        for (brush_t *b = selected_brushes.next; b != &selected_brushes; b = b->next)
        {
            Undo_AddEntity(b->owner->def);
            entity_t *e = b->owner->def;
            DeleteKey(e->epairs, sz);
            FUN_004655f0(e, sz);
            FUN_004657a0(e, sz);
        }
    }
    else
    {
        Undo_AddEntity(edit_entity);
        entity_t *e = edit_entity;
        DeleteKey(e->epairs, sz);
        FUN_004655f0(e, sz);
        FUN_004657a0(e, sz);
    }
    FUN_004777c0();
    Undo_End();
}

// Q3Radiant Win_ent.cpp GetSelectAllCriteria shape
BOOL FUN_00478090(CString &strKey, CString &strVal)
{
    char sz[4096];
    HWND hwnd = hwndEnt[EntProps];
    int i = SendMessage(hwnd, LB_GETCURSEL, 0, 0);
    if (i >= 0 && inspector_mode == 0x80)
    {
        SendMessage(hwndEnt[EntKeyField], WM_GETTEXT, sizeof(sz), (LPARAM)sz);
        strKey = sz;
        SendMessage(hwndEnt[EntValueField], WM_GETTEXT, sizeof(sz), (LPARAM)sz);
        strVal = sz;
        return TRUE;
    }
    return FALSE;
}

// Q3Radiant Win_ent.cpp EditProp shape
void FUN_00478140()
{
    int i;
    HWND hwnd;
    char sz[4096];
    char *val;

    if (edit_entity == NULL)
        return;
    hwnd = hwndEnt[EntProps];
    i = SendMessage(hwnd, LB_GETCURSEL, 0, 0);
    if (i < 0)
        return;
    SendMessage(hwnd, LB_GETTEXT, i, (LPARAM)sz);
    for (i = 0; sz[i] != '\t'; i++)
        ;
    sz[i] = '\0';
    val = sz + i + 1;
    if (*val == '\t')
        val++;
    SendMessage(hwndEnt[EntKeyField], WM_SETTEXT, 0, (LPARAM)sz);
    SendMessage(hwndEnt[EntValueField], WM_SETTEXT, 0, (LPARAM)val);
}

// Q3Radiant Win_ent.cpp MOVE shape
void FUN_004781f0(HWND e, int x, int y, int w, int h, HWND hwndPlacement, int swp)
{
    SetWindowPos(e, hwndPlacement, col + x, y, w, h, swp);
}

// Q3Radiant Win_ent.cpp SizeEntityDlg shape
void FUN_00478220(int iWidth, int iHeight)
{
    int y, x, xCheck, yCheck;
    int i, iRow;
    int w, h;

#define MOVE(e, mx, my, mw, mh) FUN_004781f0(e, mx, my, mw, mh, HWND_TOP, 0x114)
    if (iWidth < 32 || iHeight < 32 || (iWidth == dword_0112999c && iHeight == dword_01129998))
        return;
    dword_0112999c = iWidth;
    dword_01129998 = iHeight;
    SendMessage(dword_010bcd60, WM_SETREDRAW, 0, 0);
    iHeight -= 24;
    col = inspector_mode == 0x40 ? 0 : iWidth;
    if (*(int *)(dword_01233488 + 0x7a0) > 0 && *(int *)(dword_01233488 + 0x7a0) < 3)
        MOVE(dword_010bcd5c, 5, 5, iWidth - 10, iHeight - 10);
    col = inspector_mode == 0x10 ? 0 : iWidth;
    if (*(int *)(dword_01233488 + 0x7a0) > 0 && *(int *)(dword_01233488 + 0x7a0) < 3)
        MOVE(dword_010bcd64, 5, 5, iWidth - 10, iHeight - 10);
    col = inspector_mode == 0x2000 ? 0 : iWidth;
    MOVE(dword_010bcd74, 5, 5, iWidth - 10, iHeight - 10);
    col = inspector_mode == 0x80 ? 0 : iWidth;
    y = iHeight / 2;
    y -= 10;
    y = y / 3;
    w = iWidth - 10;
    MOVE(hwndEnt[EntList], 5, 5, w, 2 * y);
    MOVE(hwndEnt[EntComment], 5, 10 + 2 * y, w, y - 10);
    xCheck = (iWidth - 10) / 3;
    yCheck = 18;
    x = 5;
    for (iRow = 0; iRow <= 12; iRow += 4)
    {
        y = iHeight / 2;
        for (i = 0; i < 4; i++)
        {
            MOVE(hwndEnt[EntCheck1 + i + iRow], x, y, xCheck, yCheck);
            y += yCheck;
        }
        x += xCheck;
    }
    y = iHeight / 2 + 4 * yCheck;
    w = iWidth - 10;
    h = (iHeight - (yCheck * 5 + 10)) - y;
    MOVE(hwndEnt[EntProps], 5, y, w, h);
    y += h + 5;
    w = iWidth - 50;
    MOVE(hwndEnt[EntKeyLabel], 5, y, 40, yCheck);
    MOVE(hwndEnt[EntKeyField], 45, y, w, yCheck);
    y += yCheck;
    MOVE(hwndEnt[EntValueLabel], 5, y, 40, yCheck);
    MOVE(hwndEnt[EntValueField], 45, y, w, yCheck);
    y += yCheck;
    y += 2;
    i = y;
    x = 5;
    xCheck = yCheck * 2;
    MOVE(hwndEnt[EntDir135], x, y, xCheck, yCheck);
    y += yCheck;
    MOVE(hwndEnt[EntDir180], x, y, xCheck, yCheck);
    y += yCheck;
    MOVE(hwndEnt[EntDir225], x, y, xCheck, yCheck);
    y = i;
    x += xCheck;
    MOVE(hwndEnt[EntDir90], x, y, xCheck, yCheck);
    y += yCheck;
    y += yCheck;
    MOVE(hwndEnt[EntDir270], x, y, xCheck, yCheck);
    y = i;
    x += xCheck;
    MOVE(hwndEnt[EntDir45], x, y, xCheck, yCheck);
    y += yCheck;
    MOVE(hwndEnt[EntDir0], x, y, xCheck, yCheck);
    y += yCheck;
    MOVE(hwndEnt[EntDir315], x, y, xCheck, yCheck);
    y = i + yCheck / 2;
    x += xCheck + xCheck / 2;
    MOVE(hwndEnt[EntDirUp], x, y, xCheck, yCheck);
    y += yCheck;
    MOVE(hwndEnt[EntDirDown], x, y, xCheck, yCheck);
    y = i;
    x += 1.5 * xCheck;
    MOVE(hwndEnt[EntDelProp], x, y, xCheck * 2, yCheck);
    y += yCheck + 4;
    MOVE(hwndEnt[EntAssignModels], x, y, xCheck * 2, yCheck);
    col = 0;
    iHeight += 24;
    FUN_004781f0(hwndEnt[EntTab], 0, 0, iWidth, iHeight, HWND_BOTTOM, SWP_NOACTIVATE | SWP_NOCOPYBITS);
    SendMessage(dword_010bcd60, WM_SETREDRAW, 1, 0);
#undef MOVE
}
