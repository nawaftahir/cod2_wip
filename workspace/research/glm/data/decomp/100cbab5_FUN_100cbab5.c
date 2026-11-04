// 100cbab5 size=64 FUN_100cbab5

void FUN_100cbab5(int param_1,int param_2)

{
  int *piVar1;
  int iVar2;
  int in_ECX;
  
  do {
    iVar2 = *(int *)(*(int *)(*(int *)(in_ECX + 4) + 0x14) + param_2 * 4);
    if (*(int *)(iVar2 + 0x74) == param_1) {
      piVar1 = (int *)(*(int *)(in_ECX + 0x28) + param_1 * 4);
      *piVar1 = *piVar1 + 1;
    }
    if (*(int *)(iVar2 + 0x54) != 0) {
      *(int *)(iVar2 + 0x74) = param_1;
      piVar1 = (int *)(*(int *)(in_ECX + 0x28) + param_1 * 4);
      *piVar1 = *piVar1 + -1;
    }
    param_2 = *(int *)(iVar2 + 8);
  } while (param_2 != -1);
  return;
}


