// 1008a84c size=98 FUN_1008a84c

void FUN_1008a84c(int param_1,undefined4 param_2)

{
  int *piVar1;
  int iVar2;
  int iVar3;
  int in_ECX;
  
  iVar2 = *(int *)(*(int *)(in_ECX + 0x14) + param_1 * 4);
  iVar3 = *(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar2 + 4) * 4);
  *(undefined4 *)(iVar2 + 0x48) = param_2;
  iVar3 = *(int *)(iVar3 + 0x20);
  if (iVar3 != 0) {
    piVar1 = (int *)(iVar3 + (*(int *)(iVar2 + 0x10) + *(int *)(iVar2 + 0xc) * 4) * 4);
    if (*piVar1 != -1) {
      *(int *)(iVar2 + 0x4c) = *piVar1;
      *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *piVar1 * 4) + 0x50) = param_1;
    }
    *piVar1 = param_1;
  }
  if (*(int *)(iVar2 + 0x14) != -1) {
    FUN_1008a7ee(*(int *)(iVar2 + 0x14),param_2);
  }
  return;
}


