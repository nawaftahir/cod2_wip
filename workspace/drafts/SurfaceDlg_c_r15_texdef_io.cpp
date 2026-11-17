// Lane c r15: unmatched SurfaceDlg bodies. LTCG inlines 0x43cf20 into its 11 callers, retail keeps it (esi + ret 4). Not built.

// Retail 0x0043cf20: write a float with %.6f, or %.6g when it is large.
void FUN_0043cf20(char *buf, float f)
{
    if (fabs(f) < 0.0001f)
        sprintf(buf, "%.6f", f);
    else
        sprintf(buf, "%.6g", f);
}

// Retail 0x0043cf80: fill the dialog controls from the selected texdef.
void __stdcall FUN_0043cf80(CSurfaceDlg *dlg)
{
    if (!surfDlgGlob.hwnd)
        return;
    texdef_t *pt;
    bool onlyPatches = DAT_012485b4.GetSize() <= 0 && selected_brushes.next != &selected_brushes;
    if (onlyPatches)
    {
        for (brush_t *pb = selected_brushes.next; pb != &selected_brushes; pb = pb->next)
        {
            if (!pb->patch)
            {
                onlyPatches = false;
                break;
            }
        }
    }
    if (onlyPatches)
    {
        if (selected_brushes.next->next != &selected_brushes)
        {
            Sys_Printf("Error: you must have a single brush selected\n");
            surfDlgGlob.patchTexdef.radMat = DAT_01128da8.radMat;
        }
        else if (selected_brushes.next->owner->def->eclass->fixedsize)
        {
            Sys_Printf("Error: you cannot manipulate fixed size entities\n");
            surfDlgGlob.patchTexdef.radMat = DAT_01128da8.radMat;
        }
        else if (selected_brushes.next->patch)
            surfDlgGlob.patchTexdef.radMat = FUN_00440840(selected_brushes.next->patch->def->images[DAT_01128d90]->name);
        else
            surfDlgGlob.patchTexdef.radMat = FUN_00440840("");
        pt = &surfDlgGlob.patchTexdef;
        dlg->m_bPatchMode = true;
        surfDlgGlob.field_40 = FUN_0043cd60();
    }
    else if (surfDlgGlob.field_00 && DAT_012485b4.GetSize() > 0)
    {
        selFace_t selFace = DAT_012485b4[0];
#line 263
        assert( selFace.face == &selFace.brush->faces[selFace.index] );
#line 264
        assert( selFace.brush->version == selFace.brush->def->version );
        pt = &selFace.brush->def->faces[selFace.index].texdef[DAT_01128d94];
        surfDlgGlob.field_40 = FUN_0043ce20();
        dlg->m_bPatchMode = false;
    }
    else
    {
        pt = &DAT_01128da8;
        surfDlgGlob.field_40 = FUN_0043cd60();
        dlg->m_bPatchMode = false;
    }
    char buf[128];
    dlg->SetRedraw(FALSE);
    FUN_0043cb00(dlg->GetDlgItem(0x4dd)->GetSafeHwnd(), pt->radMat->name);
    FUN_0043cf20(buf, pt->shift[0]);
    FUN_0043cb00(dlg->GetDlgItem(0x4ab)->GetSafeHwnd(), buf);
    FUN_0043cf20(buf, pt->shift[1]);
    FUN_0043cb00(dlg->GetDlgItem(0x4ac)->GetSafeHwnd(), buf);
    FUN_0043cf20(buf, dlg->m_bPatchMode ? pt->scale[0] : pt->scale[0] / (float)pt->radMat->size[0]);
    FUN_0043cb00(dlg->GetDlgItem(0x4bb)->GetSafeHwnd(), buf);
    FUN_0043cf20(buf, pt->scale[0]);
    FUN_0043cb00(dlg->GetDlgItem(0x618)->GetSafeHwnd(), buf);
    FUN_0043cf20(buf, dlg->m_bPatchMode ? pt->scale[1] : pt->scale[1] / (float)pt->radMat->size[1]);
    FUN_0043cb00(dlg->GetDlgItem(0x4bd)->GetSafeHwnd(), buf);
    FUN_0043cf20(buf, pt->scale[1]);
    FUN_0043cb00(dlg->GetDlgItem(0x61a)->GetSafeHwnd(), buf);
    FUN_0043cf20(buf, pt->rotate);
    FUN_0043cb00(dlg->GetDlgItem(0x4c1)->GetSafeHwnd(), buf);
    if (surfDlgGlob.field_40 != 0.0f)
        sprintf(buf, "%.6g", surfDlgGlob.field_40);
    else
        buf[0] = 0;
    FUN_0043cb00(dlg->GetDlgItem(0x40b)->GetSafeHwnd(), buf);
    dlg->SetRedraw(TRUE);
    dlg->Invalidate(TRUE);
}

// Retail 0x0043d400: read the patch texdef fields back from the controls.
void __stdcall FUN_0043d400(CSurfaceDlg *dlg)
{
    char buf[128];
    GetWindowText(dlg->GetDlgItem(0x4ab)->GetSafeHwnd(), buf, 127);
    surfDlgGlob.patchTexdef.shift[0] = (float)atof(buf);
    GetWindowText(dlg->GetDlgItem(0x4ac)->GetSafeHwnd(), buf, 127);
    surfDlgGlob.patchTexdef.shift[1] = (float)atof(buf);
    GetWindowText(dlg->GetDlgItem(0x4bb)->GetSafeHwnd(), buf, 127);
    surfDlgGlob.patchTexdef.scale[0] = (float)atof(buf);
    if (!dlg->m_bPatchMode)
        surfDlgGlob.patchTexdef.scale[0] = (float)surfDlgGlob.patchTexdef.radMat->size[0] * surfDlgGlob.patchTexdef.scale[0];
    FUN_0043cf20(buf, surfDlgGlob.patchTexdef.scale[0]);
    FUN_0043cb00(dlg->GetDlgItem(0x618)->GetSafeHwnd(), buf);
    GetWindowText(dlg->GetDlgItem(0x4bd)->GetSafeHwnd(), buf, 127);
    surfDlgGlob.patchTexdef.scale[1] = (float)atof(buf);
    if (!dlg->m_bPatchMode)
        surfDlgGlob.patchTexdef.scale[1] = (float)surfDlgGlob.patchTexdef.radMat->size[1] * surfDlgGlob.patchTexdef.scale[1];
    FUN_0043cf20(buf, surfDlgGlob.patchTexdef.scale[1]);
    FUN_0043cb00(dlg->GetDlgItem(0x61a)->GetSafeHwnd(), buf);
    GetWindowText(dlg->GetDlgItem(0x4c1)->GetSafeHwnd(), buf, 127);
    surfDlgGlob.patchTexdef.rotate = (float)atof(buf);
    GetWindowText(dlg->GetDlgItem(0x40b)->GetSafeHwnd(), buf, 127);
    surfDlgGlob.field_40 = (float)atof(buf);
}

// Retail 0x0043d630: apply the control values to the selected texdef.
float *__stdcall FUN_0043d630(CSurfaceDlg *dlg)
{
    texdef_t *pt;
    bool onlyPatches = DAT_012485b4.GetSize() <= 0 && selected_brushes.next != &selected_brushes;
    if (onlyPatches)
    {
        for (brush_t *pb = selected_brushes.next; pb != &selected_brushes; pb = pb->next)
        {
            if (!pb->patch)
            {
                onlyPatches = false;
                break;
            }
        }
    }
    if (onlyPatches)
    {
        pt = &surfDlgGlob.patchTexdef;
        dlg->m_bPatchMode = true;
    }
    else if (surfDlgGlob.field_00 && DAT_012485b4.GetSize() > 0)
    {
        selFace_t selFace = DAT_012485b4[0];
#line 367
        assert( selFace.face == &selFace.brush->faces[selFace.index] );
#line 368
        assert( selFace.brush->version == selFace.brush->def->version );
        pt = &selFace.brush->def->faces[selFace.index].texdef[DAT_01128d94];
        dlg->m_bPatchMode = false;
    }
    else
    {
        pt = &DAT_01128da8;
        dlg->m_bPatchMode = false;
    }
    char buf[128];
    GetWindowText(dlg->GetDlgItem(0x4dd)->GetSafeHwnd(), buf, 127);
    if (buf[0] <= ' ')
    {
        pt->radMat = FUN_00440840("$default");
        FUN_0043cb00(dlg->GetDlgItem(0x4dd)->GetSafeHwnd(), pt->radMat->name);
    }
    else
        pt->radMat = FUN_00440840(buf);
    GetWindowText(dlg->GetDlgItem(0x4ab)->GetSafeHwnd(), buf, 127);
    pt->shift[0] = (float)atof(buf);
    GetWindowText(dlg->GetDlgItem(0x4ac)->GetSafeHwnd(), buf, 127);
    pt->shift[1] = (float)atof(buf);
    GetWindowText(dlg->GetDlgItem(0x4bb)->GetSafeHwnd(), buf, 127);
    pt->scale[0] = (float)atof(buf);
    if (!dlg->m_bPatchMode)
        pt->scale[0] = (float)pt->radMat->size[0] * pt->scale[0];
    FUN_0043cf20(buf, pt->scale[0]);
    FUN_0043cb00(dlg->GetDlgItem(0x618)->GetSafeHwnd(), buf);
    GetWindowText(dlg->GetDlgItem(0x4bd)->GetSafeHwnd(), buf, 127);
    pt->scale[1] = (float)atof(buf);
    if (!dlg->m_bPatchMode)
        pt->scale[1] = (float)pt->radMat->size[1] * pt->scale[1];
    FUN_0043cf20(buf, pt->scale[1]);
    FUN_0043cb00(dlg->GetDlgItem(0x61a)->GetSafeHwnd(), buf);
    GetWindowText(dlg->GetDlgItem(0x4c1)->GetSafeHwnd(), buf, 127);
    pt->rotate = (float)atof(buf);
    GetWindowText(dlg->GetDlgItem(0x40b)->GetSafeHwnd(), buf, 127);
    surfDlgGlob.field_40 = (float)atof(buf);
    surfDlgGlob.pending = true;
    return &pt->scale[0];
}
