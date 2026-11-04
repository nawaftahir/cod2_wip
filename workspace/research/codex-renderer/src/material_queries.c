// Renderer 1.0 material accessors; layouts checked against the target instructions.
const char *R_GetMaterialName(const void *material)
{
    return *(const char * const *)material;
}

int R_GetMaterialSubimageCount(const void *material)
{
    const unsigned char *bytes;

    bytes = (const unsigned char *)material;
    return bytes[15] * bytes[14];
}

extern const unsigned char *renderer_in_use_dvar;

unsigned char R_IsMaterialRefractive(const void *material)
{
    const unsigned char *technique_set;
    const unsigned char *technique;

    if (*(const int *)(renderer_in_use_dvar + 8) != 2)
    {
        technique_set = *(const unsigned char * const *)((const unsigned char *)material + 0x38);
        technique = *(const unsigned char * const *)(technique_set + 0x58);
        if (technique != 0 && (technique[4] & 1) != 0)
        {
            return 1;
        }
    }
    return 0;
}
