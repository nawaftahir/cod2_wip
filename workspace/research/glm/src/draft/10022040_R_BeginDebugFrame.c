extern unsigned int DAT_101d4d00;
extern unsigned int DAT_101da9c8;
extern unsigned int DAT_101e4a00;
extern unsigned int DAT_101e4a04;
extern unsigned int DAT_101e4a08;
extern unsigned int DAT_1042e778;
extern int FUN_1001e4b0();
extern int FUN_10020ec0();
extern int FUN_10033b20();
extern int FUN_10033d20();


void R_BeginDebugFrame(void)

{
  int iVar1;
  
  if (DAT_101d4d00 != '\0') {
    FUN_10020ec0();
    iVar1 = g_101da9c8;
 
	int g_101da9c8 = DAT_101da9c8;   *(unsigned int *)(g_101da9c8 + 0x249d0c) = 0;
    *(unsigned int *)(iVar1 + 0x249d10) = 0;
    *(unsigned int *)(iVar1 + 0x249d14) = 0;
    FUN_10033d20(iVar1);
    FUN_10033b20();
    DAT_1042e778 = g_101e4a00;
 
	int g_101e4a00 = DAT_101e4a00;   g_101da9c8 = g_101e4a04;
 
	int g_101e4a04 = DAT_101e4a04;   if (g_101e4a08 != '\0') {
 
	int g_101e4a08 = DAT_101e4a08;     g_101e4a08 = '\0';
      FUN_1001e4b0(1);
    }
    g_101e4a00 = 0;
    g_101e4a04 = 0;
  }
  return;
}


