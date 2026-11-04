// 10021270 size=143 R_DrawStretchPicRotate

void R_DrawStretchPicRotate
               (undefined4 param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4,
               undefined4 param_5,undefined4 param_6,undefined4 param_7,undefined4 param_8,
               undefined4 param_9)

{
  undefined2 *puVar1;
  int iVar2;
  int iVar3;
  
  iVar3 = DAT_1042e778;
  iVar2 = *(int *)(DAT_1042e778 + 0x30000);
  if ((0x2e000 - iVar2) + *(int *)(DAT_1042e778 + 0x30004) < 0x28) {
    *(undefined4 *)(DAT_1042e778 + 0x30008) = 0;
    return;
  }
  puVar1 = (undefined2 *)(iVar2 + DAT_1042e778);
  *(undefined2 **)(DAT_1042e778 + 0x30008) = puVar1;
  *(int *)(iVar3 + 0x30000) = iVar2 + 0x28;
  *puVar1 = 0x11;
  puVar1[1] = 0x28;
  *(undefined4 *)(puVar1 + 2) = param_1;
  *(undefined4 *)(puVar1 + 4) = param_2;
  *(undefined4 *)(puVar1 + 6) = param_3;
  *(undefined4 *)(puVar1 + 8) = param_4;
  *(undefined4 *)(puVar1 + 10) = param_5;
  *(undefined4 *)(puVar1 + 0xc) = param_6;
  *(undefined4 *)(puVar1 + 0xe) = param_7;
  *(undefined4 *)(puVar1 + 0x10) = param_8;
  *(undefined4 *)(puVar1 + 0x12) = param_9;
  return;
}


