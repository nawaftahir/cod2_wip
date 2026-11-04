extern unsigned int DAT_101ce7ec;
extern unsigned int DAT_1072d9bc;
extern unsigned int DAT_1072d9c0;
extern unsigned int DAT_1072d9d0;
extern unsigned int DAT_1072d9d4;
extern unsigned int DAT_1072d9e0;
extern unsigned int DAT_1072debc;
extern unsigned int DAT_10730554;
extern unsigned int DAT_10730558;
extern unsigned int DAT_10764584;
extern unsigned int DAT_10766748;
extern int FUN_1003a690();
extern int FUN_1003a7b0();
extern int FUN_1003e9b0();


void FUN_1003a8d0(void)

{
  unsigned short uVar1;
  int iVar2;
  
  iVar2 = *(int *)(*(int *)(DAT_1072d9bc + 0x38) + 4 + DAT_1072d9c0 * 4);
  if (iVar2 != 0) {
    if (DAT_1072debc != '\0') {
      FUN_1003e9b0();
    }
    if (((DAT_10766748 == '\0') &&
        ((uVar1 = *(unsigned short *)(iVar2 + 4), (uVar1 & 1) == 0 || (DAT_10730554 != 0xe)))) &&
       (((uVar1 & 2) == 0 || (DAT_10730558 != 0xe)))) {
      if (g_1072d9e0 != 0) {
 
	int g_1072d9e0 = DAT_1072d9e0;       FUN_1003a690();
      }
      if (g_1072d9d0 != 0) {
   
	int g_1072d9d0 = DAT_1072d9d0;     FUN_1003a7b0();
      }
      if ((*(int *)(DAT_101ce7ec + 8) != 0) && (g_10764584 != (FILE *)0x0)) {
 
	int g_10764584 = DAT_10764584;       _fprintf(g_10764584,"%s","---------- RB_EndSurface\n");
        _fflush(g_10764584);
      }
      return;
    }
  }
  g_1072d9e0 = 0;
  g_1072d9d0 = 0;
  DAT_1072d9d4 = 0;
  return;
}


