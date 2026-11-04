// 1008be66 size=94 FUN_1008be66

void FUN_1008be66(int param_1,uint param_2)

{
  int iVar1;
  int in_ECX;
  
  while( true ) {
    if (param_2 == 0) {
      return;
    }
    if ((param_1 != -1) &&
       (iVar1 = *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + param_1 * 4) + 0x38), iVar1 != -1)) {
      param_1 = iVar1;
    }
    iVar1 = *(int *)(*(int *)(in_ECX + 0x14) + param_1 * 4);
    if (*(uint *)(iVar1 + 0x54) < param_2) {
      *(uint *)(iVar1 + 0x54) = param_2;
    }
    if (*(int *)(iVar1 + 8) != -1) {
      FUN_1008be66(*(int *)(iVar1 + 8),*(undefined4 *)(iVar1 + 0x54));
    }
    param_1 = *(int *)(iVar1 + 0x14);
    if (param_1 == -1) break;
    param_2 = *(uint *)(iVar1 + 0x54);
  }
  return;
}


