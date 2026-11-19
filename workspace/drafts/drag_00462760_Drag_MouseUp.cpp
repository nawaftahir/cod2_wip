// 0x00462760
void Drag_MouseUp(int buttons)
{
    float rect[3], origin[3], dir[3], mins[3], maxs[3], p1[3], p2[3];
    int mode;

    SendMessage(g_qeglobals.d_hwndStatus, 0x401, 0, (LPARAM)"drag completed.");
    DAT_0112993c = false;
    DAT_0112993d = false;
    drag_ok = false;

    mode = g_qeglobals.d_select_mode;
    if (mode == 5 && g_pfnDragRect)
    {
        bool shift = (buttons >> 3) & 1;
        g_pfnDragRect(DAT_011298dc, DAT_011298e4, DAT_011298e0, DAT_011298e8, rect);
        FUN_00434630(shift, rect);
        FUN_00434810(shift);
        mode = g_qeglobals.d_select_mode;
        g_qeglobals.d_select_mode = 4;
        if (mode == 11)
            FUN_0041b190(g_pParentWnd);
        else if (mode == 10)
            FUN_0042beb0();
        g_nUpdateBits = -1;
        mode = g_qeglobals.d_select_mode;
    }

    if (DAT_005909f8 != 1)
    {
        if (mode == 0xf && FUN_004396d0(pressdelta) < 1.0f)
        {
            VectorClear(dir);
            g_pParentWnd->ActiveXY()->FUN_0044c5c0(DAT_011298dc, DAT_011298e4, origin, dir);
            int flags;
            if (buttons == 4 && (GetAsyncKeyState(VK_MENU) & 0x8000) && g_qeglobals.d_select_mode != 4
                && g_qeglobals.d_select_mode != 6 && g_qeglobals.d_select_mode != 7)
                flags = 4;
            else
                flags = 0x40;
            FUN_0046f6b0(origin, dir, flags);
            g_qeglobals.d_select_mode = 0;
            g_nUpdateBits = -1;
            mode = 0;
        }
        else if (mode == 0xe || mode == 0xf)
        {
            CXYWnd *xy = g_pParentWnd->ActiveXY();
            xy->FUN_0044c5c0(DAT_011298dc, DAT_011298e4, p1, dir);
            xy->FUN_0044c5c0(DAT_011298e0, DAT_011298e8, p2, dir);
            for (int i = 0; i < 3; i++)
            {
                mins[i] = p1[i] < p2[i] ? p1[i] : p2[i];
                maxs[i] = p1[i] > p2[i] ? p1[i] : p2[i];
            }
            FUN_00471160(mins, maxs, mode != 0xf);
            g_qeglobals.d_select_mode = 0;
            g_nUpdateBits = -1;
            mode = 0;
        }
        else if (mode == 0x10 || mode == 0x11)
        {
            g_qeglobals.d_select_mode = 1;
            g_nUpdateBits = -1;
        }
    }

    if (DAT_011298a4[0] != 0 || DAT_011298a4[1] != 0 || DAT_011298a4[2] != 0)
    {
        FUN_0046fd50(DAT_011298a4, true);
        VectorClear(DAT_011298a4);
        g_nUpdateBits |= 1;
    }

    g_pParentWnd->SetStatusText(1, "");
    if (g_qeglobals.d_select_mode == 10)
    {
        g_qeglobals.d_select_mode = 0;
        FUN_0042beb0();
        return;
    }
    FUN_00443f80((selbrush_t *)&selected_brushes);
    Undo_End();
}
