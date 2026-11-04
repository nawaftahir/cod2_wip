// 1006c52d size=57 FUN_1006c52d

void FUN_1006c52d(int param_1)

{
  int iVar1;
  int in_ECX;
  
  if (param_1 != 0) {
    *(undefined4 *)(in_ECX + 0x88) = *(undefined4 *)(param_1 + -8);
    iVar1 = *(int *)(param_1 + -4);
    if (iVar1 < 1) {
      *(int *)(in_ECX + 0x8c) = -iVar1;
      _free((undefined4 *)(param_1 + -8));
    }
    else {
      *(int *)(in_ECX + 0x8c) = iVar1;
    }
  }
  return;
}


