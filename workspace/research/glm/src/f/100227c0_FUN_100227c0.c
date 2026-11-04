#define g_101d4c6c (*(int *)0x101D4C6C)
#define g_101d4c70 (*(int *)0x101D4C70)
#define g_101d4c78 (*(int *)0x101D4C78)

void FUN_100227c0(int *param_1, int *param_2)
{
    int metrics_x;
    int metrics_y;
    int sm_cxscreen;
    int sm_cyscreen;

    if (g_101d4c78 != 0)
    {
        *param_1 = g_101d4c6c;
        *param_2 = g_101d4c70;
        return;
    }
    metrics_x = GetSystemMetrics(0x4e);
    metrics_y = GetSystemMetrics(0x4f);
    sm_cxscreen = GetSystemMetrics(0);
    sm_cyscreen = GetSystemMetrics(1);
    if (metrics_x - sm_cxscreen < 0)
    {
        metrics_x = sm_cxscreen;
    }
    *param_1 = metrics_x;
    if (metrics_y - sm_cyscreen >= 0)
    {
        metrics_y = sm_cyscreen;
    }
    *param_2 = metrics_y;
}