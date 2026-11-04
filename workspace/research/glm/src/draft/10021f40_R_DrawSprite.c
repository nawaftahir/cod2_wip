extern unsigned int DAT_101ce70c;
extern unsigned int DAT_101d0b00;
extern unsigned int DAT_101d4d00;
extern int FUN_10016e70();
extern int FUN_1001e4b0();
extern int FUN_10021e50();


void R_DrawSprite(void)

{
  if (DAT_101d4d00 != '\0') {
    if (g_101d0b00 != 0) {
 
	int g_101d0b00 = DAT_101d0b00;     g_101d0b00 = 0;
      FUN_10016e70();
    }
    FUN_10021e50();
    (*(void *)RI_CL_UpdateDebugData)(0);
    if (*(char *)(DAT_101ce70c + 8) != '\0') {
      FUN_1001e4b0(0);
    }
  }
  return;
}


