// 100a07e3 size=89 FUN_100a07e3

int FUN_100a07e3(undefined4 param_1,undefined4 param_2)

{
  int iVar1;
  undefined8 uVar2;
  
  iVar1 = FUN_100a06b8(param_1);
  if (((iVar1 != 0) && (iVar1 = *(int *)(iVar1 + 0x10), iVar1 != 0)) && (*(int *)(iVar1 + 4) == 9))
  {
    uVar2 = FUN_10099ab4(iVar1);
    iVar1 = (int)((ulonglong)uVar2 >> 0x20);
    if ((int)uVar2 != 0) {
      iVar1 = FUN_1009c9f2(param_2,*(int *)(*(int *)(iVar1 + 0x20) + 8) + 0x10,iVar1 + 0x30);
      if (iVar1 < 0) {
        return iVar1;
      }
      return 0;
    }
  }
  return -0x7fffbffb;
}


