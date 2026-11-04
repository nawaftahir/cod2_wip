// 10021890 size=108 FUN_10021890

void FUN_10021890(undefined4 param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4)

{
  undefined2 *puVar1;
  int iVar2;
  int iVar3;
  
  iVar3 = DAT_1042e778;
  iVar2 = *(int *)(DAT_1042e778 + 0x30000);
  if ((0x2e000 - iVar2) + *(int *)(DAT_1042e778 + 0x30004) < 0x14) {
    *(undefined4 *)(DAT_1042e778 + 0x30008) = 0;
    return;
  }
  puVar1 = (undefined2 *)(iVar2 + DAT_1042e778);
  *(undefined2 **)(DAT_1042e778 + 0x30008) = puVar1;
  *(int *)(iVar3 + 0x30000) = iVar2 + 0x14;
  *puVar1 = 0x17;
  puVar1[1] = 0x14;
  *(undefined4 *)(puVar1 + 2) = param_4;
  *(undefined4 *)(puVar1 + 4) = param_1;
  *(undefined4 *)(puVar1 + 6) = param_2;
  *(undefined4 *)(puVar1 + 8) = param_3;
  return;
}


