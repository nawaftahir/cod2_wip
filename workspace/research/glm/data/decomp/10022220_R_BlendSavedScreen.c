// 10022220 size=118 R_BlendSavedScreen

void R_BlendSavedScreen(undefined1 param_1,undefined4 *param_2,undefined4 param_3,undefined1 param_4
                       )

{
  int *piVar1;
  int iVar2;
  int iVar3;
  undefined2 *puVar4;
  
  iVar3 = DAT_1042e778;
  iVar2 = *(int *)(DAT_1042e778 + 0x30000);
  if (0x30000 - iVar2 < 0x1c) {
    puVar4 = (undefined2 *)0x0;
    *(undefined4 *)(DAT_1042e778 + 0x30008) = 0;
  }
  else {
    puVar4 = (undefined2 *)(iVar2 + DAT_1042e778);
    *(int *)(DAT_1042e778 + 0x30000) = iVar2 + 0x1c;
    piVar1 = (int *)(iVar3 + 0x30004);
    *piVar1 = *piVar1 + 0x1c;
    *(undefined2 **)(iVar3 + 0x30008) = puVar4;
    *puVar4 = 0xb;
    puVar4[1] = 0x1c;
  }
  *(undefined1 *)(puVar4 + 2) = param_1;
  *(undefined4 *)(puVar4 + 4) = param_3;
  *(undefined1 *)((int)puVar4 + 5) = param_4;
  *(undefined4 *)(puVar4 + 6) = *param_2;
  *(undefined4 *)(puVar4 + 8) = param_2[1];
  *(undefined4 *)(puVar4 + 10) = param_2[2];
  *(undefined4 *)(puVar4 + 0xc) = param_2[3];
  return;
}


