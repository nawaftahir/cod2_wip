// 1008a7ee size=94 FUN_1008a7ee

void FUN_1008a7ee(int param_1,uint param_2)

{
  int iVar1;
  int iVar2;
  int in_ECX;
  
  while( true ) {
    iVar2 = *(int *)(*(int *)(in_ECX + 0x14) + param_1 * 4);
    if (*(int *)(iVar2 + 0x38) != -1) {
      iVar2 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)(iVar2 + 0x38) * 4);
    }
    iVar1 = *(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar2 + 4) * 4);
    if (param_2 < *(uint *)(iVar2 + 0x54)) {
      *(uint *)(iVar2 + 0x54) = param_2;
    }
    if (*(uint *)(iVar2 + 0x58) < param_2) {
      *(uint *)(iVar2 + 0x58) = param_2;
    }
    *(int *)(iVar2 + 0x5c) = *(int *)(iVar2 + 0x5c) + 1;
    if (*(int *)(iVar2 + 8) == -1) break;
    if (param_2 < *(uint *)(iVar1 + 0x28)) {
      *(uint *)(iVar1 + 0x28) = param_2;
    }
    if (*(uint *)(iVar1 + 0x2c) < param_2) {
      *(uint *)(iVar1 + 0x2c) = param_2;
    }
    *(int *)(iVar1 + 0x30) = *(int *)(iVar1 + 0x30) + 1;
    param_1 = *(int *)(iVar2 + 8);
  }
  return;
}


