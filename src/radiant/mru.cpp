// mru.cpp: most-recently-used file list. Bodies from Q3Radiant MRU.CPP, byte-identical to retail.
#include <windows.h>

BOOL IsWin395OrHigher(void)
{
    WORD wVer;

    wVer = LOWORD(GetVersion());
    wVer = (((WORD)LOBYTE(wVer)) << 8) | (WORD)HIBYTE(wVer);

    return (wVer >= 0x035F); // 5F = 95 dec
}
