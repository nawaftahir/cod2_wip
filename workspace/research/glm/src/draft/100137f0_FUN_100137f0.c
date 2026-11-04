extern unsigned int DAT_101ce648;
extern unsigned int DAT_101d1b9c;
extern unsigned int DAT_101d1bf8;
extern unsigned int DAT_101d481c;
extern int FUN_10001050();
extern int FUN_1000d260();
extern int FUN_1000d2e0();
extern int FUN_10013690();
extern int FUN_10016db0();
extern int FUN_10016df0();
extern int FUN_10017470();
extern int FUN_100174c0();
extern int FUN_10020330();
extern int FUN_10020380();
extern int FUN_1003a9d0();


unsigned int FUN_100137f0(void)

{
  int iVar1;
  unsigned int uVar2;
  
  iVar1 = (**(void **)(*g_101d1bf8 + 0xc))(g_101d1bf8);
  i
	int g_101d1bf8 = DAT_101d1bf8;f (iVar1 == -0x7789f798) {
    return 0;
  }
  (*(void *)RI_Printf)(0,"Recovering lost device...\n");
  (*(void *)RI_DObjBad)(1,FUN_10020330,0,1);
  FUN_1000d260();
  FUN_10017470();
  FUN_10016db0();
  if (g_101d1b9c != 0) {
    F
	int g_101d1b9c = DAT_101d1b9c;UN_10001780();
  }
  FUN_10013690();
  if (g_101d1b9c != 0) {
    uVar2 = FUN_10001050(*(unsigned int *)(g_101d1b9c + 0x2c));
    *(unsigned int *)(g_101d1b9c + 0x30) = uVar2;
  }
  FUN_100174c0();
  FUN_10016df0();
  FUN_1000d2e0();
  if (*(int *)(DAT_101ce648 + 8) != 0) {
    (*(void *)RI_DObjBad)(1,FUN_10020380,0,1);
  }
  DAT_101d481c = FUN_1003a9d0();
  (*(void *)RI_Printf)(0,"Finished recovering lost device.\n");
  return 1;
}


