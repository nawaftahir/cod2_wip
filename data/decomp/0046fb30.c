
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_0046fb30(void)

{
  int iVar1;
  bool bVar2;
  
  if (DAT_012485b8 != (void *)0x0) {
    _free(DAT_012485b8);
    DAT_012485b8 = (void *)0x0;
  }
  iVar1 = DAT_011298b0;
  bVar2 = DAT_011298b0 == 0xb;
  _DAT_012485c0 = 0;
  DAT_012485bc = 0;
  DAT_011298b0 = 0;
  if (bVar2) {
    FUN_0041b190();
  }
  else if (iVar1 == 10) {
    FUN_0042beb0();
  }
  DAT_011298b4 = 0;
  DAT_01129898 = 0;
  DAT_010c4d84 = 0;
  if (DAT_010a44b8 != &DAT_010a44b4) {
    do {
      iVar1 = DAT_010a44b8[2];
      FUN_00458c00();
      if ((*(int *)(iVar1 + 0x18) == iVar1 + 0xc) && (iVar1 != DAT_012334ec)) {
        FUN_004678c0();
      }
    } while (DAT_010a44b8 != &DAT_010a44b4);
  }
  DAT_0123348c = 0xffffffff;
  return;
}

