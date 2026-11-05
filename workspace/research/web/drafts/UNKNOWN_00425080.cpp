#include "stdafx.h"
#include <stdlib.h>

// Retail 0x004250c0 (17 B). Releases non-static backing storage.
// The static empty buffer address at 0x00598c80 and the pointer compare
// are recoverable from the retail decompilation, unlike the owner type.
extern char DAT_00598c80;

void __fastcall FUN_004250c0(char **storage)
{
    if (*storage != &DAT_00598c80)
        free(*storage);
}
