// Q3Radiant Win_ent.cpp GetSpawnFlags shape, with the undo calls
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
    eclass_t *pecNew = FUN_00464770(0, sz);
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
        FUN_0046fbe0(1);
        FUN_0046f0b0(selected_brushes.next, 1, 1, 0);
    }
    FUN_004777c0();
    g_nUpdateBits = -1;
}
