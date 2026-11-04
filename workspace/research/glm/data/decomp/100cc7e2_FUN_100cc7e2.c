// 100cc7e2 size=57 FUN_100cc7e2

undefined4 FUN_100cc7e2(short *param_1,int param_2,int *param_3)

{
  int iVar1;
  
  iVar1 = param_2;
  if (param_2 != 0) {
    do {
      if (*param_1 == 0) break;
      param_1 = param_1 + 1;
      iVar1 = iVar1 + -1;
    } while (iVar1 != 0);
    if (iVar1 != 0) {
      if (param_3 == (int *)0x0) {
        return 0;
      }
      *param_3 = param_2 - iVar1;
      return 0;
    }
  }
  return 0x80070057;
}


