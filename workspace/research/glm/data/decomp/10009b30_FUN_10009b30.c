// 10009b30 size=88 FUN_10009b30

undefined4 FUN_10009b30(undefined4 param_1)

{
  int iVar1;
  
  iVar1 = FUN_10009a70(param_1);
  if (iVar1 != 0) {
    if (0 < iVar1) {
      do {
        FUN_10009910();
        iVar1 = iVar1 + -1;
      } while (iVar1 != 0);
    }
    return 1;
  }
  return 0;
}


