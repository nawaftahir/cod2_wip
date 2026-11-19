// delete the selected brushes (Q3 Select_Delete)
void FUN_0046fb30()
{
    int mode;

    ((SelArrAccess &)g_SelectedFaces).Free();
    mode = g_qeglobals.d_select_mode;
    g_qeglobals.d_select_mode = 0;
    if (mode == 11)
        FUN_0041b190(dword_01233488);
    else if (mode == 10)
        FUN_0042beb0();
    g_qeglobals.selectObject = NULL;
    DAT_01129898 = 0;
    g_qeglobals.d_num_move_points = 0;
    while (selected_brushes.next != &selected_brushes)
    {
        entityInst_t *e = selected_brushes.next->owner;
        FUN_00458c00(selected_brushes.next);
        if (e->field_18 == (void *)e->brushes && e != DAT_012334ec)
            FUN_004678c0(e);
    }
    g_nUpdateBits = -1;
}
