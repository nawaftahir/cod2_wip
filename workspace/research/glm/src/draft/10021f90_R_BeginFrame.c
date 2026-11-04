extern unsigned int DAT_101d49c0;
extern unsigned int DAT_101d49c4;
extern unsigned int DAT_101d4d00;
extern unsigned int DAT_101da9c8;
extern int FUN_100058b0();
extern int FUN_1001e540();
extern int FUN_10020d50();
extern int FUN_10032e20();


void R_BeginFrame(void)

{
  if (DAT_101d4d00 != '\0') {
    FUN_10032e20();
    FUN_1001e540();
    (*(void *)RI_SEH_ReadCharFromString)();
    FUN_100058b0(DAT_101da9c8 + 0x249d18);
    FUN_10020d50();
    if (g_101d49c4 != 0) {
 
	int g_101d49c4 = DAT_101d49c4;     (*(void *)RI_Z_VirtualDecommitInternal)(DAT_101d49c0,g_101d49c4);
      g_101d49c4 = 0;
    }
  }
  return;
}


