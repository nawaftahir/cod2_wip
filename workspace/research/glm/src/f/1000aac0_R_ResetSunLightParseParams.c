extern float g_minSunDist;        /* 0x101ce5f4 */

void R_ResetSunLightParseParams(float f)
{
    if (f <= 0.0f)
        g_minSunDist = 0.0f;
    else
        g_minSunDist = f;
}
