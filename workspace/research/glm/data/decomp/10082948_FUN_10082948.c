// 10082948 size=80 FUN_10082948

bool FUN_10082948(int param_1)

{
  int iVar1;
  int in_ECX;
  
  iVar1 = FUN_100827da(param_1);
  if ((((iVar1 != 0) && (*(int *)(in_ECX + 0x10) == *(int *)(param_1 + 0x10))) &&
      (*(int *)(in_ECX + 0x14) == *(int *)(param_1 + 0x14))) &&
     (iVar1 = FUN_100827f5(*(undefined4 *)(in_ECX + 8),*(undefined4 *)(param_1 + 8)), iVar1 != 0)) {
    iVar1 = FUN_100827f5(*(undefined4 *)(in_ECX + 0xc),*(undefined4 *)(param_1 + 0xc));
    return iVar1 != 0;
  }
  return false;
}


