// 100832a4 size=127 FUN_100832a4

undefined4 FUN_100832a4(int param_1)

{
  int iVar1;
  int in_ECX;
  
  iVar1 = FUN_100827da(param_1);
  if ((((((iVar1 != 0) && (*(int *)(in_ECX + 0x14) == *(int *)(param_1 + 0x14))) &&
        (*(int *)(in_ECX + 0x18) == *(int *)(param_1 + 0x18))) &&
       ((*(int *)(in_ECX + 0x1c) == *(int *)(param_1 + 0x1c) &&
        (*(int *)(in_ECX + 0x28) == *(int *)(param_1 + 0x28))))) &&
      ((iVar1 = FUN_10082999(), iVar1 != 0 &&
       ((iVar1 = FUN_100827f5(*(undefined4 *)(in_ECX + 0x10),*(undefined4 *)(param_1 + 0x10)),
        iVar1 != 0 &&
        (iVar1 = FUN_100827f5(*(undefined4 *)(in_ECX + 0x20),*(undefined4 *)(param_1 + 0x20)),
        iVar1 != 0)))))) &&
     (iVar1 = FUN_100827f5(*(undefined4 *)(in_ECX + 0x24),*(undefined4 *)(param_1 + 0x24)),
     iVar1 != 0)) {
    return 1;
  }
  return 0;
}


