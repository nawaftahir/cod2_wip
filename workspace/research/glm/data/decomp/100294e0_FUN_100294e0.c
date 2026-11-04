// 100294e0 size=70 FUN_100294e0

undefined4 FUN_100294e0(void)

{
  int in_EAX;
  undefined4 uVar1;
  int in_EDX;
  
  if ((&DAT_10696c48)[in_EAX * 7 + in_EDX] != -1) {
    R_BeginDelayedDrawing((&DAT_10696c48)[in_EAX * 7 + in_EDX]);
  }
  if ((&DAT_10696c58)[in_EAX * 7] != -1) {
    return 1;
  }
  (&DAT_10696c40)[in_EAX * 0x1c] = 1;
  uVar1 = R_RenderScene();
  (&DAT_10696c58)[in_EAX * 7] = uVar1;
  return 0;
}


