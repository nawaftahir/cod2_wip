// 100183c0 size=90 FUN_100183c0

bool FUN_100183c0(void)

{
  int iVar1;
  int unaff_EDI;
  
  iVar1 = FUN_1005faf0();
  if (iVar1 != 0) {
    iVar1 = FUN_1005faf0(&DAT_101958cc,1);
    if (iVar1 != 0) {
      iVar1 = FUN_1005ff30();
      if (iVar1 == unaff_EDI) {
        iVar1 = FUN_1005faf0(&DAT_101958a8,1);
        return iVar1 != 0;
      }
      FUN_1005f360("expected %i, found %i instead\n");
    }
  }
  return false;
}


