// 1008309e size=186 FUN_1008309e

undefined4 FUN_1008309e(int param_1)

{
  int iVar1;
  int in_ECX;
  char *pcVar2;
  char *pcVar3;
  bool bVar4;
  
  iVar1 = FUN_100827da(param_1);
  if ((((((iVar1 == 0) || (*(int *)(in_ECX + 0x10) != *(int *)(param_1 + 0x10))) ||
        (*(int *)(in_ECX + 0x14) != *(int *)(param_1 + 0x14))) ||
       ((*(int *)(in_ECX + 0x18) != *(int *)(param_1 + 0x18) ||
        (*(int *)(in_ECX + 0x1c) != *(int *)(param_1 + 0x1c))))) ||
      ((*(int *)(in_ECX + 0x34) != *(int *)(param_1 + 0x34) ||
       ((iVar1 = FUN_100827f5(*(undefined4 *)(in_ECX + 0x20),*(undefined4 *)(param_1 + 0x20)),
        iVar1 == 0 ||
        (iVar1 = FUN_100827f5(*(undefined4 *)(in_ECX + 0x24),*(undefined4 *)(param_1 + 0x24)),
        iVar1 == 0)))))) ||
     ((iVar1 = FUN_100827f5(*(undefined4 *)(in_ECX + 0x28),*(undefined4 *)(param_1 + 0x28)),
      iVar1 == 0 ||
      ((iVar1 = FUN_100827f5(*(undefined4 *)(in_ECX + 0x2c),*(undefined4 *)(param_1 + 0x2c)),
       iVar1 == 0 ||
       (iVar1 = FUN_100827f5(*(undefined4 *)(in_ECX + 0x30),*(undefined4 *)(param_1 + 0x30)),
       iVar1 == 0)))))) {
    return 0;
  }
  if (*(int *)(in_ECX + 0x34) != 0) {
    iVar1 = *(int *)(in_ECX + 0x34) << 2;
    bVar4 = true;
    pcVar2 = *(char **)(in_ECX + 0x38);
    pcVar3 = *(char **)(param_1 + 0x38);
    do {
      if (iVar1 == 0) break;
      iVar1 = iVar1 + -1;
      bVar4 = *pcVar2 == *pcVar3;
      pcVar2 = pcVar2 + 1;
      pcVar3 = pcVar3 + 1;
    } while (bVar4);
    if (!bVar4) {
      return 0;
    }
  }
  return 1;
}


