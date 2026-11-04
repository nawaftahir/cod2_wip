extern unsigned int DAT_10190690;
extern unsigned int DAT_101ce708;
extern unsigned int DAT_1072d9c0;
extern unsigned int DAT_1072debc;
extern int FUN_10034910();
extern int FUN_1003a000();
extern int FUN_1003a340();
extern int FUN_1003e9b0();


void FUN_1003a580(unsigned int param_1,unsigned int param_2)

{
  unsigned int *puVar1;
  
  if (DAT_1072debc != '\0') {
    FUN_1003e9b0();
  }
  if ((5 < g_1072d9c0) && (g_1072d9c0 < 0x12)) {
   
	int g_1072d9c0 = DAT_1072d9c0; FUN_1003a340();
  }
  if ((2 < g_1072d9c0) && (g_1072d9c0 < 0x1b)) {
    FUN_10034910();
  }
  puVar1 = (unsigned int *)0x0;
  if (((*(int *)(DAT_101ce708 + 8) == 2) && (8 < g_1072d9c0)) && (g_1072d9c0 < 0xf)) {
    puVar1 = &DAT_10190690;
  }
  FUN_1003a000(param_1,param_2,puVar1);
  return;
}


