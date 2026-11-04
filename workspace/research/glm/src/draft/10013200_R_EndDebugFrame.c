extern unsigned int DAT_10696cb0;
extern unsigned int DAT_10696cb8;
extern unsigned int DAT_10696cc8;


void R_EndDebugFrame(int param_1)

{
  if (*(int *)(&g_10696cb8 + param_1 * 4) != -1) {
 
	int g_10696cb8 = DAT_10696cb8;   R_BeginDelayedDrawing(*(int *)(&g_10696cb8 + param_1 * 4));
  }
  if (g_10696cc8 == -1) {
 
	int g_10696cc8 = DAT_10696cc8;   g_10696cb0 = '\x01';
    g_1
	int g_10696cb0 = DAT_10696cb0;0696cc8 = R_RenderScene();
  }
  if (g_10696cb0 != '\0') {
    R_BeginDelayedDrawing(g_10696cc8);
    g_10696cb0 = '\0';
  }
  return;
}


