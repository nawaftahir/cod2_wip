// 10082f4a size=192 FUN_10082f4a

undefined4 FUN_10082f4a(int param_1)

{
  int iVar1;
  int in_ECX;
  
  iVar1 = FUN_100827da(param_1);
  if (((((iVar1 != 0) && (*(int *)(in_ECX + 0x10) == *(int *)(param_1 + 0x10))) &&
       (*(int *)(in_ECX + 0x14) == *(int *)(param_1 + 0x14))) &&
      (((*(int *)(in_ECX + 0x18) == *(int *)(param_1 + 0x18) &&
        (*(int *)(in_ECX + 0x38) == *(int *)(param_1 + 0x38))) &&
       ((*(int *)(in_ECX + 0x3c) == *(int *)(param_1 + 0x3c) &&
        ((iVar1 = FUN_100827f5(*(undefined4 *)(in_ECX + 0x1c),*(undefined4 *)(param_1 + 0x1c)),
         iVar1 != 0 &&
         (iVar1 = FUN_100827f5(*(undefined4 *)(in_ECX + 0x20),*(undefined4 *)(param_1 + 0x20)),
         iVar1 != 0)))))))) &&
     ((iVar1 = FUN_100827f5(*(undefined4 *)(in_ECX + 0x24),*(undefined4 *)(param_1 + 0x24)),
      iVar1 != 0 &&
      ((((iVar1 = FUN_100827f5(*(undefined4 *)(in_ECX + 0x28),*(undefined4 *)(param_1 + 0x28)),
         iVar1 != 0 &&
         (iVar1 = FUN_100827f5(*(undefined4 *)(in_ECX + 0x2c),*(undefined4 *)(param_1 + 0x2c)),
         iVar1 != 0)) &&
        (iVar1 = FUN_100827f5(*(undefined4 *)(in_ECX + 0x30),*(undefined4 *)(param_1 + 0x30)),
        iVar1 != 0)) &&
       (iVar1 = FUN_100827f5(*(undefined4 *)(in_ECX + 0x34),*(undefined4 *)(param_1 + 0x34)),
       iVar1 != 0)))))) {
    return 1;
  }
  return 0;
}


