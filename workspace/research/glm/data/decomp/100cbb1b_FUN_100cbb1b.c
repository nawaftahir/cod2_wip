// 100cbb1b size=74 FUN_100cbb1b

void FUN_100cbb1b(int param_1,uint param_2)

{
  undefined4 *puVar1;
  undefined4 uVar2;
  int iVar3;
  int in_ECX;
  uint uVar4;
  
  uVar4 = param_2 - param_1 >> 1;
  if (uVar4 != 0) {
    param_1 = param_1 << 2;
    iVar3 = param_2 * 4;
    param_2 = uVar4;
    do {
      iVar3 = iVar3 + -4;
      puVar1 = (undefined4 *)(param_1 + *(int *)(in_ECX + 0x3c));
      uVar2 = *puVar1;
      *puVar1 = *(undefined4 *)(iVar3 + *(int *)(in_ECX + 0x3c));
      *(undefined4 *)(iVar3 + *(int *)(in_ECX + 0x3c)) = uVar2;
      param_1 = param_1 + 4;
      param_2 = param_2 - 1;
    } while (param_2 != 0);
  }
  return;
}


