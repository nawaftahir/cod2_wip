extern int FUN_10099580();


unsigned int FUN_10099a41(int param_1)

{
  int iVar1;
  
  while( true ) {
    while( true ) {
      while( true ) {
        while( true ) {
          if (param_1 == 0) {
            return 0;
          }
          iVar1 = *(int *)(param_1 + 4);
          if (iVar1 != 1) break;
          iVar1 = FUN_10099a41(*(unsigned int *)(param_1 + 8));
          if (iVar1 != 0) {
            return 1;
          }
          param_1 = *(int *)(param_1 + 0xc);
        }
        if (iVar1 != 6) break;
        param_1 = *(int *)(param_1 + 0x18);
      }
      if (iVar1 != 8) break;
      param_1 = *(int *)(param_1 + 0x10);
    }
    if (iVar1 == 9) {
      return *(unsigned int *)(param_1 + 0x20) & 0x200;
    }
    if (iVar1 != 0xb) break;
    param_1 = *(int *)(param_1 + 0x20);
  }
  FUN_10099580();
  return 0;
}


