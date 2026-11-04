// 10011460 size=100 FUN_10011460

void FUN_10011460(void)

{
  int iVar1;
  int iVar2;
  int unaff_EDI;
  int local_4;
  
  iVar2 = *(int *)(unaff_EDI + 0x20);
  while( true ) {
    if (iVar2 < 2) {
      DAT_101d4814 = 0;
      DAT_101d4818 = 0;
      return;
    }
    DAT_101d4814 = iVar2;
    iVar1 = (**(code **)(*DAT_101d1bf4 + 0x2c))
                      (DAT_101d1bf4,0,1,0x15,*(char *)(unaff_EDI + 8) == '\0',iVar2,&local_4);
    if (-1 < iVar1) break;
    iVar2 = iVar2 + -1;
  }
  DAT_101d4818 = local_4 + -1;
  return;
}


