extern unsigned char *renderer_world;
extern const unsigned char *renderer_in_use_dvar;

void R_SetSunLightOverride(const float *color)
{
    float *destination;

    if (*(const int *)(renderer_in_use_dvar + 8) != 2)
    {
        destination = (float *)(renderer_world + 0xc8);
        destination[0] = color[0];
        destination[1] = color[1];
        destination[2] = color[2];
    }
}

void R_ResetSunLightOverride(void)
{
    float *destination;
    float *source;

    destination = (float *)(renderer_world + 0xc8);
    source = (float *)(renderer_world + 0xe0);
    destination[0] = source[0];
    destination[1] = source[1];
    destination[2] = source[2];
}
