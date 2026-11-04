// 100215d0 size=138 R_DrawQuadPic

void R_DrawQuadPic(undefined4 param_1,undefined4 *param_2,undefined4 *param_3,undefined4 param_4,
                  undefined4 param_5,undefined4 param_6)

{
  undefined2 *puVar1;
  int iVar2;
  int iVar3;
  
  iVar3 = DAT_1042e778;
  iVar2 = *(int *)(DAT_1042e778 + 0x30000);
  if ((0x2e000 - iVar2) + *(int *)(DAT_1042e778 + 0x30004) < 0x24) {
    *(undefined4 *)(DAT_1042e778 + 0x30008) = 0;
    return;
  }
  puVar1 = (undefined2 *)(iVar2 + DAT_1042e778);
  *(undefined2 **)(DAT_1042e778 + 0x30008) = puVar1;
  *(int *)(iVar3 + 0x30000) = iVar2 + 0x24;
  *puVar1 = 0x13;
  puVar1[1] = 0x24;
  *(undefined4 *)(puVar1 + 2) = param_1;
  *(undefined4 *)(puVar1 + 4) = *param_2;
  *(undefined4 *)(puVar1 + 6) = *param_3;
  *(undefined4 *)(puVar1 + 8) = param_3[1];
  *(undefined4 *)(puVar1 + 10) = param_3[2];
  *(undefined4 *)(puVar1 + 0xc) = param_4;
  *(undefined4 *)(puVar1 + 0xe) = param_5;
  *(undefined4 *)(puVar1 + 0x10) = param_6;
  return;
}


