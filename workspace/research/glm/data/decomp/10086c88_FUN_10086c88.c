// 10086c88 size=33 FUN_10086c88

int FUN_10086c88(int param_1)

{
  int iVar1;
  int in_ECX;
  
  if ((param_1 == -1) ||
     (iVar1 = *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + param_1 * 4) + 0x38), iVar1 == -1)) {
    iVar1 = param_1;
  }
  return iVar1;
}


