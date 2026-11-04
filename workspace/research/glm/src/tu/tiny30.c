/* 0x10012e70: renderer-state bulk reset (memset chain + config copy) */
extern unsigned int g_101ce644;
void *__cdecl memset(void *, int, unsigned int);
extern unsigned int g_101d4c70;
extern unsigned int g_101d4c6c;
extern unsigned char big_101d4d00[];
extern unsigned int mid_101d0b00[];
extern unsigned int tbl_1072da00[];

void FUN_10012e70(void)
{
    unsigned int gbase;
    unsigned char *src;

    gbase = g_101ce644;
    memset(big_101d4d00, 0, 0xc68 * 4);
    memset(mid_101d0b00, 0, 0x43c * 4);
    memset(tbl_1072da00, 0, 0xdad8 * 4);
    *(unsigned int *)0x10730554 = 0xe;
    *(unsigned int *)0x10730558 = 0xe;
    *(unsigned int *)0x1072ddec = g_101d4c70;
    *(unsigned int *)0x1072de48 = 3;
    *(unsigned int *)0x1072dde8 = g_101d4c6c;
    src = *(unsigned char **)(gbase + 8);
    *(unsigned char *)0x1072debe = src[0x101906b0];
}
