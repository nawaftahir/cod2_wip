extern int FUN_10099580();
extern int FUN_10099b4f();


unsigned int FUN_10099f62(int param_1,unsigned int param_2,int param_3)

{
  int iVar1;
  unsigned int uVar2;
  
  while( true ) {
    while( true ) {
      while( true ) {
        while( true ) {
          if (param_1 == 0) {
            return 0x80004005;
          }
          iVar1 = *(int *)(param_1 + 4);
          if (iVar1 != 1) break;
          uVar2 = FUN_10099b4f(*(unsigned int *)(param_1 + 8));
          if (param_2 < uVar2) {
            param_1 = *(int *)(param_1 + 8);
          }
          else {
            param_1 = *(int *)(param_1 + 0xc);
            param_2 = param_2 - uVar2;
          }
        }
        if (iVar1 != 6) break;
        param_1 = *(int *)(param_1 + 0x18);
      }
      if (iVar1 != 8) break;
      param_1 = *(int *)(param_1 + 0x10);
      uVar2 = FUN_10099b4f(param_1);
      if (uVar2 == 0) {
        return 0x80004005;
      }
      param_2 = param_2 % uVar2;
    }
    if (iVar1 == 9) {
      iVar1 = *(int *)(param_1 + 0x10);
      if (((iVar1 == 0) || (iVar1 == 1)) || (iVar1 == 2)) {
        *(unsigned int *)(param_3 + 0x10) = 0;
      }
      else if (iVar1 == 3) {
        *(unsigned int *)(param_3 + 0x10) = 3;
      }
      *(unsigned int *)(param_3 + 0x14) = *(unsigned int *)(param_1 + 0x14);
      *(unsigned int *)(param_3 + 0x18) = 1;
      *(unsigned int *)(param_3 + 0x1c) = 1;
      *(unsigned int *)(param_3 + 0x20) = *(unsigned int *)(param_1 + 0x20) & 0x200;
      return 0;
    }
    if (iVar1 != 0xb) break;
    param_1 = *(int *)(param_1 + 0x20);
  }
  FUN_10099580();
  return 0;
}


