extern void *g_dvar_refraction;   /* 0x101ce708, +8 = value */

unsigned char R_IsMaterialRefractive(void *material)
{
    unsigned int technique;

    if (*(int *)((char *)g_dvar_refraction + 8) != 2)
    {
        technique = *(unsigned int *)(*(int *)((char *)material + 0x38) + 0x58);
        if (technique != 0 && (*(unsigned char *)(technique + 4) & 1) != 0)
            return 1;
    }
    return 0;
}
