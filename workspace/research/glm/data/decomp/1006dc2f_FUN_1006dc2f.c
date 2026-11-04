// 1006dc2f size=114 FUN_1006dc2f

int FUN_1006dc2f(int param_1)

{
  int iVar1;
  
  if (param_1 != 0) {
    iVar1 = *(int *)(param_1 + 4);
    if (iVar1 == 6) {
      return *(int *)(param_1 + 0x14) + 0x10;
    }
    if (iVar1 != 0xb) {
      if (iVar1 == 0xc) {
        iVar1 = FUN_1006dc2f(*(undefined4 *)(param_1 + 0x14));
        if (iVar1 != 0) {
          return iVar1;
        }
        iVar1 = FUN_1006dc2f(*(undefined4 *)(param_1 + 0x18));
        if (iVar1 != 0) {
          return iVar1;
        }
        iVar1 = FUN_1006dc2f(*(undefined4 *)(param_1 + 0x1c));
        if (iVar1 != 0) {
          return iVar1;
        }
        iVar1 = FUN_1006dc2f(*(undefined4 *)(param_1 + 0x20));
        if (iVar1 != 0) {
          return iVar1;
        }
      }
      else if (iVar1 == 0xd) {
        return param_1 + 0x30;
      }
    }
  }
  return 0;
}


