// 100cba4c size=105 FUN_100cba4c

void FUN_100cba4c(int param_1,int param_2)

{
  int *piVar1;
  int iVar2;
  int in_ECX;
  
  iVar2 = *(int *)(*(int *)(*(int *)(in_ECX + 4) + 0x14) + param_2 * 4);
  if (((*(byte *)(*(int *)(*(int *)(*(int *)(in_ECX + 4) + 0x10) + *(int *)(iVar2 + 4) * 4) + 4) &
       0x20) == 0) && (*(int *)(iVar2 + 0x5c) != 0)) {
    if (*(int *)(in_ECX + 0x24) != 0) {
      *(int *)(*(int *)(in_ECX + 0x24) +
              (*(int *)(*(int *)(in_ECX + 0x20) + param_1 * 4) +
              *(int *)(*(int *)(in_ECX + 0x1c) + param_1 * 4)) * 4) = param_2;
    }
    piVar1 = (int *)(*(int *)(in_ECX + 0x1c) + param_1 * 4);
    *piVar1 = *piVar1 + 1;
  }
  if (*(int *)(iVar2 + 0x14) != -1) {
    FUN_100cb9d7(param_1,*(int *)(iVar2 + 0x14));
  }
  return;
}


