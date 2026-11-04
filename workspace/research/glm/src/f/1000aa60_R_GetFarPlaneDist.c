extern void *g_farPlaneDvar;   /* 0x101ce61c; value at +8 */
extern int g_cond1;            /* 0x101d620c */
extern char g_cond2;           /* 0x101d61c8 */
extern int g_cond3;            /* 0x101d61ac */
extern float g_fallback;       /* 0x101d61c0 */
extern float g_minDist;        /* 0x101ce5f4 */

float R_GetFarPlaneDist(void)
{
    float dist;

    dist = *(float *)((char *)g_farPlaneDvar + 8);
    if (dist == 0.0f && g_cond1 != 0 && g_cond2 != 0 && g_cond3 == 1)
        dist = g_fallback;
    if (dist < g_minDist)
        dist = g_minDist;
    return dist;
}
