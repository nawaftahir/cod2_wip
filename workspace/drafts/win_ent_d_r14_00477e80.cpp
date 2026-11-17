// 0x477e80 AddProp shape: MATCHES 100% alone, but flips FUN_00467510 (entity.cpp) in the gate. Insert before DelProp in win_ent.cpp when 0x467510 is robust.
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

