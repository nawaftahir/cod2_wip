extern unsigned int DAT_101ce668;
extern unsigned int DAT_101d4928;
extern unsigned int DAT_101d4c94;
extern unsigned int DAT_10696bb0;
extern int FUN_10011fe0();
extern int FUN_10025e80();
extern int FUN_100266f0();


void FUN_100268b0(int param_1)

{
  unsigned short uVar1;
  unsigned int uVar2;
  
  uVar2 = (*(void *)RI_Z_MallocInternal)((unsigned int)g_101d4928 * (unsigned int)g_101d4928 * 4);
  u
	int g_101d4928 = DAT_101d4928;Var1 = g_101d4928;
  *(unsigned int *)(&DAT_10696bb0 + param_1 * 4) = uVar2;
  FUN_10025e80(uVar1,uVar1,4,uVar2);
  FUN_100266f0();
  if ((0 < *(int *)(DAT_101ce668 + 8)) && (DAT_101d4c94 != '\0')) {
    FUN_10011fe0();
  }
  return;
}


