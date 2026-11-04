// 10024a90 size=456 FUN_10024a90

void FUN_10024a90(int param_1,undefined4 param_2,int param_3)

{
  undefined4 uVar1;
  undefined4 uVar2;
  
  if (((*(int *)(DAT_101ce708 + 8) == 2) || (*(char *)(DAT_101ce694 + 8) == '\0')) ||
     (DAT_101d489c == 0)) {
    if (param_3 == 1) {
      if (DAT_10696c44 == -1) {
        DAT_10696c40 = '\x01';
        DAT_10696c44 = R_RenderScene();
        FUN_10021840();
        R_BlendSavedScreen(7,&DAT_10191488,0x3f800000,0);
      }
      if (DAT_10696c40 != '\0') {
        R_BeginDelayedDrawing(DAT_10696c44);
        DAT_10696c40 = '\0';
      }
      uVar2 = R_RenderScene();
      uVar1 = DAT_10678500;
      (&DAT_10696c48)[param_1] = uVar2;
      FUN_10021b50(uVar1);
      FUN_10021890(param_2);
      if ((&DAT_10696c48)[param_1] != -1) {
        R_BeginDelayedDrawing((&DAT_10696c48)[param_1]);
      }
      if (DAT_10696c58 == -1) {
        DAT_10696c40 = '\x01';
        DAT_10696c58 = R_RenderScene();
      }
      if (DAT_10696c40 != '\0') {
        R_BeginDelayedDrawing(DAT_10696c58);
        DAT_10696c40 = '\0';
      }
    }
  }
  else {
    if (DAT_10696c44 == -1) {
      DAT_10696c40 = '\x01';
      DAT_10696c44 = R_RenderScene();
      FUN_10021840();
      FUN_10024a40();
    }
    if (DAT_10696c40 != '\0') {
      R_BeginDelayedDrawing(DAT_10696c44);
      DAT_10696c40 = '\0';
    }
    uVar1 = R_RenderScene();
    (&DAT_10696c48)[param_1] = uVar1;
    FUN_10021b50(DAT_10678500);
    FUN_10021890(param_2);
    FUN_100294e0();
    if (DAT_10696c40 != '\0') {
      R_BeginDelayedDrawing(DAT_10696c58);
      DAT_10696c40 = 0;
      return;
    }
  }
  return;
}


