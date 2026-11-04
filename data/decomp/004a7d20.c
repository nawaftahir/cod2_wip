
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_004a7d20(void)

{
  int iVar1;
  undefined4 *puVar2;
  
  DAT_01223280 = &DAT_01182f00;
  FUN_004a7570();
  _DAT_01203200 = 0;
  _DAT_01203204 = 0;
  _DAT_01203208 = 0;
  _DAT_0120320c = 0;
  _DAT_01203210 = 0;
  _DAT_01203214 = 0;
  _DAT_01203218 = 0;
  _DAT_0120321c = 0;
  _DAT_01203220 = 0;
  _DAT_01182f00 = 0;
  _DAT_01182f02 = 0;
  iVar1 = 0;
  do {
    FUN_004a76a0(1 << ((byte)iVar1 & 0x1f));
    iVar1 = iVar1 + 1;
  } while (iVar1 < 0x10);
  DAT_01203224 = 0;
  DAT_01203228 = 0;
  puVar2 = &DAT_01203280;
  for (iVar1 = 0x4000; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar2 = 0;
    puVar2 = puVar2 + 1;
  }
  puVar2 = &DAT_01213280;
  for (iVar1 = 0x4000; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar2 = 0;
    puVar2 = puVar2 + 1;
  }
  return;
}

