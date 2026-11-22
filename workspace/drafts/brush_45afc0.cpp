// bulk draft of retail 0x0045afc0; kept out of the build: compiled in, it re-rolls the LTCG tie of matched GraphGetValueFromFraction 0x004832c0
// 0x0045afc0 (664 B): snap a brush to the grid; "Brush_SnapToGrid: Removing brush with no faces"
void FUN_0045afc0(brushdef_t *def)
{
    Brush_RemoveEmptyFaces(def);
    if (def->faceCount < 4)
    {
        Warning("Brush_SnapToGrid: Removing brush with no faces\n");
        FUN_00458af0(def);
        return;
    }
    if (def->owner != NULL && def->owner->eclass->fixedsize != 0)
    {
        vec3_t snapped, delta;
        for (int i = 0; i < 3; i++)
            snapped[i] = (float)(floor(def->owner->origin[i] / (float)g_qeglobals.d_gridsize + 0.5) * (double)g_qeglobals.d_gridsize);
        VectorSubtract(snapped, def->owner->origin, delta);
        FUN_0045e1a0(def, delta, true);
        return;
    }
    brushdef_t *backup = FUN_00458dc0(def);
    for (int i = 0; i < def->faceCount; i++)
    {
        face_t *f = &def->faces[i];
        for (int j = 0; j < 3; j++)
        {
            for (int k = 0; k < 3; k++)
                f->planepts[j][k] = (float)floor(f->w->points[j][k] / (float)g_qeglobals.d_gridsize + 0.5f) * (float)g_qeglobals.d_gridsize;
        }
    }
    FUN_0045a220(def, true);
    if (g_qeglobals.d_select_mode == 1 || g_qeglobals.d_select_mode == 2)
        FUN_00475350();
    Sys_MarkMapModified();
    def->version++;
    for (int k = 0; k < 3; k++)
    {
        if (def->maxs[k] - def->mins[k] < 1.0f)
        {
            Sys_Printf("WARNING: Snapped brush is smaller than 1 unit, restoring original brush\n");
            face_t *swap = def->faces;
            def->faces = backup->faces;
            backup->faces = swap;
            FUN_0045a220(def, true);
            if (g_qeglobals.d_select_mode == 1 || g_qeglobals.d_select_mode == 2)
                FUN_00475350();
            Sys_MarkMapModified();
            def->version++;
            break;
        }
    }
    FUN_00458af0(backup);
}
