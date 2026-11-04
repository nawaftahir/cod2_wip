


int FUN_100c3da3(int param_1)

{
  int iVar1;
  int iVar2;
  
  while( true ) {
    while( true ) {
      if (param_1 == 0) {
        return 0;
      }
      iVar1 = *(int *)(param_1 + 4);
      if (iVar1 == 1) {
        iVar1 = FUN_100c3da3(*(unsigned int *)(param_1 + 0xc));
        iVar2 = FUN_100c3da3(*(unsigned int *)(param_1 + 8));
        return iVar2 + iVar1;
      }
      if (iVar1 != 6) break;
      param_1 = *(int *)(param_1 + 0x18);
    }
    if (iVar1 == 8) {
      iVar1 = FUN_100c3da3(*(unsigned int *)(param_1 + 0x10));
      return iVar1 * *(int *)(param_1 + 0x14);
    }
    if (iVar1 == 9) break;
    if (iVar1 != 0xb) {
      return 0;
    }
    param_1 = *(int *)(param_1 + 0x20);
  }
  return *(int *)(param_1 + 0x1c) * *(int *)(param_1 + 0x18);
}


