// 100214e0 size=225 R_DrawStretchRaw

void R_DrawStretchRaw(undefined4 *param_1,int param_2,undefined4 param_3)

{
  undefined2 *puVar1;
  int iVar2;
  int iVar3;
  undefined1 uVar4;
  
  iVar3 = DAT_1042e778;
  iVar2 = *(int *)(DAT_1042e778 + 0x30000);
  if ((0x2e000 - iVar2) + *(int *)(DAT_1042e778 + 0x30004) < 0x2c) {
    *(undefined4 *)(DAT_1042e778 + 0x30008) = 0;
    return;
  }
  puVar1 = (undefined2 *)(iVar2 + DAT_1042e778);
  *(undefined2 **)(DAT_1042e778 + 0x30008) = puVar1;
  *(int *)(iVar3 + 0x30000) = iVar2 + 0x2c;
  *puVar1 = 0x12;
  puVar1[1] = 0x2c;
  *(undefined4 *)(puVar1 + 2) = param_3;
  *(undefined4 *)(puVar1 + 4) = *param_1;
  *(undefined4 *)(puVar1 + 6) = param_1[1];
  *(undefined4 *)(puVar1 + 8) = param_1[2];
  *(undefined4 *)(puVar1 + 10) = param_1[3];
  *(undefined4 *)(puVar1 + 0xc) = param_1[4];
  *(undefined4 *)(puVar1 + 0xe) = param_1[5];
  *(undefined4 *)(puVar1 + 0x10) = param_1[6];
  *(undefined4 *)(puVar1 + 0x12) = param_1[7];
  if (param_2 == 0) {
    *(undefined4 *)(puVar1 + 0x14) = 0xffffffff;
    return;
  }
  uVar4 = FUN_1010a8a8();
  *(undefined1 *)(puVar1 + 0x14) = uVar4;
  uVar4 = FUN_1010a8a8();
  *(undefined1 *)((int)puVar1 + 0x29) = uVar4;
  uVar4 = FUN_1010a8a8();
  *(undefined1 *)(puVar1 + 0x15) = uVar4;
  uVar4 = FUN_1010a8a8();
  *(undefined1 *)((int)puVar1 + 0x2b) = uVar4;
  return;
}


