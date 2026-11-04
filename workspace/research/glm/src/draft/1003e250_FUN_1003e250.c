extern unsigned int DAT_1072e258;
extern unsigned int DAT_10730550;
extern int FUN_1003e130();


void FUN_1003e250(float param_1)

{
  *(float *)(&DAT_1072e258 + DAT_10730550 * 0xcd0) = -param_1;
  FUN_1003e130();
  return;
}


