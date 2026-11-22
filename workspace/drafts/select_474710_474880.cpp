// bulk draft of retail 0x00474710 and 0x00474880 (both referee-match); kept out of the build: either one compiled in flips matched entity.cpp 0x004656b0, 0x00465780, 0x00467510 (LTCG)
// 0x00474710 (367 B): set one component of the angles key of the selected entities
void FUN_00474710(float value, int axis)
{
    FUN_004433b0();
    Undo_GeneralStart("set entity angles");
    for (brush_t *brush = selected_brushes.next; brush != &selected_brushes; brush = brush->next)
    {
#line 2518
        assert(brush->owner->def == brush->def->owner);
        entity_t *ent = brush->owner->def;
        if (ent->eclass->fixedsize)
        {
            Undo_AddEntity(ent);
            float angles[3];
            if (FUN_00465d80(ent, "angles"))
                sscanf(ValueForKey(ent->epairs, "angles"), "%f %f %f", &angles[0], &angles[1], &angles[2]);
            else
                angles[0] = angles[1] = angles[2] = 0;
            angles[axis] = value;
            FUN_00465bf0(ent, "angles", va("%g %g %g", angles[0], angles[1], angles[2]));
        }
    }
    Undo_End();
}


// 0x00474880 (286 B): set the angles key of the selected entities
void FUN_00474880(const float *angles)
{
    FUN_004433b0();
    Undo_GeneralStart("set entity angles");
    for (brush_t *brush = selected_brushes.next; brush != &selected_brushes; brush = brush->next)
    {
#line 2540
        assert(brush->owner->def == brush->def->owner);
        entity_t *ent = brush->owner->def;
        if (ent->eclass->fixedsize)
        {
            Undo_AddEntity(ent);
            FUN_00465bf0(ent, "angles", va("%g %g %g", angles[0], angles[1], angles[2]));
        }
    }
    Undo_End();
}

