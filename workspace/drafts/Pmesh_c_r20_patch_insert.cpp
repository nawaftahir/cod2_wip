// Lane c r20 drafts (unmatched, not built). See ledger/defer.tsv for results.
// Needs in Pmesh.cpp: extern float DAT_010bcd7c[][3]; extern int DAT_010c2d7c, DAT_010c4d84, DAT_010c4d88[];

// 0x00429bc0 (553 B): grid coordinates shared by the selected control vertices
bool FUN_00429bc0(patchMesh_t *patch, int *px, int *py)
{
#line 1746
    assert(patch);
    assert(px);
    assert(py);
    bool found = false;
    *px = -1;
    *py = -1;
    for (int i = 0; i < DAT_010c4d84; i++)
    {
        PatchControl *pdv = (PatchControl *)DAT_010c4d88[i];
        if (pdv < &patch->ctrl[0][0] || pdv > &patch->ctrl[15][15])
            continue;
        int idx = (int)(pdv - &patch->ctrl[0][0]);
        int x = idx / 16;
        int y = idx - x * 16;
#line 1762
        assert(pdv == &patch->ctrl[x][y]);
        if (!found)
        {
            *px = x;
            *py = y;
            found = true;
        }
        else
        {
            if (*px != x)
                *px = -1;
            if (*py != y)
                *py = -1;
        }
    }
    if (!found)
        return false;
    if (*px >= 0 && *py >= 0)
        return false;
    if (*px < 0 && *py < 0)
    {
        Sys_Printf("selected vertices must be on the same column or row\n");
        return false;
    }
    return true;
}

// 0x0042fda0 (609 B): add one extrapolated control column at the nearer end
void FUN_0042fda0(patchMesh_t *p, int index)
{
    int w = p->width;
    if (w + 1 >= 16)
        return;
    float half = (float)w * 0.5f;
    if (!((float)index > half) && index != w - 1)
    {
        for (int i = w; i > 0; i--)
        {
            for (int j = 0; j < p->height; j++)
            {
                p->ctrl[i][j] = p->ctrl[i - 1][j];
                for (int k = 0; k < 3; k++)
                    p->ctrl[i][j].xyz[k] = p->ctrl[i - 1][j].xyz[k];
            }
        }
        for (int j = 0; j < p->height; j++)
        {
            p->ctrl[0][j] = p->ctrl[1][j];
            for (int k = 0; k < 3; k++)
                p->ctrl[0][j].xyz[k] = p->ctrl[1][j].xyz[k] - p->ctrl[2][j].xyz[k] + p->ctrl[1][j].xyz[k];
            for (int k = 0; k < 3; k++)
                DAT_010bcd7c[DAT_010c2d7c][k] = p->ctrl[0][j].xyz[k];
            if (DAT_010c2d7c < 0x7ff)
                DAT_010c2d7c++;
        }
        p->width++;
    }
    else
    {
        for (int j = 0; j < p->height; j++)
        {
            p->ctrl[w][j] = p->ctrl[w - 1][j];
            for (int k = 0; k < 3; k++)
                p->ctrl[w][j].xyz[k] = p->ctrl[w - 1][j].xyz[k] - p->ctrl[w - 2][j].xyz[k] + p->ctrl[w - 1][j].xyz[k];
            for (int k = 0; k < 3; k++)
                DAT_010bcd7c[DAT_010c2d7c][k] = p->ctrl[w][j].xyz[k];
            if (DAT_010c2d7c < 0x7ff)
                DAT_010c2d7c++;
        }
        p->width++;
    }
}

// 0x00430010 (526 B): add one extrapolated control row at the nearer end
void FUN_00430010(patchMesh_t *p, int index)
{
    int w = p->height;
    if (w + 1 >= 16)
        return;
    float half = (float)w * 0.5f;
    if (!((float)index > half) && index != w - 1)
    {
        for (int i = w; i > 0; i--)
        {
            for (int j = 0; j < p->width; j++)
            {
                p->ctrl[j][i] = p->ctrl[j][i - 1];
                for (int k = 0; k < 3; k++)
                    p->ctrl[j][i].xyz[k] = p->ctrl[j][i - 1].xyz[k];
            }
        }
        for (int j = 0; j < p->width; j++)
        {
            p->ctrl[j][0] = p->ctrl[j][1];
            for (int k = 0; k < 3; k++)
                p->ctrl[j][0].xyz[k] = p->ctrl[j][1].xyz[k] - p->ctrl[j][2].xyz[k] + p->ctrl[j][1].xyz[k];
            for (int k = 0; k < 3; k++)
                DAT_010bcd7c[DAT_010c2d7c][k] = p->ctrl[j][0].xyz[k];
            if (DAT_010c2d7c < 0x7ff)
                DAT_010c2d7c++;
        }
        p->height++;
    }
    else
    {
        for (int j = 0; j < p->width; j++)
        {
            p->ctrl[j][w] = p->ctrl[j][w - 1];
            for (int k = 0; k < 3; k++)
                p->ctrl[j][w].xyz[k] = p->ctrl[j][w - 1].xyz[k] - p->ctrl[j][w - 2].xyz[k] + p->ctrl[j][w - 1].xyz[k];
            for (int k = 0; k < 3; k++)
                DAT_010bcd7c[DAT_010c2d7c][k] = p->ctrl[j][w].xyz[k];
            if (DAT_010c2d7c < 0x7ff)
                DAT_010c2d7c++;
        }
        p->height++;
    }
}

// 0x00438020 (241 B): add a control row or column next to the selected terrain vertices
void FUN_00438020()
{
    bool bChanged = false;
    for (selbrush_t *b = selected_brushes.next; b != &selected_brushes; b = b->next)
    {
        if (!b->patch)
            continue;
#line 7505
        assert( b->patch->def == b->def->patch );
        patchMesh_t *p = b->patch->def;
        if (!(p->type_10 & 0x40))
            continue;
        int x, y;
        if (!FUN_00429bc0(p, &x, &y))
            continue;
        if (x >= 0)
            FUN_0042fda0(p, x);
        else
            FUN_00430010(p, y);
        bChanged = true;
        FUN_004269d0(p, bChanged);
    }
    if (bChanged)
    {
        if (g_PatchDialog.GetSafeHwnd())
            g_PatchDialog.GetPatchInfo();
        DAT_0123348c = -1;
    }
}


/* r21: retail convention test. Adding an unreferenced
   static void c_probe_unused(void (**out)(patchMesh_t *, int)) { out[0] = FUN_0042fda0; out[1] = FUN_00430010; }
   makes LTCG keep the stack convention (the probe itself is dropped from the exe) and 0x438020
   MATCHES 100%. Not landed: the retail image holds no pointer to either function, so the probe is
   invented code. 42fda0/430010 then sit at 39%/30%: p in ebx vs retail esi + reload from [ebp+8]. */
