// FUN_0045c6b0 draft: 68%, FUN_00465bf0 gets inlined in the 2nd loop

void FUN_0045c6b0()
{
    char buf[16];
    int maxGroup = -1;
    for (brush_t *b = active_brushes.next; b != &active_brushes; b = b->next)
    {
        if (!b->owner || b->owner == (entity_t *)world_entity)
            continue;
#line 3153
        assert(b->owner->def == b->def->owner);
        entity_t *e = (entity_t *)b->owner->def;
        if (!FUN_00465d80(e, *(char **)(dword_01233b64 + 0x2ec)))
            continue;
        char *group = ValueForKey(e->epairs, *(char **)(dword_01233b64 + 0x2ec));
#line 3158
        brush_assert1(group);
        if (*group)
        {
            int n = atoi(group);
            if (maxGroup < n)
                maxGroup = n;
        }
    }
    _itoa(maxGroup + 1, buf, 10);
    for (brush_t *b = selected_brushes.next; b != &selected_brushes; b = b->next)
    {
        if (!b->owner || b->owner == (entity_t *)world_entity)
            continue;
#line 3173
        assert(b->owner->def == b->def->owner);
        FUN_00465bf0((entity_t *)b->owner->def, *(char **)(dword_01233b64 + 0x2ec), buf);
    }
}
