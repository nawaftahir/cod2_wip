// 100697fc size=85 FUN_100697fc

int FUN_100697fc(int param_1)

{
  int *piVar1;
  uint uVar2;
  int iVar3;
  int in_ECX;
  
  piVar1 = *(int **)(in_ECX + 8);
  if (piVar1 != (int *)0x0) {
    uVar2 = *(uint *)(in_ECX + 100);
    if (uVar2 < *(uint *)(in_ECX + 0x5c)) {
      *(int *)(in_ECX + 0x30) = param_1;
      iVar3 = (**(code **)(*piVar1 + 0x10))
                        (piVar1,*(undefined4 *)(param_1 + 0x10),*(undefined4 *)(param_1 + 0x14),
                         *(int *)(in_ECX + 0x58) + uVar2 * 4,*(uint *)(in_ECX + 0x5c) - uVar2);
      if (iVar3 < 0) {
        *(undefined4 *)(in_ECX + 0x4c) = 1;
        *(undefined4 *)(in_ECX + 0x50) = 1;
      }
      *(undefined4 *)(in_ECX + 100) = *(undefined4 *)(in_ECX + 0x5c);
      return iVar3;
    }
  }
  return 0;
}


