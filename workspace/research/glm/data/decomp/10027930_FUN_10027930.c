// 10027930 size=839 FUN_10027930

void FUN_10027930(int param_1,undefined4 param_2,int param_3)

{
  int iVar1;
  undefined4 uVar2;
  int iVar3;
  undefined2 *puVar4;
  int iVar5;
  undefined4 *puVar6;
  bool bVar7;
  int local_18;
  undefined4 local_10;
  undefined4 local_c;
  undefined4 local_8;
  undefined4 local_4;
  
  bVar7 = DAT_10696c60 == -1;
  if (bVar7) {
    DAT_10696c5c = '\x01';
    DAT_10696c60 = R_RenderScene();
  }
  if (DAT_10696c5c != '\0') {
    R_BeginDelayedDrawing(DAT_10696c60);
    DAT_10696c5c = '\0';
  }
  uVar2 = R_RenderScene();
  (&DAT_10696c64)[param_1] = uVar2;
  local_10 = 0x3f000000;
  local_c = 0x3f000000;
  local_8 = 0x3f000000;
  local_4 = 0;
  local_18 = 0;
  if (*(int *)(param_3 + 0xa20) != 0) {
    puVar6 = (undefined4 *)(param_3 + 0x68);
    do {
      iVar3 = puVar6[-0x18] - puVar6[-0x19];
      iVar5 = puVar6[-0x19] - puVar6[-0x1a];
      if (((iVar3 != 0) && (iVar5 != 0)) && (local_18 < *(int *)(DAT_101ce810 + 8))) {
        FUN_10021ae0(puVar6 + -0x17,*puVar6);
        FUN_10021840();
        R_BlendSavedScreen(7,&local_10,0x3f800000,0);
        FUN_10021b50(DAT_10678500,puVar6[-1]);
        R_ClearScreen(1,1,0x7e,0x7e);
        iVar1 = DAT_10678abc + puVar6[-0x1a] * 8;
        FUN_100244b0();
        FUN_10021890(iVar1,iVar5,0x1f,0);
        R_ClearScreen(0,0,0x80,0x80);
        if (*(int *)(DAT_101ce830 + 8) != 0) {
          FUN_100221d0();
        }
        FUN_10021840();
        if (((bVar7) && (bVar7 = false, *(int *)(DAT_101ce708 + 8) != 2)) &&
           ((*(char *)(DAT_101ce694 + 8) != '\0' && (DAT_101d489c != 0)))) {
          R_BlendSavedScreen(1,&DAT_10191488,0,0);
        }
        FUN_10021b50(DAT_10678500,param_2);
        if (local_18 < *(int *)(DAT_101ce640 + 8)) {
          iVar5 = DAT_10678abc + puVar6[-0x19] * 8;
          FUN_100244b0();
          FUN_10021890(iVar5,iVar3,0x20,0);
        }
      }
      local_18 = local_18 + 1;
      puVar6 = puVar6 + 0x1b;
    } while (local_18 != *(int *)(param_3 + 0xa20));
  }
  iVar3 = DAT_1042e778;
  if (bVar7) {
    iVar5 = *(int *)(DAT_1042e778 + 0x30000);
    if (0x30000 - iVar5 < 8) {
      puVar4 = (undefined2 *)0x0;
      *(undefined4 *)(DAT_1042e778 + 0x30008) = 0;
    }
    else {
      puVar4 = (undefined2 *)(iVar5 + DAT_1042e778);
      *(int *)(DAT_1042e778 + 0x30000) = iVar5 + 8;
      *(int *)(iVar3 + 0x30004) = *(int *)(iVar3 + 0x30004) + 8;
      *(undefined2 **)(iVar3 + 0x30008) = puVar4;
      *puVar4 = 0xe;
      puVar4[1] = 8;
    }
    *(undefined4 *)(puVar4 + 2) = 3;
    if (((*(int *)(DAT_101ce708 + 8) != 2) && (*(char *)(DAT_101ce694 + 8) != '\0')) &&
       (DAT_101d489c != 0)) {
      R_BlendSavedScreen(1,&DAT_10191488,0,0);
    }
  }
  if ((&DAT_10696c64)[param_1] != -1) {
    R_BeginDelayedDrawing((&DAT_10696c64)[param_1]);
  }
  if (DAT_10696c74 == -1) {
    DAT_10696c5c = '\x01';
    DAT_10696c74 = *(int *)(iVar3 + 0x30000);
    if (0x30000 - DAT_10696c74 < 8) {
      puVar4 = (undefined2 *)0x0;
      *(undefined4 *)(iVar3 + 0x30008) = 0;
    }
    else {
      *(int *)(iVar3 + 0x30000) = DAT_10696c74 + 8;
      puVar4 = (undefined2 *)(DAT_10696c74 + iVar3);
      *(int *)(iVar3 + 0x30004) = *(int *)(iVar3 + 0x30004) + 8;
      *(undefined2 **)(iVar3 + 0x30008) = puVar4;
      *puVar4 = 1;
      puVar4[1] = 8;
    }
    *(undefined4 *)(puVar4 + 2) = 0;
  }
  if (DAT_10696c5c != '\0') {
    R_BeginDelayedDrawing(DAT_10696c74);
    DAT_10696c5c = '\0';
  }
  return;
}


