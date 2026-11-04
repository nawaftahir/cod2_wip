// 10081b61 size=41 FUN_10081b61

int FUN_10081b61(undefined4 param_1)

{
  int iVar1;
  int in_ECX;
  
  iVar1 = FUN_10081a12(param_1);
  if (-1 < iVar1) {
    *(int *)(in_ECX + 0x10) = *(int *)(in_ECX + 0xc);
    *(int *)(in_ECX + 0x14) = *(int *)(in_ECX + 8) + *(int *)(in_ECX + 0xc);
    iVar1 = 0;
  }
  return iVar1;
}


