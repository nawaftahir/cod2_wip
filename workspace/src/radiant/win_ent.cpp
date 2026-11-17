#include "entityw.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "../universal/assertive.h"

HWND hwndEnt[EntLast];

// slots of hwndEnt used here (retail 0x11299b0 + 4 * slot)
#define EntList 0
#define EntComment 1
#define EntCheck1 2
#define EntProps 14

struct epair_t
{
    epair_t *next;
    char *key;
    char *value;
};

struct eclass_t
{
    unsigned char pad00[4];
    char *name;
    unsigned char pad08[0x48];
    char *comments;
    char flagnames[8][0x20];
};

struct entity_t
{
    unsigned char pad00[0x50];
    eclass_t *eclass;
    unsigned char pad54[4];
    float origin[3];
    epair_t *epairs;
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
extern int g_nUpdateBits;
char *ValueForKey(epair_t *&e, const char *key);
char *TranslateString(const char *string);

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
