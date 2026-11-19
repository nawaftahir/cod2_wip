// Q3 Select_Ungroup: move the brushes of the selected entities back to the world
void FUN_00471670()
{
    brush_t *sb;
    entityInst_t *e;
    int count = 0;

    if (selected_brushes.next == &selected_brushes)
    {
        Sys_Printf("No grouped entities selected.\n");
        return;
    }
    for (sb = selected_brushes.next; ; sb = sb->next)
    {
#line 1367
        assert(sb->owner);
#line 1368
        assert(sb->def);
#line 1369
        assert(sb->owner->def == sb->def->owner);
        e = sb->owner;
        if (e != DAT_012334ec && !e->def->eclass->fixedsize)
        {
            for (brush_t *eb = e->ownerHead(); eb != e->ownerEnd(); eb = e->ownerHead())
            {
                FUN_00467240(eb->def);
                FUN_004671b0(eb->def, DAT_012334ec->def);
                FUN_0045a220(eb->def, true);
                if (g_qeglobals.d_select_mode == 1 || g_qeglobals.d_select_mode == 2)
                    FUN_00475350();
                Sys_MarkMapModified();
                eb->def->version++;
                Brush_RemoveFromEntity(eb, (entity_t *)DAT_012334ec);
            }
#line 1382
            assert(e->ownerHead() == e->ownerEnd());
            FUN_004678c0(e);
            count++;
        }
        if (sb->next == &selected_brushes)
            break;
    }
    if (count <= 0)
    {
        Sys_Printf("No grouped entities selected.\n");
        return;
    }
    Sys_Printf("Ungrouped %d entit%s.\n", count, count == 1 ? "y" : "ies");
    g_nUpdateBits = -1;
}
