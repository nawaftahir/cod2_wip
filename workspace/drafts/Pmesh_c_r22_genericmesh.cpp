// Lane c r22 drafts (not built). Patch_GenericMesh 0x4293f0 (80%, 759/756) and its terrain twin 0x4296f0.
// Needs in Pmesh.cpp: extern void *DAT_01128da8; FUN_0046fb30/FUN_0046f0b0 decls; QE_SingleBrush_Pmesh above them.
// Blocked: FUN_0046f0b0 (Select_Brush, 522 B) is unwritten, so its ecx call form cannot match.
// Calls fabs(float): the compiler emits ?fabs@@YAMM@Z (retail 0x439600, frameless; ours keeps push ebp).

extern brush_t selected_brushes;
extern brush_t DAT_010a44dc;
extern void *DAT_01128da8;
extern void Sys_Printf(const char *fmt, ...);
void FUN_0046fb30();
void FUN_0046f0b0(brush_t *b, int a, int b2, int c);

brush_t *Patch_GenericMesh(int nWidth, int nHeight, int nOrientation, bool bDeleteSource, bool bOverride)
{
    if (nHeight < 3 || nHeight > 15 || nWidth < 3 || nWidth > 15)
    {
        Sys_Printf("Invalid patch width or height.\n");
        return NULL;
    }
    if (!bOverride && !QE_SingleBrush_Pmesh())
    {
        Sys_Printf("Cannot generate a patch from multiple selections.\n");
        return NULL;
    }
    patchMesh_t *p = MakeNewPatch();
    p->width = nWidth;
    p->height = nHeight;
    p->type_10 = 0;
    int nFirst = 0;
    int nSecond = 1;
    if (nOrientation == 0)
    {
        nFirst = 1;
        nSecond = 2;
    }
    else if (nOrientation == 1)
        nSecond = 2;
    brush_t *sel = selected_brushes.next;
    brushdef_t *b = sel->def;
    entity_t *owner = sel->owner;
    int xStep = (int)b->mins[nFirst];
    float xAdj = fabs((b->maxs[nFirst] - b->mins[nFirst]) / (float)(nWidth - 1));
    float yAdj = fabs((b->maxs[nSecond] - b->mins[nSecond]) / (float)(nHeight - 1));
    for (int i = 0; i < nWidth; i++)
    {
        int yStep = (int)b->mins[nSecond];
        for (int j = 0; j < nHeight; j++)
        {
            p->ctrl[i][j].xyz[nFirst] = (float)xStep;
            p->ctrl[i][j].xyz[nSecond] = (float)yStep;
            p->ctrl[i][j].xyz[nOrientation] = b->maxs[nOrientation];
            yStep = (int)((float)yStep + yAdj);
        }
        xStep = (int)((float)xStep + xAdj);
    }
    (&p->image_18)[DAT_01128d90] = DAT_01128da8;
    FUN_00427160(p, 0);
    if (p->type_10 & 0x40)
        FUN_00426e80(p, 1, 16.0f);
    else
        FUN_00426f20(p, 1, 16.0f);
    p->flag_382f = 1;
    p->value_3834 = 16.0f;
    if (p->cache_3824)
        free(p->cache_3824);
    p->cache_3824 = FUN_004267d0(p, DAT_01128d94, NULL, NULL);
    p->version++;
    brushdef_t *def = AddBrushForPatch(p, owner->def);
    brush_t *nb = FUN_00458440(def, owner);
    FUN_00459210(nb, &DAT_010a44dc);
    if (bDeleteSource)
    {
        FUN_0046fb30();
        FUN_0046f0b0(nb, 1, 1, 0);
    }
    return nb;
}

brush_t *FUN_004296f0(int nWidth, int nHeight, int nOrientation, bool bDeleteSource, bool bOverride)
{
    if (nHeight < 2 || nHeight > 15 || nWidth < 2 || nWidth > 15)
    {
        Sys_Printf("Invalid terrain width or height.\n");
        return NULL;
    }
    if (!bOverride && !QE_SingleBrush_Pmesh())
    {
        Sys_Printf("Cannot generate a terrain from multiple selections.\n");
        return NULL;
    }
    patchMesh_t *p = MakeNewPatch();
    p->width = nWidth;
    p->height = nHeight;
    p->type_10 = 0x40;
    int nFirst = 0;
    int nSecond = 1;
    if (nOrientation == 0)
    {
        nFirst = 1;
        nSecond = 2;
    }
    else if (nOrientation == 1)
        nSecond = 2;
    brush_t *sel = selected_brushes.next;
    brushdef_t *b = sel->def;
    entity_t *owner = sel->owner;
    int xStep = (int)b->mins[nFirst];
    float xAdj = fabs((b->maxs[nFirst] - b->mins[nFirst]) / (float)(nWidth - 1));
    float yAdj = fabs((b->maxs[nSecond] - b->mins[nSecond]) / (float)(nHeight - 1));
    for (int i = 0; i < nWidth; i++)
    {
        int yStep = (int)b->mins[nSecond];
        for (int j = 0; j < nHeight; j++)
        {
            p->ctrl[i][j].xyz[nFirst] = (float)xStep;
            p->ctrl[i][j].xyz[nSecond] = (float)yStep;
            p->ctrl[i][j].xyz[nOrientation] = b->maxs[nOrientation];
            yStep = (int)((float)yStep + yAdj);
        }
        xStep = (int)((float)xStep + xAdj);
    }
    (&p->image_18)[DAT_01128d90] = DAT_01128da8;
    FUN_00427160(p, 0);
    if (p->type_10 & 0x40)
        FUN_00426e80(p, 1, 16.0f);
    else
        FUN_00426f20(p, 1, 16.0f);
    p->flag_382f = 1;
    p->value_3834 = 16.0f;
    if (p->cache_3824)
        free(p->cache_3824);
    p->cache_3824 = FUN_004267d0(p, DAT_01128d94, NULL, NULL);
    p->version++;
    brushdef_t *def = AddBrushForPatch(p, owner->def);
    brush_t *nb = FUN_00458440(def, owner);
    FUN_00459210(nb, &DAT_010a44dc);
    if (bDeleteSource)
    {
        FUN_0046fb30();
        FUN_0046f0b0(nb, 1, 1, 0);
    }
    return nb;
}

