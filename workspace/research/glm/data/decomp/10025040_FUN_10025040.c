// 10025040 size=694 FUN_10025040

void FUN_10025040(int param_1,undefined4 param_2,undefined4 *param_3,undefined4 param_4,
                 undefined4 param_5)

{
  int in_EAX;
  undefined4 uVar1;
  undefined4 uVar2;
  
  FUN_10024a90(param_1,param_4);
  if (in_EAX == 1) {
    FUN_10027930(param_1,param_2,param_5);
  }
  if (DAT_10696c7c == -1) {
    DAT_10696c78 = '\x01';
    DAT_10696c7c = R_RenderScene();
    FUN_10021840();
    R_ClearScreen(0,0,DAT_101d4c6c,DAT_101d4c70);
    FUN_100249c0();
    FUN_10021770(0);
  }
  if (DAT_10696c78 != '\0') {
    R_BeginDelayedDrawing(DAT_10696c7c);
    DAT_10696c78 = '\0';
  }
  uVar1 = R_RenderScene();
  uVar2 = DAT_10678500;
  *(undefined4 *)(&DAT_10696c80 + param_1 * 4) = uVar1;
  FUN_10021b50(uVar2,param_2);
  FUN_10021890(param_4);
  FUN_10021890(param_4);
  FUN_10021920();
  if (*(int *)(&DAT_10696c80 + param_1 * 4) != -1) {
    R_BeginDelayedDrawing(*(int *)(&DAT_10696c80 + param_1 * 4));
  }
  if (DAT_10696c90 == -1) {
    DAT_10696c78 = '\x01';
    DAT_10696c90 = R_RenderScene();
    if (*(char *)(param_3 + 1) != '\0') {
      FUN_100220c0();
    }
  }
  if (DAT_10696c78 != '\0') {
    R_BeginDelayedDrawing(DAT_10696c90);
    DAT_10696c78 = '\0';
  }
  if (DAT_10696c98 == -1) {
    DAT_10696c94 = '\x01';
    DAT_10696c98 = R_RenderScene();
  }
  if (DAT_10696c94 != '\0') {
    R_BeginDelayedDrawing(DAT_10696c98);
    DAT_10696c94 = '\0';
  }
  uVar2 = R_RenderScene();
  *(undefined4 *)(&DAT_10696c9c + param_1 * 4) = uVar2;
  FUN_10021b50(DAT_10678500,param_2);
  FUN_100247f0();
  FUN_10021890(param_4);
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
  }
  if (DAT_10696cb0 != '\0') {
    R_BeginDelayedDrawing(DAT_10696cb4);
    DAT_10696cb0 = '\0';
  }
  uVar1 = R_RenderScene();
  uVar2 = DAT_10678500;
  *(undefined4 *)(&DAT_10696cb8 + param_1 * 4) = uVar1;
  FUN_10021b50(uVar2,param_2);
  if (*(char *)(param_3 + 1) != '\0') {
    FUN_10022110(*param_3);
  }
  FUN_10022170(param_1);
  return;
}


