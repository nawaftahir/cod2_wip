#include <string.h>
/* 0x101061c8: zero 12 bytes via stosd triplet */
void FUN_101061c8(void *dst)
{
    unsigned int n = 12;
    memset(dst, 0, n);
}
