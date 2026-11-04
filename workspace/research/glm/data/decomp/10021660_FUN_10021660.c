// 10021660 size=130 FUN_10021660

void FUN_10021660(undefined4 param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4,
                 undefined4 param_5,undefined4 param_6)

{
  undefined2 *puVar1;
  int iVar2;
  int iVar3;
  
  iVar3 = DAT_1042e778;
  iVar2 = *(int *)(DAT_1042e778 + 0x30000);
  if ((0x2e000 - iVar2) + *(int *)(DAT_1042e778 + 0x30004) < 0x1c) {
    *(undefined4 *)(DAT_1042e778 + 0x30008) = 0;
    return;
  }
  puVar1 = (undefined2 *)(iVar2 + DAT_1042e778);
  *(undefined2 **)(DAT_1042e778 + 0x30008) = puVar1;
  *(int *)(iVar3 + 0x30000) = iVar2 + 0x1c;
  *puVar1 = 0x14;
  puVar1[1] = 0x1c;
  *(undefined4 *)(puVar1 + 2) = param_6;
  *(undefined4 *)(puVar1 + 4) = param_1;
  *(undefined4 *)(puVar1 + 6) = param_2;
  *(undefined4 *)(puVar1 + 8) = param_3;
  *(undefined4 *)(puVar1 + 10) = param_4;
  FUN_1002c0b0();
  return;
}


