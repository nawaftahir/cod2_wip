/* 0x1003e250: negate float into indexed per-view table, chain onward */
extern unsigned int g_10730550;
extern char tblbase_1072e258[];
extern void __cdecl Next_1003e130(void);

void FUN_1003e250(float x)
{
    *(float *)(tblbase_1072e258 + g_10730550 * 0xcd0) = -x;
    Next_1003e130();
}
