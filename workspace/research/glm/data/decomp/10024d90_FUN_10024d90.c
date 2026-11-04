// 10024d90 size=451 FUN_10024d90

void FUN_10024d90(int param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4)

{
  undefined4 uVar1;
  undefined4 uVar2;
  
  if (DAT_10696c98 == -1) {
    DAT_10696c94 = '\x01';
    DAT_10696c98 = R_RenderScene();
    FUN_10021840();
    R_ClearScreen(0,0,DAT_101d4c6c,DAT_101d4c70);
    if ((((DAT_101d4818 == 0) || (*(int *)(DAT_101ce708 + 8) == 2)) ||
        (*(char *)(DAT_101ce694 + 8) == '\0')) || (uVar2 = 1, DAT_101d489c == 0)) {
      uVar2 = 7;
    }
    uVar1 = FUN_10024920();
    R_BlendSavedScreen(uVar2,uVar1,0x3f800000,0);
  }
  if (DAT_10696c94 != '\0') {
    R_BeginDelayedDrawing(DAT_10696c98);
    DAT_10696c94 = '\0';
  }
  uVar1 = R_RenderScene();
  uVar2 = DAT_10678500;
  *(undefined4 *)(&DAT_10696c9c + param_1 * 4) = uVar1;
  FUN_10021b50(uVar2,param_2);
  FUN_10021890(param_3,param_4,3,0);
  FUN_10021920();
  if (*(int *)(&DAT_10696c9c + param_1 * 4) != -1) {
    R_BeginDelayedDrawing(*(int *)(&DAT_10696c9c + param_1 * 4));
  }
  if (DAT_10696cac == -1) {
    DAT_10696c94 = '\x01';
    DAT_10696cac = R_RenderScene();
  }
  if (DAT_10696c94 != '\0') {
    R_BeginDelayedDrawing(DAT_10696cac);
    DAT_10696c94 = '\0';
  }
  if (DAT_10696cb4 == -1) {
    DAT_10696cb0 = '\x01';
    DAT_10696cb4 = R_RenderScene();
    R_ClearScreen(0,0,DAT_101d4c6c,DAT_101d4c70);
  }
  if (DAT_10696cb0 != '\0') {
    R_BeginDelayedDrawing(DAT_10696cb4);
    DAT_10696cb0 = '\0';
  }
  uVar1 = R_RenderScene();
  uVar2 = DAT_10678500;
  *(undefined4 *)(&DAT_10696cb8 + param_1 * 4) = uVar1;
  FUN_10021b50(uVar2,param_2);
  return;
}


