// 1000d880 size=124 FUN_1000d880

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_1000d880(void)

{
  int iVar1;
  
  FUN_1000d680();
  FUN_1000d560();
  iVar1 = 0;
  do {
    FUN_1003d950((&DAT_10766764)[iVar1]);
    iVar1 = iVar1 + 1;
  } while (iVar1 < 0x10);
  _DAT_101cea60 = PTR_DAT_101a59f8;
  DAT_101cea5e = 4;
  DAT_101cea4a = 0;
  DAT_101cea4c = 0;
  iVar1 = FUN_1000cb40();
  (&DAT_101cea68)[iVar1] = &DAT_101cea40;
  DAT_101d1b98 = &DAT_101cea40;
  DAT_101d1be8 = 0x32;
  DAT_101d1be9 = 0;
  _DAT_101d1bec = &DAT_101cea40;
  return;
}


