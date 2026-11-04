extern unsigned int DAT_101ce62c;
extern unsigned int DAT_101ce6f8;
extern unsigned int DAT_101ce7ec;
extern unsigned int DAT_101d492c;
extern unsigned int DAT_101d4934;
extern unsigned int DAT_101d4940;
extern unsigned int DAT_101d497c;
extern unsigned int DAT_101d4c94;
extern unsigned int DAT_1072debd;
extern unsigned int DAT_10764584;
extern int FUN_10011f10();
extern int FUN_100138c0();
extern int FUN_1002baf0();
extern int FUN_100307e0();
extern int FUN_10037890();
extern int FUN_100efe3c();


void FUN_10033b20(void)

{
  int iVar1;
  unsigned int uVar2;
  
  if ((*(int *)(DAT_101ce7ec + 8) != 0) && (g_10764584 != (FILE *)0x0)) {
 
	int g_10764584 = DAT_10764584;   _fprintf(g_10764584,"%s","***************** RB_SwapBuffers *****************\n\n\n");
    _fflush(g_10764584);
  }
  iVar1 = (**(void **)(*(int *)(&g_101d4940)[g_101d4934 * 4] + 0xc))
       
	int g_101d4940 = DAT_101d4940;  
	int g_101d4934 = DAT_101d4934;           ((int *)(&g_101d4940)[g_101d4934 * 4],0,0,0,0,0);
  if (iVar1 < 0) {
    if (iVar1 != -0x7789f798) {
      uVar2 = FUN_100efe3c(iVar1);
      FUN_100138c0(0,"Direct3DDevice9::Present failed: %s\n",uVar2);
    }
    DAT_101d492c = 1;
    FUN_1002baf0();
  }
  *DAT_101d497c = 0;
  DAT_1072debd = 0;
  FUN_10037890();
  if ((*(char *)(g_101ce62c + 7) != '\0') || (*(char *)(g_101ce6f8 + 7) != '\0')) {
    (*(void *)R
	int g_101ce6f8 = DAT_101ce6f8;I_
	int g_101ce62c = DAT_101ce62c;Dvar_IsAtDefaultValue)(g_101ce62c);
    (*(void *)RI_Dvar_IsAtDefaultValue)(g_101ce6f8);
    if ((*(char *)(g_101ce6f8 + 8) == '\0') && (DAT_101d4c94 != '\0')) {
      FUN_10011f10();
      FUN_100307e0();
    }
  }
  return;
}


