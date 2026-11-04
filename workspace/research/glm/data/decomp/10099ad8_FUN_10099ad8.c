// 10099ad8 size=119 FUN_10099ad8

undefined4 FUN_10099ad8(int param_1)

{
  int iVar1;
  
  while( true ) {
    while( true ) {
      while( true ) {
        while( true ) {
          if (param_1 == 0) {
            return 1;
          }
          iVar1 = *(int *)(param_1 + 4);
          if (iVar1 != 1) break;
          iVar1 = FUN_10099ad8(*(undefined4 *)(param_1 + 8));
          if (iVar1 == 0) {
            return 0;
          }
          param_1 = *(int *)(param_1 + 0xc);
        }
        if (iVar1 != 6) break;
        param_1 = *(int *)(param_1 + 0x18);
      }
      if (iVar1 != 8) break;
      param_1 = *(int *)(param_1 + 0x10);
    }
    if (iVar1 == 9) break;
    if (iVar1 != 0xb) {
      FUN_10099580();
      return 0;
    }
    param_1 = *(int *)(param_1 + 0x20);
  }
  if (*(int *)(param_1 + 0x10) < 0) {
    return 0;
  }
  if (2 < *(int *)(param_1 + 0x10)) {
    return 0;
  }
  return 1;
}


