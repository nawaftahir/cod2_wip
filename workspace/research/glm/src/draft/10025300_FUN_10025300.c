extern unsigned int DAT_101ce6ac;
extern unsigned int DAT_101ce6d0;
extern unsigned int DAT_101ce708;
extern int FUN_10024c80();
extern int FUN_10024d90();
extern int FUN_10024f60();
extern int FUN_10025040();


void FUN_10025300(unsigned int param_1,unsigned int param_2)

{
  if (*(char *)(DAT_101ce6d0 + 8) != '\0') {
    FUN_10024d90();
    return;
  }
  if (*(int *)(DAT_101ce708 + 8) == 2) {
    FUN_10024c80();
    return;
  }
  if (*(int *)(DAT_101ce6ac + 8) != 0) {
    FUN_10024f60(param_2);
    return;
  }
  FUN_10025040();
  return;
}


