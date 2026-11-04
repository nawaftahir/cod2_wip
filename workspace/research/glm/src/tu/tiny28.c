/* 0x10106b03: bounds-checked flag fetch from record array */
extern unsigned int g_1076ac9c;
extern unsigned char tbl_1076aca0[];

int FUN_10106b03(int idx)
{
    unsigned int w;
    int b;

    if ((unsigned int)idx >= g_1076ac9c) return 0;
    b = idx & 0x1f;
    w = *(unsigned int *)(tbl_1076aca0 + (idx >> 5) * 4);
    return (*(signed char *)(w + (b + b * 8) * 4 + 4)) & 0x40;
}
