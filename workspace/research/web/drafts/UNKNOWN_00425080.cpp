#include "stdafx.h"
#include <stdlib.h>

// Retail 0x004250c0 (17 B). Releases non-static backing storage.
// The static empty buffer address at 0x00598c80 and the pointer compare
// are recoverable from the retail decompilation, unlike the owner type.
extern char DAT_00598c80;

// Retail 0x00425080 / 3 B: load the first 32-bit value from an ECX pointer.
// Candidate source; accept only after the pinned CI referee reports MATCH.
int __fastcall FUN_00425080(int *value)
{
    return *value;
}


void __fastcall FUN_004250c0(char **storage)
{
    if (*storage != &DAT_00598c80)
        free(*storage);
}


// Retail one-byte RET bodies verified with MSVC 7.1. Original entry-point ownership/signatures remain provisional.
extern "C" void FUN_00425120() {}
