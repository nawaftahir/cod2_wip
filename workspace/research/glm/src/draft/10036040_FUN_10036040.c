extern unsigned int DAT_101ce6d4;
extern int FUN_10035ac0();
extern int FUN_10035c40();
extern int FUN_10035fb0();


int FUN_10036040(int param_1)

{
  char cVar1;
  unsigned int local_10;
  
  if (*(int *)(DAT_101ce6d4 + 8) != 0) {
    FUN_10035c40();
  }
  cVar1 = FUN_10035fb0();
  if (cVar1 != '\0') {
    cVar1 = FUN_10035ac0(*(int *)(param_1 + 4) + local_10 * 8);
    if (cVar1 != '\0') {
      return *(int *)(param_1 + 4) + local_10 * 8;
    }
  }
  return 0;
}


