
undefined4 __fastcall FUN_00429fe0(int param_1)

{
  int in_EAX;
  int iVar1;
  int iVar2;
  int iVar3;
  
  iVar3 = 0;
  if (0 < *(int *)(param_1 + 4)) {
    iVar2 = in_EAX * 0x380 + 0x24 + param_1;
    do {
      if ((*(byte *)(iVar2 + 0x34) & 2) == 0) {
        iVar1 = 0;
        if (DAT_010c4d84 < 1) {
          return 0;
        }
        while (iVar2 != (&DAT_010c4d88)[iVar1]) {
          iVar1 = iVar1 + 1;
          if (DAT_010c4d84 <= iVar1) {
            return 0;
          }
        }
        if (iVar1 == -1) {
          return 0;
        }
      }
      iVar3 = iVar3 + 1;
      iVar2 = iVar2 + 0x38;
    } while (iVar3 < *(int *)(param_1 + 4));
  }
  return 1;
}

