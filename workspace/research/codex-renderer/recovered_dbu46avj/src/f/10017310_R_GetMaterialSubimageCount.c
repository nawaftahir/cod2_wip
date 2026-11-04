int R_GetMaterialSubimageCount(void *material)
{
    return ((unsigned char *)material)[15] * ((unsigned char *)material)[14];
}
