extern void *memcpy(void *, const void *, unsigned int);
extern char *g_zoneBase;
extern void *(*RI_Z_MallocInternal)(int size);

void R_LightingFromCubemapShots(const void *data, unsigned int count, int maxCount)
{
    char *z;

    z = g_zoneBase + 0x249D18;
    if (data != 0)
    {
        if (*(int *)(z + 0x24) == 0)
            *(int *)(z + 0x24) = (int)RI_Z_MallocInternal(maxCount << 7);
        memcpy(*(void **)(z + 0x24), data, count << 7);
    }
    *(int *)(z + 0x28) = count;
}
