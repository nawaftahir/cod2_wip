extern unsigned int DAT_101ce784;
extern unsigned int DAT_101ce82c;
extern unsigned int DAT_1072decc;
extern int FUN_100305d0();
extern int FUN_10035740();


/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_100306b0(void)

{
  _DAT_1072dc00 = *(float *)(DAT_101ce784 + 8);
  _DAT_1072dc0c = *(unsigned int *)(DAT_101ce82c + 8);
  _DAT_1072dc08 = 0;
  _DAT_1072dc04 = 1.0 / (1.0 - _DAT_1072dc00);
  DAT_1072decc = FUN_100305d0();
  FUN_10035740();
  return;
}


