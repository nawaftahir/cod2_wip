extern unsigned char *renderer_world;

void R_GetWorldBounds(float *mins, float *maxs)
{
    int *source;
    int *destination;

    source = (int *)(renderer_world + 0x13c);
    destination = (int *)mins;
    destination[0] = source[0];
    destination[1] = source[1];
    destination[2] = source[2];
    source = (int *)(renderer_world + 0x148);
    destination = (int *)maxs;
    destination[0] = source[0];
    destination[1] = source[1];
    destination[2] = source[2];
}
