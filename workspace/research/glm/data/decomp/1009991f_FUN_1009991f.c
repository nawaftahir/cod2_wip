// 1009991f size=149 FUN_1009991f

undefined4 FUN_1009991f(int param_1,int param_2)

{
  int iVar1;
  
  if (param_1 == 0) {
    return 0;
  }
  iVar1 = *(int *)(param_1 + 4);
  if (iVar1 == 1) {
    do {
      if (*(int *)(param_1 + 4) != 1) break;
      FUN_1009991f(*(undefined4 *)(param_1 + 8),param_2);
      param_1 = *(int *)(param_1 + 0xc);
    } while (param_1 != 0);
    if (param_1 == 0) {
      return 0;
    }
  }
  else if (iVar1 == 6) {
    param_1 = *(int *)(param_1 + 0x18);
  }
  else if (iVar1 == 8) {
    param_1 = *(int *)(param_1 + 0x10);
  }
  else {
    if (iVar1 == 9) {
      if (param_2 != 0) {
        *(byte *)(param_1 + 0x21) = *(byte *)(param_1 + 0x21) | 2;
        return 0;
      }
      *(byte *)(param_1 + 0x21) = *(byte *)(param_1 + 0x21) & 0xfd;
      return 0;
    }
    if (iVar1 != 0xb) {
      FUN_10099580();
      return 0;
    }
    param_1 = *(int *)(param_1 + 0x20);
  }
  FUN_1009991f(param_1,param_2);
  return 0;
}


