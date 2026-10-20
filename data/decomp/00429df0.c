
int __fastcall FUN_00429df0(undefined4 param_1,int param_2)

{
  int iVar1;
  
  iVar1 = 0;
  if (0 < DAT_010c4d84) {
    do {
      if (param_2 == (&DAT_010c4d88)[iVar1]) {
        return iVar1;
      }
      iVar1 = iVar1 + 1;
    } while (iVar1 < DAT_010c4d84);
  }
  return -1;
}

