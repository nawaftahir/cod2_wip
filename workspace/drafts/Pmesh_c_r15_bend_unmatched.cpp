// Lane c r15: unmatched bend bodies (see ledger/defer.tsv). Not built.

void FUN_00433ad0()
{
    if (DAT_012334ba)
    {
        DAT_012334ba = false;
        if (DAT_012335a0.GetSafeHwnd())
            DAT_012335a0.ShowWindow(SW_HIDE);
        FUN_0041b190(dword_01233488);
        return;
    }
    patchMesh_t *p = SinglePatchSelected();
    if (!p)
    {
        Sys_Printf("Must bend a single patch");
        return;
    }
    if (p->type_10 & 0x40)
    {
        Sys_Printf("Patch_BendToggle: Bending of terrain curves not implemented\n");
        return;
    }
    DAT_0109c538.width = p->width;
    DAT_0109c538.height = p->height;
    DAT_0109c538.type_10 = p->type_10;
    memcpy(DAT_0109c538.ctrl, p->ctrl, sizeof(p->ctrl));
    DAT_012334ba = true;
    DAT_005909fc = 0;
    DAT_00590a04 = true;
    DAT_012334c0 = 1;
    FUN_00409690(DAT_00590a08[0]);
}

void FUN_00433ed0()
{
    patchMesh_t *p = SinglePatchSelected();
    if (!p)
    {
        FUN_00433ad0();
        return;
    }
    if (p->type_10 & 0x40)
    {
        Sys_Printf("Patch_SelectBendAxis: Bending of terrain curves not implemented\n");
        return;
    }
    if (DAT_00590a04)
        FUN_0042a3a0(p, DAT_012334c0, false);
    else
        FUN_0042a3f0(p, DAT_012334c0, false);
    Patch_SetBendRotateOrigin();
}

void FUN_00433f20()
{
    patchMesh_t *p = SinglePatchSelected();
    if (!p)
    {
        FUN_00433ad0();
        return;
    }
    if (p->type_10 & 0x40)
    {
        Sys_Printf("Patch_SelectBendNormal: Bending of terrain curves not implemented\n");
        return;
    }
    DAT_010c4d84 = 0;
    if (DAT_00590a04)
    {
        if (DAT_00590a05)
        {
            for (int i = 0; i < DAT_012334c0; i++)
                FUN_0042a3a0(p, i, true);
        }
        else
        {
            for (int i = p->height - 1; i > DAT_012334c0; i--)
                FUN_0042a3a0(p, i, true);
        }
    }
    else if (DAT_00590a05)
    {
        for (int i = 0; i < DAT_012334c0; i++)
            FUN_0042a3f0(p, i, true);
    }
    else
    {
        for (int i = p->width - 1; i > DAT_012334c0; i--)
            FUN_0042a3f0(p, i, true);
    }
    Patch_SetBendRotateOrigin();
}

void FUN_00434040()
{
    if (DAT_012334b9)
    {
        DAT_012334b9 = false;
        if (DAT_012335a0.GetSafeHwnd())
            DAT_012335a0.ShowWindow(SW_HIDE);
        FUN_0041b190(dword_01233488);
        return;
    }
    patchMesh_t *p = SinglePatchSelected();
    if (!p)
    {
        Sys_Printf("Must work with a single patch");
        return;
    }
    DAT_0109c538.width = p->width;
    DAT_0109c538.height = p->height;
    DAT_0109c538.type_10 = p->type_10;
    memcpy(DAT_0109c538.ctrl, p->ctrl, sizeof(p->ctrl));
    DAT_012334b9 = true;
    DAT_00590a00 = 0;
    DAT_00590a04 = true;
    DAT_012334c0 = 0;
    FUN_00409690(DAT_00590a1c[0]);
}
