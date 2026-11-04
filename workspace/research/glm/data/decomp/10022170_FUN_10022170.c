// 10022170 size=86 FUN_10022170

void FUN_10022170(undefined4 param_1)

{
  undefined2 *puVar1;
  int iVar2;
  int iVar3;
  
  iVar3 = DAT_1042e778;
  iVar2 = *(int *)(DAT_1042e778 + 0x30000);
  if ((0x2e000 - iVar2) + *(int *)(DAT_1042e778 + 0x30004) < 8) {
    *(undefined4 *)(DAT_1042e778 + 0x30008) = 0;
    return;
  }
  puVar1 = (undefined2 *)(iVar2 + DAT_1042e778);
  *(undefined2 **)(DAT_1042e778 + 0x30008) = puVar1;
  *(int *)(iVar3 + 0x30000) = iVar2 + 8;
  *puVar1 = 0x1b;
  puVar1[1] = 8;
  *(undefined4 *)(puVar1 + 2) = param_1;
  return;
}


