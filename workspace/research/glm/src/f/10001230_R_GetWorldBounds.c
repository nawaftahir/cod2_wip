extern void *g_world;

void R_GetWorldBounds(float *mins, float *maxs)
{
    float *src;

    src = (float *)((char *)g_world + 0x13C);
    mins[0] = src[0];
    mins[1] = src[1];
    mins[2] = src[2];
    src = (float *)((char *)g_world + 0x148);
    maxs[0] = src[0];
    maxs[1] = src[1];
    maxs[2] = src[2];
}
