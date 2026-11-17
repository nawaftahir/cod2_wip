// Draft (lane d r12): retail 0x0042f5d0, 112 B of code bytes match (95%, only the size differs).
// tu_map says 117 B but the last 5 B (0x42f640: mov byte [eax+6],1 ; ret) are a separate function.
// Needs tu_map 0x42f5d0 112 B + new row 0x42f640 5 B (inventory, owner).
// In Pmesh.cpp after FUN_0042beb0. patch_t needs: unsigned char pad4[2]; unsigned char field_06; after def.
struct MainFrameToolbarView;
extern "C" void FUN_0041b190(MainFrameToolbarView *self);
extern MainFrameToolbarView *dword_01233488;
extern int DAT_011298b4;
void FUN_00433ad0();
void FUN_00434040();
extern bool byte_12334ba;
extern bool byte_12334b9;

void FUN_0042f5d0()
{
    int mode = DAT_011298b0;
    DAT_011298b0 = 0;
    if (mode == 0xb)
        FUN_0041b190(dword_01233488);
    else if (mode == 0xa)
        FUN_0042beb0();
    DAT_011298b4 = 0;
    for (selbrush_t *b = DAT_010a44b4.next; b != &DAT_010a44b4; b = b->next)
    {
        if (b->patch)
            b->patch->field_06 = 0;
    }
    if (byte_12334ba)
        FUN_00433ad0();
    if (byte_12334b9)
        FUN_00434040();
}
