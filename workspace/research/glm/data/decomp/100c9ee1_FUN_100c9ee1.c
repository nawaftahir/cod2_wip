// 100c9ee1 size=42 FUN_100c9ee1

int FUN_100c9ee1(void)

{
  int iVar1;
  int *in_ECX;
  
  iVar1 = FUN_100c98b1(0x1d);
  if (-1 < iVar1) {
    iVar1 = (**(code **)(*in_ECX + 0x60))();
    if (-1 < iVar1) {
      iVar1 = FUN_100c4cc4();
      if (-1 < iVar1) {
        iVar1 = 0;
      }
    }
  }
  return iVar1;
}


