/* 0x1000aa60: conditional FOV-ish override with clamp */
extern unsigned int g_101ce61c;
extern unsigned int g_101d620c;
extern unsigned char g_101d61c8;
extern unsigned int g_101d61ac;
extern float f_101d61c0[];
extern float f_1019bc84[];
extern float f_101ce5f4[];

float FUN_1000aa60(void)
{
    float v;

    v = *(float *)(g_101ce61c + 8);
    if (v == f_1019bc84[0]
        && g_101d620c != 0
        && g_101d61c8 != 0
        && g_101d61ac == 1)
    {
        v = f_101d61c0[0];
    }
    if (v < f_101ce5f4[0])
    {
        v = f_101ce5f4[0];
    }
    return v;
}
