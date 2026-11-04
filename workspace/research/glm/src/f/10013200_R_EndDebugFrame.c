extern void R_BeginDelayedDrawing(int marker);
extern int R_RenderScene(void);
extern int g_debugCube[6];
extern char g_dbgPending;

void R_EndDebugFrame(int index)
{
    if (g_debugCube[index] != -1)
    {
        R_BeginDelayedDrawing(g_debugCube[index]);
    }
    if (g_debugCube[7] == -1)
    {
        g_dbgPending = 1;
        g_debugCube[7] = R_RenderScene();
    }
    if (g_dbgPending != 0)
    {
        R_BeginDelayedDrawing(g_debugCube[7]);
        g_dbgPending = 0;
    }
}
