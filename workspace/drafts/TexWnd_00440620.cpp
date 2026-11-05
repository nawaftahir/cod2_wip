// 0x00440620 (159 B retail inventory, 160 B candidate with 4-entry jump table) - Texture_SetMode
// Matched 99% (all 159 bytes of retail matched, first diff at +0x9f due to inventory size 159 vs 160).
// Regresses GraphGetValueFromFraction 0x004832c0 to 76%, 828/832 B, first diff +0x5 under /GL.
// Moved to drafts per Rule 5.

#include "stdafx.h"
#include "../universal/assertive.h"

extern int DAT_01129604;
extern char *DAT_01233488;
extern int DAT_0123348c;

void __fastcall Texture_SetMode(int iTexMenu)
{
    int mode;
    switch (iTexMenu)
    {
    case 0x80df:
        mode = 0;
        break;
    case 0x80e0:
        mode = 1;
        break;
    case 0x80e1:
        mode = 2;
        break;
    case 0x80e2:
        mode = 3;
        break;
    default:
        assertFailMsg(1, "unhandled case");
        return;
    }

    DAT_01129604 = iTexMenu;
    char *cam = *(char **)(DAT_01233488 + 0x78c);
    if (*(int *)(cam + 0x78) != mode)
    {
        *(int *)(cam + 0x78) = mode;
        DAT_0123348c |= 1;
    }
}
