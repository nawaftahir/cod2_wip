// Lane b r6 draft: callers of FUN_004267d0 (retail: p in eax, layer/x/y on stack). Not in the TU: every call
// sequence differs until 0x4267d0 itself takes p in eax only. Insert in retail address order into Pmesh.cpp.

void UpdatePatchInspector();

void FUN_0042ea50(patchMesh_t *p, const vec3_t v)
{
    for (int i = 0; i < p->width; i++)
    {
        for (int j = 0; j < p->height; j++)
            VectorAdd(p->ctrl[i][j].xyz, v, p->ctrl[i][j].xyz);
    }
    if (p->cache_3824)
        free(p->cache_3824);
    p->cache_3824 = FUN_004267d0(p, DAT_01128d94, NULL, NULL);
    p->version++;
    UpdatePatchInspector();
}


void FUN_0042fad0(patchMesh_t *p, int amount)
{
    float scale = (float)amount;
    if (p->type_10 & 0x40)
        FUN_00426e80(p, 1, scale);
    else
        FUN_00426f20(p, 1, scale);
    p->value_3834 = scale;
    p->flag_382f = 1;
    if (DAT_01128d90 == 1)
    {
        if (p->cache_3824)
            free(p->cache_3824);
        p->cache_3824 = FUN_004267d0(p, DAT_01128d94, NULL, NULL);
        p->version++;
    }
}

void FUN_004325d0(patchMesh_t *p, int c)
{
    for (int i = 0; i < p->width; i++)
    {
        for (int j = 0; j < p->height; j++)
        {
            if (DAT_011298b0 == 4 && FUN_00429df0(NULL, (int)&p->ctrl[i][j]) == -1)
                continue;
            float *st = &p->ctrl[i][j].st[DAT_01128d94][c];
            *st = 1.0f - *st;
        }
    }
    if (DAT_01128d94 == 1)
        p->flag_382f = 0;
    if (p->cache_3824)
        free(p->cache_3824);
    p->cache_3824 = FUN_004267d0(p, DAT_01128d94, NULL, NULL);
    p->version++;
}

void FUN_004326b0(patchMesh_t *p, float scaleS, float scaleT)
{
    if (scaleS == 0.0f)
        scaleS = 1.0f;
    if (scaleT == 0.0f)
        scaleT = 1.0f;
    for (int i = 0; i < p->width; i++)
    {
        for (int j = 0; j < p->height; j++)
        {
            if (DAT_011298b0 == 4 && FUN_00429df0(NULL, (int)&p->ctrl[i][j]) == -1)
                continue;
            p->ctrl[i][j].st[DAT_01128d94][0] *= scaleS;
            p->ctrl[i][j].st[DAT_01128d94][1] *= scaleT;
        }
    }
    if (scaleS == scaleT)
    {
        scaleS *= p->value_3834;
        if (DAT_01128d94 == 1)
        {
            p->flag_382f = 1;
            p->value_3834 = scaleS;
        }
    }
    else if (DAT_01128d94 == 1)
        p->flag_382f = 0;
    if (p->cache_3824)
        free(p->cache_3824);
    p->cache_3824 = FUN_004267d0(p, DAT_01128d94, NULL, NULL);
    p->version++;
}

void FUN_00433830(patchMesh_t *p)
{
    for (int i = 0; i < p->width; i++)
    {
        for (int j = 0; j < p->height; j++)
        {
            p->ctrl[i][j].st[DAT_01128d94][0] = (float)i / (float)(p->width - 1);
            p->ctrl[i][j].st[DAT_01128d94][1] = (float)j / (float)(p->height - 1);
        }
    }
    if (DAT_01128d94 == 1)
        p->flag_382f = 0;
    if (p->cache_3824)
        free(p->cache_3824);
    p->cache_3824 = FUN_004267d0(p, DAT_01128d94, NULL, NULL);
    p->version++;
}


void FUN_00435840()
{
    for (selbrush_t *b = DAT_010a44dc.next; b && b != &DAT_010a44dc; b = b->next)
    {
        if (b->patch)
        {
#line 6282
            assert( b->patch->def == b->def->patch );
            patchMesh_t *p = b->patch->def;
            if (p->cache_3824)
                free(p->cache_3824);
            p->cache_3824 = FUN_004267d0(p, DAT_01128d94, NULL, NULL);
            p->version++;
        }
    }
}

void FUN_00439160(int amount)
{
    for (selbrush_t *b = selected_brushes.next; b != &selected_brushes; b = b->next)
    {
        if (!b->patch)
            continue;
        patchMesh_t *p = b->patch->def;
        if (p->type_10 & 0x40)
            continue;
#line 8062
        assert( p == b->def->patch );
        if (amount < 0 && p->style_14 == 1)
            continue;
        if (amount > 0)
        {
            mesh_t *m = (mesh_t *)p->cache_3824;
            if (m->width <= p->width && m->height <= p->height)
                continue;
        }
        mesh_t *m = (mesh_t *)p->cache_3824;
        int oldCount = m->height * m->width;
        p->style_14 += amount;
        for (;;)
        {
            if (p->style_14 < 1)
            {
                p->style_14 = 1;
                break;
            }
            if (p->cache_3824)
                free(p->cache_3824);
            p->cache_3824 = FUN_004267d0(p, DAT_01128d94, NULL, NULL);
            p->version++;
            m = (mesh_t *)p->cache_3824;
            if (m->height * m->width != oldCount)
                break;
            p->style_14 += amount;
        }
    }
    DAT_0123348c = -1;
}

