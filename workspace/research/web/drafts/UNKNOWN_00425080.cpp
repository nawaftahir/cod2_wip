#include "stdafx.h"
#include <stdlib.h>

// Retail 0x004250c0 (17 B). Releases non-static backing storage.
// The static empty buffer address at 0x00598c80 and the pointer compare
// are recoverable from the retail decompilation, unlike the owner type.
extern char DAT_00598c80;

// Retail 0x00425080 / 3 B: member accessor of the text storage object.
// Backing data at +0, length at +4, capacity at +8 are supported by
// the constructor/destructor spans at 0x00425090..0x004250c0.
struct UNKNOWN_00425080
{
    char *data;
    int length;
    int capacity;
    char *FUN_00425080();
    UNKNOWN_00425080();
    void FUN_004250b0();
};

char *UNKNOWN_00425080::FUN_00425080()
{
    return data;
}

// Retail 0x00425090 / 17 B: initializes three storage fields.
UNKNOWN_00425080::UNKNOWN_00425080()
{
    capacity = 0;
    length = 0;
    data = &DAT_00598c80;
}

// Retail 0x004250b0 / 15 B: resets the same storage fields.
void UNKNOWN_00425080::FUN_004250b0()
{
    capacity = 0;
    length = 0;
    data = &DAT_00598c80;
}


void __fastcall FUN_004250c0(char **storage)
{
    if (*storage != &DAT_00598c80)
        free(*storage);
}


// Retail one-byte RET bodies verified with MSVC 7.1. Original entry-point ownership/signatures remain provisional.
extern "C" void FUN_00425120() {}
