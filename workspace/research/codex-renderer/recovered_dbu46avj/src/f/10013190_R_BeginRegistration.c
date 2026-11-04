#include <string.h>
extern void sub_10012f80(void);
extern int g_vidConfig[11];      /* 0x101d4c6c */

void R_BeginRegistration(int *configOut)
{
    sub_10012f80();
    memcpy(configOut, g_vidConfig, 44);
}
