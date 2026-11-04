extern void *memcpy(void *, const void *, unsigned int);
extern char *g_zoneBase;
extern void *(*RI_Z_MallocInternal)(int size);

void R_LocateDebugStrings(const void *data, int count, int maxCount)
{
    char *z;

    z = g_zoneBase + 0x249D18;
    if (data != 0)
    {
        if (*(int *)(z + 0x3C) == 0)
            *(int *)(z + 0x3C) = (int)RI_Z_MallocInternal(maxCount * 0x2C);
        memcpy(*(void **)(z + 0x3C), data, count * 0x2C);
    }
    *(int *)(z + 0x40) = count;
}
