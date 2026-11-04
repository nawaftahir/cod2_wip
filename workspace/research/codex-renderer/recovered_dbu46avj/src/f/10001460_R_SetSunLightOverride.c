extern void *g_world;

void R_SetSunLightOverride(void)
{
    float *dst;
    float *src;

    dst = (float *)((char *)g_world + 0xC8);
    src = (float *)((char *)g_world + 0xE0);
    dst[0] = src[0];
    dst[1] = src[1];
    dst[2] = src[2];
}
