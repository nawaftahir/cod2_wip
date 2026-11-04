extern unsigned int DAT_1072ded0;
extern unsigned int DAT_1072ded4;
extern int FUN_100304d0();


void FUN_10030580(void)

{
  int iVar1;
  
  iVar1 = 0;
  if (0 < g_1072ded0) {
 
	int g_1072ded0 = DAT_1072ded0;   do {
      FUN_100304d0((&DAT_1072ded4)[iVar1]);
      iVar1 = iVar1 + 1;
    } while (iVar1 < g_1072ded0);
  }
  g_1072ded0 = 0;
  return;
}


