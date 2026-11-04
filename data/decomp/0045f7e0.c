
void FUN_0045f7e0(void)

{
  int iVar1;
  int iVar2;
  int iVar3;
  
  iVar1 = DAT_012485bc;
  iVar3 = 0;
  if (DAT_012485bc != 0) {
    iVar2 = 0;
    do {
      if ((iVar2 < 0) || (DAT_012485bc <= iVar3)) {
                    /* WARNING: Subroutine does not return */
        FUN_004f3bd2();
      }
      FUN_0045a830();
      iVar3 = iVar3 + 1;
      iVar2 = iVar2 + 0xc;
    } while (iVar3 != iVar1);
  }
  return;
}

