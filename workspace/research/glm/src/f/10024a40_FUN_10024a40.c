extern void R_BlendSavedScreen(int a, const void *b, float c, int d);
extern void FUN_10021660(int a, int b, float c, float d, const void *e, void *f);
extern void *g_whiteMat;
extern void *g_overmat24a40;

void FUN_10024a40(void)
{
    R_BlendSavedScreen(6, &g_whiteMat, 1.0f, 0);
    FUN_10021660(0, 0, 1.0f, 1.0f, &g_whiteMat, g_overmat24a40);
}
