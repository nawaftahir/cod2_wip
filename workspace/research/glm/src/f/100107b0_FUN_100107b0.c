extern void *(*RI_Hunk_AllocateTempMemoryInternal)(int size);
extern void (*RI_Hunk_FreeTempMemory)(void *buf);
extern void FUN_10010160(void *a, void *buf, int c, int d, void *e);
extern void FUN_100106b0(void);

void FUN_100107b0(void *arg)
{
    void *buf;

    buf = RI_Hunk_AllocateTempMemoryInternal(0x18000);
    FUN_10010160(arg, buf, 0x40, 0, FUN_100106b0);
    RI_Hunk_FreeTempMemory(buf);
}
