extern void *g_defaultMaterial;

bool R_Material_IsDefault(void *material)
{
    bool eq;

    if (*(int *)((char *)material + 0x3C) != *(int *)((char *)g_defaultMaterial + 0x3C))
        return 0;
    else if (*(int *)((char *)material + 0x40) != *(int *)((char *)g_defaultMaterial + 0x40))
        return 0;
    else
    {
        eq = *(int *)((char *)material + 0x38) == *(int *)((char *)g_defaultMaterial + 0x38);
        return eq;
    }
}
