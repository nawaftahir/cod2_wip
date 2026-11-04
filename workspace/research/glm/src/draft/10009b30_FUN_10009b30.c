extern int FUN_10009910();
extern int FUN_10009a70();


unsigned int FUN_10009b30(unsigned int param_1)

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


