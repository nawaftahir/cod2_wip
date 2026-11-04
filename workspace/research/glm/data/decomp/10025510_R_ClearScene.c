// 10025510 size=87 R_ClearScene

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void R_ClearScene(void)

{
  DAT_10678500 = DAT_10678500 + 1;
  DAT_10678514 = 0;
  DAT_10678ab8 = 0;
  DAT_10678abc = DAT_101da9c8 + 8 + *(int *)(DAT_101da9c8 + 4) * 8;
  DAT_10678ac0 = 0;
  DAT_1067850c = 0;
  DAT_10678510 = *(int *)(DAT_101da9c8 + 0xa000c) * 0x74 + 0xa0010 + DAT_101da9c8;
  _DAT_10692a5c = 0;
  FUN_1000a7f0();
  return;
}


