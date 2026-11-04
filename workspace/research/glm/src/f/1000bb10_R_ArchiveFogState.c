#include <string.h>
extern char g_fogState[0xA0];    /* 0x101d616c */
extern int g_fogFlag;            /* 0x101d620c */

void R_ArchiveFogState(void)
{
    memset(g_fogState, 0, 0xA0);
    g_fogFlag = 0;
}
