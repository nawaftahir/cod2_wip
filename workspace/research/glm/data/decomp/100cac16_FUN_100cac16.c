// 100cac16 size=42 FUN_100cac16

int FUN_100cac16(void)

{
  int iVar1;
  int *in_ECX;
  
  iVar1 = FUN_100c98b1(0x2b);
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


