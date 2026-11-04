// 100831b4 size=103 FUN_100831b4

undefined4 FUN_100831b4(int param_1)

{
  int iVar1;
  int in_ECX;
  
  iVar1 = FUN_100827da(param_1);
  if ((((iVar1 != 0) && (*(int *)(in_ECX + 0x10) == *(int *)(param_1 + 0x10))) &&
      (iVar1 = FUN_100827f5(*(undefined4 *)(in_ECX + 0x14),*(undefined4 *)(param_1 + 0x14)),
      iVar1 != 0)) &&
     (((iVar1 = FUN_100827f5(*(undefined4 *)(in_ECX + 0x18),*(undefined4 *)(param_1 + 0x18)),
       iVar1 != 0 &&
       (iVar1 = FUN_100827f5(*(undefined4 *)(in_ECX + 0x1c),*(undefined4 *)(param_1 + 0x1c)),
       iVar1 != 0)) &&
      (iVar1 = FUN_100827f5(*(undefined4 *)(in_ECX + 0x20),*(undefined4 *)(param_1 + 0x20)),
      iVar1 != 0)))) {
    return 1;
  }
  return 0;
}


