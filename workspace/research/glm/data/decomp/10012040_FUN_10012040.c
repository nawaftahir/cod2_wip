// 10012040 size=116 FUN_10012040

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_10012040(void)

{
  int iVar1;
  undefined4 *puVar2;
  
  FUN_1000d880();
  FUN_100173e0();
  DAT_101d5d28 = 0;
  DAT_101d1b28 = FUN_10014c60();
  puVar2 = &DAT_101d616c;
  for (iVar1 = 0x28; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar2 = 0;
    puVar2 = puVar2 + 1;
  }
  puVar2 = &DAT_101ae4b8;
  for (iVar1 = 0x15; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar2 = 0;
    puVar2 = puVar2 + 1;
  }
  DAT_101d620c = 0;
  _DAT_101ae4c0 = 0x1000;
  _DAT_101ae4cc = 0x200;
  _DAT_101ae4d8 = 0x1000;
  _DAT_101ae4f0 = 0x4000;
  DAT_101ae508 = 0x1000;
  DAT_101d4d00 = 1;
  return;
}


