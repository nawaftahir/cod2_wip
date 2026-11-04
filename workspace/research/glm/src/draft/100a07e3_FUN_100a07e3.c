extern int FUN_10099ab4();
extern int FUN_1009c9f2();
extern int FUN_100a06b8();


int FUN_100a07e3(unsigned int param_1,unsigned int param_2)

{
  int iVar1;
  unsigned long long uVar2;
  
  iVar1 = FUN_100a06b8(param_1);
  if (((iVar1 != 0) && (iVar1 = *(int *)(iVar1 + 0x10), iVar1 != 0)) && (*(int *)(iVar1 + 4) == 9))
  {
    uVar2 = FUN_10099ab4(iVar1);
    iVar1 = (int)((unsigned long long)uVar2 >> 0x20);
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


