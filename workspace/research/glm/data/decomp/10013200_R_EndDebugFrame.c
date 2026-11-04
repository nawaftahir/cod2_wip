// 10013200 size=79 R_EndDebugFrame

void R_EndDebugFrame(int param_1)

{
  if (*(int *)(&DAT_10696cb8 + param_1 * 4) != -1) {
    R_BeginDelayedDrawing(*(int *)(&DAT_10696cb8 + param_1 * 4));
  }
  if (DAT_10696cc8 == -1) {
    DAT_10696cb0 = '\x01';
    DAT_10696cc8 = R_RenderScene();
  }
  if (DAT_10696cb0 != '\0') {
    R_BeginDelayedDrawing(DAT_10696cc8);
    DAT_10696cb0 = '\0';
  }
  return;
}


